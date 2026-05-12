# Skills do Template - Modelo

> **Referência e quando usar as skills do Template.** Inventário canônico em [.cursor/skills/README.md](../../.cursor/skills/README.md). Cada um dos 5 projetos tem `.cursor/skills/` na raiz com skills específicas do seu papel. Agents (ex.: plan-executor) podem invocar estas skills — ver [subagents.md](./subagents.md).

---

## Skills na plataforma (5 projetos)

| Projeto | Papel | Skills (lista) | Caminho |
|---------|--------|----------------|---------|
| **Template** (modelo-template-frontend) | Referência de fluxos, telas, specs de API e migração | 27 skills (18 + 9 de replicação) | `.cursor/skills/` (este repo) |
| **Frontend Oficial** (modelo-frontend) | App em produção; migração e sincronização com Template | aplicar-filtro-migracao, executar-testes, rewrite-imports-migracao, validate-clean-architecture, validate-guardrails | No repo do oficial |
| **BFF** (modelo-bff) | Orquestração e adaptação; mapeamento BFF ↔ API | executar-testes, mapear-endpoint-bff-api, revisar-conformidade, validar-modulo-auth | No repo do BFF |
| **APIs** (modelo-api) | Domínio e regras de negócio | adicionar-endpoint-crud, adicionar-observabilidade-servico, analisar-viabilidade-hexagonal, aplicar-rate-limit-endpoint, atualizar-consolidado-endpoint, avaliar-ddd-contexto, buscar-kb-por-erro, criar-novo-microsservico, criar-ou-ajustar-docker-compose, criar-plano-migracao-hexagonal, detectar-antipatterns, documentar-comandos-docker-local, documentar-endpoint-swagger, escrever-testes-microsservico, especificar-infra-para-modelo-infrastructure, executar-migracao-hexagonal, mapear-endpoint-template-bff-api, mapear-erro-api-codigo, mapear-infra-aws-por-servico, registrar-bug-na-kb, revisar-seguranca-endpoint, revisar-slo-endpoint, sugerir-design-patterns, validar-conformidade-clean-architecture, validar-contrato-api-frontend, validar-solid-modulo, verificar-cobertura-microsservico | `.cursor/skills/` no repo das APIs |
| **Infrastructure** (modelo-infrastructure) | Infraestrutura e DevOps; CI/CD, ambientes, deploy e monitoramento | apply-infra-tagging, create-terraform-module, deploy-infra-checklist, estimate-aws-costs, security-policies-docker, validate-kubernetes-manifests, validate-terraform | `.cursor/skills/` no repo da infraestrutura |

---

## Índice

