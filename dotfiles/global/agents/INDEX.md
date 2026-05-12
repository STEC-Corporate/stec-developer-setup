# Catálogo de agents — AcoustiCore

| Arquivo | Descrição | Estado |
|----------|-----------|--------|
| [sdd-orquestrador.md](sdd-orquestrador.md) | Orquestra fluxo SDD (docs, plano, gaps) | stable |
| [legado-analisar-modulo.md](legado-analisar-modulo.md) | Análise de código legado e contratos implícitos | stable |
| [stack-java-guia.md](stack-java-guia.md) | Backend Java / Spring | stable |
| [stack-java-desktop-guia.md](stack-java-desktop-guia.md) | JavaFX / Swing (desktop) | stable |
| [stack-typescript-guia.md](stack-typescript-guia.md) | TypeScript — React / Next / Nest / Vue / Angular | stable |
| [stack-python-guia.md](stack-python-guia.md) | Python — FastAPI / Flask | stable |
| [stack-dotnet-guia.md](stack-dotnet-guia.md) | C# / .NET (geral de plataforma) | stable |
| [stack-dotnet-core-guia.md](stack-dotnet-core-guia.md) | .NET Core / ASP.NET Core (backend HTTP) | stable |
| [stack-openapi-guia.md](stack-openapi-guia.md) | Contratos OpenAPI (transversal) | stable |
| [stack-react-native-guia.md](stack-react-native-guia.md) | React Native (móvel) | stable |
| [stack-android-guia.md](stack-android-guia.md) | Android nativo (Kotlin/Java em `android/`) | stable |

Prefixos sugeridos: `qualidade-*`, `sdd-*`, `legado-*`, `stack-*`, `arch-*`, `framework-*`, `cloud-*`, `workflow-*`.

## Agents plugins Cursor (`plugin-cursor-*-guia`)

| Arquivo | Tema | Estado |
|----------|------|--------|
| [plugin-cursor-arquiteto-guia.md](plugin-cursor-arquiteto-guia.md) | Arquitetura de plugin e composicao de componentes | experimental |
| [plugin-cursor-seguranca-guia.md](plugin-cursor-seguranca-guia.md) | Gate de seguranca e conformidade para submissao | experimental |
| [plugin-cursor-publicacao-guia.md](plugin-cursor-publicacao-guia.md) | Preparacao e acompanhamento de submissao via PR | experimental |
| [plugin-cursor-orquestrador-guia.md](plugin-cursor-orquestrador-guia.md) | Pipeline E2E scaffold -> validar -> submeter -> acompanhar | experimental |

## Agents workflow Cursor (`workflow-*-guia`)

| Arquivo | Tema | Estado |
|----------|------|--------|
| [workflow-cursor-entrega-guia.md](workflow-cursor-entrega-guia.md) | Entrega local: testes, lint, typecheck, hooks/CI | stable |
| [workflow-prompt-profissional-guia.md](workflow-prompt-profissional-guia.md) | Brainstorm (repo) → Brief → prompt mestre para IA | stable |

Documentação: [fluxo-workflow-agent-hooks-ci.md](../../docs/governanca/fluxo-workflow-agent-hooks-ci.md) · Plano histórico: [plans/workflow-agent-hooks-cursor.plan.md](../plans/workflow-agent-hooks-cursor.plan.md).

## Agents cloud (`cloud-*-guia`)

Catálogo completo (matriz provedor × família, rules): [docs/governanca/catalogo-cloud-ia.md](../../docs/governanca/catalogo-cloud-ia.md).

### Transversais (descoberta, diagramas, otimização, FinOps)

| Arquivo | Tema | Estado |
|----------|------|--------|
| [cloud-architecture-discover-guia.md](cloud-architecture-discover-guia.md) | Inventário a partir de IaC / K8s / código | experimental |
| [cloud-architecture-diagram-guia.md](cloud-architecture-diagram-guia.md) | Diagramas Mermaid / C4 | experimental |
| [cloud-architecture-optimize-guia.md](cloud-architecture-optimize-guia.md) | Custo, segurança, performance, operação | experimental |
| [cloud-finops-guia.md](cloud-finops-guia.md) | Estimativas, tags, reservas vs on-demand | experimental |

