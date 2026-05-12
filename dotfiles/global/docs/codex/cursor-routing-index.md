# Cursor Routing Index

## Objetivo

Servir como índice central de roteamento para o catálogo `.cursor/`, conectando:

- famílias de `agents`
- `skills` preferenciais por família
- `rules` que reforçam comportamento ou contexto
- classe de portabilidade

Este documento não substitui os prompts dos agents nem os `SKILL.md`. Ele existe para reduzir aliases implícitos, facilitar manutenção e orientar futuras extrações do catálogo.

## Regras de leitura

1. roteie primeiro pela intenção da tarefa
2. use a família de `agent` mais específica que resolva o problema
3. complemente com `skills` reutilizáveis da mesma família ou da stack
4. aplique `rules` sempre que elas reforçarem padrões do projeto ou da holding
5. respeite a portabilidade:
   - `global-reutilizavel`: pode virar pacote compartilhado
   - `programa-holding`: depende do programa interno
   - `projeto-especifico`: depende de contexto SoundLink ou de fluxo local

## Rules Disponíveis

| Rule | Papel principal | Portabilidade |
|---|---|---|
| `submodule-premise` | premissa do AI-ProjectDeveloper como submodule | `programa-holding` |
| `post-implementation-checklist` | checklist obrigatório pós-implementação | `programa-holding` |
| `clean-architecture-guardrails` | guardrails de backend e camadas | `global-reutilizavel` |
| `typescript-conventions` | convenções TypeScript | `global-reutilizavel` |
| `nestjs-conventions` | convenções NestJS | `global-reutilizavel` |
| `react-conventions` | convenções React e Next.js | `global-reutilizavel` |
| `rag-docs-context` | RAG documental por intenção | `projeto-especifico` |
| `replication-musician-as-template` | replicação a partir do perfil músico | `projeto-especifico` |

## Índice por Família

### Arquitetura e DDD

| Agents | Skills preferenciais | Rules | Portabilidade |
|---|---|---|---|
| `arquitetura-analista-hexagonal`, `arquitetura-avaliador-hexagonal`, `arquitetura-padroes-ddd`, `arquitetura-validar-limpa`, `ddd-*` | `arquitetura-analisar-viabilidade-hexagonal`, `arquitetura-avaliar-ddd-contexto`, `arquitetura-detectar-antipatterns`, `arquitetura-sugerir-design-patterns`, `arquitetura-validar-arquitetura-limpa`, `arquitetura-validar-conformidade-arquitetura-limpa` | `clean-architecture-guardrails`, `submodule-premise` | `global-reutilizavel` |
| `arquitetura-alinhamento-api` | `code-sincronizar-especificacao-apis`, `code-validar-contrato-api-frontend` | `rag-docs-context`, `submodule-premise` | `projeto-especifico` |

### Código e Correção

| Agents | Skills preferenciais | Rules | Portabilidade |
|---|---|---|---|
| `code-aplicar-correcoes`, `code-corretor-de-linter`, `code-validador`, `debug-*` | `code-consultar-regras-para-correcao`, `debug-buscar-kb-por-erro`, `debug-mapear-erro-api-codigo`, `code-revisar-conformidade`, `code-verificar-file-sizes` | `post-implementation-checklist`, `typescript-conventions`, `submodule-premise` | `global-reutilizavel` |
| `orquestracao-qualidade-codigo`, `qualidade-programa-orquestrador` | `orquestracao-executor-sentinelas`, `qualidade-executor-sentinelas-checklist`, `gate-arquitetura`, `gate-testes`, `gate-seguranca`, `gate-ci` | `post-implementation-checklist`, `submodule-premise` | `programa-holding` |

### Documentação

| Agents | Skills preferenciais | Rules | Portabilidade |
|---|---|---|---|
| `docs-bugs-kb`, `docs-contrato-api`, `docs-especificacoes-api`, `docs-gerador`, `docs-inicializador`, `docs-regras-negocio`, `docs-user-flows` | `docs-criar-doc-fluxo-usuario`, `docs-criar-doc-regras-negocio`, `docs-criar-doc-structure`, `docs-criar-especificacao-api`, `docs-gerar-fe-docs`, `docs-registrar-bug-na-kb`, `code-gerar-especificacoes-api` | `rag-docs-context`, `submodule-premise` | `projeto-especifico` |
| `docs-*` em cenários genéricos | `docs-documentar-endpoint-swagger`, `docs-gerar-docs-referencia`, `docs-atualizar-consolidado-endpoint` | `submodule-premise` | `global-reutilizavel` |

### Planejamento

