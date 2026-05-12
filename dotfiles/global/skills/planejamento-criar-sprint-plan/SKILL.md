---
name: planejamento-criar-sprint-plan
description: Cria Scrumban plan completo seguindo sprint-plan-template.md. Use ao planejar nova sprint, ao analisar plano existente, ou ao atualizar planejamento do ciclo.
---

## Skills relacionadas (ciclo Scrumban)

- [planejamento-scrumban-task](../planejamento-scrumban-task/SKILL.md) — itens do quadro (DoR/DoD, WIP)
- [planejamento-atualizar-sprint-progress](../planejamento-atualizar-sprint-progress/SKILL.md) — plano e relatório do ciclo
- [planejamento-criar-retrospective](../planejamento-criar-retrospective/SKILL.md) — `retrospective.md`
- Agente orquestrador: `.cursor/agents/planejamento-scrumban.md`

# Criar Scrumban plan

## Quando Usar

- Ao planejar nova sprint
- Ao criar documento completo de planejamento de sprint
- Ao analisar sprint plan existente para completude
- Ao atualizar planejamento durante sprint

## Template

**Consultar**: `docs/gestao-ideias/04-referencia-tecnica/_templates/sprint-plan-template.md`

**Diferença importante**:
- **Este template**: Para criar o artefato Scrumban plan em `sprint-plan.md` (documento de referência)
- **Processo de execução**: `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/SCRUMBAN-GUIDE.md` (WIP, DoR, DoD)

## Estrutura Obrigatória

### 1. Informações do Sprint

```markdown
## 📋 Informações do Sprint

- **Sprint**: [Número]
- **Feature**: [Nome da Feature]
- **Data de Início**: [Data]
- **Data de Término**: [Data]
- **Duração**: 2 semanas
- **Participantes**: [Lista]
```

### 2. Objetivo do Sprint

```markdown
## 🎯 Objetivo do Sprint

[Descreva o objetivo principal desta sprint em 1-2 parágrafos]
```

### 3. Validação Estratégica (OBRIGATÓRIA - Fase 0)

```markdown
## ✅ Validação Estratégica

### 🛡️ Guardrails
- [ ] Nenhuma US viola Guardrails
- [ ] Nenhuma US implementa destaque pago para músicos
- [ ] Nenhuma US permite manipulação de ranking

### 🌟 North Star Metric
- [ ] Pelo menos 50% das US têm impacto Médio/Alto na North Star
- [ ] Sprint contribui para a North Star Metric

### 📊 Priorização
- [ ] Score de priorização calculado usando playbook
- [ ] Features priorizadas corretamente
```

**Importante**: Esta seção deve ser preenchida ANTES de aprovar a sprint.

### 4. User Stories Selecionadas

```markdown
## 📝 User Stories Selecionadas

### US-XXX: [Título]
- **Story Points**: [X]
- **Impacto North Star**: [Alto/Médio/Baixo]
- **Status**: [ ] Não iniciado | [ ] Em progresso | [ ] Completo

### US-XXX+1: [Título]
...
```

### 5. Tarefas Técnicas Detalhadas

```markdown
## 🔧 Tarefas Técnicas

### TASK-001: [Título]
- **Descrição**: [Detalhes]
- **Estimativa**: [X horas]
- **Dependências**: [Lista]
- **Status**: [ ] Não iniciado | [ ] Em progresso | [ ] Completo
```

### 6. Definition of Done

```markdown
## ✅ Definition of Done

- [ ] Código implementado seguindo Clean Architecture
- [ ] Testes criados (≥75% cobertura)
- [ ] Documentação atualizada
- [ ] Code review aprovado
- [ ] Deploy em staging realizado
- [ ] Validação em staging concluída
```

### 7. Métricas de Sucesso

```markdown
## 📊 Métricas de Sucesso

- **Story Points Planejados**: [X]
- **Story Points Completados**: [X] (preencher no fim)
- **Velocity Esperada**: [X]
- **Velocity Real**: [X] (preencher no fim)
```

### 8. Riscos Identificados

```markdown
## ⚠️ Riscos Identificados

- **Risco 1**: [Descrição] - Mitigação: [Ação]
- **Risco 2**: [Descrição] - Mitigação: [Ação]
```

### 9. Links para Documentos Relacionados

```markdown
## 🔗 Links Importantes

- **User Stories**: `user-stories.md`
- **Tasks**: `tasks.md`
- **Business Rules**: `docs/gestao-tarefas/03-especificacao-produto/business-rules/[perfil]/[feature].md`
- **API Specs**: `docs/gestao-tarefas/03-especificacao-produto/api-specifications/[perfil]/[feature]/`
```

### 10. Templates Vazios para Preencher

Criar arquivos vazios para serem preenchidos durante/fim da sprint:
- `retrospective.md` - Para retrospectiva
- `sprint-report.md` - Para relatório final

## Localização

**Arquivo**: `docs/gestao-ideias/02-execucao/planejamento/scrum-planning/sprints/[feature]/sprint-XX/sprint-plan.md`

## Validações Obrigatórias

- [ ] Fase 0 (Validação Estratégica) completada
- [ ] User Stories selecionadas com impacto North Star
- [ ] Tarefas técnicas detalhadas
- [ ] Definition of Done definida
- [ ] Métricas de sucesso estabelecidas
- [ ] Riscos identificados
- [ ] Template retrospective.md criado

## Referências

- **Template**: `docs/gestao-ideias/04-referencia-tecnica/_templates/sprint-plan-template.md`
- **Template Reunião**: `docs/gestao-ideias/02-execucao/planejamento/scrum-planning/events/sprint-planning-template.md`
- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- **North Star**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`
- **Feature Checklist**: `docs/gestao-ideias/04-referencia-tecnica/_templates/feature-checklist.md`

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

