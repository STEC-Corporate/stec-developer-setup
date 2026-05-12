# Estratégia de Testes Completa - SoundLink

> **Documento Estratégico**: Estratégia completa de testes para a SoundLink, incluindo estratégia por camada (Clean Architecture), cobertura mínima por tipo de teste, estratégia por projeto (5 projetos), integração com CI/CD e métricas de qualidade.

---

## 📊 Visão Geral

Este documento apresenta a estratégia completa de testes para a SoundLink, considerando Clean Architecture, os 5 projetos da plataforma, tipos de testes, cobertura mínima e integração com CI/CD.

---

## 🏗️ Estratégia de Testes por Camada (Clean Architecture)

### Domain Layer

**Objetivo**: Validar tipos, interfaces e validações

**Tipos de Testes**:
- **Unit Tests**: Validação de tipos, schemas Zod, interfaces
- **Validation Tests**: Validação de regras de negócio (formato, UI)

**Cobertura Mínima**: 90%+

**Ferramentas**:
- Jest
- Zod (validação)

**Exemplos**:
- Validação de schemas Zod
- Validação de tipos TypeScript
- Validação de interfaces

**Consultar**: `.cursorrules`

---

### Application Layer

**Objetivo**: Validar orquestração, hooks e serviços

**Tipos de Testes**:
- **Unit Tests**: API Services, Custom Hooks, Data Transformers
- **Integration Tests**: Features completas (domain → application → presentation)

**Cobertura Mínima**: 80%+

**Ferramentas**:
- Jest
- React Testing Library
- MSW (Mock Service Worker)

**Exemplos**:
- Testes de API Services
- Testes de Custom Hooks
- Testes de Data Transformers
- Testes de integração de features

**Consultar**: `.cursorrules`

---

### Infrastructure Layer

**Objetivo**: Validar implementações técnicas

**Tipos de Testes**:
- **Unit Tests**: HTTP Clients, External Services, Utilities
- **Integration Tests**: Integrações com APIs externas

**Cobertura Mínima**: 70%+

**Ferramentas**:
- Jest
- MSW (Mock Service Worker)

**Exemplos**:
- Testes de HTTP Clients
- Testes de External Services
- Testes de Utilities
- Testes de integração com APIs

**Consultar**: `.cursorrules`

---

### Presentation Layer

**Objetivo**: Validar UI, componentes e interações

**Tipos de Testes**:
- **Unit Tests**: Componentes React isolados
- **Integration Tests**: Componentes integrados
- **E2E Tests**: Fluxos completos de usuário

**Cobertura Mínima**: 75%+ (unit), 60%+ (E2E)

**Ferramentas**:
- Jest
- React Testing Library
- Playwright (E2E)

**Exemplos**:
- Testes de componentes React
- Testes de formulários
- Testes de interações
- Testes E2E de fluxos

**Consultar**: `.cursorrules`

---

## 📊 Cobertura Mínima por Tipo de Teste

### Unit Tests

**Cobertura Mínima**: 80%+

**Aplicação**:
- Domain Layer: 90%+
- Application Layer: 80%+
- Infrastructure Layer: 70%+
- Presentation Layer: 75%+

**Métricas**:
- Statements: 80%+
- Branches: 80%+
- Functions: 85%+
- Lines: 80%+

---

### Integration Tests

**Cobertura Mínima**: 70%+

**Aplicação**:
- Features completas: 70%+
- Integrações com APIs: 70%+
- Integrações entre camadas: 70%+

**Métricas**:
- Features testadas: 70%+
- Integrações testadas: 70%+
- Fluxos críticos: 100%

---

### E2E Tests

**Cobertura Mínima**: 60%+

**Aplicação**:
- Fluxos críticos: 100%
- Fluxos principais: 80%+
- Fluxos secundários: 60%+

**Métricas**:
- Fluxos críticos: 100%
- Fluxos principais: 80%+
- Fluxos secundários: 60%+

---

## 🎯 Estratégia por Projeto (5 Projetos)

### 1. Template (soundlink-template-frontend)

**Foco**: Referência e documentação

**Uso de dados em testes**: Este é o **único** produto da plataforma SoundLink que utiliza **dados mockados** (canonical) em desenvolvimento e testes. Os demais projetos (Frontend oficial, BFF, API, Infra) consomem **dados reais** ou ambientes de teste integrados. Ver `.cursorrules` (seção "Dados de Desenvolvimento (Mocks)") e `docs/referencia/dev/canonical-mocks.md`.

**Estratégia de Testes**:
- **Unit Tests**: Componentes e hooks
- **Integration Tests**: Features completas
- **E2E Tests**: Fluxos principais

**Cobertura Mínima**:
- Unit: 80%+
- Integration: 70%+
- E2E: 60%+

**CI/CD**: Testes em PRs

---

### 2. Frontend Oficial (soundlink-frontend)

**Foco**: App em produção

