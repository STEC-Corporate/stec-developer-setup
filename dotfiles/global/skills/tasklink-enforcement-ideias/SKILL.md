---
name: tasklink-enforcement-ideias
description: >-
  Aplica política TaskLink-first em repos SoundLink: variáveis TASKLINK_DOC_LOCK,
  paths bloqueados, hierarquia STEC/projetos e quando usar bypass. Use ao
  criar/editar ideias, intake ou triagem em docs/gestao-* ou ao configurar travas.
---

# TaskLink — enforcement em repositórios consumidores

## Ler primeiro

1. `docs/gestao-tarefas/tasklink-travas-repos.md` — variáveis, paths, camadas.
2. `docs/gestao-tarefas/tasklink-gestao-tarefas.md` — fontes da verdade.
3. `docs/gestao-tarefas/tasklink-conformidade-docs.md` — cabeçalhos de planos (strict), specs em `03/`, encoding, CI `DOCS_AUDIT_STRICT`, hook `DOCS_HOOK_STRICT`.
4. No repositório TaskLink: `docs/28-hierarquia-stec-projetos-e-travas-repos.md`, ADR-003.

## Checklist antes de tocar em gestão de ideias

- [ ] Existe referência TaskLink (ID / URL) para a ideia ou a operação foi explicitamente isenta?
- [ ] `TASKLINK_DOC_LOCK` está `off` **ou** o humano confirmou excepção?
- [ ] Se a ideia é transversal: foi considerado **move** entre projetos na holding (HOLDING_ADMIN), não duplicação silenciosa?
- [ ] Novos ou alterados `.plan.md` em `plans-local-templates/` têm `**Iniciado:**` e `**Origem:**` nas primeiras 25 linhas (export Markdown / TaskLink deve gerar estes tokens; ver `tasklink-conformidade-docs.md`)?

## Hook

- Script: `.cursor/skills/hooks/tasklink-doc-lock.sh`
- Registro: `.cursor/hooks.json` → evento `preToolUse`

## Limitações (comunicar ao usuário)

- Hooks do Cursor **não** substituem edição humana directa; CI/branch protection fecham o ciclo no Git.
