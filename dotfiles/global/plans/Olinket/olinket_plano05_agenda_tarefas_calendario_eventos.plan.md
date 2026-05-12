---
name: Olinket Plano 5 — Agenda de Tarefas × Calendário de Eventos
overview: Separar claramente duas superfícies (tarefas do dia a dia vs calendário de eventos de negócio), alinhar estados durante negociação ao SoundLink, e atualizar matriz-telas + specs. Dados até BFF podem permanecer demo/localStorage.
todos:
  - id: fase-doc-matriz
    content: Secção matriz-telas + fragmento agenda.md (dois conceitos + estados).
    status: completed
  - id: fase-ui-navegacao
    content: UI sem mistura (abas ou rotas), copy PT-BR, aria-labels distintos.
    status: completed
  - id: fase-logica-demo
    content: Regras demo — quais EventStatus entram no calendário de eventos; tarefas só na agenda.
    status: completed
  - id: fase-testes
    content: Unit (helpers/filtros) + smoke E2E rotas ou tabs.
    status: completed
  - id: fase-sl-paridade
    content: Checkpoint soundlink-template-frontend — nav músico + ContractorCreatedEvent; matriz §7 atualizada.
    status: completed
isProject: true
---

# Build-ready — Plano 5: Agenda de Tarefas × Calendário de Eventos

> **Status:** CONCLUÍDO | **Iniciado:** 2026-05-01 | **Fechado:** 2026-05-02 | **Origem:** `.cursor/plans/Olinket/olinket-soundlink-planos-prompts.md` (Plano 5)

## Objetivo

- **Agenda de Tarefas:** compromissos/atividades (`TarefaContratante`, `dueDate` opcional, `eventId` opcional); persistência demo `localStorage` / **[PLANEJADO]** `olinket.tarefas.v1` via BFF.
- **Calendário de Eventos:** datas de negócio a partir de **`EventSummary.eventDate`**; filtro `eventosParaCalendarioNegocio`; sync multi-parte **[PLANEJADO]** API/event bus.

## Situação atual (template) — entregue

| O quê | Onde |
|-------|------|
| Rotas `{base}/agenda` | `src/app/contractor-individual/agenda/page.tsx`, `src/app/contractor-business/agenda/page.tsx` |
| Vista | `ContaAgendaView` — abas «Calendário de eventos» / «Agenda de tarefas»; `ContaAgendaCalendarioMes` com `mode: 'eventos' \| 'tarefas'` |
| Regra de estados | `src/features/agenda/domain/agenda-calendario-negocio.ts` |
| Nav | `Agenda` → `{base}/agenda` |
| BR | `docs/gestao-tarefas/03-especificacao-produto/business-rules/contratante-individual/agenda.md` |
| Matriz | `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/matriz-telas.md` §7 (coluna SL preenchida após checkpoint) |

**Gap original:** mistura evento + tarefa na mesma malha — **resolvido** com abas e modos de calendário.

## Anexo — Checkpoint SoundLink (2026-05-02)

Repositório: `D:\SoundLink\Projetos\soundlink-template-frontend` (working tree local).

| Tema | Achado |
|------|--------|
| Navegação **músico** | `src/components/headers/musician-nav-links.tsx`: rótulos **«Agenda de Tarefas»** (`/musician/task-manager`) e **«Calendário de Eventos»** (`/musician/performance-calendar`) — par terminológico alinhado às abas Olinket. |
| Navegação **contratante individual** | `contractor-individual-nav-links.tsx`: **sem** rota «Agenda»; item **Eventos** (`/events` sob `contractor-individual`). Paridade conceitual: calendário de negócio Olinket ↔ lista/detalhe de eventos no SL. |
| Estado em negociação (mock contratante) | `contractor-events.repository.local.ts`: `ContractorCreatedEvent.status` = `'pending' \| 'confirmed'` — **pending** ≈ `em_selecao` / aberto com proposta; **confirmed** ≈ `contratado`. |
| ADR agregador | [ADR-024](../../../docs/gestao-ideias/04-referencia-tecnica/arquivo/espelho-soundlink-adrs/adr-024-events-calendar-as-aggregator.md) (espelho no Olinket). |

Integrações **BFF** e **cancelados no calendário** permanecem **[PLANEJADO]** fora do encerramento deste plano.

## Referências cruzadas

- [olinket-soundlink-planos-prompts.md](./olinket-soundlink-planos-prompts.md) (Plano 5).
- [olinket_pbr06_calendario_tarefas_contratante.plan.md](./olinket_pbr06_calendario_tarefas_contratante.plan.md).