**Uso de dados em testes**: Dados reais ou ambientes de teste (APIs/BFF); **não** usa canonical mocks (apenas o Template usa).

**Estratégia de Testes**:
- **Unit Tests**: Componentes críticos
- **Integration Tests**: Features críticas
- **E2E Tests**: Fluxos críticos

**Cobertura Mínima**:
- Unit: 80%+
- Integration: 70%+
- E2E: 80%+ (fluxos críticos)

**CI/CD**: Testes obrigatórios em PRs e deploys

---

### 3. BFF (soundlink-bff)

**Foco**: Orquestração

**Uso de dados em testes**: Integração com APIs reais ou mocks de API; **não** usa canonical do Template.

**Estratégia de Testes**:
- **Unit Tests**: Services e adapters
- **Integration Tests**: Integrações com APIs
- **E2E Tests**: Fluxos de orquestração

**Cobertura Mínima**:
- Unit: 80%+
- Integration: 70%+
- E2E: 60%+

**CI/CD**: Testes obrigatórios em PRs

---

### 4. APIs (soundlink-api)

**Foco**: Microsserviços

**Uso de dados em testes**: Dados reais ou bancos de teste; **não** usa canonical do Template.

**Estratégia de Testes**:
- **Unit Tests**: Services e repositories
- **Integration Tests**: Integrações entre serviços
- **E2E Tests**: Fluxos completos de API

**Cobertura Mínima**:
- Unit: 85%+
- Integration: 75%+
- E2E: 70%+

**CI/CD**: Testes obrigatórios em PRs e deploys

---

### 5. Infrastructure (soundlink-infrastructure)

**Foco**: Infraestrutura

**Uso de dados em testes**: Ambientes e scripts; **não** usa canonical do Template.

**Estratégia de Testes**:
- **Unit Tests**: Scripts e configurações
- **Integration Tests**: Deployments e infraestrutura
- **E2E Tests**: Infraestrutura completa

**Cobertura Mínima**:
- Unit: 70%+
- Integration: 60%+
- E2E: 50%+

**CI/CD**: Testes obrigatórios em PRs

---

## 🔄 Integração com CI/CD

### Pipeline de Testes

**Etapas**:
1. **Lint**: Validação de código
2. **Type Check**: Validação TypeScript
3. **Unit Tests**: Testes unitários
4. **Integration Tests**: Testes de integração
5. **E2E Tests**: Testes end-to-end
6. **Coverage Report**: Relatório de cobertura

**Critérios de Sucesso**:
- ✅ Todos os testes passam
- ✅ Cobertura mínima atingida
- ✅ Sem erros de lint
- ✅ Type check passa

---

### Testes em PRs

**Obrigatório**:
- Lint
- Type Check
- Unit Tests
- Integration Tests (se aplicável)

**Opcional**:
- E2E Tests (pode ser manual)

**Critérios**:
- ✅ Todos os testes obrigatórios passam
- ✅ Cobertura mantida ou aumentada

---

### Testes em Deploys

**Obrigatório**:
- Todos os testes (unit, integration, E2E)
- Coverage report
- Performance tests (se aplicável)

**Critérios**:
- ✅ Todos os testes passam
- ✅ Cobertura mínima atingida
- ✅ Performance dentro dos limites

---

## 📊 Métricas de Qualidade

### Métricas de Cobertura

**Cobertura Geral**:
- Meta: 75%+
- Atual: A preencher na primeira medição (ver "Como medir" abaixo)
- Tendência: A preencher após cada ciclo de medição

**Como medir**: Executar suite de testes com cobertura habilitada (ex.: `npm run test -- --coverage` ou comando equivalente do projeto); consultar relatório gerado (ex.: `coverage/lcov-report/index.html` ou saída no CI). Registrar valor em "Atual" e atualizar "Tendência" na revisão mensal.

**Responsável**: Tech Lead ou QA. **Frequência**: Mensal para atualização de "Atual" e "Tendência"; semanal no CI (badge/relatório no README ou pipeline).

**Cobertura por Tipo**:
- Unit Tests: 80%+
- Integration Tests: 70%+
- E2E Tests: 60%+

**Cobertura por Camada**:
- Domain: 90%+
- Application: 80%+
- Infrastructure: 70%+
- Presentation: 75%+

---

### Métricas de Qualidade de Testes

**Taxa de Sucesso**:
- Meta: 95%+
- Atual: A preencher na primeira medição (proporção de testes que passam no último run)
- Tendência: A preencher após cada ciclo

**Responsável**: Tech Lead / QA. **Frequência**: Mensal (doc); a cada run no CI.

**Tempo de Execução**:
- Unit Tests: < 30s
- Integration Tests: < 5min
- E2E Tests: < 15min

**Manutenibilidade**:
- Testes flaky: < 5%
- Testes duplicados: < 10%
- Testes desatualizados: < 5%

---

## 🎯 O que é fluxo crítico

