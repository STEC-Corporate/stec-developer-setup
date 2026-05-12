---
name: Olinket PBR-02 — Agregadores (mensagens, contratos, pagamentos)
overview: Visões globais de Mensagens / Contratos / Pagamentos além do contexto por evento; mesmo fio agregável; criadora de contratos espelha passos SoundLink com UI @stec/olinket-ui — §8.1, §11.1, §11.3.
todos:
  - id: modelagem-dados-local
    content: Contrato de dados (mock/local até BFF) para conversas/contratos/pagamentos com eventId + agregação list-view.
    status: completed
  - id: rotas-globais
    content: Rotas OU seção /conta (ex. /conta/contratos, /conta/pagamentos, /conta/mensagens) como índices; links desde header.
    status: completed
  - id: hub-evento
    content: Tabs evento já existentes continuam como fonte de verdade contextual; garantir mesmo id aparece nos agregadores.
    status: completed
  - id: criadora-contratos-paridade
    content: Lista de passos/blocos igual intenção SoundLink — doc + componentes placeholders evoluindo para parity.
    status: completed
  - id: testes
    content: Smoke E2E navegação agregadores + uma rota de evento.
    status: completed
isProject: true
---

# Build-ready — PBR-02: Agregadores globais + contexto evento

## Objetivo

**Mensagens, Contratos e Pagamentos**: visão **agregadora** para o contratante (lista/consolidado) mantendo entrada **dentro do evento** para o trabalho cotidiano — **[plano-mãe](./olinket_fecho_paridade_ux_e_descoberta.plan.md)** §8.1, §11.3.

## Escopo IN

- Listagens/transversal “minhas mensagens/contratos/pagamentos” a partir do hub contratante.
- Reuso de identificadores de evento onde o fio nasce.
- Planeamento da **criadora de contratos** — paridade conceitual de passos vs SoundLink; UI Olinket.

## Escopo OUT

- Persistência servidor final (documentar contratos BFF).

## Critérios de aceite

1. Dois pontos de leitura (agregador + dentro do evento) demonstráveis nas seeds ou mocks sem fork de modelo.
2. ADR canônico mensagens: [ADR-002](../../docs/gestao-ideias/00-governanca/decisoes/adr-002-mensagens-canal-canonico.md) para canal por **evento** — agregadores **não contradizem** esta fonte.

## Dependências

- PBR-03 pode **correr** em paralelo; integração UX com notificações opcionalmente depois.

---

**Implementação no template (2026-04-28):** fragmento em [`docs/planejamento/fragmento-pbr02-agregadores-globais.md`](../../docs/planejamento/fragmento-pbr02-agregadores-globais.md); smoke E2E (`PBR-02`) em `tests/e2e/smoke-routes.spec.ts`.
