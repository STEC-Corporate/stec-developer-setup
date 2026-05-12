# Cursor Portability Inventory

## Objetivo

Classificar o catálogo `.cursor/` pela ótica de portabilidade para orientar:

- extração de ativos globais
- separação do que é patrimônio da holding
- isolamento do que é específico de SoundLink ou de um projeto concreto

Taxonomia usada:

- `global-reutilizavel`: pode ser reaproveitado em múltiplos projetos com pouco ou nenhum ajuste semântico
- `programa-holding`: reaproveitável dentro da holding, mas acoplado a padrões internos, catálogos, bundles, sentinelas ou programas específicos
- `projeto-especifico`: depende de contexto forte de SoundLink, BFF, Template, Modelo, AWS do projeto ou fluxo local

## Resumo

### Agents

- total: `82`
- `global-reutilizavel`: `47`
- `programa-holding`: `17`
- `projeto-especifico`: `18`

### Skills

- total: `145`
- `global-reutilizavel`: `100`
- `programa-holding`: `35`
- `projeto-especifico`: `10`

## Critérios práticos

- Itens de arquitetura, código, testes, segurança, stacks e automações genéricas tendem a `global-reutilizavel`
- Itens ligados a `Modelo`, `submodule`, `cursor-global`, `quality-gates`, `sentinelas`, `java legado`, `BeachLink` e governança transversal da holding tendem a `programa-holding`
- Itens ligados a `Template -> Frontend -> BFF -> API`, `North Star` já contextualizada, infraestrutura SoundLink ou fluxos de migração específicos tendem a `projeto-especifico`

## Agents

### Global Reutilizavel

`arquitetura-analista-hexagonal`, `arquitetura-avaliador-hexagonal`, `arquitetura-padroes-ddd`, `arquitetura-validar-limpa`, `cicd-commit-e-release`, `cicd-enviar`, `cicd-infra`, `cicd-repo-github`, `cicd-validar-release`, `code-aplicar-correcoes`, `code-corretor-de-linter`, `code-validador`, `custos-otimizador`, `ddd-clean-ddd-auditor`, `ddd-core-reviewer`, `ddd-fullstack-module-builder`, `debug-analista-de-bugs`, `debug-depurador`, `docker-local`, `docker-seguranca`, `infra-assistente-dev-local`, `java-especialista`, `kotlin-especialista`, `kubernetes-especialista`, `nestjs-clean-arch-solid`, `nestjs-ddd-implementer`, `nestjs-especialista`, `nestjs-qualidade`, `nextjs-especialista`, `observabilidade-aplicacao`, `observabilidade-stack`, `planejamento-criador`, `planejamento-executor`, `planejamento-scrumban`, `python-especialista`, `react-especialista`, `react-native-especialista`, `seguranca-api`, `seguranca-auditor`, `seguranca-verificador-guardrails`, `terraform-arquiteto`, `testes-completude-feature`, `testes-engenheiro-api`, `testes-executor`, `testes-guia-falha`, `testes-verificador`, `typescript-estrito`

### Programa Holding

`cicd-quality-gates-advisor`, `observabilidade-programa-qualidade-kpis`, `orquestracao-qualidade-codigo`, `planejamento-config-ia`, `planejamento-estrutura`, `qualidade-programa-orquestrador`, `qualidade-stack-prefixo-guia`, `replicacao-atualizacoes-modelo`, `replicacao-catalogo-modelo`, `replicacao-classificacao-assets-cursor`, `replicacao-cursor-global-bundle`, `replicacao-orquestrador-template`, `replicacao-submodule-ai-projectdeveloper`, `replicacao-verificador-template`, `technical-spec-driven-cursor`, `template-copiador`, `template-estrutura`

### Projeto Especifico