**Fluxo crítico** = fluxo que (1) impacta diretamente a North Star (contratações bem-sucedidas com avaliação ≥4 estrelas) ou (2) se quebrado gera risco relevante de segurança, receita ou conformidade (ex.: pagamento, autenticação, permissões por perfil). Esses fluxos devem ter **100% de cobertura E2E** e prioridade máxima na execução e manutenção de testes.

---

## 📋 Fluxos críticos (E2E obrigatório)

A lista abaixo define os fluxos que **devem** ter cobertura E2E completa. Novos fluxos que se enquadrem na definição acima devem ser acrescentados aqui.

| # | Nome | Descrição resumida | Status E2E |
|---|------|--------------------|------------|
| 1 | **Proposta → Evento → Pagamento → Avaliação** | Contratante envia proposta → Prestador aceita → Evento confirmado → Evento realizado → Pagamento liberado (escrow) → Avaliação bilateral pós-evento | A implementar |
| 2 | **Autenticação e perfil** | Login → Seleção de perfil ativo → Acesso à área restrita conforme perfil | A implementar |
| 3 | **Criação de evento (com validação)** | Usuário com permissão cria evento; validação de perfil e, quando aplicável, projeto musical (RN-EVENT-001, RN-EVENT-002) | A implementar |
| 4 | **Checkout e escrow** | Contratante assina contrato → Checkout (cachê + taxa) → Pagamento em garantia registrado; fluxo até liberação ao prestador (quando implementado) | A implementar |
| 5 | **Avaliação pós-evento** | Após evento realizado, contratante e prestador avaliam um ao outro (bilaterais, vinculadas ao evento); impacto em North Star | A implementar |

**Responsável pela lista**: Tech Lead / QA. **Atualização**: Ao incluir novo fluxo que atenda à definição de fluxo crítico, adicionar nesta tabela e priorizar E2E.

---

## 🎯 Priorização de Testes

### Prioridade Alta

1. **Fluxos Críticos**: 100% de cobertura E2E
2. **Domain Layer**: 90%+ de cobertura unit
3. **Application Layer**: 80%+ de cobertura unit

### Prioridade Média

4. **Presentation Layer**: 75%+ de cobertura unit
5. **Integration Tests**: 70%+ de cobertura
6. **Infrastructure Layer**: 70%+ de cobertura unit

### Prioridade Baixa

7. **E2E Tests Secundários**: 60%+ de cobertura
8. **Testes de Infraestrutura**: 50%+ de cobertura

---

## 📅 Roadmap de Implementação

### Q1 2026: Fundação

**Foco**: Estrutura e testes críticos

**Ações**:
- Configurar estrutura de testes
- Implementar testes críticos
- Configurar CI/CD

**Métricas**:
- 50%+ de cobertura geral
- 100% de cobertura em fluxos críticos
- CI/CD configurado

---

### Q2 2026: Expansão

**Foco**: Aumentar cobertura

**Ações**:
- Expandir testes unitários
- Adicionar testes de integração
- Melhorar E2E tests

**Métricas**:
- 65%+ de cobertura geral
- 80%+ de cobertura unit
- 60%+ de cobertura E2E

---

### Q3-Q4 2026: Consolidação

**Foco**: Atingir metas de cobertura

**Ações**:
- Completar cobertura mínima
- Otimizar testes
- Melhorar qualidade

**Métricas**:
- 75%+ de cobertura geral
- 80%+ de cobertura unit
- 70%+ de cobertura integration
- 60%+ de cobertura E2E

---

## 🔄 Revisão e Atualização

Este documento deve ser revisado:
- **Mensalmente**: Atualizar métricas de cobertura
- **Trimestralmente**: Reavaliar estratégia e priorização
- **Anualmente**: Revisão estratégica completa

**Próxima Revisão**: A definir (ex.: último dia do mês). **Responsável pela revisão**: Tech Lead ou Strategic Advisor.

---

## 📚 Referências

- **Clean Architecture**: `.cursorrules`
- **Skill de Testes**: `.cursor/skills/create-testing-strategy/SKILL.md`
- **Agents de Qualidade**: `.cursor/agents/code-quality-orchestrator.md`, `.cursor/agents/test-runner.md`
- **Métricas de Qualidade**: `.cursor/docs/ia/quality/quality-metrics.md`
- **Performance**: `.cursor/docs/ia/quality/performance-validation-strategy.md`

---

**Criado em**: 2026-01-21  
**Última atualização**: 2026-02-25  
**Revisão**: Mensal (métricas), Trimestral (estratégia)  
**Responsável**: Tech Lead / Strategic Advisor

---

## 📚 Documentos relacionados

- **Referência rápida**: `docs/referencia/dev/estrategia-testes.md`
- **Fluxos críticos**: tabela "Fluxos críticos (E2E obrigatório)" neste documento
- **Guardrails**: `.cursor/docs/ia/guardrails.md` (regra de cobertura e link para este doc)
