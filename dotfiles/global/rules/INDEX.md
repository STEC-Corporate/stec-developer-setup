# Catálogo de rules — AcoustiCore

| Arquivo | alwaysApply | globs | Estado |
|----------|-------------|-------|--------|
| [00-sdd-governance.mdc](00-sdd-governance.mdc) | sim | `**/*` | stable |
| [engineering-discipline.mdc](engineering-discipline.mdc) | não | `docs/**` | stable |
| [backend-java.mdc](backend-java.mdc) | não | `**/*.java` | stable |
| [desktop-java.mdc](desktop-java.mdc) | não | `**/ui/**/*.java` | stable |
| [frontend-typescript.mdc](frontend-typescript.mdc) | não | `**/*.{ts,tsx}` | stable |
| [backend-python.mdc](backend-python.mdc) | não | `**/*.py` | stable |
| [backend-csharp.mdc](backend-csharp.mdc) | não | `**/*.cs` | stable |
| [backend-dotnet-core.mdc](backend-dotnet-core.mdc) | não | `**/*.{cs,csproj}` | stable |
| [openapi-contracts.mdc](openapi-contracts.mdc) | não | `**/*openapi*.{yml,yaml,json}` | stable |
| [mobile-react-native.mdc](mobile-react-native.mdc) | não | `**/src/**/*.{tsx,ts,jsx,js}` | stable |
| [mobile-android.mdc](mobile-android.mdc) | não | `**/android/**/*.{kt,kts,java}` | stable |
| [agent-implementation-quality.mdc](agent-implementation-quality.mdc) | não | vários (código + manifests) | stable |
| [plugin-cursor-quality-gates.mdc](plugin-cursor-quality-gates.mdc) | não | manifests + assets de plugin | experimental |
| [cursor-hooks-safety.mdc](cursor-hooks-safety.mdc) | não | `hooks/**`, `hooks.json` | stable |

**Nota:** `backend-csharp.mdc` e `backend-dotnet-core.mdc` podem sobrepor-se em APIs ASP.NET Core — intencional para combinar orientação geral e específica.

## Rules cloud (`cloud-*.mdc`)

Infra e custos. Matriz completa: [docs/governanca/catalogo-cloud-ia.md](../../docs/governanca/catalogo-cloud-ia.md).

| Arquivo | Estado |
|----------|--------|
| [cloud-finops.mdc](cloud-finops.mdc) | experimental |
| [cloud-security-baseline.mdc](cloud-security-baseline.mdc) | experimental |
| [cloud-performance.mdc](cloud-performance.mdc) | experimental |
| [cloud-architecture-review.mdc](cloud-architecture-review.mdc) | experimental |

Regras adicionais: usar **globs estritos**; evitar `alwaysApply` exceto SDD core.

## Rules por framework (`framework-*.mdc`)

Todas com `alwaysApply: false`. Globs são heurísticos — ver [docs/governanca/catalogo-frameworks-ia.md](../../docs/governanca/catalogo-frameworks-ia.md) para mapeamento framework → arquivo.

