---
name: docs-criar-historia-usuario
description: Cria User Story seguindo user-story-template.md. Use ao documentar nova User Story, ao analisar se User Story existente está completa, ou ao criar User Stories para sprint.
---

# Criar User Story

## Quando Usar

- Ao documentar nova User Story
- Ao criar User Stories para sprint
- Ao analisar se User Story existente está completa
- Ao refatorar User Story para seguir template

## Template

**Consultar**: `docs/gestao-ideias/04-referencia-tecnica/_templates/user-story-template.md`

## Estrutura Obrigatória

### 1. Cabeçalho

```markdown
## US-XXX: [Título da User Story]

**Como** [tipo de usuário]  
**Quero** [ação desejada]  
**Para** [benefício/objetivo]
```

### 2. Impacto na North Star Metric (OBRIGATÓRIO)

```markdown
## 🌟 Impacto na North Star Metric

**Nível de Impacto**: [ ] Alto | [ ] Médio | [ ] Baixo | [ ] Nenhum

**Métrica North Star**: Contratações bem-sucedidas com avaliação positiva (≥4 estrelas)

**Justificativa**:
[Explique como esta user story impacta a North Star Metric]
```

**Classificação**:
- **Alto**: Impacta DIRETAMENTE a North Star
- **Médio**: Melhora indiretamente a North Star
- **Baixo**: Impacta pouco a North Star
- **Nenhum**: Não impacta North Star

### 3. Critérios de Aceitação

```markdown
## ✅ Critérios de Aceitação

- [ ] Critério 1: [Descrição clara e testável]
- [ ] Critério 2: [Descrição clara e testável]
- [ ] Critério 3: [Descrição clara e testável]
```

**Requisitos**:
- Critérios claros e testáveis
- Mínimo 3 critérios
- Cada critério deve ser verificável

### 4. Validação de Guardrails (OBRIGATÓRIO)

```markdown
## 🛡️ Validação de Guardrails

**Consultar**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`

- [ ] User Story NÃO viola nenhuma regra ❌ NUNCA
- [ ] User Story NÃO implementa destaque pago para músicos
- [ ] User Story NÃO permite manipulação de ranking
- [ ] User Story NÃO viola Clean Architecture
- [ ] User Story cumpre todos os ✅ SEMPRE aplicáveis
```

### 5. Regras de Negócio (para Backend)

```markdown
## 📋 Regras de Negócio (para implementar no backend)

- RN001: [Descrição da regra]
- RN002: [Descrição da regra]
- RN003: [Descrição da regra]
```

### 6. APIs Necessárias

```markdown
## 🔌 APIs Necessárias

- `GET /api/[endpoint]` - [Descrição]
- `POST /api/[endpoint]` - [Descrição]
- `PUT /api/[endpoint]` - [Descrição]
```

### 7. Estratégia de Testes

```markdown
## 🧪 Estratégia de Testes

### Testes Unitários
- [ ] Teste 1: [Descrição]
- [ ] Teste 2: [Descrição]

### Testes de Integração
- [ ] Teste 1: [Descrição]

### Testes E2E
- [ ] Teste 1: [Descrição]
```

## Localização

**Arquivo**: `docs/gestao-ideias/02-execucao/planejamento/scrum-planning/sprints/[feature]/sprint-XX/user-stories.md`

**Formato**: Adicionar ao arquivo existente ou criar novo se necessário.

## Validações Obrigatórias

- [ ] Impacto na North Star preenchido (campo obrigatório)
- [ ] Validação de Guardrails completada
- [ ] Critérios de aceitação claros e testáveis
- [ ] APIs necessárias identificadas
- [ ] Regras de negócio documentadas (se aplicável)

## Referências

- **Template**: `docs/gestao-ideias/04-referencia-tecnica/_templates/user-story-template.md`
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

