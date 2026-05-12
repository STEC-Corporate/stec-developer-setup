# ✅ Checklist de Nova Feature

> **Use este checklist ANTES e DURANTE a implementação de qualquer feature**

---

## 📋 Feature: [Nome da Feature]

**Data de Início**: [Data]  
**Responsável**: [Nome]  
**Sprint**: [Número]

---

## Fase 0: 🛡️ Validação Estratégica (OBRIGATÓRIA)

> **CRÍTICO**: Esta fase deve ser completada ANTES de começar a implementação

### Guardrails

**Consultar**: `.cursor/docs/ia/guardrails.md`

- [ ] Li completamente o documento `.cursor/docs/ia/guardrails.md`
- [ ] Feature NÃO viola nenhum ❌ NUNCA
  - [ ] ❌ NÃO implementa destaque pago para músicos
  - [ ] ❌ NÃO permite manipulação de ranking
  - [ ] ❌ NÃO permite boost de visibilidade por pagamento
  - [ ] ❌ NÃO viola Clean Architecture
  - [ ] ❌ NÃO quebra transparência no sistema
- [ ] Feature cumpre todos ✅ SEMPRE aplicáveis
  - [ ] ✅ Ranking baseado em mérito (se aplicável)
  - [ ] ✅ Transparência mantida (se aplicável)
  - [ ] ✅ Clean Architecture respeitada
  - [ ] ✅ Dados verificáveis (se aplicável)
- [ ] Decisão: ✅ Aprovada para implementação | ❌ Rejeitada | ⚠️ Requer ajustes

**Se rejeitada ou requer ajustes**: Documentar motivo em `docs/decisoes/decision-log.md`

### North Star Metric

**Consultar**: `docs/planejamento/metrics/north-star.md`

- [ ] Li documento da North Star Metric
- [ ] Calculei impacto na North Star: "Contratações bem-sucedidas com avaliação ≥4 estrelas"
  - [ ] 🟢 Alto (>10% impacto) → Prioridade ALTA
  - [ ] 🟡 Médio (5-10% impacto) → Prioridade MÉDIA
  - [ ] 🔴 Baixo (<5% impacto) → Prioridade BAIXA
  - [ ] ⚪ Nenhum (manutenção/refatoração) → Reavaliar necessidade
- [ ] Justificativa do impacto documentada
- [ ] Se impacto Baixo/Nenhum: Confirmado que feature ainda é necessária

### Priorização

**Consultar**: `.cursor/docs/ia/playbooks/feature-prioritization.md`

- [ ] Usei o Playbook de Priorização para calcular score
- [ ] Score de priorização ≥ 1.0 (mínimo para implementar)
- [ ] Fatores considerados:
  - [ ] Impacto na North Star
  - [ ] Alinhamento com OKRs
  - [ ] Complexidade técnica
  - [ ] Riscos identificados

### Decisões Anteriores

**Consultar**: `docs/decisoes/decision-log.md` e `docs/decisoes/adr-*.md`

- [ ] Consultei Decision Log
- [ ] Não há decisão anterior conflitante
- [ ] Se há decisão similar: Seguindo decisão anterior
- [ ] Consultei ADRs relevantes:
  - [ ] ADR-001: Sem plano premium para músicos
  - [ ] ADR-002: Ranking apenas por mérito
  - [ ] ADR-003: Perfis Producer/Manager separados
  - [ ] ADR-004: Clean Architecture Frontend
  - [ ] ADR-005: Next.js 14 App Router

**Resultado da Fase 0**:
- [ ] ✅ Feature APROVADA para implementação
- [ ] Entry criada em `docs/decisoes/decision-log.md`
- [ ] Se decisão arquitetural importante: ADR criada

---

## Fase 1: 📝 Documentação (Antes do Código)

### Business Rules

- [ ] Arquivo `docs/fluxo/business-rules/[perfil]/[feature].md` criado
- [ ] User Stories documentadas com formato:
  - [ ] Como [usuário]
  - [ ] Quero [ação]
  - [ ] Para [benefício]
- [ ] Critérios de Aceitação claros e testáveis
- [ ] Regras de Negócio identificadas (para backend)
- [ ] Validações de UI especificadas