### Por provedor e família (`cloud-{aws|gcp|azure|oci|magalu|lwsa}-{familia}-guia`)

Famílias canônicas: `compute`, `containers`, `serverless`, `storage`, `datastores`, `networking-edge`, `identity-security`, `messaging-events`, `observability`, `cicd-devops`.

| Provedor | Slug | Notas |
|----------|------|--------|
| AWS | `aws` | Tabelas de equivalência GCP / Azure / OCI nas skills |
| GCP | `gcp` | Idem (GCP primeiro na tabela) |
| Azure | `azure` | Idem |
| OCI | `oci` | Idem |
| Magalu Cloud | `magalu` | Skeleton — validar doc oficial |
| LWSA | `lwsa` | Skeleton — validar doc oficial |

Regeneração opcional: [`skills/catalogo-cloud-providers-ia/scripts/generate-cloud-agents-skills.py`](../skills/catalogo-cloud-providers-ia/scripts/generate-cloud-agents-skills.py) (ver skill [catalogo-cloud-providers-ia](../skills/catalogo-cloud-providers-ia/SKILL.md)).

## Agents por arquitetura (`arch-*-guia`)

Decisão macro, fronteiras e trade-offs (não tecnologia concreta). Matriz: [docs/governanca/catalogo-arch-agents-ia.md](../../docs/governanca/catalogo-arch-agents-ia.md).

### Onda 1 — núcleo

| Arquivo | Tema | Estado |
|----------|------|--------|
| [arch-monolito-guia.md](arch-monolito-guia.md) | Monólito clássico | stable |
| [arch-monolito-modular-guia.md](arch-monolito-modular-guia.md) | Monólito modular | stable |
| [arch-separacao-frontend-backend-guia.md](arch-separacao-frontend-backend-guia.md) | Separação FE/BE | stable |
| [arch-clean-architecture-guia.md](arch-clean-architecture-guia.md) | Clean Architecture | stable |
| [arch-hexagonal-guia.md](arch-hexagonal-guia.md) | Hexagonal | stable |
| [arch-mvc-e-padroes-ui-guia.md](arch-mvc-e-padroes-ui-guia.md) | MVC e padrões UI | stable |

### Onda 2 — distribuído e eventos

| Arquivo | Tema | Estado |
|----------|------|--------|
| [arch-microservicos-guia.md](arch-microservicos-guia.md) | Microserviços | stable |
| [arch-sistemas-distribuidos-guia.md](arch-sistemas-distribuidos-guia.md) | Sistemas distribuídos | stable |
| [arch-orientada-eventos-guia.md](arch-orientada-eventos-guia.md) | Orientada a eventos | stable |
| [arch-cqrs-guia.md](arch-cqrs-guia.md) | CQRS | stable |
| [arch-sagas-orquestracao-guia.md](arch-sagas-orquestracao-guia.md) | Sagas / orquestração | stable |

### Onda 3 — infra transversal

| Arquivo | Tema | Estado |
|----------|------|--------|
| [arch-mensageria-guia.md](arch-mensageria-guia.md) | Mensageria | stable |
| [arch-cache-guia.md](arch-cache-guia.md) | Cache | stable |
| [arch-api-gateway-guia.md](arch-api-gateway-guia.md) | API Gateway | stable |
| [arch-bff-guia.md](arch-bff-guia.md) | BFF | stable |
| [arch-dados-distribuidos-guia.md](arch-dados-distribuidos-guia.md) | Dados distribuídos | stable |

### Onda 4 — moderno / experimental

| Arquivo | Tema | Estado |
|----------|------|--------|
| [arch-serverless-guia.md](arch-serverless-guia.md) | Serverless / FaaS | experimental |
| [arch-service-mesh-guia.md](arch-service-mesh-guia.md) | Service mesh | experimental |
| [arch-padroes-migracao-guia.md](arch-padroes-migracao-guia.md) | Padrões de migração | experimental |
| [arch-arquitetura-celulas-guia.md](arch-arquitetura-celulas-guia.md) | Arquitetura em células | experimental |

