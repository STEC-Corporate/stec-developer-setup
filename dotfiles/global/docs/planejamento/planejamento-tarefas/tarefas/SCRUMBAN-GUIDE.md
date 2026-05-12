# Guia rápido — Scrumban para execução com IA

Este repositório usa **Scrumban** para planejar e executar trabalho com apoio de IA. A ideia é manter uma cadência de revisão (como no Scrum), mas operar por **fluxo** (pull system) com **WIP limit**, **DoR** e **DoD**.

## Quadro padrão

`Backlog` → `Ready` → `InProgress` → `Review` → `Done` → `Blocked`

## WIP limits (recomendado: 1 humano + IA)

- **InProgress**: 2
- **Review**: 2

Se o review começar a acumular, reduza `InProgress` antes de aumentar WIP.

## Definition of Ready (DoR)

Um item só entra em `InProgress` quando:

- tem link para a US/TASK (fonte de verdade)
- tem critério(s) de aceite objetivo(s)
- tem escopo claro (o que entra / o que não entra)
- define saída esperada (arquivos/componentes/docs)
- define dependências e como tratar ausência de backend (mock/real)

## Definition of Done (DoD)

Antes de mover para `Done`:

- [ ] Evidência do resultado (arquivo/print/link)
- [ ] Sem violações conhecidas de guardrails / clean architecture
- [ ] Padrões `.cursorrules` respeitados quando aplicável
- [ ] Documentação atualizada quando aplicável
- [ ] Qualidade mínima verificada (lint/ts/tests) quando aplicável

## Métricas (o que acompanhar)

- **Throughput**: quantos itens chegaram em `Done` por período.
- **Cycle time**: tempo de `Ready → Done`.
- **WIP**: quantos itens simultâneos em `InProgress` e `Review`.
- **Bloqueios**: quantidade e tempo em `Blocked`.

## Como usar nos arquivos de planejamento

Em `docs/planejamento/planejamento-tarefas/tarefas/**`:

- `sprint-plan.md`: é o **planning do ciclo** (objetivo, quadro, WIP, DoR/DoD).
- `sprint-report.md`: report do ciclo (throughput/cycle time/bloqueios + evidências).
- `retrospective.md`: melhoria contínua com foco em reduzir retrabalho e estabilizar DoR/DoD.

Para cada **item de trabalho** novo, use o template em [`_templates/scrumban-task-item-template.md`](./_templates/scrumban-task-item-template.md).
