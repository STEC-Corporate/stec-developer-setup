# Catálogo de skills — AcoustiCore

## Núcleo SDD

| Pasta | Descrição | Estado |
|-------|-----------|--------|
| [sdd-sincronizar-spec-produto](sdd-sincronizar-spec-produto/SKILL.md) | Alinhar código ↔ `docs/produto/fluxo/` | stable |
| [docs-gerar-artefatos-sdd](docs-gerar-artefatos-sdd/SKILL.md) | BR, fluxos, critérios de aceite | stable |
| [workflow-ferramentas-ia](workflow-ferramentas-ia/SKILL.md) | Cursor / Codex / Claude, mesmo contrato | experimental |
| [workflow-cursor-agent-entrega](workflow-cursor-agent-entrega/SKILL.md) | Entrega no Cursor: testes, lint, hooks, CI | stable |

## Catálogos Cursor (manutenção)

Scripts de geração ficam em **`scripts/`** dentro de cada skill (ver [docs/governanca/catalogo-scripts-skills.md](../../docs/governanca/catalogo-scripts-skills.md)).

| Pasta | Descrição | Estado |
|-------|-----------|--------|
| [catalogo-frameworks-ia](catalogo-frameworks-ia/SKILL.md) | Gerar catálogo `framework-*` | stable |
| [catalogo-arch-agents-ia](catalogo-arch-agents-ia/SKILL.md) | Gerar catálogo `arch-*` | stable |
| [catalogo-cloud-providers-ia](catalogo-cloud-providers-ia/SKILL.md) | Gerar catálogo `cloud-*` por provedor | stable |

## Plugins Cursor (criacao e publicacao)

| Pasta | Descrição | Estado |
|-------|-----------|--------|
| [plugin-cursor-scaffold](plugin-cursor-scaffold/SKILL.md) | Scaffold de plugin Cursor com manifesto e estrutura base | experimental |
| [plugin-cursor-review-submission](plugin-cursor-review-submission/SKILL.md) | Checklist de submissao para marketplace oficial | experimental |
| [plugin-cursor-security-audit](plugin-cursor-security-audit/SKILL.md) | Auditoria de seguranca e conformidade de paths/refs | experimental |
| [plugin-cursor-prepare-pr](plugin-cursor-prepare-pr/SKILL.md) | Preparacao automatizada de conteudo de PR de submissao | experimental |
| [plugin-cursor-track-publication](plugin-cursor-track-publication/SKILL.md) | Acompanhamento de PR, checks e recomendacao final | experimental |
| [plugin-cursor-pipeline-e2e](plugin-cursor-pipeline-e2e/SKILL.md) | Orquestracao ponta a ponta (dry-run/apply) | experimental |

## Stacks

| Pasta | Descrição | Estado |
|-------|-----------|--------|
| [stack-java-backend](stack-java-backend/SKILL.md) | Workflow Java backend / Spring | stable |
| [stack-java-desktop](stack-java-desktop/SKILL.md) | JavaFX / Swing | stable |
| [stack-typescript-frontend](stack-typescript-frontend/SKILL.md) | TS / React / Node | stable |
| [stack-python-backend](stack-python-backend/SKILL.md) | FastAPI / Flask | stable |
| [stack-dotnet-backend](stack-dotnet-backend/SKILL.md) | .NET geral (arquitetura e plataforma) | stable |
| [stack-dotnet-core-backend](stack-dotnet-core-backend/SKILL.md) | .NET Core / ASP.NET Core (HTTP) | stable |
| [stack-openapi-contracts](stack-openapi-contracts/SKILL.md) | Especificações OpenAPI | stable |
| [stack-react-native](stack-react-native/SKILL.md) | React Native | stable |
| [stack-android-native](stack-android-native/SKILL.md) | Android nativo | stable |

Novas stacks: criar pasta `stack-<nome>/` com `SKILL.md` + README com estado.

## Scaffolding por arquitetura

| Pasta | Descrição | Estado |
|-------|-----------|--------|
| [scaffold-ddd-aggregate](scaffold-ddd-aggregate/SKILL.md) | Scaffold de agregado DDD com invariantes | experimental |
| [scaffold-clean-layer-skeleton](scaffold-clean-layer-skeleton/SKILL.md) | Esqueleto de camadas para Clean Architecture | experimental |
| [scaffold-mvc-module](scaffold-mvc-module/SKILL.md) | Estrutura base de módulo MVC | experimental |

## Skills por arquitetura (`arch-<slug>/`)

Cada pasta acompanha o agent `arch-<slug>-guia`. Matriz: [docs/governanca/catalogo-arch-agents-ia.md](../../docs/governanca/catalogo-arch-agents-ia.md).

### Onda 1

