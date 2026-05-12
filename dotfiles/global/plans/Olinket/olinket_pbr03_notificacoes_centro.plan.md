---
name: Olinket PBR-03 — Centro de notificações
overview: "Sino no header → página única com todas notificações; agrupamento por abas e origem; leitura obrigatória e **marcar lido** por categoria §11.1, §11.6 §12.4."
todos:
  - id: modelo-notifs
    content: Tipos Notification + category + read state (local até API).
    status: completed
  - id: header-bell
    content: Badge contagem não lidos; entrada para /conta/notificacoes ou rota definida.
    status: completed
  - id: page-tabs
    content: Layout abas STEC/Evento/Pessoa/… conforme grupo produto definido §11.
    status: completed
  - id: marca-lido
    content: Por aba ou global conforme UX fechamento §11.6.
    status: completed
  - id: e2e-notifs
    content: Playwright cenário marca lido + contagem atualiza.
    status: completed
isProject: true
---

# Build-ready — PBR-03: Notificações (centro único)

## Objetivo

Implementar centro de **notificações** coerente com **[plano-mãe](./olinket_fecho_paridade_ux_e_descoberta.plan.md) §11.1 e §11.6** — **SLC**.

## Critérios de aceite

1. Sino sempre visível no header logado OU regra projeto (documentar variante mobile).
2. Página lista com filtros/tab por agrupamentos acordados; “marcar lido” atualiza estado.
3. Estado sem backend = `localStorage` prefixo `olinket.` compatível outros features.


---

**Implementação no template (2026-04-28):** [`docs/planejamento/fragmento-pbr03-notificacoes-centro.md`](../docs/planejamento/fragmento-pbr03-notificacoes-centro.md); código em `src/features/notificacoes/` + rota `src/app/conta/notificacoes/page.tsx`; E2E `PBR-03` em `tests/e2e/smoke-routes.spec.ts`.