1. [Skills Estratégicas](#skills-estratégicas)
2. [Skills de Desenvolvimento](#skills-de-desenvolvimento)
3. [Skills de Documentação](#skills-de-documentação)
4. [Skills de Qualidade](#skills-de-qualidade)
5. [Skills de Workflow](#skills-de-workflow)
6. [Skills de North Star e Dicionário de Métricas](#skills-de-north-star-e-dicionário-de-métricas)

---

## Skills Estratégicas

### 1. **validate-feature-strategy** ⭐ CRÍTICA
**Propósito**: Validar features contra Guardrails e North Star antes da implementação

**Quando usar**: Antes de criar qualquer feature nova

**O que faz**:
- Lê `.cursor/docs/ia/guardrails.md` e valida contra proibições
- Calcula impacto na North Star Metric
- Verifica decisões anteriores no Decision Log
- Consulta ADRs relevantes
- Gera relatório de aprovação/rejeição

**Benefício**: Garante que nenhuma feature viole princípios fundamentais

---

### 2. **calculate-north-star-impact**
**Propósito**: Calcular e classificar impacto de features na North Star Metric

**Quando usar**: Durante Fase 0 de validação estratégica

**O que faz**:
- Lê `docs/planejamento/metrics/north-star.md`
- Analisa como feature impacta "Contratações bem-sucedidas com avaliação ≥4 estrelas"
- Classifica: Alto (>10%) / Médio (5-10%) / Baixo (<5%) / Nenhum
- Gera justificativa do impacto

---

---

## Skills de North Star e Dicionário de Métricas

Usadas pelo agent **north-star-metrics-orchestrator** para gerar `north-star.md` e `metric-dictionary.md` em novos projetos. Templates em `docs/_templates/`: north-star-template.md, metric-dictionary-template.md, metric-dictionary-single-entry.md.

### 1. **generate-north-star-doc**
**Propósito**: Gerar `docs/planejamento/metrics/north-star.md` no projeto destino a partir do template e das respostas coletadas pelo north-star-metrics-orchestrator

**Quando usar**: Após o orquestrador coletar as respostas do bloco North Star; ao gerar ou regerar o documento North Star

**O que faz**:
- Lê `docs/_templates/north-star-template.md` (destino ou workspace)
- Mapeia o objeto `answers` para os placeholders do template
- Escreve `docs/planejamento/metrics/north-star.md` no path de destino

**Invocado por**: north-star-metrics-orchestrator

---

### 2. **generate-metric-dictionary-doc**
**Propósito**: Gerar `docs/planejamento/metrics/metric-dictionary.md` no projeto destino a partir dos templates e da lista de métricas por categoria

**Quando usar**: Após o orquestrador coletar categorias e métricas do dicionário; ao gerar ou regerar o dicionário de métricas

**O que faz**:
- Lê `metric-dictionary-template.md` e `metric-dictionary-single-entry.md`
- Gera índice por categoria e seções para cada métrica
- Escreve `docs/planejamento/metrics/metric-dictionary.md` no path de destino

**Invocado por**: north-star-metrics-orchestrator

---

## 🏗️ Skills de Desenvolvimento

### 3. **create-feature-complete** ⭐ CRÍTICA
**Propósito**: Criar feature completa seguindo o `feature-checklist.md`

**Quando usar**: Ao implementar nova feature

**O que faz**:
- Executa Fase 0 (validação estratégica)
- Cria estrutura Clean Architecture (domain/application/infrastructure/presentation)
- Gera código seguindo padrões do `.cursorrules`
- Cria testes (unit/integration/e2e)
- Valida contra padrões UI/UX obrigatórios

**Benefício**: Feature completa e consistente desde o início

---

### 4. **create-api-specification**
**Propósito**: Criar documentação completa de API Specifications

**Quando usar**: Ao documentar endpoints de uma feature

**O que faz**:
- Extrai endpoints do código frontend
- Gera `endpoints.md` com todos os endpoints
- Extrai types TypeScript para `types.ts`
- Cria `examples.md` baseado em mocks
- Valida contra padrões de nomenclatura

**Benefício**: Documentação consistente e completa para backend

---

### 5. **extract-component**
**Propósito**: Guiar processo de componentização seguindo `componentizacao-checklist.md`

**Quando usar**: Ao identificar padrões repetidos (3+ ocorrências)

**O que faz**:
- Identifica padrões repetidos no código
- Valida critérios de extração (70%+ similaridade)
- Projeta API do componente (props/slots)
- Guia migração piloto (1-2 features)
- Valida testes de migração

**Benefício**: Componentização sistemática e segura

---

### 6. **apply-ui-ux-patterns**
**Propósito**: Aplicar padrão universal de UI/UX automaticamente

**Quando usar**: Ao criar componentes de criação/visualização

**O que faz**:
- Aplica padrão: Botão Criar → Modal
- Aplica padrão: Card Clicável → Modal Detalhes
- Adiciona tooltips em todos campos/botões
- Adiciona TabHelpButton em abas
- Aplica cores corretas (perfil vs navegação)
- Aplica margens padrão (`w-full px-4 py-6 sm:px-6 lg:px-6`)

**Benefício**: UI/UX consistente automaticamente

---

## 📝 Skills de Documentação

### 7. **create-user-story**
**Propósito**: Criar User Story seguindo `user-story-template.md`

**Quando usar**: Ao documentar nova User Story

**O que faz**:
- Usa template de User Story
- Inclui campo obrigatório "Impacto na North Star"
- Valida contra Guardrails
- Gera critérios de aceitação
- Identifica APIs necessárias

---

### 8. **create-sprint-plan**
**Propósito**: Criar Sprint Plan completo seguindo `sprint-plan-template.md`

**Quando usar**: Ao planejar nova sprint

**O que faz**:
- Usa template de Sprint Plan
- Inclui Fase 0 (validação estratégica)
- Lista User Stories com impacto North Star
- Gera tarefas técnicas detalhadas
- Cria templates vazios (okr.md, kpi.md, retrospective.md)

---

### 9. **create-business-rules-doc**
**Propósito**: Criar documentação de Business Rules no formato `fe-*.md`

**Quando usar**: Ao documentar regras de negócio de uma feature

**O que faz**:
- Cria arquivo `fe-[feature-name].md`
- Formata User Stories para backend
- Inclui critérios de aceitação
- Lista regras de negócio (RN001, RN002...)
- Identifica APIs necessárias

---

### 10. **create-user-flow-doc**
**Propósito**: Criar documentação de User Flow

**Quando usar**: Ao documentar fluxo de usuário de uma feature

**O que faz**:
- Cria arquivo `fe-[perfil]-[feature]-user-flow.md`
- Documenta fluxo principal
- Documenta fluxos alternativos
- Documenta casos de erro
- Segue padrão de nomenclatura

---

### 11. **create-testing-strategy**
**Propósito**: Criar estratégia de testes completa

**Quando usar**: Ao planejar testes de uma feature

**O que faz**:
- Cria `testing-strategy.md`
- Planeja testes unitários (≥75% cobertura)
- Planeja testes de integração
- Planeja testes E2E (fluxos críticos)
- Documenta casos de teste

---

## ✅ Skills de Qualidade

### 12. **review-code-modelo**
**Propósito**: Revisar código seguindo padrões do Modelo

**Quando usar**: Ao revisar código antes de commit

**O que faz**:
- **⚠️ OBRIGATÓRIO**: Verifica tamanho de arquivos (usa `check-file-sizes`)
- Valida Clean Architecture
- Verifica TypeScript strict mode
- Valida padrões UI/UX
- Verifica cobertura de testes
- Valida contra `.cursorrules`
- Verifica tooltips/help obrigatórios

**Melhoria aplicada**: Agora inclui verificação obrigatória de tamanho de componentes e hooks.

---

### 13. **check-file-sizes** ⭐ CRÍTICA
**Propósito**: Verifica tamanho de arquivos (componentes, hooks, services) contra limites

**Quando usar**: Ao analisar feature, antes de code review, ou validar conformidade

**O que faz**:
- Verifica tamanho de TODOS componentes (máximo 200 linhas)
- Verifica tamanho de TODOS hooks (máximo 150 linhas)
- Verifica tamanho de services (máximo 300 linhas)
- Gera relatório com violações marcadas como 🔴 Crítico
- Lista TODOS arquivos verificados com tamanho

**Benefício**: Garante que limites de tamanho nunca sejam ignorados

---

### 14. **validate-guardrails**
**Propósito**: Validar código/documentação contra Guardrails

**Quando usar**: Antes de qualquer commit

**O que faz**:
- Lê `.cursor/docs/ia/guardrails.md`
- Verifica se código viola proibições
- Verifica se código segue obrigações
- Gera relatório de conformidade

---

### 15. **validate-clean-architecture**
**Propósito**: Validar estrutura de pastas e dependências

**Quando usar**: Ao criar nova feature ou refatorar

**O que faz**:
- Verifica organização por features
- Valida dependências entre camadas
- Verifica se Domain Layer não depende de externas
- Valida separação domain/application/infrastructure/presentation

---

## Skills de Workflow

### 16. **update-sprint-progress**
**Propósito**: Atualizar progresso de sprint (okr.md, kpi.md)

**Quando usar**: Durante/fim de sprint

**O que faz**:
- Atualiza `okr.md` com resultados alcançados
- Atualiza `kpi.md` com métricas
- Atualiza `sprint-plan.md` com status
- Gera `sprint-report.md` (resumo executivo)

---

### 17. **create-retrospective**
**Propósito**: Criar retrospectiva de sprint

**Quando usar**: Fim de sprint

**O que faz**:
- Usa template de retrospectiva
- Identifica o que funcionou bem
- Identifica o que não funcionou
- Extrai feedback sobre documentação
- Gera ações para próxima sprint

---

### 18. **sync-api-specifications**
**Propósito**: Sincronizar API Specifications com código

**Quando usar**: Após mudanças em endpoints/types

**O que faz**:
- Extrai endpoints do código
- Atualiza `endpoints.md`
- Atualiza `types.ts` com types do domain
- Atualiza `examples.md` com mocks
- Valida consistência

---

## Skills de Replicação de Template

Skills usadas pelo fluxo de replicação — ver [template-replication-flow.md](./template-replication-flow.md) e [orquestrador-template-replicacao.plan.md](../dev/planos-executados/orquestrador-template-replicacao.plan.md).

**Modelo** (path canônico): `/home/jesus/Projetos/Holding-STEC-Template`. Fluxo A: 5 projetos → Modelo. Fluxo B: Modelo → projeto template.

| Skill | Propósito | Usada por | Observação |
|-------|-----------|-----------|------------|
| **create-github-repo** | Cria repositório na organização GitHub via API/CLI; inicializa pasta local com git e remote | github-repo-creator | |
| **clone-template-structure** | Copia estrutura de pastas/arquivos da origem para o destino; não modifica origem | template-structure-creator | |
| **adapt-guardrails-domain** | Adapta guardrails.md ao novo domínio (remover Modelo, injetar princípios do negócio) | guardrails-adapter | |
| **copy-adapt-templates** | Copia _templates da origem para o destino e adapta placeholders; origem intacta | templates-copier | |
| **generate-referencia-docs** | Gera docs/referencia/ a partir de _templates/referencia/ com placeholders substituídos (architecture, migracao, etc.) | templates-copier | tech-stack e schema são copiados; demais gerados |
| **create-doc-structure** | Cria pastas business-rules, user-flows, api-specifications por perfil | doc-structure-initializer | |
| **generate-fe-docs** | Gera fe-*.md seguindo padrões (business-rules, user-flows) | business-rules-generator, user-flows-generator | |
| **generate-api-specs** | Gera endpoints.md, types.ts, examples.md base | api-specs-generator | |
| **configure-agents-skills** | **Fluxo A**: Copia agents e skills dos 5 projetos **para o Modelo**. **Fluxo B**: Copia do Modelo para projeto template | ia-config-agent | Quando destino = Modelo: copia dos 5. Quando destino = projeto template: copia do Modelo |
| **validate-template-completeness** | Executa checklist e reporta gaps | template-replication-verifier | |
| **generate-modelo-readme** | Gera README.md na raiz do Modelo com guia de próximos passos, tecnologias, comandos e agents | template-replication-orchestrator (Fluxo A) | |
| **update-model-from-platform** | Atualiza o Modelo com agents/skills/docs dos 5 projetos; usada apenas para o Modelo | template-replication-orchestrator, ia-config-agent | Fluxo A apenas |
| **fetch-from-model** | Busca documentos/itens do Modelo para o projeto atual (definições de negócio, padrões de mercado, processos internos) | model-fetch-agent | Todo projeto |
| **list-catalog-items** | Lista agents e documentos do Modelo organizados por categoria | model-catalog-selector | Projetos template |
| **selective-copy-from-model** | Copia itens selecionados do Modelo para o projeto | model-catalog-selector | Projetos template |

---

## 🎯 Priorização de Implementação

### ⭐ **Alta Prioridade** (Implementar Primeiro)

1. **validate-feature-strategy** - Crítica para evitar violações
2. **create-feature-complete** - Automatiza workflow principal
3. **check-file-sizes** - ⭐ CRÍTICA - Verifica limites obrigatórios
4. **apply-ui-ux-patterns** - Garante consistência visual
5. **create-api-specification** - Essencial para colaboração

### 🟡 **Média Prioridade**

6. **review-code-modelo** - Melhora qualidade (agora inclui verificação de tamanho)
7. **create-user-story** - Acelera documentação
8. **create-sprint-plan** - Padroniza planejamento
9. **extract-component** - Otimiza reutilização (agora identifica componentes grandes)
10. **validate-guardrails** - Valida conformidade

### 🟢 **Baixa Prioridade** (Nice to Have)

11. **calculate-north-star-impact** - Pode ser manual
12. **create-business-rules-doc** - Template já existe
13. **create-user-flow-doc** - Template já existe
14. **update-sprint-progress** - Pode ser manual

---

## ❓ Como as Skills Funcionam

### ⚠️ **Skills NÃO são Scripts Executáveis**

Skills são **instruções para o agente AI**, não scripts que rodam automaticamente do início ao fim.

**Como funciona**:

1. **Detecção Automática**: O agente AI lê a `description` no frontmatter e decide quando aplicar a Skill baseado no contexto da conversa
2. **Aplicação Contextual**: O agente lê o `SKILL.md` e segue as instruções, mas adapta ao contexto específico
3. **Não é Sequencial**: O agente pode pular passos, combinar Skills, ou usar apenas partes relevantes
4. **Bidirecional**: Skills servem tanto para **criar** quanto para **analisar** features existentes

### 📋 **Exemplos de Uso**

#### ✅ **Para Criar Nova Feature**
```
Você: "Criar feature de avaliações de músicos"

Agente detecta: "criar feature" → aplica validate-feature-strategy + create-feature-complete
Agente segue: Instruções passo a passo, mas adapta ao contexto
```

#### ✅ **Para Analisar Feature Existente**
```
Você: "Analisar se a feature de ranking está seguindo os guardrails"

Agente detecta: "analisar" + "guardrails" → aplica validate-guardrails
Agente segue: Lê código existente e valida contra guardrails
```

#### ✅ **Uso Manual/Explícito**
```
Você: "Use a skill validate-feature-strategy para validar esta proposta"

Agente: Aplica a Skill explicitamente, mesmo que não tenha detectado automaticamente
```

### 🎯 **Características Importantes**

| Aspecto | Como Funciona |
|---------|---------------|
| **Execução** | Agente AI lê e interpreta instruções (não é script) |
| **Sequência** | Pode ser sequencial OU adaptativa ao contexto |
| **Uso** | Serve para criar E analisar features |
| **Detecção** | Automática (via description) OU manual (você pede) |
| **Flexibilidade** | Agente pode combinar múltiplas Skills ou usar partes |

### 🔄 **Diferença: Skills vs Scripts**

| Skills | Scripts (Python/Bash) |
|--------|----------------------|
| Instruções para AI | Código executável |
| Interpretado pelo agente | Executado pelo sistema |
| Adaptável ao contexto | Sequencial e determinístico |
| Pode ser parcialmente aplicada | Roda do início ao fim |
| Serve para criar E analisar | Geralmente só para criar/processar |

### 💡 **Exemplos Práticos: Criar vs Analisar**

#### **validate-feature-strategy**
- ✅ **Criar**: "Validar proposta de feature de destaque pago" → Rejeita (viola guardrails)
- ✅ **Analisar**: "Analisar se feature X está violando guardrails" → Lê código e valida

#### **create-feature-complete**
- ✅ **Criar**: "Criar feature de avaliações" → Gera estrutura completa
- ✅ **Analisar**: "Analisar se feature Y segue Clean Architecture" → Valida estrutura existente

#### **apply-ui-ux-patterns**
- ✅ **Criar**: "Criar modal de criação de projeto" → Aplica padrões automaticamente
- ✅ **Analisar**: "Verificar se modais seguem padrão universal" → Valida código existente

#### **review-code-modelo**
- ✅ **Criar**: "Revisar código antes de commit" → Valida novo código
- ✅ **Analisar**: "Revisar feature antiga contra padrões atuais" → Analisa código existente

---

## Como criar uma Skill

Estrutura: `.cursor/skills/[skill-name]/SKILL.md` com frontmatter `name` e `description`. O agente AI usa a description para decidir quando aplicar. Para detalhes, consulte a documentação do Cursor sobre Skills.

---

## Referências

- [Agents (inventário por projeto)](./subagents.md) — plan-executor e outros agents invocam skills
- [.cursor/skills/README.md](../../.cursor/skills/README.md) — inventário canônico das skills do Template
- **Templates**: `docs/_templates/`
- **Guardrails**: [guardrails.md](./guardrails.md)
- **Padrões**: [.cursorrules](../../.cursorrules)
- **Feature Checklist**: `docs/_templates/feature-checklist.md`

---

**Última atualização**: 06/02/2026 — Plataforma 5 projetos; inventário completo de skills (Template 18, Oficial 5, BFF 4, APIs e Infrastructure conforme tabela).