| Arquivo | Estado |
|----------|--------|
| [framework-spring.mdc](framework-spring.mdc) | stable |
| [framework-fastapi.mdc](framework-fastapi.mdc) | stable |
| [framework-flask.mdc](framework-flask.mdc) | stable |
| [framework-aspnet-core.mdc](framework-aspnet-core.mdc) | stable |
| [framework-nestjs.mdc](framework-nestjs.mdc) | stable |
| [framework-react.mdc](framework-react.mdc) | stable |
| [framework-nextjs.mdc](framework-nextjs.mdc) | stable |
| [framework-vue.mdc](framework-vue.mdc) | stable |
| [framework-angular.mdc](framework-angular.mdc) | stable |
| [framework-react-native.mdc](framework-react-native.mdc) | stable |
| [framework-openapi-governance.mdc](framework-openapi-governance.mdc) | stable |
| [framework-quarkus.mdc](framework-quarkus.mdc) | experimental |
| [framework-micronaut.mdc](framework-micronaut.mdc) | experimental |
| [framework-fastify.mdc](framework-fastify.mdc) | experimental |
| [framework-hono.mdc](framework-hono.mdc) | experimental |
| [framework-litestar.mdc](framework-litestar.mdc) | experimental |
| [framework-falcon.mdc](framework-falcon.mdc) | experimental |
| [framework-sanic.mdc](framework-sanic.mdc) | experimental |
| [framework-svelte.mdc](framework-svelte.mdc) | experimental |
| [framework-solid.mdc](framework-solid.mdc) | experimental |
| [framework-astro.mdc](framework-astro.mdc) | experimental |
| [framework-remix.mdc](framework-remix.mdc) | experimental |
| [framework-jakarta-ee.mdc](framework-jakarta-ee.mdc) | experimental |
| [framework-helidon.mdc](framework-helidon.mdc) | experimental |
| [framework-dropwizard.mdc](framework-dropwizard.mdc) | experimental |
| [framework-javalin.mdc](framework-javalin.mdc) | experimental |
| [framework-abp.mdc](framework-abp.mdc) | experimental |
| [framework-servicestack.mdc](framework-servicestack.mdc) | experimental |
| [framework-kmp.mdc](framework-kmp.mdc) | experimental |
| [framework-ionic-capacitor.mdc](framework-ionic-capacitor.mdc) | experimental |
| [framework-dotnet-maui.mdc](framework-dotnet-maui.mdc) | experimental |
| [framework-javafx.mdc](framework-javafx.mdc) | experimental |
| [framework-swing.mdc](framework-swing.mdc) | experimental |
| [framework-android-jetpack.mdc](framework-android-jetpack.mdc) | experimental |

## Rules por arquitetura (`arch-*.mdc`)

Todas com `alwaysApply: false` e glob `docs/**/*.md`. Ver [docs/governanca/catalogo-arch-agents-ia.md](../../docs/governanca/catalogo-arch-agents-ia.md).

| Arquivo | Estado |
|----------|--------|
| [arch-monolito.mdc](arch-monolito.mdc) | stable |
| [arch-monolito-modular.mdc](arch-monolito-modular.mdc) | stable |
| [arch-separacao-frontend-backend.mdc](arch-separacao-frontend-backend.mdc) | stable |
| [arch-clean-architecture.mdc](arch-clean-architecture.mdc) | stable |
| [arch-hexagonal.mdc](arch-hexagonal.mdc) | stable |
| [arch-mvc-e-padroes-ui.mdc](arch-mvc-e-padroes-ui.mdc) | stable |
| [arch-microservicos.mdc](arch-microservicos.mdc) | stable |
| [arch-sistemas-distribuidos.mdc](arch-sistemas-distribuidos.mdc) | stable |
| [arch-orientada-eventos.mdc](arch-orientada-eventos.mdc) | stable |
| [arch-cqrs.mdc](arch-cqrs.mdc) | stable |
| [arch-sagas-orquestracao.mdc](arch-sagas-orquestracao.mdc) | stable |
| [arch-mensageria.mdc](arch-mensageria.mdc) | stable |
| [arch-cache.mdc](arch-cache.mdc) | stable |
| [arch-api-gateway.mdc](arch-api-gateway.mdc) | stable |
| [arch-bff.mdc](arch-bff.mdc) | stable |
| [arch-dados-distribuidos.mdc](arch-dados-distribuidos.mdc) | stable |
| [arch-serverless.mdc](arch-serverless.mdc) | experimental |
| [arch-service-mesh.mdc](arch-service-mesh.mdc) | experimental |
| [arch-padroes-migracao.mdc](arch-padroes-migracao.mdc) | experimental |
| [arch-arquitetura-celulas.mdc](arch-arquitetura-celulas.mdc) | experimental |
