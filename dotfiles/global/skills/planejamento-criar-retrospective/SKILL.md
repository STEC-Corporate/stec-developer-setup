---
name: planejamento-criar-retrospective
description: Cria retrospectiva de ciclo (Scrumban). Use ao final do ciclo, ao analisar o que funcionou/não funcionou, ou ao extrair feedback sobre documentação e processos.
---

# Criar Retrospectiva (Scrumban)

## Alinhamento obrigatório

- Consultar `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/SCRUMBAN-GUIDE.md` (melhoria contínua, DoR/DoD, métricas de fluxo).
- Complemento de fluxo dos artefatos: `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/GUIA-FLUXO-SPRINT.md`.

## Quando Usar

- Ao final do ciclo de trabalho (equivalente a fim de sprint)
- Ao analisar o que funcionou/não funcionou
- Ao extrair feedback sobre documentação
- Ao identificar ações para o próximo ciclo

## Localização

**Arquivo**: `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/[feature]/[pasta-do-ciclo]/retrospective.md`

**Exemplo**: `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/musician-profile/01-cadastro-infopessoal/retrospective.md`

## Estrutura Obrigatória

### 1. O que Funcionou Bem ✅

```markdown
## ✅ O que Funcionou Bem

- [Item 1]: [Descrição do que funcionou e por quê]
- [Item 2]: [Descrição do que funcionou e por quê]
- [Item 3]: [Descrição do que funcionou e por quê]
```

**Focar em**:
- Processos que aceleraram desenvolvimento
- Documentação que ajudou
- Ferramentas que funcionaram bem
- Comunicação eficiente

### 2. O que Não Funcionou ❌

```markdown
## ❌ O que Não Funcionou

- [Item 1]: [Descrição do problema e impacto]
- [Item 2]: [Descrição do problema e impacto]
- [Item 3]: [Descrição do problema e impacto]
```

**Focar em**:
- Bloqueios encontrados
- Documentação incompleta ou confusa
- Processos que atrasaram
- Ferramentas que não funcionaram

### 3. Feedback sobre Documentação

```markdown
## 📝 Feedback sobre Documentação

### API Specifications
- [Feedback específico sobre api-specifications/]
- [O que estava bom]
- [O que faltou ou estava confuso]

### Business Rules
- [Feedback sobre business-rules/]
- [O que estava claro]
- [O que precisava mais detalhes]

### User Flows
- [Feedback sobre user-flows/]
- [O que ajudou]
- [O que faltou]
```

**Importante**: Este feedback é crítico para melhorar documentação para próximas sprints.

### 4. Ações para Próxima Sprint

```markdown
## 🎯 Ações para Próxima Sprint

- [ ] [Ação 1]: [Descrição e responsável]
- [ ] [Ação 2]: [Descrição e responsável]
- [ ] [Ação 3]: [Descrição e responsável]
```

**Focar em**:
- Melhorias de processo
- Ajustes na documentação
- Ferramentas a adotar/abandonar
- Mudanças de abordagem

## Template Completo

```markdown
# Retrospectiva - Sprint [XX]

## ✅ O que Funcionou Bem

- [Item 1]
- [Item 2]

## ❌ O que Não Funcionou

- [Item 1]
- [Item 2]

## 📝 Feedback sobre Documentação

### API Specifications
- [Feedback]

### Business Rules
- [Feedback]

### User Flows
- [Feedback]

## 🎯 Ações para Próxima Sprint

- [ ] [Ação 1]
- [ ] [Ação 2]
```

## Validações Obrigatórias

- [ ] O que funcionou bem identificado
- [ ] O que não funcionou identificado
- [ ] Feedback sobre documentação fornecido
- [ ] Ações para próxima sprint definidas

## Referências

- **Guia Scrumban**: `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/SCRUMBAN-GUIDE.md`
- **Workflow Colaborativo**: `docs/gestao-ideias/00-governanca/WORKFLOW-COLABORATIVO.md`

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

