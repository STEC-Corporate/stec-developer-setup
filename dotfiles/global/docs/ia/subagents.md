# Agents (SubAgentes) - Modelo

> **Modelo de agents na plataforma (5 projetos) e mapeamento dos agents do Template e dos demais projetos (Frontend Oficial, BFF, APIs, Infrastructure). Repositórios GitHub:** [github.com/ITModelo](https://github.com/ITModelo) (modelo-template-frontend, modelo-frontend, modelo-bff, modelo-api, modelo-infrastructure).

---

## O que são Agents (SubAgentes)?

Agents são **assistentes de IA especializados** para os quais o agente principal do Cursor pode delegar tarefas. Cada um opera em sua própria janela de contexto e retorna o resultado ao agente principal. Na plataforma Modelo, **cada um dos 5 projetos** (Template, Frontend Oficial, BFF, APIs, Infrastructure) tem seus próprios agents em `.cursor/agents/` na raiz do repositório.

---

## Agents na plataforma (5 projetos)

| Projeto | Papel | Agents (lista) | Caminho |
|---------|--------|----------------|---------|
| **Template** (modelo-template-frontend) | Referência de fluxos, telas, specs de API e migração | plan-creator, plan-executor, verifier, guardrails-checker, clean-architecture-validator, feature-completeness-verifier, typescript-strict-enforcer, documentation-generator, erp-crm-specialist, security-auditor, debugger, test-runner | `.cursor/agents/` (este repo) |
| **Frontend Oficial** (modelo-frontend) | App em produção; migração e sincronização com Template | clean-architecture-validator, debugger, guardrails-checker, migration-executor, plan-executor, security-auditor, sync-from-template, test-runner, typescript-strict-enforcer, verifier | `.cursor/agents/` em [modelo-frontend](https://github.com/ITModelo/modelo-frontend) |
| **BFF** (modelo-bff) | Orquestração e adaptação para o frontend; mapeamento BFF ↔ API | bff-orchestrator, bug-analyzer, code-quality, code-validator | `.cursor/agents/` em [modelo-bff](https://github.com/ITModelo/modelo-bff) |
| **APIs** (modelo-api) | Domínio e regras de negócio; contratos consumidos pelo BFF | api-alignment, api-docs-contract, arquitetura-padroes-ddd, docker-local, hexagonal-analyst, hexagonal-evaluator, hexagonal-executor, hexagonal-plan-creator, infra-aws, knowledge-base-bugs, nestjs-clean-api, observability-api, security-api, test-engineer-api | `.cursor/agents/` em [modelo-api](https://github.com/ITModelo/modelo-api) |
| **Infrastructure** (modelo-infrastructure) | Infraestrutura e DevOps; CI/CD, ambientes, deploy e monitoramento | cicd-infra, cost-optimizer, docker-security, kubernetes-ops, local-dev-helper, observability-infra, terraform-architect | `.cursor/agents/` em [modelo-infrastructure](https://github.com/ITModelo/modelo-infrastructure) |

Repositórios GitHub: [Template](https://github.com/ITModelo/modelo-template-frontend) | [Frontend Oficial](https://github.com/ITModelo/modelo-frontend) | [BFF](https://github.com/ITModelo/modelo-bff) | [APIs](https://github.com/ITModelo/modelo-api) | [Infrastructure](https://github.com/ITModelo/modelo-infrastructure).

Skills por projeto: [skills-recomendadas.md](./skills-recomendadas.md).

---

## Agents do Template (modelo-template-frontend)

Os 13 agents do Template estão em [.cursor/agents/](https://github.com/ITModelo/modelo-template-frontend/tree/main/.cursor/agents/). Descrição em uma linha e arquivo:

| Agent | Descrição | Arquivo |
|-------|------------|---------|
| **plan-creator** | Cria planos completos e Build-ready; confronta feature com skills. | [plan-creator.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/plan-creator.md) |
| **plan-executor** | Executa planos na ordem; invoca skills indicadas. | [plan-executor.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/plan-executor.md) |
| **verifier** | Valida trabalho declarado concluído; confirma que está funcional. | [verifier.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/verifier.md) |
| **guardrails-checker** | Verifica conformidade com guardrails do Modelo. | [guardrails-checker.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/guardrails-checker.md) |
| **clean-architecture-validator** | Valida Clean Architecture (camadas, dependências, organização por features). | [clean-architecture-validator.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/clean-architecture-validator.md) |
| **feature-completeness-verifier** | Verifica se features estão completas (checklist, testes, docs). | [feature-completeness-verifier.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/feature-completeness-verifier.md) |
| **typescript-strict-enforcer** | Garante TypeScript strict e princípios SOLID. | [typescript-strict-enforcer.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/typescript-strict-enforcer.md) |
| **documentation-generator** | Gera documentação (user stories, JSDoc, README, APIs). | [documentation-generator.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/documentation-generator.md) |
| **erp-crm-specialist** | Especialista em features ERP/CRM. | [erp-crm-specialist.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/erp-crm-specialist.md) |
| **security-auditor** | Auditoria de segurança (auth, dados sensíveis, vulnerabilidades). | [security-auditor.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/security-auditor.md) |
| **debugger** | Depuração e análise de causa raiz. | [debugger.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/debugger.md) |
| **test-runner** | Executa testes e corrige falhas. | [test-runner.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/test-runner.md) |
| **north-star-metrics-orchestrator** | Orquestra a criação da North Star e do Dicionário de Métricas; faz perguntas em sequência ao usuário e invoca generate-north-star-doc e generate-metric-dictionary-doc. | [north-star-metrics-orchestrator.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/north-star-metrics-orchestrator.md) |

---

## Agents de Replicação de Template

Os agents de replicação operam em dois fluxos — ver [template-replication-flow.md](./template-replication-flow.md) e [orquestrador-template-replicacao.plan.md](../dev/planos-executados/orquestrador-template-replicacao.plan.md).

**Modelo** (path canônico): `/home/jesus/Projetos/Holding-STEC-Template`. Ao mencionar "o modelo", usar este path.

- **Fluxo A**: 5 projetos → Modelo (atualizar o Modelo; não ocorre na duplicação para outros projetos)
- **Fluxo B**: Modelo → projeto template (cópia seletiva ou estrutura completa)

| Agent | Descrição | Arquivo |
|-------|------------|---------|
| **model-fetch-agent** | **Obrigatório em todo projeto**. Busca atualizações do Modelo ou recupera documentos importantes (definições de negócio, padrões de mercado, processos internos da holding) | [model-fetch-agent.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/model-fetch-agent.md) |
| **model-catalog-selector** | Lista agents e documentos do Modelo; organiza por assunto; usuário escolhe; copia do Modelo para o projeto template | [model-catalog-selector.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/model-catalog-selector.md) |
| **template-replication-orchestrator** | Orquestra replicação do Modelo para projeto template; chama github-repo-creator ou structure-creator; valida saída | [template-replication-orchestrator.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/template-replication-orchestrator.md) |
| **github-repo-creator** | Cria repositório GitHub e prepara pasta local; usado quando criar novo projeto | [github-repo-creator.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/github-repo-creator.md) |
| **template-structure-creator** | Cria estrutura de pastas e arquivos base (docs/ e .cursor/) | [template-structure-creator.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/template-structure-creator.md) |
| **guardrails-adapter** | Adapta guardrails ao domínio do destino | [guardrails-adapter.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/guardrails-adapter.md) |
| **templates-copier** | Copia e adapta templates (_templates, eventos) | [templates-copier.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/templates-copier.md) |
| **doc-structure-initializer** | Cria estrutura vazia de business-rules, user-flows, api-specifications | [doc-structure-initializer.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/doc-structure-initializer.md) |
| **business-rules-generator** | Gera fe-*.md iniciais por perfil/feature | [business-rules-generator.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/business-rules-generator.md) |
| **user-flows-generator** | Gera fe-*-user-flow.md iniciais | [user-flows-generator.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/user-flows-generator.md) |
| **api-specs-generator** | Gera endpoints.md, types.ts, examples.md iniciais | [api-specs-generator.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/api-specs-generator.md) |
| **ia-config-agent** | **Fluxo A**: Copia agents e skills dos 5 projetos **para o Modelo**. **Fluxo B**: Copia do Modelo para projeto template | [ia-config-agent.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/ia-config-agent.md) |
| **planning-structure-agent** | Cria estrutura de planejamento e decisões | [planning-structure-agent.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/planning-structure-agent.md) |
| **template-replication-verifier** | Valida que toda estrutura foi duplicada e está consistente | [template-replication-verifier.md](https://github.com/ITModelo/modelo-template-frontend/blob/main/.cursor/agents/template-replication-verifier.md) |

---

## Agents do Frontend Oficial (modelo-frontend)

Os 10 agents do Frontend Oficial estão no repositório modelo-frontend. Repositório: [github.com/ITModelo/modelo-frontend](https://github.com/ITModelo/modelo-frontend). Descrição em uma linha e referência ao arquivo:

| Agent | Descrição | Arquivo |
|-------|------------|---------|
| **clean-architecture-validator** | Valida conformidade com Clean Architecture no Frontend Oficial. Use ao implementar novas features, refatorar código ou revisar estrutura de pastas. | [clean-architecture-validator.md](https://github.com/ITModelo/modelo-frontend/blob/main/.cursor/agents/clean-architecture-validator.md) |
| **debugger** | Debugging specialist for errors and test failures. Use when encountering issues. | [debugger.md](https://github.com/ITModelo/modelo-frontend/blob/main/.cursor/agents/debugger.md) |
| **guardrails-checker** | Verifica conformidade com guardrails do Modelo. Use sempre antes de implementar qualquer feature, tomar decisão arquitetural ou quando IA sugerir algo e você tiver dúvida. | [guardrails-checker.md](https://github.com/ITModelo/modelo-frontend/blob/main/.cursor/agents/guardrails-checker.md) |
| **migration-executor** | Executa migração Template para Frontend Oficial. Lê config de fases no Template, aplica allow/deny sem fake/mock, copia só código, aplica import-rewrite. Consulta docs/gestao-ideias/00-governanca/MAPA-DOCUMENTOS.md. | [migration-executor.md](https://github.com/ITModelo/modelo-frontend/blob/main/.cursor/agents/migration-executor.md) |
| **plan-executor** | Executa planos de trabalho (.cursor/plans/*.plan.md) no Frontend Oficial. Lê o plano, segue fases/todos, invoca skills locais; para sprints, consulta planejamento no Template via docs/gestao-ideias/00-governanca/MAPA-DOCUMENTOS.md. | [plan-executor.md](https://github.com/ITModelo/modelo-frontend/blob/main/.cursor/agents/plan-executor.md) |
| **security-auditor** | Security specialist. Use when implementing auth, payments, or handling sensitive data. | [security-auditor.md](https://github.com/ITModelo/modelo-frontend/blob/main/.cursor/agents/security-auditor.md) |
| **sync-from-template** | Especialista em "o que trazer do Template". Lê manifest, aplica filtros (deny fake/mock), lista arquivos a copiar e regras de rewrite; delega cópia/merge ao Migration Executor ou a script. | [sync-from-template.md](https://github.com/ITModelo/modelo-frontend/blob/main/.cursor/agents/sync-from-template.md) |
| **test-runner** | Test automation expert. Use proactively to run tests and fix failures. | [test-runner.md](https://github.com/ITModelo/modelo-frontend/blob/main/.cursor/agents/test-runner.md) |
| **typescript-strict-enforcer** | Garante TypeScript strict mode. Use proativamente ao escrever código TypeScript, refatorar código existente ou migrar JavaScript para TypeScript. | [typescript-strict-enforcer.md](https://github.com/ITModelo/modelo-frontend/blob/main/.cursor/agents/typescript-strict-enforcer.md) |
| **verifier** | Validates completed work. Use after tasks are marked done to confirm implementations are functional. | [verifier.md](https://github.com/ITModelo/modelo-frontend/blob/main/.cursor/agents/verifier.md) |

---

## Agents do BFF (modelo-bff)

Os 4 agents do BFF estão no repositório modelo-bff. Repositório: [github.com/ITModelo/modelo-bff](https://github.com/ITModelo/modelo-bff). Descrição em uma linha e referência ao arquivo:

| Agent | Descrição | Arquivo |
|-------|------------|---------|
| **bff-orchestrator** | Especialista em orquestração do BFF Modelo e alinhamento com as APIs do monorepo modelo-api. | [bff-orchestrator.md](https://github.com/ITModelo/modelo-bff/blob/main/.cursor/agents/bff-orchestrator.md) |
| **bug-analyzer** | Analisar bugs e sugerir correções com planejamento explícito (mínimo duas opções com prós e contras). | [bug-analyzer.md](https://github.com/ITModelo/modelo-bff/blob/main/.cursor/agents/bug-analyzer.md) |
| **code-quality** | Garantir criação e revisão de código NestJS/TypeScript com qualidade e alinhamento aos padrões do projeto (Clean Architecture, SOLID). | [code-quality.md](https://github.com/ITModelo/modelo-bff/blob/main/.cursor/agents/code-quality.md) |
| **code-validator** | Validar código (arquitetura, padrões, testes) sem aplicar correções; reportar conformidades e desvios. | [code-validator.md](https://github.com/ITModelo/modelo-bff/blob/main/.cursor/agents/code-validator.md) |

---

## Agents das APIs (modelo-api)

Os 14 agents das APIs estão no repositório modelo-api. Repositório: [github.com/ITModelo/modelo-api](https://github.com/ITModelo/modelo-api). Descrição em uma linha e referência ao arquivo:

| Agent | Descrição | Arquivo |
|-------|------------|---------|
| **api-alignment** | Garantir que as APIs (modelo-api) estejam alinhadas ao Template e ao BFF: contratos, user flows e regras de negócio. | [api-alignment.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/api-alignment.md) |
| **api-docs-contract** | Manter documentação Swagger e contratos alinhados ao frontend e ao padrão de erros. Propor ou revisar decorators Swagger e atualizações no CONSOLIDADO quando a API mudar. | [api-docs-contract.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/api-docs-contract.md) |
| **arquitetura-padroes-ddd** | Sugerir design patterns, detectar antipatterns e avaliar DDD onde fizer sentido. | [arquitetura-padroes-ddd.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/arquitetura-padroes-ddd.md) |
| **docker-local** | Facilitar Docker e docker-compose para execucao local. Docker e para ambiente local, nao substitui deploy AWS. | [docker-local.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/docker-local.md) |
| **hexagonal-analyst** | Analisar codigo do microsservico: dependencias, acoplamento, candidatos a portas/adaptadores. Nao altera codigo. | [hexagonal-analyst.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/hexagonal-analyst.md) |
| **hexagonal-evaluator** | Avaliar viabilidade de migrar para Arquitetura Hexagonal. Nao executa codigo. Produz analise e plano; execucao por outro agente. | [hexagonal-evaluator.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/hexagonal-evaluator.md) |
| **hexagonal-executor** | Executar plano de migracao aprovado para Hexagonal (portas e adaptadores). Seguir .cursorrules e plano S21. | [hexagonal-executor.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/hexagonal-executor.md) |
| **hexagonal-plan-creator** | Produzir plano detalhado de migracao para hexagonal mantendo Clean Architecture. Nao executa codigo. | [hexagonal-plan-creator.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/hexagonal-plan-creator.md) |
| **infra-aws** | Mapear toda a infraestrutura necessária na AWS para modelo-api e garantir que seja documentada e implementada no repositório modelo-infrastructure. Decisão do projeto: IaC com Terraform. Compute: ECS Fargate. | [infra-aws.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/infra-aws.md) |
| **knowledge-base-bugs** | Registrar bugs na base de conhecimento com descricao, motivo e solucao. | [knowledge-base-bugs.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/knowledge-base-bugs.md) |
| **nestjs-clean-api** | Implementar ou alterar código de um microsserviço seguindo Clean Architecture, SOLID e padrões do repositório. | [nestjs-clean-api.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/nestjs-clean-api.md) |
| **observability-api** | Adicionar ou revisar métricas (negócio e técnicas), tracing e SLO em microsserviços. Manter nomenclatura compatível com Prometheus e dashboards existentes. | [observability-api.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/observability-api.md) |
| **security-api** | Revisar e aplicar boas práticas de segurança nas APIs: guards (JWT, roles), rate limiting, sanitização de entrada, alinhado ao plano de segurança. | [security-api.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/security-api.md) |
| **test-engineer-api** | Escrever e manter testes alinhados ao plano de testes: unitários, integração e E2E. | [test-engineer-api.md](https://github.com/ITModelo/modelo-api/blob/main/.cursor/agents/test-engineer-api.md) |

---

## Agents da Infrastructure (modelo-infrastructure)

Os 7 agents da Infrastructure estão no repositório modelo-infrastructure. Repositório: [github.com/ITModelo/modelo-infrastructure](https://github.com/ITModelo/modelo-infrastructure). Descrição em uma linha e referência ao arquivo:

| Agent | Descrição | Arquivo |
|-------|------------|---------|
| **cicd-infra** | Especialista em GitHub Actions, OIDC, workflows de deploy e estratégia multi-repositório (infrastructure, backend, frontend). Ajuda com stages (build, test, security, deploy), environment protection, rollback e convenções de secrets/workflows. | [cicd-infra.md](https://github.com/ITModelo/modelo-infrastructure/blob/main/.cursor/agents/cicd-infra.md) |
| **cost-optimizer** | Especialista em custos AWS e estimativas para os ambientes Modelo. Ajuda a dimensionar recursos, explicar custos por ambiente (dev/staging/prod), sugerir right-sizing e estratégias de redução (SPOT, auto-shutdown, retenção). | [cost-optimizer.md](https://github.com/ITModelo/modelo-infrastructure/blob/main/.cursor/agents/cost-optimizer.md) |
| **docker-security** | Especialista em Dockerfiles, políticas de segurança de containers e validação de imagens. Ajuda a seguir templates do projeto, políticas em docker/policies/ e boas práticas (multi-stage, non-root, scanning). | [docker-security.md](https://github.com/ITModelo/modelo-infrastructure/blob/main/.cursor/agents/docker-security.md) |
| **kubernetes-ops** | Especialista em Kubernetes e EKS. Ajuda com manifests (Deployments, Services, ConfigMaps, Secrets), namespaces, HPA, PDB, probes (liveness, readiness, startup), resource limits/requests e segurança (Security Context, Network Policies, IRSA). | [kubernetes-ops.md](https://github.com/ITModelo/modelo-infrastructure/blob/main/.cursor/agents/kubernetes-ops.md) |
| **local-dev-helper** | Especialista em ambiente de desenvolvimento local: docker-compose, Skaffold, scripts de setup/deploy e Kubernetes local. Ajuda a subir apenas o necessário para dev, validar pré-requisitos e seguir o guia de ambiente. | [local-dev-helper.md](https://github.com/ITModelo/modelo-infrastructure/blob/main/.cursor/agents/local-dev-helper.md) |
| **observability-infra** | Especialista em observabilidade: Prometheus, Grafana, AlertManager, métricas, logging e (quando aplicável) OpenTelemetry. Ajuda a configurar dashboards, alertas, ServiceMonitors e integração com a stack do Modelo. | [observability-infra.md](https://github.com/ITModelo/modelo-infrastructure/blob/main/.cursor/agents/observability-infra.md) |
| **terraform-architect** | Especialista em Infrastructure as Code com Terraform e AWS. Ajuda a desenhar e manter módulos reutilizáveis, variáveis, backends (S3 + DynamoDB), state e boas práticas alinhadas ao projeto Modelo. | [terraform-architect.md](https://github.com/ITModelo/modelo-infrastructure/blob/main/.cursor/agents/terraform-architect.md) |

---

O Cursor também utiliza subagentes integrados (Explore, Bash, Browser) automaticamente quando necessário; não é preciso configurá-los.

---

## 📖 Como Usar Agents

### Delegação Automática

O agente delega tarefas automaticamente com base em:
- A complexidade e o escopo da tarefa
- Descrições personalizadas de subagentes no seu projeto
- O contexto atual e as ferramentas disponíveis

### Invocação Explícita

Solicite um subagente específico usando a sintaxe `/name` no prompt:

```
> /verifier confirm the auth flow is complete
> /debugger investigate this error
> /security-auditor review the payment module
> /guardrails-checker validate this feature proposal
```

Você também pode chamar subagentes naturalmente:

```
> Use o subagente verifier para confirmar que o fluxo de autenticação foi concluído
> Have the debugger subagent investigate this error
> Run the security-auditor subagent on the payment module
```

### Execução Paralela

Inicie vários subagentes em paralelo:

```
> Review the API changes and update the documentation in parallel
```

O Agent envia várias chamadas da ferramenta Task em uma única mensagem, fazendo com que os subagentes sejam executados simultaneamente.

### Retomando SubAgentes

Subagentes podem ser retomados para continuar conversas anteriores:

```
> Resume agent abc123 and analyze the remaining test failures
```

---

## 🎯 Padrões de Uso Recomendados

### Padrão de Orquestração

Para fluxos de trabalho complexos, um agente principal pode coordenar vários subagentes especializados em sequência:

1. **guardrails-checker** → Valida que feature não viola princípios
2. **clean-architecture-validator** → Valida estrutura arquitetural
3. **typescript-strict-enforcer** → Valida tipos TypeScript
4. **Implementação** → Agente principal implementa
5. **test-runner** → Executa testes
6. **verifier** → Valida que tudo funciona
7. **documentation-generator** → Gera documentação

### Padrão de Verificação

Sempre use o **verifier** após implementar features:

```
> Implementei a feature X. Use o verifier para validar que está completa e funcional.
```

### Padrão de Debug

Quando encontrar problemas, use o **debugger**:

```
> /debugger investigate this error: [mensagem de erro]
```

---

## ⚠️ Melhores Práticas

### ✅ Fazer

- **Escreva subagentes focados** - Cada subagente deve ter uma responsabilidade única e clara
- **Invista nas descrições** - O campo `description` determina quando o Agent delega para o seu subagente
- **Mantenha os prompts concisos** - Prompts longos diluem o foco
- **Adicione subagentes ao controle de versão** - Inclua `.cursor/agents/` no seu repositório
- **Comece com 2-3 subagentes** - Adicione mais apenas quando tiver casos de uso claros

### ❌ Evitar

- **Descrições vagas** - "Use para tarefas gerais" não fornece sinal ao Agent
- **Prompts longos demais** - Um prompt de 2.000 palavras não torna um subagent mais inteligente
- **Subagents em excesso** - Ter mais de 50 subagents genéricos é ineficaz
- **Duplicar slash commands** - Se uma tarefa tiver um único propósito e não precisar de isolamento de contexto, use um slash command

---

## 💰 Considerações sobre Tokens e Custos

### Como Funciona

- **Subagentes consomem tokens de forma independente** - Cada subagente tem sua própria janela de contexto
- **Executar cinco subagentes em paralelo** consome aproximadamente cinco vezes os tokens de um único agente
- **Avalie a sobrecarga** - Para tarefas rápidas e simples, o agente principal costuma ser mais rápido
- **Subagentes podem ser mais lentos** - O benefício é o isolamento de contexto, não a velocidade

### Quando Usar

**Use subagentes quando:**
- Você precisa isolar o contexto para tarefas longas de pesquisa
- Você está executando vários fluxos de trabalho em paralelo
- A tarefa exige especialização em várias etapas
- Você quer uma verificação independente do trabalho

**Use skills quando:**
- A tarefa tem um único propósito (gerar changelog, formatar)
- Você quer uma ação rápida e repetível
- A tarefa é concluída de uma só vez
- Você não precisa de uma janela de contexto separada

---

## 📁 Localização dos Arquivos (Template)

No Template, os agents estão em `.cursor/agents/`:

```
.cursor/agents/
├── README.md
├── plan-creator.md
├── plan-executor.md
├── verifier.md
├── guardrails-checker.md
├── clean-architecture-validator.md
├── feature-completeness-verifier.md
├── typescript-strict-enforcer.md
├── documentation-generator.md
├── erp-crm-specialist.md
├── security-auditor.md
├── debugger.md
├── test-runner.md
├── template-replication-orchestrator.md
├── github-repo-creator.md
├── template-structure-creator.md
├── guardrails-adapter.md
├── templates-copier.md
├── doc-structure-initializer.md
├── business-rules-generator.md
├── user-flows-generator.md
├── api-specs-generator.md
├── ia-config-agent.md
├── planning-structure-agent.md
└── template-replication-verifier.md
```

Repositórios GitHub dos demais projetos: [modelo-frontend](https://github.com/ITModelo/modelo-frontend), [modelo-bff](https://github.com/ITModelo/modelo-bff), [modelo-api](https://github.com/ITModelo/modelo-api), [modelo-infrastructure](https://github.com/ITModelo/modelo-infrastructure). Em cada repositório, os agents estão em `.cursor/agents/` na raiz.

Project agents (`.cursor/agents/`) têm precedência sobre user agents (`~/.cursor/agents/`). Nos outros projetos (Oficial, BFF, APIs, Infrastructure), a estrutura é a mesma na raiz de cada repositório.

---

## 🔗 Relação com Skills e Plans

- **Skills** (`.cursor/skills/*/SKILL.md`): processos repetíveis (check-file-sizes, extract-component, etc.). O **plan-executor** invoca skills ao executar um plano; o **plan-creator** referencia skills ao escrever o plano.
- **Plans** (`.cursor/plans/*.plan.md`): criados pelo plan-creator, executados pelo plan-executor, validados pelo verifier.
- **Guardrails** ([guardrails.md](./guardrails.md)): usados pelo guardrails-checker. **.cursorrules**: usados pelo clean-architecture-validator.

---

## 🚀 Quick Start

### Para Desenvolvedores

1. **Conheça os subagentes disponíveis** - Leia esta documentação
2. **Use invocação explícita** - Comece usando `/name` para chamar subagentes específicos
3. **Confie na delegação automática** - O Agent usa subagentes automaticamente quando apropriado
4. **Adicione novos subagentes** - Quando identificar necessidade, crie novos subagentes focados

### Para IA Trabalhando no Modelo

1. **Use subagentes para tarefas complexas** - Delegue para subagentes especializados
2. **Valide com guardrails-checker** - Sempre valide features contra guardrails
3. **Use verifier após implementações** - Valide que trabalho está completo
4. **Execute testes com test-runner** - Execute testes proativamente

---

## 📈 Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 27/01/2026 | Criação inicial com subagentes personalizados |
| 1.1 | 03/02/2026 | Plataforma 5 projetos; inventário e mapeamento (Agent \| Descrição \| Arquivo) para Template, Oficial, BFF, APIs, Infrastructure; paths em projetos-plataforma-paths-jesus.md |
| 1.2 | 04/02/2026 | URLs GitHub (ITModelo) no lugar de paths locais; links diretos para agents em todos os 5 repositórios |
| 1.3 | 06/02/2026 | Alinhamento com README e skills-recomendadas; referência aos 5 projetos e ferramentas IA atualizadas |

**Próximas atualizações**: Conforme necessidade

---

## ❓ FAQ

- **Agents vs skills?** Agents: tarefas complexas, isolamento de contexto, especialização. Skills: tarefas rápidas, propósito único (ver [skills-recomendadas.md](./skills-recomendadas.md)).
- **Outros projetos?** Cada projeto (Oficial, BFF, APIs, Infrastructure) tem seus próprios agents em `.cursor/agents/` no respectivo repositório. Repositórios: [github.com/ITModelo](https://github.com/ITModelo) (modelo-frontend, modelo-bff, modelo-api, modelo-infrastructure).

---

## 📞 Links Úteis

- [Guardrails](./guardrails.md) - Princípios invioláveis
- [Prompts](./prompts.md) - Prompts prontos
- [Skills (inventário por projeto)](./skills-recomendadas.md)
- [.cursorrules](../../.cursorrules) - Regras técnicas
- [Exemplos práticos](./subagents-exemplos-praticos.md) - Uso dos agents do Template
- [Cursor: SubAgentes](https://docs.cursor.com/agents/subagents) - Documentação oficial

---

**Mantenedor**: Frontend Template Creator  
**Última revisão**: 06/02/2026
