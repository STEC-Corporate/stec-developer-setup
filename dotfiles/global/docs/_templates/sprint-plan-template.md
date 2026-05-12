# 📅 Sprint [XX]: [Nome da Sprint]

> **Template COMPLETO do Plano da Sprint (artefato)**

**ℹ️ Diferença importante:**
- **Este template**: Para criar o artefato completo `sprint-plan.md` (documento de referência durante toda a sprint)
- **Template da reunião**: Use `docs/planejamento/scrum-planning/events/sprint-planning-template.md` para documentar a reunião de Sprint Planning

---

## 📋 Informações do Sprint

- **Sprint**: [Número]
- **Feature**: [Nome da Feature]
- **Data de Início**: [A definir]
- **Data de Término**: [A definir]
- **Duração**: 2 semanas
- **Participantes**: [A definir]

## 🎯 Objetivo do Sprint

[Descreva o objetivo principal desta sprint em 1-2 parágrafos]

---

## ✅ Validação Estratégica

> **OBRIGATÓRIO**: Esta seção deve ser preenchida ANTES de aprovar a sprint

### 🛡️ Guardrails

**Consultar**: `.cursor/docs/ia/guardrails.md`

- [ ] Nenhuma US viola Guardrails
- [ ] Nenhuma US implementa destaque pago para músicos
- [ ] Nenhuma US permite manipulação de ranking
- [ ] Nenhuma US viola Clean Architecture
- [ ] Todas US respeitam princípios de transparência

### 🌟 North Star Metric

**Consultar**: `docs/planejamento/metrics/north-star.md`

- [ ] Pelo menos 50% das US têm impacto Médio/Alto na North Star
- [ ] Sprint contribui para pelo menos 1 Key Result do OKR trimestral
- [ ] Impacto na North Star documentado em cada US

**Métrica North Star**: Contratações bem-sucedidas com avaliação positiva (≥4 estrelas)

### 📊 Priorização

**Consultar**: `.cursor/docs/ia/playbooks/feature-prioritization.md`

- [ ] Features priorizadas usando Playbook de Priorização
- [ ] Features de alto impacto na North Star priorizadas
- [ ] Dependências técnicas identificadas e resolvidas

### 🏗️ Qualidade

**Consultar**: `.cursorrules`

- [ ] Cobertura de testes ≥75% planejada para todas US
- [ ] Clean Architecture será respeitada em toda implementação
- [ ] Documentação `fe-*.md` será criada/atualizada para todas US
- [ ] Validação com Zod planejada para todos formulários

### 📝 Decisões

**Consultar**: `docs/decisoes/decision-log.md`

- [ ] Decisões anteriores consultadas (não duplicar esforços)
- [ ] Decisões importantes desta sprint documentadas em `decision-log.md`
- [ ] Se decisão arquitetural significativa → criar ADR

---

## 📊 Capacidade da Equipe

- **Desenvolvedores**: [A definir]
- **Horas disponíveis por desenvolvedor**: [A definir] horas/semana
- **Total de horas disponíveis**: [A definir] horas

---

## 📝 User Stories Selecionadas

> **Referência**: [User Stories - Sprint XX](./user-stories.md)  
> **Business Rules**: `docs/fluxo/business-rules/[perfil]/[feature]/`

### US-XXX: [Título da User Story]

- **Prioridade**: Alta | Média | Baixa
- **Estimativa**: [X] story points / [Y] horas
- **Impacto North Star**: 🟢 Alto | 🟡 Médio | 🔴 Baixo | ⚪ Nenhum
- **Foco**: [Descrição curta do foco]
- **Referência Business Rules**: [Link]
- **Referência User Story**: [Link para user-stories.md]

### US-XXX: [Título da User Story]

- **Prioridade**: Alta | Média | Baixa
- **Estimativa**: [X] story points / [Y] horas
- **Impacto North Star**: 🟢 Alto | 🟡 Médio | 🔴 Baixo | ⚪ Nenhum
- **Foco**: [Descrição curta do foco]
- **Referência Business Rules**: [Link]
- **Referência User Story**: [Link para user-stories.md]

---

## 🔧 Tarefas Técnicas

> **Referência Completa**: [Tasks - Sprint XX](./tasks.md)

### TASK-XXX: [Nome da Tarefa]

- **Responsável**: [A definir]
- **Estimativa**: [X] horas
- **Dependências**: [TASK-XXX ou Nenhuma]
- **Status**: Pendente
- **Tipo**: 🏗️ Infraestrutura | 🎨 Frontend | 🧪 Testes | 📝 Documentação
- **User Story**: [US-XXX]
- **Link**: [Link para tasks.md]
- **Descrição**: [Breve descrição]

---

## 📋 Definition of Done

- [ ] Código implementado e revisado
- [ ] Testes unitários ≥75% cobertura
- [ ] Testes de integração implementados
- [ ] Testes E2E para fluxos críticos
- [ ] Documentação atualizada (`fe-*.md`, API specs, etc.)
- [ ] Linter errors = 0
- [ ] Code review aprovado
- [ ] Deploy em ambiente de staging
- [ ] Validado contra Guardrails
- [ ] Impacto na North Star documentado

---

## 🎯 Métricas de Sucesso

**Consultar**: `docs/planejamento/metrics/metric-dictionary.md`

### Métricas de Entrega

- **Story Points Planejados**: [X]
- **Velocity Esperada**: [X] SP/sprint
- **User Stories Planejadas**: [X]

### Métricas de Qualidade

- **Cobertura de Testes Esperada**: ≥75%
- **Bugs Esperados**: ≤5
- **Tech Debt Criado**: Mínimo possível

### Métricas de Impacto

- **Impacto North Star**: [Alto/Médio/Baixo]
- **OKR Relacionado**: [Referência ao OKR]
- **Key Results Impactados**: [Lista de KRs]

---

## 🚨 Riscos Identificados

| Risco | Probabilidade | Impacto | Mitigação |
|-------|--------------|---------|-----------|
| [Descrição] | Alta/Média/Baixa | Alto/Médio/Baixo | [Ações de mitigação] |

---

## 🔗 Documentação Relacionada

- **OKR Geral da Feature**: `docs/planejamento/scrum-planning/sprints/[feature]/okrs-[feature].md`
- **OKR Trimestral**: `docs/planejamento/okrs-kpis-q1-2026.md`
- **Business Rules**: `docs/fluxo/business-rules/[perfil]/[feature]/`
- **User Flows**: `docs/fluxo/user-flows/[perfil]/[feature]/`
- **API Specifications**: `docs/fluxo/api-specifications/[perfil]/[feature]/`
- **Guardrails**: `.cursor/docs/ia/guardrails.md`
- **North Star**: `docs/planejamento/metrics/north-star.md`
- **Playbook Priorização**: `.cursor/docs/ia/playbooks/feature-prioritization.md`

---

## 📝 Notas da Sprint Planning

[Qualquer nota, decisão ou discussão importante da reunião de planning]

---

## 📅 Eventos da Sprint

- **Sprint Planning**: [Data e hora]
- **Daily Standup**: [Horário recorrente]
- **Sprint Review**: [Data e hora]
- **Sprint Retrospective**: [Data e hora]

---

**Criado em**: [Data]  
**Aprovado por**: [Nome]  
**Status**: [ ] Planejado | [ ] Em Execução | [ ] Concluído | [ ] Cancelado
