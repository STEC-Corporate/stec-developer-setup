---
name: planejamento-atualizar-sprint-progress
description: Atualiza progresso do ciclo (sprint-plan.md, sprint-report). Use durante o ciclo para métricas, ao final para relatório, ou ao analisar progresso atual (Scrumban).
---

# Atualizar Progresso do Ciclo (Scrumban)

## Alinhamento obrigatório

- Consultar `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/SCRUMBAN-GUIDE.md` (quadro, WIP, throughput, cycle time, bloqueios).
- Artefatos do ciclo: `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/GUIA-FLUXO-SPRINT.md`.

## Quando Usar

- Durante o ciclo para atualizar métricas
- Ao final do ciclo para relatório completo
- Ao analisar progresso atual
- Ao atualizar métricas do ciclo

## Arquivos a Atualizar

### 1. sprint-plan.md (Scrumban plan)

**Localização**: `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/[feature]/[pasta-do-ciclo]/sprint-plan.md`

**Atualizar**:
- Status das User Stories (✅ Completo, 🟡 Em progresso, ⏳ Não iniciado)
- Status das tarefas técnicas
- Velocity real
- Observações e bloqueios

**Formato**:
```markdown
## User Stories

- ✅ US-XXX: [Título] (8 SP) - Completo
- 🟡 US-XXX+1: [Título] (5 SP) - Em progresso
- ⏳ US-XXX+2: [Título] (3 SP) - Não iniciado

## Métricas de Sucesso

- **Story Points Planejados**: 29
- **Story Points Completados**: 24
- **Velocity Real**: 24 SP
```

### 2. sprint-report.md

**Localização**: `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/[feature]/[pasta-do-ciclo]/sprint-report.md`

**Criar ao final da sprint** com:
- Resumo executivo
- User Stories entregues
- Métricas finais
- Problemas encontrados
- Lições aprendidas

## Processo de Atualização

### Durante a Sprint

1. Atualizar `sprint-plan.md` com status das US/tarefas
2. Documentar bloqueios e problemas

### Final da Sprint

1. Atualizar `sprint-plan.md` com status final
2. Criar `sprint-report.md` com resumo executivo

## Referências

- **Guia Scrumban**: `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/SCRUMBAN-GUIDE.md`
- **Scrumban plan template**: `docs/gestao-ideias/04-referencia-tecnica/_templates/sprint-plan-template.md`
- **Workflow**: `docs/gestao-ideias/00-governanca/WORKFLOW-COLABORATIVO.md`

## Quando usar
- Use quando a tarefa estiver alinhada ao objetivo da skill.
- Use quando for necessario padrao tecnico e repetibilidade.

## Pre-condicoes
- Escopo e contexto da tarefa definidos.
- Arquivos-alvo identificados.
- Criterios de aceite minimos estabelecidos.

## Checklist de saida
- Resultado entregue e verificavel.
- Evidencias objetivas registradas.
- Riscos e proximos passos documentados.

## Cobertura de stack e dominio
- Stacks suportadas: Java, Kotlin, Python, TypeScript, React, React Native, NextJS, NestJS.
- Dominios: backend, frontend e mobile.

