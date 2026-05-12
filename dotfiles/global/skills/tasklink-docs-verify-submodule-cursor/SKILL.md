---
name: tasklink-docs-verify-submodule-cursor
description: >-
  P0: verifica submodule .cursor (agents/skills/rules), SUBMODULES.md; com .cursor OK,
  reporta TASKLINK_DOC_LOCK/BYPASS e hooks.json (preToolUse + tasklink-doc-lock). Bloqueia
  scaffold de docs se P0a falhar. Use antes de tasklink-docs-scaffold-from-template.
---

# Verificar submodule `.cursor/` e P0 TaskLink

## Ler primeiro

1. `.cursor/SUBMODULES.md` — onboarding do submodule AI-ProjectDeveloper.
2. Manifest opcional: `gestao-docs.manifest.json` na raiz do repo destino ou em `docs/` (ver `tasklink-docs-manifest-schema`).

## P0a — Submodule (bloqueante)

Na **raiz do repo consumidor** (workspace):

1. Existe `.cursor/agents/`, `.cursor/skills/`, `.cursor/rules/`?
2. Existe `.cursor/SUBMODULES.md`?
3. Opcional: `git submodule status` — entrada `.cursor` sem prefixo `-` (submodule inicializado).

**Se falhar qualquer item crítico:** devolver relatório com decisão `blocked_submodule`, apontar **apenas** para `.cursor/SUBMODULES.md` para configuração (`git submodule add`, `git submodule update --init --recursive`). **Não** alterar `docs/gestao-*`.

## P0b — Ambiente e hooks (relatório)

1. **`TASKLINK_DOC_LOCK`:** tentar ler do ambiente do processo; se impossível, registrar `unknown` e pedir confirmação humana ou `user_declared` no manifest (`p0_env_source`).
2. **`TASKLINK_BYPASS`:** `1` ou `absent`.
3. **`.cursor/hooks.json`:** existe? JSON válido? Se `p0_require_tasklink_hook === true` no manifest, existe `hooks.preToolUse` com pelo menos um `command` que termina em `tasklink-doc-lock.sh`?
4. **SHA do submodule:** `cd .cursor && git rev-parse HEAD` (ou equivalente) para o relatório.

### Coerência Modo C

Se `tasklink_doc_lock_expected` for `soft` ou `strict` e o valor observado de `TASKLINK_DOC_LOCK` não coincidir, registrar mismatch; bloqueante se a equipe configurou assim no manifest.

## Saída (Markdown)

1. **P0a** — `pass` \| `fail`; `git submodule status` (linha `.cursor`); pastas `.cursor/{agents,skills,rules}`.
2. **P0b** — `TASKLINK_DOC_LOCK`, `TASKLINK_BYPASS`, `hooks.json` (`present` \| `absent` \| `invalid_json`), `preToolUse_tasklink` (`ok` \| `missing`), SHA em `.cursor` (`git rev-parse HEAD`).
3. **Decisão** — `proceed_to_scaffold` \| `blocked_submodule` \| `blocked_p0b` \| `proceed_with_warnings`.

## Limitações

- Hooks e variáveis dependem do Cursor e do shell; não substituir revisão humana nem CI.