| Agents | Skills preferenciais | Rules | Portabilidade |
|---|---|---|---|
| `planejamento-criador`, `planejamento-executor`, `planejamento-scrumban` | `planejamento-criar-sprint-plan`, `planejamento-criar-retrospective`, `planejamento-scrumban-task`, `planejamento-validar-feature-strategy`, `planejamento-atualizar-sprint-progress` | `post-implementation-checklist`, `submodule-premise` | `global-reutilizavel` |
| `planejamento-config-ia`, `planejamento-estrutura` | `planejamento-configure-agents-skills`, `replicacao-copiar-cursorrules-to-templates`, `template-copiar-adapt-templates`, `template-clone-template-structure` | `submodule-premise`, `rag-docs-context` | `programa-holding` |

### Orquestração

| Agents | Skills preferenciais | Rules | Portabilidade |
|---|---|---|---|
| `orquestracao-assessor-estrategico` | `seguranca-auto-validate-guardrails`, `docs-calcular-north-star-impact`, `orquestracao-validar-multi-project-impact` | `rag-docs-context`, `submodule-premise` | `projeto-especifico` |
| `orquestracao-bff` | `orquestracao-mapear-endpoint-bff-api`, `code-validar-contrato-api-frontend`, `code-sincronizar-especificacao-apis` | `clean-architecture-guardrails`, `nestjs-conventions`, `rag-docs-context` | `projeto-especifico` |
| `orquestracao-especialista-erp-crm` | `planejamento-validar-feature-strategy`, `code-avaliar-competitive-advantage`, `code-avaliar-competitive-landscape` | `rag-docs-context`, `submodule-premise` | `projeto-especifico` |
| `orquestracao-metricas-north-star` | `docs-gerar-doc-north-star`, `docs-gerar-doc-dicionario-metricas`, `docs-adapt-north-star-features-section` | `rag-docs-context`, `submodule-premise` | `projeto-especifico` |

### Replicação, Template e Bundle

| Agents | Skills preferenciais | Rules | Portabilidade |
|---|---|---|---|
| `replicacao-atualizacoes-modelo`, `replicacao-catalogo-modelo`, `replicacao-orquestrador-template`, `replicacao-submodule-ai-projectdeveloper`, `replicacao-verificador-template`, `template-copiador`, `template-estrutura` | `replicacao-atualizar-model-from-platform`, `replicacao-buscar-from-model`, `replicacao-copiar-cursorrules-to-templates`, `replicacao-cursor-global-scaffold`, `replicacao-list-catalog-items`, `replicacao-selective-copy-from-model`, `replicacao-substitute-soundlink-in-destination`, `replicacao-validar-template-completeness`, `template-clone-template-structure`, `template-copiar-adapt-templates` | `submodule-premise`, `replication-musician-as-template` | `programa-holding` |
| `replicacao-sincronizador-template`, `migracao-*` | `migracao-aplicar-filtro-migracao`, `migracao-criar-plano-migracao-hexagonal`, `migracao-executar-migracao-hexagonal`, `migracao-rewrite-imports-migracao` | `replication-musician-as-template`, `rag-docs-context` | `projeto-especifico` |

### Segurança

| Agents | Skills preferenciais | Rules | Portabilidade |
|---|---|---|---|
| `seguranca-api`, `seguranca-auditor`, `seguranca-verificador-guardrails` | `seguranca-auto-validate-guardrails`, `seguranca-revisar-seguranca-endpoint`, `seguranca-validar-guardrails`, `seguranca-validar-modulo-auth` | `clean-architecture-guardrails`, `nestjs-conventions`, `submodule-premise` | `global-reutilizavel` |
| `seguranca-adaptador-guardrails` | `seguranca-adapt-guardrails-domain` | `rag-docs-context`, `submodule-premise` | `projeto-especifico` |

### Infra, Docker, Terraform e Kubernetes

| Agents | Skills preferenciais | Rules | Portabilidade |
|---|---|---|---|
| `infra-assistente-dev-local`, `docker-local`, `docker-seguranca`, `terraform-arquiteto`, `kubernetes-especialista`, `custos-otimizador` | `docker-criar-ou-ajustar-docker-compose`, `docker-documentar-comandos-docker-local`, `docker-security-policies-docker`, `terraform-criar-terraform-module`, `terraform-validar-terraform`, `kubernetes-validar-kubernetes-manifests`, `custos-estimate-aws-costs`, `infra-aplicar-infra-tagging`, `infra-deploy-infra-checklist` | `submodule-premise` | `global-reutilizavel` |
| `infra-aws` | `infra-especificar-infra-para-soundlink-infrastructure`, `infra-mapear-infra-aws-por-servico` | `rag-docs-context`, `submodule-premise` | `projeto-especifico` |

