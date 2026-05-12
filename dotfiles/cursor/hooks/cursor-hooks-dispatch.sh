#!/usr/bin/env bash
# Ponto único de entrada dos hooks do agente (sessionStart, afterFileEdit,
# beforeShellExecution, preToolUse). Evita vários .sh no hooks.json — o Cursor
# tende a abrir o ficheiro do hook no editor a cada execução; um único script
# reduz o ruído de abas.
#
# preToolUse: em hooks.json use um único string em "command" (sem array "args")
# e um "matcher" só para ferramentas de escrita — caso contrário o hook dispara
# antes de Read/Grep/Shell a cada turno e o IDE pode abrir abas vazias em excesso.
# Uso: cursor-hooks-dispatch.sh <sessionStart|afterFileEdit|beforeShellExecution|preToolUse>

set -euo pipefail

HOOK="${1:?usage: $0 <sessionStart|afterFileEdit|beforeShellExecution|preToolUse>}"
INPUT=$(cat)

case "$HOOK" in
sessionStart)
  PREMISE=""
  for p in "rules/submodule-premise.mdc" ".cursor/rules/submodule-premise.mdc"; do
    if [[ -f "$p" ]]; then
      PREMISE=$(cat "$p")
      break
    fi
  done
  export _CURSOR_HOOK_PREMISE="$PREMISE"
  python3 -c "
import json, os
premise = os.environ.get('_CURSOR_HOOK_PREMISE', '')
ctx = (
    '=== CONTEXTO HOLDING STEC ===\\n\\n'
    'Este repositório é um submodule Git da holding STEC.\\n'
    'Agents/ e skills/ estão na raiz intencionalmente.\\n'
    'Nunca mover para .cursor/ neste repo.\\n'
    'Ver rules/submodule-premise.mdc para detalhes.\\n\\n'
    '=== PREMISSA SUBMODULE ===\\n' + premise + '\\n\\n'
    '=== FIM DO CONTEXTO ==='
)
print(json.dumps({'continue': True, 'context': ctx}, ensure_ascii=False))
"
  unset _CURSOR_HOOK_PREMISE
  ;;