### User Flows

- [ ] Arquivo `docs/fluxo/user-flows/[perfil]/[feature]-user-flow.md` criado
- [ ] Fluxo principal documentado
- [ ] Fluxos alternativos documentados
- [ ] Casos de erro documentados
- [ ] Diagramas criados (se necessário)

### API Specifications

- [ ] Pasta `docs/fluxo/api-specifications/[perfil]/[feature]/` criada
- [ ] `endpoints.md`: Todos endpoints documentados
- [ ] `types.ts`: Todos types TypeScript definidos
- [ ] `examples.md`: Exemplos de request/response
- [ ] Validação de Guardrails adicionada em `endpoints.md`

### Testing Strategy

- [ ] Testes unitários planejados (≥75% cobertura)
- [ ] Testes de integração planejados
- [ ] Testes E2E planejados (fluxos críticos)
- [ ] Casos de teste documentados

---

## Fase 2: 🏗️ Implementação

### Setup

- [ ] Branch criada: `feature/[nome-feature]`
- [ ] Estrutura de pastas seguindo Clean Architecture
  - [ ] `domain/` (types, interfaces, validations)
  - [ ] `application/` (services, hooks, state)
  - [ ] `infrastructure/` (clients, config)
  - [ ] `presentation/` (components, pages)

### Domain Layer

- [ ] Types TypeScript criados (`domain/types/`)
- [ ] Interfaces de API criadas (`domain/interfaces/`)
- [ ] Schemas Zod criados (`domain/validations/`)
- [ ] Documentação `fe-*.md` referenciada

### Application Layer

- [ ] API Services implementados (`application/services/`)
- [ ] Custom Hooks criados (`application/hooks/`)
- [ ] Máximo 150 linhas por hook
- [ ] Data Transformers criados (`application/transformers/`)
- [ ] State management (Context) se necessário

### Infrastructure Layer

- [ ] HTTP Client configurado (`infrastructure/clients/`)
- [ ] Endpoints configurados (`infrastructure/config/`)
- [ ] Error handling implementado
- [ ] Retry logic implementado

### Presentation Layer

- [ ] Componentes React criados (`presentation/components/`)
- [ ] Máximo 200 linhas por componente
- [ ] Pages criadas (`presentation/pages/`)
- [ ] Formulários com validação Zod
  - [ ] Padrão Universal de UI/UX seguido:
  - [ ] Botão "Criar" abre modal (cor do perfil - usar `useProfileButtonColor()`)
  - [ ] Cards clicáveis abrem modal de detalhes
  - [ ] Modal de detalhes tem CRUD completo (Editar/Excluir/Fechar)
  - [ ] Tooltips em TODOS os campos (`title` e `data-tooltip` attributes)
  - [ ] Tooltips em TODOS os botões
  - [ ] TabHelpButton em todas as abas principais
  - [ ] TabHelpButton em todas as sub-abas
  - [ ] Links help direcionam para páginas específicas
  - [ ] Cores consistentes (cor do perfil para modais, Cinza `#F3F4F6` para navegação)
  - [ ] Botões de navegação são CINZAS (`variant="outline"` com `bg-gray-100` `#F3F4F6`)
  - [ ] Botões que abrem modais seguem cor do perfil (Músico=Verde `#2D7A4F`, Contratante=Azul `#3B82F6`, Profissionais=Vinho `#8B1A1A`, Admin=Marrom `#92400E`)
  - [ ] Padrão de margens: `w-full px-4 py-6 sm:px-6 lg:px-6`
  - [ ] Títulos principais: `text-2xl font-bold`
  - [ ] Descrições: `text-sm text-muted-foreground`
  - [ ] Título sempre seguido de descrição
  - [ ] Barra de busca padrão (quando aplicável): container com `flex flex-wrap gap-4 p-4 border rounded-lg bg-card`
  - [ ] Botões de ação sempre visíveis, mesmo quando aba está vazia

### Componentização (OPCIONAL - apenas se feature envolver extração de componentes)

