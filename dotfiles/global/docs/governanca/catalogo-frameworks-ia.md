# Catálogo de frameworks — agents, skills e rules

> **Estado:** ATIVO | **Data:** 2026-04-09  
> **Prefixo de agents:** `framework-*-guia`  
> **Prefixo de skills:** `skills/framework-<slug>/`  
> **Prefixo de rules:** `rules/framework-<slug>.mdc`

Cada entrada liga um **framework de mercado** a um agente especializado, uma skill operacional e uma rule com glob orientativo. O agente de **stack** pai (ex.: `stack-java-guia`) permanece a referência para decisões transversais.

## Legenda de estado

| Estado | Significado |
|--------|-------------|
| stable | Pronto para uso no dia a dia |
| experimental | Conteúdo base; afinar globs ao repo real |

## Matriz (framework → arquivos)

| Fase | Framework | Agent | Skill | Rule | Estado |
|------|-----------|-------|-------|------|--------|
| A | Spring Boot | `framework-spring-guia.md` | `framework-spring/` | `framework-spring.mdc` | stable |
| A | FastAPI | `framework-fastapi-guia.md` | `framework-fastapi/` | `framework-fastapi.mdc` | stable |
| A | Flask | `framework-flask-guia.md` | `framework-flask/` | `framework-flask.mdc` | stable |
| A | ASP.NET Core | `framework-aspnet-core-guia.md` | `framework-aspnet-core/` | `framework-aspnet-core.mdc` | stable |
| A | NestJS | `framework-nestjs-guia.md` | `framework-nestjs/` | `framework-nestjs.mdc` | stable |
| A | React | `framework-react-guia.md` | `framework-react/` | `framework-react.mdc` | stable |
| A | Next.js | `framework-nextjs-guia.md` | `framework-nextjs/` | `framework-nextjs.mdc` | stable |
| A | Vue | `framework-vue-guia.md` | `framework-vue/` | `framework-vue.mdc` | stable |
| A | Angular | `framework-angular-guia.md` | `framework-angular/` | `framework-angular.mdc` | stable |
| A | React Native | `framework-react-native-guia.md` | `framework-react-native/` | `framework-react-native.mdc` | stable |
| A | OpenAPI (governação) | `framework-openapi-governance-guia.md` | `framework-openapi-governance/` | `framework-openapi-governance.mdc` | stable |
| B | Quarkus | `framework-quarkus-guia.md` | `framework-quarkus/` | `framework-quarkus.mdc` | experimental |
| B | Micronaut | `framework-micronaut-guia.md` | `framework-micronaut/` | `framework-micronaut.mdc` | experimental |
| B | Fastify | `framework-fastify-guia.md` | `framework-fastify/` | `framework-fastify.mdc` | experimental |
| B | Hono | `framework-hono-guia.md` | `framework-hono/` | `framework-hono.mdc` | experimental |
| B | Litestar | `framework-litestar-guia.md` | `framework-litestar/` | `framework-litestar.mdc` | experimental |
| B | Falcon | `framework-falcon-guia.md` | `framework-falcon/` | `framework-falcon.mdc` | experimental |
| B | Sanic | `framework-sanic-guia.md` | `framework-sanic/` | `framework-sanic.mdc` | experimental |
| B | Svelte / SvelteKit | `framework-svelte-guia.md` | `framework-svelte/` | `framework-svelte.mdc` | experimental |
| B | SolidJS | `framework-solid-guia.md` | `framework-solid/` | `framework-solid.mdc` | experimental |
| B | Astro | `framework-astro-guia.md` | `framework-astro/` | `framework-astro.mdc` | experimental |
| B | Remix | `framework-remix-guia.md` | `framework-remix/` | `framework-remix.mdc` | experimental |
| C | Jakarta EE | `framework-jakarta-ee-guia.md` | `framework-jakarta-ee/` | `framework-jakarta-ee.mdc` | experimental |
| C | Helidon | `framework-helidon-guia.md` | `framework-helidon/` | `framework-helidon.mdc` | experimental |
| C | Dropwizard | `framework-dropwizard-guia.md` | `framework-dropwizard/` | `framework-dropwizard.mdc` | experimental |
| C | Javalin | `framework-javalin-guia.md` | `framework-javalin/` | `framework-javalin.mdc` | experimental |
| C | ABP Framework | `framework-abp-guia.md` | `framework-abp/` | `framework-abp.mdc` | experimental |
| C | ServiceStack | `framework-servicestack-guia.md` | `framework-servicestack/` | `framework-servicestack.mdc` | experimental |
| C | Kotlin Multiplatform | `framework-kmp-guia.md` | `framework-kmp/` | `framework-kmp.mdc` | experimental |
| C | Ionic + Capacitor | `framework-ionic-capacitor-guia.md` | `framework-ionic-capacitor/` | `framework-ionic-capacitor.mdc` | experimental |
| C | .NET MAUI | `framework-dotnet-maui-guia.md` | `framework-dotnet-maui/` | `framework-dotnet-maui.mdc` | experimental |
| C | JavaFX | `framework-javafx-guia.md` | `framework-javafx/` | `framework-javafx.mdc` | experimental |
| C | Swing | `framework-swing-guia.md` | `framework-swing/` | `framework-swing.mdc` | experimental |
| C | Android Jetpack / Compose | `framework-android-jetpack-guia.md` | `framework-android-jetpack/` | `framework-android-jetpack.mdc` | experimental |

## Agents de stack (pais)

| Domínio | Agent |
|---------|--------|
| Java backend | [stack-java-guia](../../agents/stack-java-guia.md) |
| Python | [stack-python-guia](../../agents/stack-python-guia.md) |
| .NET geral | [stack-dotnet-guia](../../agents/stack-dotnet-guia.md) |
| .NET Core HTTP | [stack-dotnet-core-guia](../../agents/stack-dotnet-core-guia.md) |
| TypeScript web | [stack-typescript-guia](../../agents/stack-typescript-guia.md) |
| OpenAPI transversal | [stack-openapi-guia](../../agents/stack-openapi-guia.md) |
| React Native stack | [stack-react-native-guia](../../agents/stack-react-native-guia.md) |
| Android nativo | [stack-android-guia](../../agents/stack-android-guia.md) |

## Nota sobre globs

Os globs nas `.mdc` são **heurísticos**. Ajuste por repositório (ex.: monorepo sem `src/main/java`) para evitar falsos positivos.