## Agents por framework (`framework-*-guia`)

Roteamento: cada agent especializa um **stack** pai (ver matriz em [docs/governanca/catalogo-frameworks-ia.md](../../docs/governanca/catalogo-frameworks-ia.md)).

### Fase A — alta adoção

| Arquivo | Framework | Estado |
|----------|-----------|--------|
| [framework-spring-guia.md](framework-spring-guia.md) | Spring Boot | stable |
| [framework-fastapi-guia.md](framework-fastapi-guia.md) | FastAPI | stable |
| [framework-flask-guia.md](framework-flask-guia.md) | Flask | stable |
| [framework-aspnet-core-guia.md](framework-aspnet-core-guia.md) | ASP.NET Core | stable |
| [framework-nestjs-guia.md](framework-nestjs-guia.md) | NestJS | stable |
| [framework-react-guia.md](framework-react-guia.md) | React | stable |
| [framework-nextjs-guia.md](framework-nextjs-guia.md) | Next.js | stable |
| [framework-vue-guia.md](framework-vue-guia.md) | Vue | stable |
| [framework-angular-guia.md](framework-angular-guia.md) | Angular | stable |
| [framework-react-native-guia.md](framework-react-native-guia.md) | React Native | stable |
| [framework-openapi-governance-guia.md](framework-openapi-governance-guia.md) | OpenAPI (governação) | stable |

### Fase B — cloud / performance

| Arquivo | Framework | Estado |
|----------|-----------|--------|
| [framework-quarkus-guia.md](framework-quarkus-guia.md) | Quarkus | experimental |
| [framework-micronaut-guia.md](framework-micronaut-guia.md) | Micronaut | experimental |
| [framework-fastify-guia.md](framework-fastify-guia.md) | Fastify | experimental |
| [framework-hono-guia.md](framework-hono-guia.md) | Hono | experimental |
| [framework-litestar-guia.md](framework-litestar-guia.md) | Litestar | experimental |
| [framework-falcon-guia.md](framework-falcon-guia.md) | Falcon | experimental |
| [framework-sanic-guia.md](framework-sanic-guia.md) | Sanic | experimental |
| [framework-svelte-guia.md](framework-svelte-guia.md) | Svelte / SvelteKit | experimental |
| [framework-solid-guia.md](framework-solid-guia.md) | SolidJS | experimental |
| [framework-astro-guia.md](framework-astro-guia.md) | Astro | experimental |
| [framework-remix-guia.md](framework-remix-guia.md) | Remix | experimental |

### Fase C — enterprise / nicho

| Arquivo | Framework | Estado |
|----------|-----------|--------|
| [framework-jakarta-ee-guia.md](framework-jakarta-ee-guia.md) | Jakarta EE | experimental |
| [framework-helidon-guia.md](framework-helidon-guia.md) | Helidon | experimental |
| [framework-dropwizard-guia.md](framework-dropwizard-guia.md) | Dropwizard | experimental |
| [framework-javalin-guia.md](framework-javalin-guia.md) | Javalin | experimental |
| [framework-abp-guia.md](framework-abp-guia.md) | ABP Framework | experimental |
| [framework-servicestack-guia.md](framework-servicestack-guia.md) | ServiceStack | experimental |
| [framework-kmp-guia.md](framework-kmp-guia.md) | Kotlin Multiplatform | experimental |
| [framework-ionic-capacitor-guia.md](framework-ionic-capacitor-guia.md) | Ionic + Capacitor | experimental |
| [framework-dotnet-maui-guia.md](framework-dotnet-maui-guia.md) | .NET MAUI | experimental |
| [framework-javafx-guia.md](framework-javafx-guia.md) | JavaFX | experimental |
| [framework-swing-guia.md](framework-swing-guia.md) | Swing | experimental |
| [framework-android-jetpack-guia.md](framework-android-jetpack-guia.md) | Android Jetpack / Compose | experimental |