> **Use quando**: A feature identifica padrões repetidos que podem ser extraídos em componentes reutilizáveis

**Consultar**: `docs/_templates/componentizacao-checklist.md` para checklist completo

- [ ] Identifiquei padrões repetidos (3+ ocorrências com 70%+ similaridade)
- [ ] Validei critérios de extração:
  - [ ] Variações podem ser resolvidas via props/slots
  - [ ] Padrão visual/UX é obrigatório
  - [ ] Não há diferenças grandes de layout/fluxo
- [ ] Se extraindo componente:
  - [ ] Componente criado em `src/components/[categoria]/[nome]`
  - [ ] Clean Architecture respeitada (apenas apresentação)
  - [ ] Props e slots definidos
  - [ ] Types TypeScript criados
  - [ ] Variações por perfil suportadas (se aplicável)
  - [ ] Testes de migração executados (smoke, visual, por perfil)
  - [ ] Evidências visuais capturadas

**Se componente extraído**: Preencher `docs/_templates/componentizacao-checklist.md` completo

---

## Fase 3: 🧪 Testes

### Testes Unitários (Jest + Testing Library)

- [ ] API Services testados (≥80% cobertura)
- [ ] Hooks testados (≥85% cobertura)
- [ ] Validações testadas
- [ ] Transformers testados
- [ ] Utilities testados

### Testes de Integração

- [ ] Fluxos domain → application → presentation testados
- [ ] API calls mockadas testadas
- [ ] State management testado

### Testes E2E (Playwright)

- [ ] Fluxo principal testado
- [ ] Casos de erro testados
- [ ] Role-based locators usados (`getByRole`, `getByLabel`)
- [ ] Web-first assertions usadas

### Cobertura de Testes

- [ ] Cobertura geral ≥ 75%
- [ ] Cobertura de services ≥ 80%
- [ ] Cobertura de hooks ≥ 85%
- [ ] Nenhum teste falhando
- [ ] Linter errors = 0

---

## Fase 4: ✅ Validação Final

### Padrões de UI/UX

- [ ] **Tooltips e Help:**
  - [ ] Todos os campos têm tooltips (`title` e `data-tooltip`)
  - [ ] Todos os botões têm tooltips
  - [ ] Todas as abas têm TabHelpButton
  - [ ] Todas as sub-abas têm TabHelpButton
  - [ ] Links help direcionam para páginas específicas
  - [ ] Títulos e descrições NÃO têm tooltips (são autoexplicativos)

- [ ] **Criação e Visualização:**
  - [ ] Botão "Criar" abre modal (cor do perfil - usar `useProfileButtonColor()`)
  - [ ] Cards clicáveis abrem modal de detalhes
  - [ ] Modal de detalhes tem CRUD completo
  - [ ] Cards mostram apenas informações resumidas
  - [ ] Modais mostram todas as informações detalhadas
  - [ ] Botões de ação sempre visíveis, mesmo quando aba está vazia

- [ ] **Layout e Margens:**
  - [ ] Padrão de margens: `w-full px-4 py-6 sm:px-6 lg:px-6`
  - [ ] NÃO usar `container mx-auto`
  - [ ] Títulos principais: `text-2xl font-bold`
  - [ ] Descrições: `text-sm text-muted-foreground`
  - [ ] Título sempre seguido de descrição

- [ ] **Cores de Botões:**
  - [ ] Botões que abrem modais: Cor do perfil (usar `useProfileButtonColor()` hook)
    - [ ] Músico: Verde `#2D7A4F` / hover `#1A4A2F`
    - [ ] Contratante: Azul `#3B82F6` / hover `#2563EB`
    - [ ] Profissionais: Vinho `#8B1A1A` / hover `#7C1A1A`
    - [ ] Admin: Marrom `#92400E` / hover `#78350F`
  - [ ] Botões que navegam para páginas: CINZA (`variant="outline"` com `bg-gray-100` `#F3F4F6`)
  - [ ] Cores consistentes em toda a feature
  - [ ] Contraste WCAG AA verificado para todas as cores
  - [ ] **Referência completa**: Ver `docs/referencia/dev/components/cores-referencia-hexadecimal.md`