afterFileEdit)
  FILE_PATH=$(echo "$INPUT" | grep -o '"path":"[^"]*"' | head -1 | cut -d'"' -f4 || echo "")
  if [[ "$FILE_PATH" == *"/domain/"* || "$FILE_PATH" == skills/core-*/* ]]; then
    cat << 'EOF'
{
  "continue": true,
  "message": "LEMBRETE DDD: ao alterar dominio (Entity/VO/UseCase/Repository), garanta testes unitarios minimos (feliz + falhas + invariantes). Use skills/testes-* e o checklist em skills/core-*/references/."
}
EOF
    exit 0
  fi
  if [[ "$FILE_PATH" == *"SKILL.md" ]] && [[ -f "$FILE_PATH" ]]; then
    if ! grep -q "^description:" "$FILE_PATH" 2>/dev/null; then
      cat << 'EOF'
{
  "continue": true,
  "message": "AVISO: SKILL.md editado sem campo 'description' no frontmatter. Adicione description antes de commitar (ver skills/skills-standards.md)."
}
EOF
      exit 0
    fi
  fi
  if [[ "$FILE_PATH" == agents/*.md ]] && [[ -f "$FILE_PATH" ]]; then
    if ! grep -q "^description:" "$FILE_PATH" 2>/dev/null; then
      cat << 'EOF'
{
  "continue": true,
  "message": "AVISO: Agent editado sem campo 'description' no frontmatter. Adicione description para que o Cursor saiba quando invocar este agente."
}
EOF
      exit 0
    fi
  fi
  if [[ -n "$FILE_PATH" && -f "$FILE_PATH" ]]; then
    docs_warn=""
    if [[ "$FILE_PATH" == *"/gestao-ideias/02-execucao/planejamento/plans-local-templates/"*.plan.md ]] && [[ "$FILE_PATH" != *"/executados/"* ]]; then
      h25="$(head -n 25 "$FILE_PATH" 2>/dev/null || true)"
      if ! echo "$h25" | grep -qiF '**iniciado:**' || ! echo "$h25" | grep -qiF '**origem:**'; then
        docs_warn="Plano .plan.md: nas primeiras 25 linhas inclua **Status:**, **Iniciado:** (data) e **Origem:** (path sob docs/). Ver docs/gestao-tarefas/tasklink-conformidade-docs.md"
      fi
    fi
    if [[ -z "$docs_warn" && "$FILE_PATH" == *"/gestao-tarefas/03-especificacao-produto/"* && "$FILE_PATH" == *.md ]]; then
      base="$(basename "$FILE_PATH")"
      case "$FILE_PATH" in
      */README.md|*/INDEX.md|*/_model/*|*/_meta/*|*/api-specifications/README.md|*/user-flows/_model/*|*/business-rules/_model/*) ;;
      *)
        if [[ "$base" == fe-*.md || "$base" == *-mapping.md || "$base" == *-user-flow.md || "$FILE_PATH" == */ui-canonical/*.md ]]; then
          h50="$(head -n 50 "$FILE_PATH" 2>/dev/null || true)"
          if ! echo "$h50" | grep -qF '**Estado:**' || ! echo "$h50" | grep -qF '**Verificado:**' || ! echo "$h50" | grep -qF '**Data:**'; then
            docs_warn="Spec em 03: no topo inclua **Estado:**, **Verificado:** e **Data:** (ver docs/gestao-tarefas/tasklink-conformidade-docs.md)."
          fi
        fi
        ;;
      esac
    fi
    if [[ -n "$docs_warn" ]]; then
      if [[ "${DOCS_HOOK_STRICT:-0}" == "1" ]]; then
        printf '{"continue":false,"message":"%s"}\n' "$docs_warn"
        exit 0
      fi
      printf '{"continue":true,"message":"%s"}\n' "$docs_warn"
      exit 0
    fi
  fi
  echo '{"continue": true}'
  ;;

beforeShellExecution)
  COMMAND=$(echo "$INPUT" | grep -o '"command":"[^"]*"' | head -1 | cut -d'"' -f4 || echo "")
  DANGEROUS_PATTERNS=("git push --force" "git push -f" "git reset --hard" "rm -rf" "DROP TABLE" "DELETE FROM" "TRUNCATE" "git rebase -i")
  for PATTERN in "${DANGEROUS_PATTERNS[@]}"; do
    if echo "$COMMAND" | grep -qi "$PATTERN"; then
      cat << EOF
{
  "continue": false,
  "message": "BLOQUEADO: Comando potencialmente destrutivo detectado: '${PATTERN}'. Confirme explicitamente ao agente que deseja executar este comando antes de prosseguir."
}
EOF
      exit 0
    fi
  done
  if echo "$COMMAND" | grep -qE "git push.*(origin )?(main|master)$"; then
    cat << 'EOF'
{
  "continue": false,
  "message": "BLOQUEADO: Push direto para main/master detectado. Use um branch de feature e abra um PR. Confirme explicitamente se deseja prosseguir."
}
EOF
    exit 0
  fi
  echo '{"continue": true}'
  ;;

preToolUse)
  printf '%s' "${INPUT}" | python3 -c '
import json, os, sys

def decide(raw: str) -> dict:
    if os.environ.get("TASKLINK_BYPASS") == "1":
        return {"permission": "allow"}
    mode = os.environ.get("TASKLINK_DOC_LOCK", "off")
    if mode == "off":
        return {"permission": "allow"}
    if not raw.strip():
        return {"permission": "allow"}
    try:
        payload = json.loads(raw)
    except json.JSONDecodeError:
        return {"permission": "allow"}

    tool = str(
        payload.get("tool")
        or payload.get("name")
        or payload.get("type")
        or ""
    ).lower()
    if not any(x in tool for x in ("write", "strreplace", "search_replace", "apply_patch", "edit")):
        return {"permission": "allow"}

    blob = json.dumps(payload, ensure_ascii=False)
    locks = (
        "docs/gestao-ideias/01-exploracao/",
        "docs/gestao-ideias/02-execucao/",
        "docs/gestao-tarefas/01-intake-ideias/",
        "docs/gestao-tarefas/02-triagem-refinamento/",
    )
    if not any(p in blob for p in locks):
        return {"permission": "allow"}

    msg_user = (
        "Trava TaskLink: estes paths são apenas via TaskLink (STEC / projeto / ideia). "
        "Ver docs/gestao-tarefas/tasklink-travas-repos.md. "
        "Local: TASKLINK_DOC_LOCK=off. Emergência: TASKLINK_BYPASS=1."
    )
    agent = (
        "Recusar edição em gestão de ideias sem referência TaskLink; usar app ou desactivar trava só com acordo explícito."
    )
    if mode == "strict":
        return {"permission": "deny", "user_message": msg_user, "agent_message": agent}
    if mode == "soft":
        return {
            "permission": "ask",
            "user_message": msg_user + " Confirmar se é excepção autorizada.",
            "agent_message": agent,
        }
    return {"permission": "allow"}

print(json.dumps(decide(sys.stdin.read())))
'
  ;;

*)
  echo '{"continue": true}' ;;
esac
