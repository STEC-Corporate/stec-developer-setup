---
name: docs-criar-doc-regras-negocio
description: Cria documentação de Business Rules no formato fe-*.md. Use ao documentar regras de negócio de uma feature, ao analisar documentação existente, ou ao criar specs para backend.
---

# Criar Documentação de Business Rules

## Quando Usar

- Ao documentar regras de negócio de uma feature
- Ao criar specs para backend implementar
- Ao analisar se documentação existente está completa
- Ao refatorar documentação para seguir padrão

## Padrão de Nomenclatura

**Arquivo**: `fe-[feature-name].md`

**Localização**: `docs/gestao-tarefas/03-especificacao-produto/business-rules/[perfil]/[feature]/fe-[feature-name].md`

**Exemplo**: `docs/gestao-tarefas/03-especificacao-produto/business-rules/musician/profile/fe-musician-profile.md`

## Estrutura Obrigatória

### 1. Descrição da Feature

```markdown
# fe-[feature-name].md

## 📝 Descrição da Feature

Breve descrição do que a feature faz no frontend.
```

### 2. User Stories para Backend

```markdown
## 🎯 User Stories para Backend

### US[XXX]: [Título da User Story]
**Como** [tipo de usuário]  
**Quero** [ação desejada]  
**Para** [benefício/objetivo]  

**Critérios de Aceitação:**
- [ ] Critério 1: [Descrição clara e testável]
- [ ] Critério 2: [Descrição clara e testável]
- [ ] Critério 3: [Descrição clara e testável]

**Regras de Negócio (para implementar no backend):**
- RN001: [Descrição da regra]
- RN002: [Descrição da regra]

**APIs Necessárias:**
- `GET /api/[endpoint]` - [Descrição]
- `POST /api/[endpoint]` - [Descrição]
```

### 3. Regras de Negócio Detalhadas

```markdown
## 📋 Regras de Negócio Detalhadas

### RN001: [Nome da Regra]
**Descrição**: [Descrição completa]
**Aplicação**: [Quando se aplica]
**Validação**: [Como validar]

### RN002: [Nome da Regra]
...
```

### 4. Dependências

```markdown
## 🔗 Dependências

- **Microsserviço**: [nome-do-microsserviço]
- **APIs externas**: [se houver]
- **Outras features**: [se houver]
```

## Regras para User Stories

- **SEMPRE** usar o prefixo `fe-` para diferenciar do backend
- **NUNCA** incluir código ou implementação técnica
- **SEMPRE** focar no "O QUE" e não no "COMO"
- **OBRIGATÓRIO** especificar APIs necessárias
- **ESSENCIAL** definir critérios de aceitação claros
- **FUNDAMENTAL** identificar regras de negócio para o backend

## Formato de Regras de Negócio

**Padrão**: `RN[XXX]: [Descrição]`

**Exemplo**:
- RN001: artisticName é OPCIONAL - músico pode usar apenas nome real
- RN002: Validação de telefone deve aceitar formato internacional (+55 11 98765-4321)
- RN003: Email deve ser único por conta, não por perfil

## Validações Obrigatórias

- [ ] Arquivo segue padrão `fe-[feature-name].md`
- [ ] User Stories formatadas corretamente
- [ ] Critérios de aceitação claros e testáveis
- [ ] Regras de negócio identificadas (RN001, RN002...)
- [ ] APIs necessárias especificadas
- [ ] Dependências documentadas

## Referências

- **Modelo de estrutura**: `docs/gestao-tarefas/03-especificacao-produto/business-rules/_model/modelo-fe-business-rules.md`
- **Padrão de Documentação**: `.cursor/skills/docs-criar-doc-regras-negocio/SKILL.md` (esta skill é a fonte canônica)
- **Business Rules README**: `docs/gestao-tarefas/03-especificacao-produto/business-rules/README.md`
- **User Story Template**: `docs/gestao-ideias/04-referencia-tecnica/_templates/user-story-template.md`
- **Feature Checklist**: `docs/gestao-ideias/04-referencia-tecnica/_templates/feature-checklist.md` (Fase 1)

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