- [ ] **Barra de Busca (quando aplicável):**
  - [ ] Container: `flex flex-wrap gap-4 p-4 border rounded-lg bg-card`
  - [ ] Input: `flex-grow min-w-[200px] sm:min-w-[250px]` com ícone de busca
  - [ ] Filtros: `min-w-[180px] flex-grow sm:flex-grow-0` à direita

### Code Quality

- [ ] Código segue Clean Architecture
- [ ] TypeScript strict mode sem erros
- [ ] Nenhum `any` usado (usar `unknown` se necessário)
- [ ] RORO pattern aplicado
- [ ] Funções puras quando possível
- [ ] Guard clauses em início de funções
- [ ] Early returns para error handling

### Performance

- [ ] Server Components usados quando possível
- [ ] `'use client'` apenas quando necessário
- [ ] Imagens otimizadas (WebP, lazy loading)
- [ ] Code splitting implementado
- [ ] Suspense boundaries adequados

### Acessibilidade

- [ ] ARIA labels em todos elementos interativos
- [ ] Navegação por teclado funcional
- [ ] Contraste WCAG AA mínimo
- [ ] Screen reader compatibility
- [ ] Touch targets ≥ 44px (mobile)
- [ ] TabHelpButton acessível (suporte a teclado e screen reader)
- [ ] Tooltips acessíveis (suporte a teclado)

### Segurança

- [ ] Validação de inputs com Zod
- [ ] Sanitização de dados
- [ ] Authentication verificada
- [ ] Sem dados sensíveis em logs
- [ ] Headers de segurança configurados

### Documentação

- [ ] Comentários JSDoc em funções complexas
- [ ] README da feature criado (se necessário)
- [ ] API Specifications atualizadas
- [ ] Decision Log atualizado
- [ ] Se decisão arquitetural: ADR criada
- [ ] Páginas Help criadas (se aplicável) com instruções completas
- [ ] Links help funcionando e direcionando para páginas corretas

---

## Fase 5: 🚀 Deploy e Monitoramento

### Pre-Deploy

- [ ] Code review completado
- [ ] Testes passando em CI/CD
- [ ] Build sem erros
- [ ] Linter sem warnings
- [ ] Lighthouse score ≥ 90 (performance)

### Deploy

- [ ] Deploy em staging
- [ ] Testes de smoke realizados
- [ ] Validação de funcionalidade em staging
- [ ] Aprovação de stakeholders
- [ ] Deploy em produção

### Post-Deploy

- [ ] Feature funciona conforme especificado
- [ ] Nenhum erro em produção
- [ ] Métricas sendo coletadas
- [ ] Documentação atualizada
- [ ] Retrospectiva agendada

---

## 📊 Métricas da Feature

### Impacto na North Star

- **Impacto Esperado**: [Alto/Médio/Baixo/Nenhum]
- **Justificativa**: [Como impacta "Contratações bem-sucedidas com avaliação ≥4"]
- **Métrica a Monitorar**: [Qual métrica vai mostrar o impacto]

### OKRs Relacionados

- **OKR Trimestral**: [Referência]
- **Key Results Impactados**: [Lista]
- **Contribuição Esperada**: [%]

---

## 🔗 Links Importantes

- **Business Rules**: `docs/fluxo/business-rules/[perfil]/[feature].md`
- **User Flows**: `docs/fluxo/user-flows/[perfil]/[feature]-user-flow.md`
- **API Specs**: `docs/fluxo/api-specifications/[perfil]/[feature]/`
- **Guardrails**: `.cursor/docs/ia/guardrails.md`
- **North Star**: `docs/planejamento/metrics/north-star.md`
- **Playbooks**: `.cursor/docs/ia/playbooks/`
- **Decision Log**: `docs/decisoes/decision-log.md`

---

## 💬 Notas e Observações

[Qualquer informação adicional, riscos identificados, lições aprendidas, etc.]

---

**Criado em**: [Data]  
**Última Atualização**: [Data]  
**Status**: [ ] Em Planejamento | [ ] Em Desenvolvimento | [ ] Em Testes | [ ] Em Review | [ ] Concluída
