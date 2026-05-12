# Taxonomia do Catálogo

## Objetivo

Definir a taxonomia oficial do catálogo para separar:

- o que é global e portátil;
- o que é pacote de domínio;
- o que deve continuar existindo como legado opcional.

Esta taxonomia é a base para as próximas etapas de desacoplamento, especialmente revisão de `rules` e extração de blocos reutilizáveis.

## Taxonomia adotada

### 1. `core`

Bloco principal do submódulo.

Contém assets que podem ser reutilizados em múltiplos projetos com baixo acoplamento semântico:

- especialistas por stack;
- workflow-bases;
- gates;
- validações arquiteturais;
- automações genéricas de código, testes, segurança e infra;
- rules de linguagem e de arquitetura;
- assets de suporte para Cursor e Codex que não dependem de um produto específico.

Critérios:

- não assume SoundLink, um produto Java legado específico ou outro produto;
- não depende de paths absolutos locais;
- não depende de taxonomia documental proprietária;
- não embute regras de negócio de um domínio específico;
- pode ser usado como bundle principal.

### 2. `packs/soundlink`

Pacote opcional de domínio.

Contém assets que continuam úteis, mas dependem do ecossistema SoundLink, do fluxo Template -> Frontend -> BFF -> API, ou da governança da holding.

Inclui principalmente:

- replicação e template;
- orquestração de múltiplos repositórios da plataforma;
- docs e workflows com taxonomia de produto;
- regras de negócio, ERP/CRM, BFF e perfis;
- regras e checklists que ainda carregam pressupostos do programa.

Critérios:

- depende de contexto SoundLink, Modelo ou Holding-STEC-Template;
- assume nomenclatura, documentos, runtime ou topologia de repositórios do ecossistema;
- deve ser opt-in, não bundle principal.

### 3. `packs/java`

Pacote opcional de legado técnico.

Contém o conhecimento preservado do catálogo Java legado. O objetivo não é tratar esse bloco como núcleo do submódulo, mas reaproveitar o que ele tem de valor técnico.

Inclui principalmente:

- convenções Java;
- Spring e arquitetura;
- JavaFX e desktop;
- testes e fluxos de build;
- requisitos, MongoDB e fluxos documentais herdados.

Critérios:

- traz forte identidade de produto ou stack rara no resto do catálogo;
- pode ser reaproveitado parcialmente, mas exige extração por camada técnica;
- deve ficar fora do bundle principal.

## Estado atual de organização

A separação ainda é semântica. Os arquivos continuam em:

- `agents/`
- `skills/`
- `rules/`

Isso é intencional nesta fase, para não quebrar descoberta automática no Cursor nem os links internos do catálogo.

## Metadados recomendados

Os assets devem evoluir para registrar sua classificação explicitamente.

Campos sugeridos:

- `catalog_scope: core | soundlink | java`
- `portability: alta | media | baixa`
- `depends_on_project_context: true | false`

Aplicação sugerida:

- agents: frontmatter
- rules: frontmatter
- skills: `README.md` e, quando fizer sentido, `SKILL.md`

## Regras de classificação

### Um asset é `core` quando:

- resolve um problema técnico transversal;
- opera por stack ou por disciplina;
- não depende de documentos de um produto específico;
- pode funcionar em projetos pais diferentes sem adaptação estrutural relevante.

### Um asset vai para `packs/soundlink` quando:

- menciona SoundLink, Template, BFF, API, Frontend Oficial ou fluxos da holding como parte do contrato;
- depende de estratégia de negócio, ERP/CRM, North Star contextualizada ou replicação de perfis;
- assume regras de produto ou uma topologia de repositórios específica.

### Um asset vai para `packs/java` quando:

- preserva convenções, pacotes ou fluxos de um catálogo Java legado;
- depende de JavaFX, desktop Java, exemplos de pacote base ou documentação herdada de uma aplicação Java específica;
- só faz sentido como legado técnico ou preset opcional.

## Mapeamento inicial por bloco

### `core`

Representantes mais claros:

- agents de stack: `java-*`, `kotlin-*`, `python-*`, `react-*`, `react-native-*`, `nextjs-*`, `nestjs-*`, `typescript-*`
- agents transversais: `arquitetura-*`, `code-*`, `debug-*`, `testes-*`, `docker-*`, `terraform-*`, `kubernetes-*`, `seguranca-*`, `observabilidade-*`
- skills: `*-workflow-base`, `gate-*`, `backend-*`, `core-*`, `terraform-*`, `docker-*`, `testes-*`, `arquitetura-*`
- rules: `clean-architecture-guardrails`, `typescript-conventions`, `react-conventions`, `nestjs-conventions`

### `packs/soundlink`

Representantes mais claros:

- agents: `replicacao-*`, `template-*`, `migracao-*`, `orquestracao-bff`, `orquestracao-especialista-erp-crm`, `orquestracao-metricas-north-star`, `docs-*` fortemente contextuais
- skills: `replicacao-*`, `template-*`, `orquestracao-mapear-endpoint-*`, `planejamento-avaliar-*`, `docs-adapt-north-star-features-section`, `seguranca-adapt-guardrails-domain`
- rules: `post-implementation-checklist`, `rag-docs-context`, `replication-musician-as-template`

### `packs/java`

Representantes mais claros:

- skills: `code-java-*`, `docs-java-domain-flow`, `testes-java-tests`, `cicd-java-github-ship`
- skills de extração futura: `code-java-code-quality`, `code-java-spring-dev`, `code-javafx-ui-java`, `arquitetura-java-architecture-review`, `debug-java-debug-diagnostics`

## Diretriz de evolução

O objetivo não é apagar `soundlink` nem o catálogo Java legado.

O objetivo é:

1. preservar o valor técnico desses blocos;
2. extrair o que for universal para `core`;
3. deixar o restante como presets opcionais, claramente marcados.

## Consequências práticas desta taxonomia

### Bundle principal

Deve conter apenas assets `core`.

### Bundle opcional de domínio

Pode conter `packs/soundlink` para projetos que compartilham o ecossistema da holding.

### Bundle opcional legado/técnico

Pode conter `packs/java` para cenários Java desktop ou preservação de conhecimento legado.

## Relação com as próximas tarefas

- Tarefa 2: revisar `rules` para que `core` seja realmente universal e `soundlink` vire opt-in
- Tarefa 3: extrair blocos técnicos reaproveitáveis de `soundlink` e `java` para o `core`
