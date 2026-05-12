---
name: code-criar-completude-feature
description: Cria feature completa seguindo feature-checklist.md e padrões do projeto. Use ao implementar nova feature, refatorar feature existente, ou quando precisar garantir que feature segue todos os padrões obrigatórios.
---

# Criar Feature Completa

## Quando Usar

- Ao implementar nova feature
- Ao refatorar feature existente para seguir padrões
- Quando precisar garantir completude de feature
- Ao migrar feature legada para padrões atuais

## Processo Completo

### Fase 0: Validação Estratégica (OBRIGATÓRIA)

**Usar Skill**: `planejamento-validar-feature-strategy`

**Verificar**:
- ✅ Feature aprovada contra Guardrails
- ✅ Impacto na North Star calculado
- ✅ Decisões anteriores consultadas
- ✅ Score de priorização ≥ 1.0

**Se não aprovada**: Parar e documentar motivo.

### Fase 1: Documentação (Antes do Código)

#### Business Rules
- Criar `docs/gestao-tarefas/03-especificacao-produto/business-rules/[perfil]/[feature].md`
- Documentar User Stories com formato padrão
- Incluir critérios de aceitação claros
- Identificar regras de negócio para backend

#### User Flows
- Criar `docs/gestao-tarefas/03-especificacao-produto/user-flows/[perfil]/[feature]-user-flow.md`
- Documentar fluxo principal
- Documentar fluxos alternativos
- Documentar casos de erro

#### API Specifications
- Criar pasta `docs/gestao-tarefas/03-especificacao-produto/api-specifications/[perfil]/[feature]/`
- `endpoints.md`: Todos endpoints documentados
- `types.ts`: Types TypeScript definidos
- `examples.md`: Exemplos de request/response

#### Testing Strategy
- Executar skill **create-testing-strategy** (ela perguntará ao usuário o path de salvamento)
- Planejar testes unitários (≥75% cobertura)
- Planejar testes de integração
- Planejar testes E2E (fluxos críticos)

### Fase 2: Implementação

#### Estrutura Clean Architecture

Criar estrutura por feature:

```
src/features/[feature-name]/
├── domain/
│   ├── types/           # Types TypeScript
│   ├── interfaces/      # Contratos de API
│   └── validations/     # Schemas Zod
├── application/
│   ├── services/        # API Services
│   ├── hooks/           # Custom Hooks (max 150 linhas)
│   ├── transformers/    # Data Transformers
│   └── state/           # State Management
├── infrastructure/
│   ├── clients/         # HTTP Clients
│   └── config/          # Endpoints config
└── presentation/
    ├── components/      # Componentes React (max 200 linhas)
    └── pages/           # Pages Next.js
```

#### Domain Layer
- Types TypeScript criados (`domain/types/`)
- Interfaces de API criadas (`domain/interfaces/`)
- Schemas Zod criados (`domain/validations/`)
- Documentação `fe-*.md` referenciada

#### Application Layer
- API Services implementados (`application/services/`)
- Custom Hooks criados (`application/hooks/`) - max 150 linhas
- Data Transformers criados (`application/transformers/`)
- State management (Context) se necessário

#### Infrastructure Layer
- HTTP Client configurado (`infrastructure/clients/`)
- Endpoints configurados (`infrastructure/config/`)
- Error handling implementado
- Retry logic implementado

#### Presentation Layer
- Componentes React criados (`presentation/components/`) - max 200 linhas
- Pages criadas (`presentation/pages/`)
- Formulários com validação Zod
- **Aplicar padrão universal de UI/UX** (usar Skill `code-aplicar-ui-ux-patterns`)

### Fase 3: Testes

#### Testes Unitários (Jest + Testing Library)
- API Services testados (≥80% cobertura)
- Hooks testados (≥85% cobertura)
- Validações testadas
- Transformers testados

#### Testes de Integração
- Fluxos domain → application → presentation testados
- API calls mockadas testadas
- State management testado

#### Testes E2E (Playwright)
- Fluxo principal testado
- Casos de erro testados
- Role-based locators usados (`getByRole`, `getByLabel`)
- Web-first assertions usadas

**Cobertura mínima**: ≥75% geral

### Fase 4: Validação Final

#### Padrões de UI/UX
- Tooltips em todos campos/botões
- TabHelpButton em todas abas
- Botão Criar → Modal (cor do perfil)
- Card Clicável → Modal Detalhes
- Cores corretas (perfil vs navegação)
- Margens padrão (`w-full px-4 py-6 sm:px-6 lg:px-6`)

#### Code Quality
- Clean Architecture respeitada
- TypeScript strict mode sem erros
- Nenhum `any` usado
- RORO pattern aplicado
- Guard clauses em início de funções

#### Performance
- Server Components usados quando possível
- `'use client'` apenas quando necessário
- Imagens otimizadas
- Code splitting implementado

#### Acessibilidade
- ARIA labels em todos elementos interativos
- Navegação por teclado funcional
- Contraste WCAG AA mínimo
- Screen reader compatibility

## Checklist de Validação

- [ ] Fase 0 completada e aprovada
- [ ] Documentação completa (business-rules, user-flows, api-specs, testing)
- [ ] Estrutura Clean Architecture criada
- [ ] Código segue `.cursorrules`
- [ ] Testes criados (≥75% cobertura)
- [ ] Padrões UI/UX aplicados
- [ ] Code quality validada
- [ ] Performance otimizada
- [ ] Acessibilidade verificada

## Referências

- **Feature Checklist**: `docs/gestao-ideias/04-referencia-tecnica/_templates/feature-checklist.md`
- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- **Padrões**: `.cursorrules`
- **Clean Architecture**: `docs/gestao-ideias/02-execucao/planejamento/architecture/clean-architecture.md`
- **UI/UX Patterns**: `.cursor/skills/code-aplicar-ui-ux-patterns/SKILL.md`
- **Testing**: `.cursor/skills/testes-frontend-conventions/SKILL.md`

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