| Pasta | Estado |
|-------|--------|
| [arch-monolito](arch-monolito/SKILL.md) | stable |
| [arch-monolito-modular](arch-monolito-modular/SKILL.md) | stable |
| [arch-separacao-frontend-backend](arch-separacao-frontend-backend/SKILL.md) | stable |
| [arch-clean-architecture](arch-clean-architecture/SKILL.md) | stable |
| [arch-hexagonal](arch-hexagonal/SKILL.md) | stable |
| [arch-mvc-e-padroes-ui](arch-mvc-e-padroes-ui/SKILL.md) | stable |

### Onda 2

| Pasta | Estado |
|-------|--------|
| [arch-microservicos](arch-microservicos/SKILL.md) | stable |
| [arch-sistemas-distribuidos](arch-sistemas-distribuidos/SKILL.md) | stable |
| [arch-orientada-eventos](arch-orientada-eventos/SKILL.md) | stable |
| [arch-cqrs](arch-cqrs/SKILL.md) | stable |
| [arch-sagas-orquestracao](arch-sagas-orquestracao/SKILL.md) | stable |

### Onda 3

| Pasta | Estado |
|-------|--------|
| [arch-mensageria](arch-mensageria/SKILL.md) | stable |
| [arch-cache](arch-cache/SKILL.md) | stable |
| [arch-api-gateway](arch-api-gateway/SKILL.md) | stable |
| [arch-bff](arch-bff/SKILL.md) | stable |
| [arch-dados-distribuidos](arch-dados-distribuidos/SKILL.md) | stable |

### Onda 4

| Pasta | Estado |
|-------|--------|
| [arch-serverless](arch-serverless/SKILL.md) | experimental |
| [arch-service-mesh](arch-service-mesh/SKILL.md) | experimental |
| [arch-padroes-migracao](arch-padroes-migracao/SKILL.md) | experimental |
| [arch-arquitetura-celulas](arch-arquitetura-celulas/SKILL.md) | experimental |

## Skills por framework (`framework-<slug>/`)

Cada pasta acompanha o agent `framework-<slug>-guia`. Matriz completa: [docs/governanca/catalogo-frameworks-ia.md](../../docs/governanca/catalogo-frameworks-ia.md).

### Fase A

| Pasta | Estado |
|-------|--------|
| [framework-spring](framework-spring/SKILL.md) | stable |
| [framework-fastapi](framework-fastapi/SKILL.md) | stable |
| [framework-flask](framework-flask/SKILL.md) | stable |
| [framework-aspnet-core](framework-aspnet-core/SKILL.md) | stable |
| [framework-nestjs](framework-nestjs/SKILL.md) | stable |
| [framework-nestjs-swc-install](framework-nestjs-swc-install/SKILL.md) | stable |
| [framework-nestjs-swc-config](framework-nestjs-swc-config/SKILL.md) | stable |
| [framework-nestjs-swc-jest](framework-nestjs-swc-jest/SKILL.md) | stable |
| [framework-react](framework-react/SKILL.md) | stable |
| [framework-nextjs](framework-nextjs/SKILL.md) | stable |
| [framework-vue](framework-vue/SKILL.md) | stable |
| [framework-angular](framework-angular/SKILL.md) | stable |
| [framework-react-native](framework-react-native/SKILL.md) | stable |
| [framework-openapi-governance](framework-openapi-governance/SKILL.md) | stable |

### Fase B

| Pasta | Estado |
|-------|--------|
| [framework-quarkus](framework-quarkus/SKILL.md) | experimental |
| [framework-micronaut](framework-micronaut/SKILL.md) | experimental |
| [framework-fastify](framework-fastify/SKILL.md) | experimental |
| [framework-hono](framework-hono/SKILL.md) | experimental |
| [framework-litestar](framework-litestar/SKILL.md) | experimental |
| [framework-falcon](framework-falcon/SKILL.md) | experimental |
| [framework-sanic](framework-sanic/SKILL.md) | experimental |
| [framework-svelte](framework-svelte/SKILL.md) | experimental |
| [framework-solid](framework-solid/SKILL.md) | experimental |
| [framework-astro](framework-astro/SKILL.md) | experimental |
| [framework-remix](framework-remix/SKILL.md) | experimental |

### Fase C

| Pasta | Estado |
|-------|--------|
| [framework-jakarta-ee](framework-jakarta-ee/SKILL.md) | experimental |
| [framework-helidon](framework-helidon/SKILL.md) | experimental |
| [framework-dropwizard](framework-dropwizard/SKILL.md) | experimental |
| [framework-javalin](framework-javalin/SKILL.md) | experimental |
| [framework-abp](framework-abp/SKILL.md) | experimental |
| [framework-servicestack](framework-servicestack/SKILL.md) | experimental |
| [framework-kmp](framework-kmp/SKILL.md) | experimental |
| [framework-ionic-capacitor](framework-ionic-capacitor/SKILL.md) | experimental |
| [framework-dotnet-maui](framework-dotnet-maui/SKILL.md) | experimental |
| [framework-javafx](framework-javafx/SKILL.md) | experimental |
| [framework-swing](framework-swing/SKILL.md) | experimental |
| [framework-android-jetpack](framework-android-jetpack/SKILL.md) | experimental |
