# 📝 Template de User Story

> **Use este template para criar todas as user stories do projeto**

---

## US-XXX: [Título da User Story]

**Como** [tipo de usuário]  
**Quero** [ação desejada]  
**Para** [benefício/objetivo]

---

## 🌟 Impacto na North Star Metric

**Nível de Impacto**: [ ] Alto | [ ] Médio | [ ] Baixo | [ ] Nenhum

**Métrica North Star**: Contratações bem-sucedidas com avaliação positiva (≥4 estrelas)

**Justificativa**:
[Explique como esta user story impacta a North Star Metric]

**Exemplos de classificação**:
- **Alto**: Impacta DIRETAMENTE a North Star (ex: sistema de avaliações, qualidade de match)
- **Médio**: Melhora indiretamente a North Star (ex: melhor busca → melhor match → mais avaliações positivas)
- **Baixo**: Impacta pouco a North Star (ex: dark mode, ajustes visuais)
- **Nenhum**: Não impacta North Star (ex: refatoração interna, manutenção)

---

## ✅ Critérios de Aceitação

- [ ] Critério 1: [Descrição clara e testável]
- [ ] Critério 2: [Descrição clara e testável]
- [ ] Critério 3: [Descrição clara e testável]
- [ ] Critério 4: [Descrição clara e testável]

---

## 🛡️ Validação de Guardrails

**Consultar**: `.cursor/docs/ia/guardrails.md`

- [ ] User Story NÃO viola nenhuma regra ❌ NUNCA
- [ ] User Story NÃO implementa destaque pago para músicos
- [ ] User Story NÃO permite manipulação de ranking
- [ ] User Story NÃO viola Clean Architecture
- [ ] User Story cumpre todos os ✅ SEMPRE aplicáveis
- [ ] User Story mantém transparência (se aplicável)

**ADRs Relacionadas**: 
- [ ] ADR-001: Não há plano premium para músicos (se aplicável)
- [ ] ADR-002: Ranking apenas por mérito (se aplicável)
- [ ] ADR-004: Clean Architecture Frontend (se aplicável)

---

## 📊 Estimativa

**Story Points**: [Fibonacci: 1, 2, 3, 5, 8, 13, 21]  
**Horas Estimadas**: [Horas]  
**Complexidade**: [ ] Simples | [ ] Média | [ ] Complexa

---

## 🔗 Dependências

**Bloqueia**:
- [ ] US-XXX: [Título]

**Bloqueada por**:
- [ ] US-XXX: [Título]

**Relacionada com**:
- [ ] US-XXX: [Título]

---

## 📋 Tarefas Técnicas

- [ ] TASK-XXX: [Descrição da tarefa]
- [ ] TASK-XXX: [Descrição da tarefa]
- [ ] TASK-XXX: [Descrição da tarefa]

---

## 📝 Regras de Negócio (Backend)

**Referência**: `docs/fluxo/business-rules/[perfil]/[feature].md`

- **RN-XXX**: [Descrição da regra a ser implementada no backend]
- **RN-XXX**: [Descrição da regra a ser implementada no backend]

---

## 🔌 APIs Necessárias

**Referência**: `docs/fluxo/api-specifications/[perfil]/[feature]/endpoints.md`

- `GET /api/[endpoint]` - [Descrição]
- `POST /api/[endpoint]` - [Descrição]
- `PUT /api/[endpoint]` - [Descrição]
- `DELETE /api/[endpoint]` - [Descrição]

---

## 🧪 Estratégia de Testes

**Unit Tests**:
- [ ] Componentes UI
- [ ] Hooks
- [ ] Validações

**Integration Tests**:
- [ ] API Services
- [ ] Data transformers

**E2E Tests** (Playwright):
- [ ] Fluxo principal
- [ ] Casos de erro

**Cobertura Esperada**: ≥75%

---

## 📄 Documentação Relacionada

- **Business Rules**: `docs/fluxo/business-rules/[perfil]/[feature].md`
- **User Flows**: `docs/fluxo/user-flows/[perfil]/[feature]-user-flow.md`
- **API Specs**: `docs/fluxo/api-specifications/[perfil]/[feature]/`

---

## 💬 Notas Adicionais

[Qualquer informação adicional relevante, observações, riscos identificados, etc.]

---

**Criado em**: [Data]  
**Criado por**: [Nome]  
**Sprint**: [Número da Sprint]  
**Status**: [ ] Backlog | [ ] Planejada | [ ] Em Desenvolvimento | [ ] Em Review | [ ] Concluída
