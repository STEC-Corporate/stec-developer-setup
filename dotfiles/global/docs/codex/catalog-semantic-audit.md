# Auditoria Semantica do Catalogo

## Escopo

Auditoria dos artefatos versionados em:

- `agents/`
- `skills/`
- `rules/`

Objetivo:

- identificar acoplamentos excessivos a projetos, dominios ou runtimes especificos;
- separar o que e reutilizavel do que e contextual;
- orientar a modularizacao do submodulo para uso mais portatil em projetos pai.

## Inventario auditado

- `82` agents
- `146` skills
- `8` rules
- `422` arquivos markdown/markdown-context ao todo

## Criterios de classificacao

### 1. Portatil

Artefatos que podem viver neste submodulo sem forte dependencia de um produto especifico.

Exemplos:

- convencoes de stack (`java-`, `python-`, `nestjs-`, `react-`)
- gates transversais (`gate-*`)
- validacoes arquiteturais genericas
- fluxo de submodule e scaffold cursor-global

### 2. Especifico

Artefatos reutilizaveis apenas dentro de uma familia de projetos da holding ou de um programa especifico.

Exemplos:

- fluxos de replicacao entre `Holding-STEC-Template`, `soundlink-*` e projetos derivados
- guardrails e docs estrategicos da holding
- automacoes de release e correcao acopladas a convencoes de um frontend especifico

### 3. Legado ou transicional

Artefatos que preservam conhecimento util, mas estao fortemente presos a um produto, app ou stack de baixa portabilidade.

Exemplos:

- skills do catálogo Java legado
- referencias a `.cursorrules` como runtime universal
- regras e playbooks de SoundLink muito orientados a telas, perfis e negocio

## Sinais quantitativos de acoplamento

Levantamento por palavras-chave e referencias dominantes:

- `soundlink`: `155` arquivos, `344` ocorrencias
- `java-legado`: `24` arquivos, `135` ocorrencias
- `Modelo/Holding-STEC-Template`: `131` arquivos, `322` ocorrencias
- `AWS/Terraform/Kubernetes/docker/modules/local-kubernetes`: `24` arquivos, `153` ocorrencias
- `.cursorrules` / `.cursor/docs` / `guardrails.md` local de runtime: `63` arquivos, `128` ocorrencias

Leitura pratica:

- o catalogo ainda esta semanticamente centrado em `SoundLink + Modelo`;
- existe um subcatálogo Java legado bem delimitado, mas altamente específico;
- parte relevante das skills assume a existencia de `.cursorrules` e `.cursor/docs` no projeto consumidor.

## Classificacao por blocos

### A. Bloco portatil com bom potencial

Mais adequados para permanecer no nucleo do submodulo:

- `agents/python-especialista.md`
- `agents/java-especialista.md`
- `agents/kotlin-especialista.md`
- `agents/react-especialista.md`
- `agents/react-native-especialista.md`
- `agents/nextjs-especialista.md`
- `agents/nestjs-especialista.md`
- `agents/typescript-estrito.md`
- `skills/*-workflow-base/`
- `skills/gate-*/`
- `skills/core-*/`
- `skills/backend-controller/`
- `skills/backend-prisma-data/`
- `skills/frontend-form-schema/`
- `rules/clean-architecture-guardrails.mdc`
- `rules/typescript-conventions.mdc`
- `rules/react-conventions.mdc`
- `rules/nestjs-conventions.mdc`
- `rules/submodule-premise.mdc`
- `codex-skills/cursor-project-standards/`
- `codex-skills/cursor-agent-orchestrator/`

Observacao:

mesmo nesses blocos, varios ainda citam `.cursorrules` ou docs de projetos especificos como apoio. O conteudo-base e portatil, mas a documentacao de uso ainda pode ser melhor desacoplada.

### B. Bloco especifico da holding e do fluxo de replicacao

Faz sentido manter junto, desde que claramente identificado como dominio `holding-template-replication`:

- `agents/replicacao-*`
- `agents/planejamento-config-ia.md`
- `agents/orquestracao-metricas-north-star.md`
- `skills/replicacao-*/`
- `skills/template-*/`
- `skills/docs-gerar-doc-north-star/`
- `skills/docs-gerar-doc-dicionario-metricas/`
- `skills/planejamento-configure-agents-skills/`
- `rules/rag-docs-context.mdc`

Risco:

esse bloco hoje mistura o que e protocolo de replicacao com o que e conteudo estrategico de SoundLink/Modelo. Ele ainda funciona, mas nao esta modularizado.

### C. Bloco altamente especifico de SoundLink

Esses artefatos nao deveriam ser tratados como padrao universal do submodulo sem uma camada de contextualizacao:

- `rules/replication-musician-as-template.mdc`
- `rules/post-implementation-checklist.mdc`
- `agents/orquestracao-bff.md`
- `agents/orquestracao-assessor-estrategico.md`
- `agents/seguranca-verificador-guardrails.md`
- `skills/code-revisar-code-soundlink/`
- `skills/code-avaliar-competitive-landscape/`
- `skills/code-avaliar-competitive-advantage/`
- `skills/planejamento-avaliar-sales-strategy/`
- `skills/planejamento-avaliar-marketing-strategy/`
- `skills/planejamento-avaliar-financial-strategy/`
- `skills/planejamento-validar-feature-strategy/`
- `skills/orquestracao-mapear-endpoint-bff-api/`

Risco:

- suposicoes sobre paths, taxonomia documental, guardrails e decisoes de produto;
- inducao de comportamento incorreto em projetos que nao compartilham o mesmo dominio.

### D. Bloco legado/transicional de Java

Esse bloco esta semanticamente coeso, mas e um mini-catalogo de produto proprio:

