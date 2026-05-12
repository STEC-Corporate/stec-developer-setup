---
name: testes-criar-testing-strategy
description: Cria estratégia de testes completa para uma feature. Use ao planejar testes de uma feature, ao analisar estratégia de testes existente, ou ao garantir cobertura adequada.
---

# Criar Estratégia de Testes

## Quando Usar

- Ao planejar testes de uma feature
- Ao analisar se estratégia de testes está completa
- Ao garantir cobertura adequada de testes
- Ao refatorar estratégia de testes

## Fluxo Obrigatório

### Passo 1 (OBRIGATÓRIO): Perguntar o path de salvamento

**Antes de executar qualquer ação**, o agente **DEVE** perguntar ao usuário:

> "Qual o caminho (path) onde os documentos de estratégia de testes devem ser salvos?"

Exemplos de resposta esperada:
- `docs/gestao-ideias/04-referencia-tecnica/arquivo/testing/[perfil]/[feature]/`
- `docs/gestao-ideias/04-referencia-tecnica/verificacao/testing/[perfil]/[feature]/`
- Outro path informado pelo usuário

**Não prosseguir** sem obter o path. Se o usuário não informar, perguntar novamente.

### Passo 2: Executar o fluxo existente

Após obter o path, seguir o fluxo desta skill:
- Criar o arquivo `testing-strategy.md` (ou nome adequado) no path informado
- Usar a estrutura obrigatória abaixo
- Validar conforme checklist de validações

## Localização

**Arquivo**: `[path informado pelo usuário]/testing-strategy.md`

O path é **sempre** obtido na pergunta obrigatória (Passo 1). Não assumir path fixo.

## Estrutura Obrigatória

### 1. Visão Geral

```markdown
# Estratégia de Testes - [Feature Name]

## 📝 Visão Geral

Breve descrição da estratégia de testes para esta feature.
```

### 2. Testes Unitários

```markdown
## 🧪 Testes Unitários

**Cobertura Mínima**: ≥75%

### API Services
- [ ] Teste 1: [Descrição do teste]
- [ ] Teste 2: [Descrição do teste]

### Custom Hooks
- [ ] Teste 1: [Descrição do teste]
- [ ] Teste 2: [Descrição do teste]

### Validações
- [ ] Teste 1: [Descrição do teste]

### Transformers
- [ ] Teste 1: [Descrição do teste]
```

**Cobertura por camada**:
- API Services: ≥80%
- Custom Hooks: ≥85%
- Validações: ≥90%
- Transformers: ≥80%

### 3. Testes de Integração

```markdown
## 🔗 Testes de Integração

### Fluxos Domain → Application → Presentation
- [ ] Teste 1: [Descrição do fluxo testado]

### API Calls Mockadas
- [ ] Teste 1: [Descrição do teste]

### State Management
- [ ] Teste 1: [Descrição do teste]
```

### 4. Testes E2E (Playwright)

```markdown
## 🎭 Testes E2E (Playwright)

### Fluxo Principal
- [ ] Teste 1: [Descrição do fluxo]

### Casos de Erro
- [ ] Teste 1: [Descrição do caso de erro]

### Casos Alternativos
- [ ] Teste 1: [Descrição do caso alternativo]
```

**Requisitos E2E**:
- Usar role-based locators (`getByRole`, `getByLabel`)
- Usar web-first assertions
- Testar fluxos críticos
- Testar casos de erro

### 5. Casos de Teste Detalhados

```markdown
## 📋 Casos de Teste Detalhados

### Caso 1: [Nome do caso]
**Objetivo**: [O que o teste valida]
**Pré-condições**: [Estado inicial necessário]
**Passos**: 
1. [Ação 1]
2. [Ação 2]
**Resultado Esperado**: [O que deve acontecer]

### Caso 2: [Nome do caso]
...
```

### 6. Cobertura de Testes

```markdown
## 📊 Cobertura de Testes

**Cobertura Geral Mínima**: ≥75%

**Cobertura por Camada**:
- Domain: [X]%
- Application: [X]%
- Infrastructure: [X]%
- Presentation: [X]%

**Branches**: ≥80%
**Functions**: ≥85%
```

## Estratégia por Tipo de Teste

### Testes Unitários (Jest + Testing Library)
- **Foco**: Lógica isolada
- **O que testar**: Services, hooks, validations, transformers
- **Mocking**: Mockar dependências externas

### Testes de Integração
- **Foco**: Interação entre camadas
- **O que testar**: Fluxos completos domain → application → presentation
- **Mocking**: Mockar apenas APIs externas

### Testes E2E (Playwright)
- **Foco**: Fluxos de usuário completos
- **O que testar**: Fluxos críticos, casos de erro
- **Locators**: Sempre usar role-based

## Validações Obrigatórias

- [ ] Estratégia de testes criada
- [ ] Testes unitários planejados (≥75% cobertura)
- [ ] Testes de integração planejados
- [ ] Testes E2E planejados (fluxos críticos)
- [ ] Casos de teste documentados
- [ ] Cobertura mínima definida

## Referências

- **Testing Guidelines**: `.cursor/skills/testes-frontend-conventions/SKILL.md`
- **Feature Checklist**: `docs/gestao-ideias/04-referencia-tecnica/_templates/feature-checklist.md` (Fase 3)
- **Testing Examples**: `docs/gestao-ideias/04-referencia-tecnica/referencia/dev/components/testes-exemplo/`

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

