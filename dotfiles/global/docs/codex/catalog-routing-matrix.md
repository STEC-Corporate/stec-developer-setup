# Matriz de Roteamento do Catálogo

## Objetivo

Traduzir a taxonomia do catálogo em uma matriz operacional de roteamento, mostrando o destino lógico de cada família principal de assets.

## Blocos lógicos

| Bloco | Papel | Entra no bundle principal? |
|---|---|---|
| `core` | catálogo global e portátil | sim |
| `packs/soundlink` | preset de domínio e ecossistema | não |
| `packs/java` | catálogo técnico Java e preset opcional | não |

## Matriz por família

| Família atual | Destino lógico | Observação |
|---|---|---|
| `agents/java-*`, `agents/kotlin-*`, `agents/python-*`, `agents/react-*`, `agents/react-native-*`, `agents/nextjs-*`, `agents/nestjs-*`, `agents/typescript-*` | `core` | especialistas por stack |
| `agents/arquitetura-*`, `agents/code-*`, `agents/debug-*`, `agents/testes-*`, `agents/docker-*`, `agents/terraform-*`, `agents/kubernetes-*`, `agents/seguranca-*`, `agents/observabilidade-*` | `core` | agentes transversais |
| `skills/*-workflow-base`, `skills/gate-*`, `skills/backend-*`, `skills/core-*`, `skills/docker-*`, `skills/terraform-*`, `skills/testes-*`, `skills/arquitetura-*` | `core` | skills técnicas reutilizáveis |
| `rules/clean-architecture-guardrails.mdc`, `rules/typescript-conventions.mdc`, `rules/react-conventions.mdc`, `rules/nestjs-conventions.mdc` | `core` | rules universais |
| `agents/replicacao-*`, `agents/template-*`, `agents/migracao-*` | `packs/soundlink` | replicação e governança da holding |
| `agents/orquestracao-bff.md`, `agents/orquestracao-especialista-erp-crm.md`, `agents/orquestracao-metricas-north-star.md`, `agents/docs-*.md` contextuais | `packs/soundlink` | dependem de domínio ou taxonomia local |
| `skills/replicacao-*`, `skills/template-*`, `skills/orquestracao-mapear-endpoint-*`, `skills/planejamento-avaliar-*`, `skills/docs-adapt-north-star-features-section/`, `skills/seguranca-adapt-guardrails-domain/` | `packs/soundlink` | preset do ecossistema SoundLink |
| `rules/post-implementation-checklist.mdc`, `rules/rag-docs-context.mdc`, `rules/replication-musician-as-template.mdc` | `packs/soundlink` | exigem desacoplamento antes de qualquer promoção a `core` |
| `skills/code-java-desktop-ux/`, `skills/code-java-export-pdf-excel/`, `skills/code-java-conventions/`, `skills/code-java-mongodb/`, `skills/code-java-requirements-author/`, `skills/code-java-ui-javafx/`, `skills/docs-java-domain-flow/`, `skills/testes-java-tests/`, `skills/cicd-java-github-ship/` | `packs/java` | catálogo técnico Java legado renomeado |
| `skills/code-java-code-quality/`, `skills/code-java-spring-dev/`, `skills/code-javafx-ui-java/`, `skills/arquitetura-java-architecture-review/`, `skills/debug-java-debug-diagnostics/` | `packs/java` com alvo futuro em `core` | extrair camada técnica primeiro |

## Regras de decisão

### Promover para `core`

Promova quando o asset:

- não depender de nome de produto;
- não assumir paths locais;
- não exigir topologia específica de repositórios;
- puder operar por stack, disciplina ou contrato técnico.

### Manter em `packs/soundlink`

Mantenha quando o asset:

- depender da plataforma SoundLink;
- depender de Modelo ou holding;
- misturar negócio, documentação local e replicação;
- exigir múltiplos repositórios do ecossistema.

### Manter em `packs/java`

Mantenha quando o asset:

- depender de uma aplicação Java específica;
- embutir exemplos de pacote base, entidades ou convenções próprias;
- focar em desktop JavaFX ou fluxos raros no restante do catálogo.

## Ordem recomendada de execução

1. classificar semanticamente sem mover diretórios;
2. refatorar `rules` específicas;
3. extrair blocos técnicos reaproveitáveis para `core`;
4. só depois decidir por reorganização física ou bundles separados.

## Resultado esperado desta fase

Após a Tarefa 1, o repositório passa a ter:

- uma taxonomia oficial;
- um destino lógico claro para cada bloco;
- uma base consistente para as próximas refatorações.