- `skills/code-java-*`
- `skills/testes-java-tests/`
- `skills/code-java-spring-dev/`
- `skills/code-java-code-quality/`
- `skills/code-javafx-ui-java/`
- `skills/docs-java-domain-flow/`
- `skills/arquitetura-java-architecture-review/`
- `skills/debug-java-debug-diagnostics/`
- `skills/cicd-java-github-ship/`

Recomendacao:

nao remover necessariamente, mas mover para um namespace claramente opcional, por exemplo:

- `skills/legacy-java-*`
- ou `skills/catalogs/java/*`

## Principais achados

### 1. O nucleo do submodulo ainda nao esta explicitamente separado do catalogo de produto

Hoje convivem no mesmo nivel:

- assets portateis;
- assets da holding;
- assets SoundLink;
- assets Java legados.

Isso aumenta custo de descoberta e risco de roteamento errado.

### 2. O catalogo usa `.cursorrules` como dependencia implicita demais

Varios agents e skills assumem:

- `.cursorrules`
- `.cursor/docs/*`
- `.cursor/rules/guardrails.md`

Como esse submodulo e justamente a base compartilhada, o ideal e que ele:

- forneca a regra equivalente em `rules/`, quando for comum;
- ou marque explicitamente que a dependencia e do projeto consumidor.

### 3. Regras `alwaysApply` e checklists ainda embutem contexto demais

Caso mais critico:

- `rules/post-implementation-checklist.mdc`

Problemas:

- assume `npm`, `Playwright`, `localhost:3000`;
- cita skills e docs herdados de SoundLink;
- se comporta como regra universal sem ser universal.

### 4. O bloco de replicacao e valioso, mas precisa de contrato mais limpo

Pontos fortes:

- existe um fluxo claro para `Modelo`, template e submodule;
- os docs importados agora deixam o repo mais autocontido.

Ponto fraco:

- o fluxo de replicacao ainda mistura:
  - contrato operacional;
  - naming dos projetos;
  - estrategia de negocio;
  - paths absolutos de ambiente local.

### 5. O bloco Java legado esta bem preservado, mas fora do lugar para um nucleo compartilhado

Ele tem coerencia interna, porem:

- nao conversa com a proposta principal de submodulo da holding;
- puxa exemplos de JavaFX, Mongo, requisitos e UI desktop que sao raros no restante do catalogo.

## Recomendacao de modularizacao

### P0. Criar taxonomia explicita

Separar o catalogo em quatro classes logicas:

- `core`: portatil e transversal
- `holding`: protocolos e templates da holding
- `soundlink`: especifico do ecossistema SoundLink
- `java`: preservacao de conhecimento legado

Mesmo sem mover pastas fisicamente agora, a classificacao ja deve existir:

- no README principal
- em um indice catalogado
- idealmente no frontmatter/README de cada artefato

Campos sugeridos:

- `catalog_scope: core | holding | soundlink | legacy`
- `portability: alta | media | baixa`
- `depends_on_project_context: true | false`

### P1. Rebaixar ou especializar rules perigosamente globais

Prioridade alta:

- `rules/post-implementation-checklist.mdc`
- `rules/replication-musician-as-template.mdc`
- `rules/rag-docs-context.mdc`

Acoes sugeridas:

- remover `alwaysApply: true` quando a regra nao for universal;
- transformar em rules opt-in ou documentacao de processo;
- ou dividir em uma regra generica + anexos especificos.

### P2. Substituir dependencia em `.cursorrules` por assets do proprio submodulo

Onde for possivel:

- mover o conhecimento normativo relevante para `rules/*.mdc`;
- deixar `.cursorrules` apenas como override do projeto consumidor.

Formula preferivel:

- "regra base no submodulo"
- "ajustes finos no projeto pai"

### P3. Isolar o bloco Java

Opcoes:

1. mover para um subcatalogo legado
2. extrair para outro repositorio/submodulo
3. manter aqui, mas marcado como `legacy` e fora do bundle principal

### P4. Criar um indice semantico do catalogo

Arquivo sugerido:

- `docs/codex/catalog-routing-matrix.md`

Conteudo:

- o que e core
- o que e holding
- o que e soundlink
- o que e legacy
- quais assets entram no bundle global
- quais assets exigem contexto do projeto consumidor

## Proposta objetiva de destino

### Deve ficar no bundle principal

- especialistas por stack
- workflow-bases
- gates
- core domain skills
- rules genericas de arquitetura e linguagem
- skills do Codex para leitura de `.cursor`

### Deve ficar no repositorio, mas fora do bundle principal

- replicacao/template da holding
- docs estrategicos do Modelo
- automacoes de migracao

### Deve ficar marcado como especifico/opt-in

- SoundLink business, BFF, replicacao de perfis
- checklists de produto com paths fixos
- strategies de mercado e business docs muito contextuais

### Deve ser isolado ou movido

- bloco Java legado, se nao houver plano real de reutilizacao cross-project

## Proximos passos recomendados

1. adicionar metadados de escopo e portabilidade nos assets mais importantes;
2. revisar `rules/post-implementation-checklist.mdc`;
3. criar indice semantico do catalogo;
4. decidir destino do bloco Java;
5. definir bundle principal apenas com assets `core`.

## Conclusao

O catalogo esta agora estruturalmente muito mais saudavel e autocontido, mas semanticamente ainda e um catalogo composto:

- um nucleo reutilizavel promissor;
- um bloco forte de replicacao da holding;
- um bloco SoundLink de alta especificidade;
- um bloco Java legado.

A melhoria mais importante agora nao e adicionar mais agents ou skills. E explicitar fronteiras.
