---
name: arquitetura-validar-arquitetura-limpa
description: Valida estrutura de pastas e dependências seguindo Clean Architecture. Use ao criar nova feature, refatorar código ou analisar estrutura.
---

# Validar Clean Architecture

## Quando usar

- Ao criar nova feature
- Ao refatorar código existente
- Ao analisar se estrutura está correta
- Ao validar dependências entre camadas

## Estrutura (Frontend Oficial)

```
src/features/[feature-name]/
├── domain/
│   ├── types/
│   ├── interfaces/
│   └── validations/
├── application/
│   ├── services/
│   ├── hooks/
│   ├── transformers/
│   └── state/
├── infrastructure/
│   ├── clients/
│   └── config/
└── presentation/
    ├── components/
    └── pages/
```

## Validações obrigatórias

### 1. Organização por features

- [ ] Código organizado por features em `src/features/`
- [ ] Cada feature tem domain/application/infrastructure/presentation
- [ ] Features não dependem de outras features diretamente

### 2. Dependências entre camadas

**Regra**: Camadas internas NÃO dependem de camadas externas.

- [ ] Domain não depende de nenhuma outra camada
- [ ] Application depende apenas de Domain
- [ ] Infrastructure depende apenas de Domain e Application
- [ ] Presentation depende apenas de Application e Domain

**Imports**: Domain só types/interfaces; Application pode importar Domain; Infrastructure Domain e Application; Presentation Application e Domain.

### 3. Domain

- [ ] Apenas types, interfaces, validations
- [ ] Sem lógica de negócio; sem dependências de outras camadas

### 4. Application

- [ ] API Services, hooks, transformers; máx. 150 linhas por hook
- [ ] Depende apenas de Domain

### 5. Infrastructure

- [ ] Clientes HTTP, config, endpoints
- [ ] Depende de Domain e Application

### 6. Presentation

- [ ] Componentes e pages; máx. 200 linhas por componente
- [ ] Depende de Application e Domain

## Violações comuns

- **Errado**: Domain importar Application/Infrastructure/Presentation.
- **Certo**: Domain só exporta tipos/interfaces.
- **Errado**: Presentation conter lógica de negócio.
- **Certo**: Lógica em Application ou backend.

## Resultado

- Relatório: Conformidade, Violações (Crítico/Alto/Médio), Recomendações.

## Referências

- `.cursor/rules/frontend-clean-architecture.mdc`
- Agent: `.cursor/agents/arquitetura-validar-limpa.md`

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