`arquitetura-alinhamento-api`, `docs-bugs-kb`, `docs-contrato-api`, `docs-especificacoes-api`, `docs-gerador`, `docs-inicializador`, `docs-regras-negocio`, `docs-user-flows`, `infra-aws`, `migracao-executor`, `migracao-executor-hexagonal`, `migracao-plano-hexagonal`, `orquestracao-assessor-estrategico`, `orquestracao-bff`, `orquestracao-especialista-erp-crm`, `orquestracao-metricas-north-star`, `replicacao-sincronizador-template`, `seguranca-adaptador-guardrails`

## Skills

### Global Reutilizavel

`arquitetura-analisar-viabilidade-hexagonal`, `arquitetura-avaliar-ddd-contexto`, `arquitetura-detectar-antipatterns`, `arquitetura-java-architecture-review`, `arquitetura-sugerir-design-patterns`, `arquitetura-validar-arquitetura-limpa`, `arquitetura-validar-conformidade-arquitetura-limpa`, `backend-controller`, `backend-nest-guard`, `backend-prisma-data`, `cicd-atualizar-changelog`, `cicd-criar-commit-release`, `cicd-criar-github-repo`, `cicd-enviar-para-remoto`, `code-adicionar-endpoint-crud`, `code-aplicar-rate-limit-endpoint`, `code-aplicar-ui-ux-patterns`, `code-avaliar-competitive-advantage`, `code-avaliar-competitive-landscape`, `code-avaliar-quality-performance`, `code-consultar-regras-para-correcao`, `code-criar-completude-feature`, `code-criar-novo-microsservico`, `code-example-skill`, `code-extrair-component`, `code-gerar-especificacoes-api`, `code-identificar-ai-opportunities`, `code-java-code-quality`, `code-java-spring-dev`, `code-javafx-ui-java`, `code-revisar-conformidade`, `code-sincronizar-especificacao-apis`, `code-validar-contrato-api-frontend`, `code-validar-solid-modulo`, `code-verificar-file-sizes`, `config-new-module`, `config-prisma`, `config-project`, `core-domain-service`, `core-dto`, `core-entity`, `core-query-cqrs`, `core-repository`, `core-use-case`, `core-value-object`, `custos-estimate-aws-costs`, `debug-buscar-kb-por-erro`, `debug-java-debug-diagnostics`, `debug-mapear-erro-api-codigo`, `docker-criar-ou-ajustar-docker-compose`, `docker-documentar-comandos-docker-local`, `docker-security-policies-docker`, `docs-atualizar-consolidado-endpoint`, `docs-criar-doc-fluxo-usuario`, `docs-criar-doc-regras-negocio`, `docs-criar-doc-structure`, `docs-criar-especificacao-api`, `docs-criar-historia-usuario`, `docs-documentar-endpoint-swagger`, `docs-gerar-doc-dicionario-metricas`, `docs-gerar-doc-north-star`, `docs-gerar-docs-referencia`, `docs-gerar-fe-docs`, `docs-registrar-bug-na-kb`, `gate-arquitetura`, `gate-ci`, `gate-seguranca`, `gate-testes`, `infra-aplicar-infra-tagging`, `infra-deploy-infra-checklist`, `java-workflow-base`, `kotlin-workflow-base`, `kubernetes-validar-kubernetes-manifests`, `nestjs-workflow-base`, `nextjs-workflow-base`, `observabilidade-adicionar-observabilidade-servico`, `openspec-apply`, `openspec-archive`, `openspec-explore`, `openspec-propose`, `planejamento-atualizar-sprint-progress`, `planejamento-criar-retrospective`, `planejamento-criar-sprint-plan`, `planejamento-scrumban-task`, `planejamento-validar-feature-strategy`, `python-workflow-base`, `react-native-workflow-base`, `react-workflow-base`, `seguranca-auto-validate-guardrails`, `seguranca-revisar-seguranca-endpoint`, `seguranca-validar-guardrails`, `seguranca-validar-modulo-auth`, `terraform-criar-terraform-module`, `terraform-validar-terraform`, `testes-criar-testing-strategy`, `testes-escrever-testes-microsservico`, `testes-executar-testes`, `testes-java-tests-spring`, `testes-verificar-cobertura-microsservico`, `typescript-workflow-base`

