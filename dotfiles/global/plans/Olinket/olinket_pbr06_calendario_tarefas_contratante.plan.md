---
name: Olinket PBR-06 — Calendário e tarefas (contratante)
overview: Incluir no hub contratante visão de calendário de eventos e agenda de tarefas úteis ao contratante §11.1; ligação aos eventos já existentes sem duplicar Workspace.
todos:
  - id: requisitos-produto
    content: Lista mínima tipos tarefa + relação evento (doc curto em planejamento/).
    status: completed
  - id: ui-calendario
    content: Vista calendário mensal com eventos criados (dados mock/seed).
    status: completed
  - id: ui-tarefas
    content: Lista tarefas pendente/concluída (local); opcional lembrete UI only.
    status: completed
  - id: navegacao
    content: Entrada menu contratante (/conta ou /eventos submenu) acordada UX.
    status: completed
  - id: testes
    content: Unit hook tarefas + smoke rota.
    status: completed
isProject: true
---

# Build-ready — PBR-06: Calendário + tarefas (contratante)

## Objetivo

Cobrir decisão §11.1 do [plano-mãe](./olinket_fecho_paridade_ux_e_descoberta.plan.md) — utilidade contratante além do músico no SoundLink.

## Notas

Não confundir com calendário de carreira do profissional — fora do escopo.

## Aceite

Ao menos uma rota “agenda” utilizável com dados seed; calendário marca datas de eventos criados.

---

**Implementação (2026-04-28):** fragmento [`docs/planejamento/fragmento-pbr06-agenda-calendario-tarefas.md`](../../docs/planejamento/fragmento-pbr06-agenda-calendario-tarefas.md); rota `/conta/agenda`; feature `src/features/agenda/`; entrada **Agenda** no header contratante; smoke E2E (`PBR-06`) em `tests/e2e/smoke-routes.spec.ts`.
