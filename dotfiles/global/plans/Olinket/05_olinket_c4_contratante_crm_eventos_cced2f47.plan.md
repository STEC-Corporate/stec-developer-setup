---
name: 05 olinket c4 contratante crm eventos
overview: "Corte 4 — Paridade UX com o contratante individual do SoundLink: dashboard, CRM (Relacionamento com Clientes) e listagem robusta de eventos."
status: completed
todos:
  - id: f1
    content: Fase 1 — src/features/clientes (Clean Architecture) + repo consumindo mocks compartilhados
    status: completed
  - id: f2
    content: Fase 2 — /conta/dashboard com DashboardSummaryCard (eventos ativos, propostas pendentes, próximos)
    status: completed
  - id: f3
    content: Fase 3 — /conta/clientes (lista + ficha [id]) com filtros e estados vazios
    status: completed
  - id: f4
    content: Fase 4 — Listagem /eventos reforçada (filtros por status/data/vertical, estados vazios)
    status: completed
  - id: f5
    content: Fase 5 — Alinhar ordem do ContratanteHeader + placeholders e margens SoundLink
    status: completed
  - id: f6
    content: Fase 6 — Testes unit (clientes, dashboard, filtros) + E2E + gates verdes
    status: completed
isProject: false
---


# 05 — Corte 4: Contratante (Dashboard + CRM + Listagem de eventos)

> **Posição na sequência:** 5 de 10. Depende do Corte 0 (mocks) e do Corte 1 (`ContratanteHeader`).
> **Plano mestre:** [.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md](.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md)
> **Docs P0 obrigatórios:** [docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md](docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md) (§3, §9), [docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md](docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md) (§7), [docs/planejamento/matriz-ecras-soundlink-olinket.md](docs/planejamento/matriz-ecras-soundlink-olinket.md) (§3)
> **Referência UX:** `contractor-individual/*` e `contractor-individual-nav-links.tsx` em `D:\SoundLink\Projetos\soundlink-template-frontend`; "Relacionamento com Clientes" do módulo do músico.

## Objetivo

Contratante passa a ter: (1) Dashboard com cartões-resumo; (2) CRM em `/conta/clientes`; (3) listagem de eventos robusta com filtros e estados vazios alinhados à UX do SoundLink.

## Não fazer

- Alterar o formulário de criação de evento (é Corte 6/7).
- Implementar negociação ponta-a-ponta (é Corte 5).
- Criar campos novos no `EventDraftSchema` — consumir o existente.

## Fases

### Fase 1 — Feature `clientes` em Clean Architecture

- Criar `src/features/clientes/`:
  - `domain/types/cliente.types.ts`, `domain/schemas/cliente.schema.ts`.
  - `domain/interfaces/cliente-repository.interface.ts`.
  - `infrastructure/cliente-local.repository.ts` (lê/compõe com `@stec/olinket-shared-mocks`).
  - `application/hooks/use-clientes.ts`, `use-cliente.ts`.
- Seeds de clientes adicionados a `@stec/olinket-shared-mocks` se ainda não existirem — se faltarem, coordenar retroativamente no Corte 0.

### Fase 2 — Rota `/conta/dashboard`

- Criar `src/app/conta/dashboard/page.tsx` com cartões:
  - **Eventos ativos** (contagem + link para `/eventos`).
  - **Propostas pendentes** (contagem + link placeholder para `/eventos?filtro=propostas_pendentes`).
  - **Próximos compromissos** (lista curta por data).
- Componente `DashboardSummaryCard` em `packages/olinket-ui/src/blocks/`.
- Lê de `use-my-events`, `use-propostas-for-event` e (quando disponível) `use-clientes`.

### Fase 3 — Rota `/conta/clientes`

- `src/app/conta/clientes/page.tsx` (lista) + `src/app/conta/clientes/[id]/page.tsx` (ficha).
- Lista com filtros (nome, cidade), estados vazios inspirados no SoundLink.
- Ficha mínima: dados do cliente + eventos associados (link cruzado).

### Fase 4 — Listagem de eventos (reforço)

- Evoluir [src/app/eventos/page.tsx](src/app/eventos/page.tsx):
  - Filtros por status (`EventStatus`), data, vertical, cidade.
  - Estados vazios com CTA "Criar evento".
  - Ordenação alinhada ao SoundLink (recentes/antigos/próximos).
- Reuso do componente de filtros em `packages/olinket-ui` quando genérico.

### Fase 5 — Ordem da navegação e paridade

- Alinhar ordem do `ContratanteHeader` (Corte 1) aos items existentes: **Dashboard, Meu Perfil, Criar Evento, Buscar, Eventos, Contratos, Pagamentos, Mensagens**.
- Rotas placeholder ("em preparação") para o que não está nesta fase (Meu Perfil, Mensagens, Pagamentos detalhados).
- Margens e grade consistentes com visão §7 (`w-full px-4 py-6 sm:px-6 lg:px-6`, conteúdo `max-w-6xl` onde aplicável).

### Fase 6 — Testes e gates

- Testes unit:
  - `clientes` — repository e hooks.
  - `DashboardSummaryCard` render.
  - Filtros da listagem de eventos.
- **E2E** (adicionar cenários em [tests/e2e/smoke-routes.spec.ts](tests/e2e/smoke-routes.spec.ts)):
  - Login demo → `/conta/dashboard` mostra cartões.
  - `/conta/clientes` lista e abre ficha.
  - `/eventos` filtra por status e exibe estado vazio quando aplicável.
- Gates: `npm run typecheck && npm run lint && npm run test && npm run test:e2e` verdes.

## Hooks para cortes seguintes

- `use-clientes` terá campo `eventosAssociados` — a ser preenchido a sério no Corte 5 (ponto de negociação contratante).
- Cartões do dashboard expõem contagens que o Corte 5 refinará com estados de proposta/contrato.

## Definição de pronto (DoD)

- `/conta/dashboard`, `/conta/clientes`, `/conta/clientes/[id]` e listagem de eventos reforçada funcionam com mocks.
- Paridade de nav e margens com SoundLink validada visualmente.
- Gates verdes; frontmatter `status: completed`.