### Programa Holding

`cicd-java-github-ship`, `code-java-desktop-ux`, `code-java-export-pdf-excel`, `code-java-conventions`, `code-java-mongodb`, `code-java-requirements-author`, `code-java-ui-javafx`, `code-revisar-code-beachlink`, `code-revisar-code-soundlink`, `docs-java-domain-flow`, `docs-calcular-north-star-impact`, `docs-gerar-modelo-readme`, `frontend-form-schema`, `observabilidade-revisar-slo-endpoint`, `orquestracao-executor-sentinelas`, `orquestracao-validar-multi-project-impact`, `planejamento-avaliar-financial-strategy`, `planejamento-avaliar-marketing-strategy`, `planejamento-avaliar-sales-strategy`, `planejamento-configure-agents-skills`, `planejamento-criar-go-to-market-strategy`, `qualidade-executor-sentinelas-checklist`, `replicacao-atualizar-model-from-platform`, `replicacao-buscar-from-model`, `replicacao-copiar-cursorrules-to-templates`, `replicacao-cursor-global-scaffold`, `replicacao-list-catalog-items`, `replicacao-selective-copy-from-model`, `replicacao-substitute-soundlink-in-destination`, `replicacao-validar-template-completeness`, `template-clone-template-structure`, `template-copiar-adapt-templates`, `testes-java-tests`, `tot-strategic-decision`, `validate-screen-against-canonical`

### Projeto Especifico

`docs-adapt-north-star-features-section`, `infra-especificar-infra-para-soundlink-infrastructure`, `infra-mapear-infra-aws-por-servico`, `migracao-aplicar-filtro-migracao`, `migracao-criar-plano-migracao-hexagonal`, `migracao-executar-migracao-hexagonal`, `migracao-rewrite-imports-migracao`, `orquestracao-mapear-endpoint-bff-api`, `orquestracao-mapear-endpoint-template-bff-api`, `seguranca-adapt-guardrails-domain`

## Candidatas imediatas para extração global

### Agents

`arquitetura-*`, `code-*`, `debug-*`, `docker-*`, `java-especialista`, `kotlin-especialista`, `python-especialista`, `react-especialista`, `nextjs-especialista`, `nestjs-especialista`, `terraform-arquiteto`, `testes-*`, `typescript-estrito`

### Skills

`arquitetura-*`, `backend-*`, `core-*`, `debug-*`, `docker-*`, `gate-*`, `java-workflow-base`, `kotlin-workflow-base`, `python-workflow-base`, `react-workflow-base`, `react-native-workflow-base`, `nextjs-workflow-base`, `nestjs-workflow-base`, `terraform-*`, `testes-*`, `typescript-workflow-base`

## Itens que pedem desacoplamento antes de extração

- `docs-*` do catálogo de agents ainda carregam contexto forte de documentos do programa
- `planejamento-config-ia`, `planejamento-estrutura` e o bloco `replicacao-*` dependem da arquitetura `Modelo` e do fluxo da holding
- `orquestracao-assessor-estrategico`, `orquestracao-bff`, `orquestracao-especialista-erp-crm` e `orquestracao-metricas-north-star` têm semântica fortemente ligada ao SoundLink
- `seguranca-adaptador-guardrails` e `seguranca-adapt-guardrails-domain` dependem de guardrails concretos de domínio

## Proximo passo recomendado

Usar este inventário como base para `D10` e `C9`:

1. criar um índice central `agent -> skills -> rules -> portabilidade`
2. separar o que vira pacote global, pacote da holding e pacote local de projeto
3. revisar as `rules` específicas com o mesmo critério de portabilidade