### Stacks

| Agents | Skills preferenciais | Rules | Portabilidade |
|---|---|---|---|
| `java-especialista` | `java-workflow-base`, `code-java-code-quality`, `code-java-spring-dev`, `arquitetura-java-architecture-review` | `clean-architecture-guardrails`, `submodule-premise` | `global-reutilizavel` |
| `kotlin-especialista` | `kotlin-workflow-base` | `clean-architecture-guardrails`, `submodule-premise` | `global-reutilizavel` |
| `python-especialista` | `python-workflow-base` | `submodule-premise` | `global-reutilizavel` |
| `react-especialista`, `react-native-especialista`, `nextjs-especialista`, `typescript-estrito` | `react-workflow-base`, `react-native-workflow-base`, `nextjs-workflow-base`, `typescript-workflow-base`, `code-aplicar-ui-ux-patterns`, `code-extrair-component` | `react-conventions`, `typescript-conventions`, `post-implementation-checklist` | `global-reutilizavel` |
| `nestjs-especialista`, `nestjs-clean-arch-solid`, `nestjs-ddd-implementer`, `nestjs-qualidade` | `nestjs-workflow-base`, `backend-controller`, `backend-nest-guard`, `backend-prisma-data`, `config-prisma`, `config-project` | `nestjs-conventions`, `clean-architecture-guardrails`, `typescript-conventions` | `global-reutilizavel` |

### Testes e Observabilidade

| Agents | Skills preferenciais | Rules | Portabilidade |
|---|---|---|---|
| `testes-completude-feature`, `testes-engenheiro-api`, `testes-executor`, `testes-guia-falha`, `testes-verificador` | `testes-criar-testing-strategy`, `testes-escrever-testes-microsservico`, `testes-executar-testes`, `testes-java-tests-spring`, `testes-verificar-cobertura-microsservico` | `post-implementation-checklist`, `submodule-premise` | `global-reutilizavel` |
| `observabilidade-aplicacao`, `observabilidade-stack` | `observabilidade-adicionar-observabilidade-servico` | `submodule-premise` | `global-reutilizavel` |
| `observabilidade-programa-qualidade-kpis` | `observabilidade-revisar-slo-endpoint` | `submodule-premise`, `rag-docs-context` | `programa-holding` |

## Roteamento Rápido

| Se a intenção for... | Comece por... | Complemente com... |
|---|---|---|
| revisar arquitetura limpa ou DDD | `arquitetura-validar-limpa`, `ddd-*` | `clean-architecture-guardrails` |
| corrigir erro/lint/bug | `code-aplicar-correcoes`, `code-corretor-de-linter`, `debug-*` | `post-implementation-checklist` |
| gerar docs de negócio, fluxo ou API | `docs-*` | `rag-docs-context` |
| planejar trabalho executável | `planejamento-criador` | `planejamento-*`, `post-implementation-checklist` |
| executar plano pronto | `planejamento-executor` | skill da fase + `post-implementation-checklist` |
| orquestrar fluxo do BFF | `orquestracao-bff` | `orquestracao-mapear-endpoint-bff-api` |
| replicar template ou ativos do Modelo | `replicacao-orquestrador-template` | `replicacao-*`, `submodule-premise` |
| aplicar guardrails de domínio | `seguranca-adaptador-guardrails` | `seguranca-adapt-guardrails-domain` |
| setup local, docker ou infra | `infra-assistente-dev-local`, `docker-local`, `terraform-arquiteto` | `docker-*`, `terraform-*`, `kubernetes-*` |
| atuar por stack | agent da stack (`python-*`, `react-*`, `nestjs-*`, etc.) | workflow-base + rules da stack |

## Lacunas já visíveis

- não existe ainda um mapa exaustivo `agent -> skill` para todos os 82 agents; o índice cobre primeiro os grupos prioritários
- `docs-*` e parte de `orquestracao-*` continuam semanticamente acoplados ao programa e podem exigir split futuro em variantes globais e locais
- `rules` ainda não têm classificação formal persistida dentro da própria `.cursor`; por enquanto a leitura de portabilidade está documentada aqui

## Próximo passo recomendado

Usar este índice para `C9` e `D11`:

1. definir quais famílias viram pacote global
2. marcar quais `rules` precisam ser explicitamente tratadas como `projeto-especifico`
3. preparar um lint estrutural que valide coerência entre família, skill e portabilidade
