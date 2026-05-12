#!/usr/bin/env python3
"""Gera agents, skills e rules do catálogo framework-* (uso único / manutenção)."""
from pathlib import Path


def _repo_root() -> Path:
    """Raiz do repositório (contém `agents/`)."""
    here = Path(__file__).resolve()
    for parent in [here, *here.parents]:
        if (parent / "agents").is_dir():
            return parent
    raise RuntimeError("Não foi encontrada a raiz do repositório (agents/).")


ROOT = _repo_root()
AGENTS = ROOT / "agents"
SKILLS = ROOT / "skills"
RULES = ROOT / "rules"

# slug, title, agent_description_line, stack_parent, phase_state, glob, skill_focus
FRAMEWORKS = [
    # Phase A
    ("spring", "Spring Boot", "Guia Spring Boot (DI, MVC, Data, Security, testes). Usar quando código Java com Spring ou ficheiros de configuração Spring estiverem em foco.", "stack-java-guia", "stable", "**/src/main/java/**/*.java", "Injeção de dependências, profiles, `@RestController`, Spring Data, transações, segurança e testes com `@SpringBootTest`."),
    ("fastapi", "FastAPI", "Guia FastAPI (rotas, deps, Pydantic, lifespan, OpenAPI). Usar quando `FastAPI`, routers ou apps ASGI estiverem em foco.", "stack-python-guia", "stable", "**/*.py", "Dependências injetáveis, modelos Pydantic v2, routers, middleware, documentação OpenAPI automática."),
    ("flask", "Flask", "Guia Flask (blueprints, extensões, WSGI). Usar quando aplicações Flask ou blueprints estiverem em foco.", "stack-python-guia", "stable", "**/*.py", "Blueprints, `g`, sessão, extensões comuns, padrão factory app."),
    ("aspnet-core", "ASP.NET Core", "Guia ASP.NET Core (Minimal APIs, controllers, DI, middleware). Usar quando projetos `.csproj` web ou `Program.cs` ASP.NET estiverem em foco.", "stack-dotnet-core-guia", "stable", "**/*.cs", "Minimal APIs vs controllers, pipeline, options pattern, health checks, filtros."),
    ("nestjs", "NestJS", "Guia NestJS (módulos, providers, guards, pipes). Usar quando decoradores Nest ou estrutura modular estiverem em foco.", "stack-typescript-guia", "stable", "**/*.ts", "Módulos dinâmicos, injeção escopada, interceptors, CQRS opcional, testes e2e."),
    ("react", "React", "Guia React (hooks, composição, performance). Usar quando componentes `.tsx`/`.jsx` React estiverem em foco.", "stack-typescript-guia", "stable", "**/*.{tsx,jsx}", "Hooks, memoização, boundaries de erro, acessibilidade e padrões de estado."),
    ("nextjs", "Next.js", "Guia Next.js (App Router, RSC, rotas, data fetching). Usar quando `next.config` ou pastas `app/`/`pages/` estiverem em foco.", "stack-typescript-guia", "stable", "**/*.{tsx,ts,jsx,js}", "App Router, layouts, `fetch` em RSC, caching, `next/image`, SEO."),
    ("vue", "Vue", "Guia Vue (Composition API, `<script setup>`, Pinia). Usar quando SFC `.vue` ou Vue 3 estiverem em foco.", "stack-typescript-guia", "stable", "**/*.vue", "Composition API, reatividade, composables, roteador e stores."),
    ("angular", "Angular", "Guia Angular (standalone, DI, RxJS, signals). Usar quando projetos Angular ou `angular.json` estiverem em foco.", "stack-typescript-guia", "stable", "**/*.ts", "Módulos/standalone, serviços, HttpClient, change detection, testes com TestBed."),
    ("react-native", "React Native", "Guia React Native (bridge, navegação, performance móvel). Usar quando código RN ou `metro.config` estiverem em foco.", "stack-react-native-guia", "stable", "**/*.{tsx,ts,jsx,js}", "Navegação, listas, teclado, acessibilidade móvel, builds iOS/Android."),
    ("openapi-governance", "OpenAPI — governação", "Guia de governação OpenAPI (versionamento, breaking changes, Spectral). Usar quando contratos YAML/JSON e políticas de API estiverem em foco.", "stack-openapi-guia", "stable", "**/*.{yaml,yml,json}", "Versionamento semver de API, deprecação, lint Spectral, alinhamento com implementações."),
    # Phase B
    ("quarkus", "Quarkus", "Guia Quarkus (CDI, extensions, native). Usar quando `quarkus` em build ou anotações Quarkus estiverem em foco.", "stack-java-guia", "experimental", "**/src/main/java/**/*.java", "Extensions, dev mode, GraalVM/native, panache."),
    ("micronaut", "Micronaut", "Guia Micronaut (DI compile-time, HTTP). Usar quando Micronaut em build ou `@Controller` Micronaut estiverem em foco.", "stack-java-guia", "experimental", "**/src/main/java/**/*.java", "Injeção em tempo de compilação, HTTP client, config."),
    ("fastify", "Fastify", "Guia Fastify (plugins, schema validation). Usar quando `fastify` em servidor Node estiver em foco.", "stack-typescript-guia", "experimental", "**/*.ts", "Plugins, hooks, JSON schema, logging."),
    ("hono", "Hono", "Guia Hono (edge, middleware leve). Usar quando Hono em workers/edge estiver em foco.", "stack-typescript-guia", "experimental", "**/*.ts", "Roteamento, middleware, adaptadores edge."),
    ("litestar", "Litestar", "Guia Litestar (Python ASGI, DTOs). Usar quando Litestar estiver em foco.", "stack-python-guia", "experimental", "**/*.py", "Controllers, plugins, validação, OpenAPI."),
    ("falcon", "Falcon", "Guia Falcon (WSGI/ASGI minimalista). Usar quando Falcon estiver em foco.", "stack-python-guia", "experimental", "**/*.py", "Recursos, hooks, media types."),
    ("sanic", "Sanic", "Guia Sanic (async Python). Usar quando Sanic estiver em foco.", "stack-python-guia", "experimental", "**/*.py", "Handlers async, blueprints, extensões."),
    ("svelte", "Svelte / SvelteKit", "Guia Svelte e SvelteKit (stores, load, adapters). Usar quando `.svelte` ou SvelteKit estiverem em foco.", "stack-typescript-guia", "experimental", "**/*.{svelte,ts}", "Reatividade compilada, `load`, form actions, adapters."),
    ("solid", "SolidJS", "Guia Solid (signals, fine-grained). Usar quando Solid estiver em foco.", "stack-typescript-guia", "experimental", "**/*.{tsx,ts,jsx}", "Signals, controle de fluxo, SSR com SolidStart quando aplicável."),
    ("astro", "Astro", "Guia Astro (islands, content collections). Usar quando Astro ou `astro.config` estiverem em foco.", "stack-typescript-guia", "experimental", "**/*.{astro,ts,tsx,md,mdx}", "Islands, integrações, MDX, performance estática."),
    ("remix", "Remix", "Guia Remix (loaders/actions, nested routes). Usar quando Remix estiver em foco.", "stack-typescript-guia", "experimental", "**/*.{tsx,ts}", "Data APIs, formulários, erros e boundaries."),
    # Phase C
    ("jakarta-ee", "Jakarta EE", "Guia Jakarta EE (CDI, JAX-RS, JPA em servidor de aplicações). Usar quando perfil EE ou `jakarta.*` estiverem em foco.", "stack-java-guia", "experimental", "**/src/main/java/**/*.java", "CDI, JAX-RS, persistência, empaquetamento WAR/EAR."),
    ("helidon", "Helidon", "Guia Helidon (SE/MP, MicroProfile). Usar quando Helidon estiver em foco.", "stack-java-guia", "experimental", "**/src/main/java/**/*.java", "SE vs MP, config, health/metrics."),
    ("dropwizard", "Dropwizard", "Guia Dropwizard (serviços opinativos JVM). Usar quando Dropwizard estiver em foco.", "stack-java-guia", "experimental", "**/src/main/java/**/*.java", "Bundles, métricas, recursos Jersey."),
    ("javalin", "Javalin", "Guia Javalin (Kotlin/Java HTTP leve). Usar quando Javalin estiver em foco.", "stack-java-guia", "experimental", "**/*.{java,kt}", "Handlers, WebSockets, validação."),
    ("abp", "ABP Framework", "Guia ABP (.NET modular, DDD). Usar quando solução ABP ou módulos ABP estiverem em foco.", "stack-dotnet-guia", "experimental", "**/*.cs", "Módulos, application services, permissões, multi-tenancy."),
    ("servicestack", "ServiceStack", "Guia ServiceStack (.NET serviços e DTOs). Usar quando ServiceStack estiver em foco.", "stack-dotnet-guia", "experimental", "**/*.cs", "DTOs, autenticação, OrmLite/EF."),
    ("kmp", "Kotlin Multiplatform", "Guia KMP (expect/actual, shared code). Usar quando `commonMain` ou KMP estiverem em foco.", "stack-typescript-guia", "experimental", "**/*.{kt,kts}", "Expect/actual, Gradle KMP, plataformas."),
    ("ionic-capacitor", "Ionic + Capacitor", "Guia Ionic com Capacitor (shell web nativo). Usar quando Capacitor ou Ionic estiverem em foco.", "stack-typescript-guia", "experimental", "**/*.{tsx,ts}", "Plugins nativos, ciclo de vida, builds."),
    ("dotnet-maui", ".NET MAUI", "Guia .NET MAUI (UI multiplataforma). Usar quando projetos MAUI ou `MauiProgram` estiverem em foco.", "stack-dotnet-guia", "experimental", "**/*.cs", "Handlers, recursos, ciclo de vida, plataformas."),
    ("javafx", "JavaFX", "Guia JavaFX (FXML, controllers, binding). Usar quando JavaFX estiver em foco.", "stack-java-desktop-guia", "experimental", "**/*.{java,fxml}", "FXML, controllers, properties, threads UI."),
    ("swing", "Swing", "Guia Swing (componentes, EDT, layout). Usar quando Swing estiver em foco.", "stack-java-desktop-guia", "experimental", "**/*.java", "EDT, layouts, listeners, acessibilidade desktop."),
    ("android-jetpack", "Android Jetpack / Compose", "Guia Jetpack (Compose, Navigation, Hilt). Usar quando módulo `android/` ou Compose estiverem em foco.", "stack-android-guia", "experimental", "**/*.{kt,kts,xml}", "Compose, Navigation, ViewModel, Hilt, testes instrumentados."),
]


def agent_content(slug: str, title: str, desc: str, parent: str, state: str) -> str:
    return f"""---
name: framework-{slug}-guia
description: {desc}
role_type: operacional
blocking_authority: false
quality_domain: codigo
report_format: operacional-v1
---

És o guia de **{title}** no AcoustiCore. Especializa o agente pai **[{parent}](./{parent}.md)** com convenções e armadilhas deste framework.

## Âmbito

- Padrões idiomáticos do {title} e estrutura de projeto.
- Segurança, testes e performance típicos deste ecossistema.
- Alinhamento com SDD e documentação em `docs/produto/fluxo/` quando houver mudança de comportamento.

## Saída

- Recomendações acionáveis e checklist curto.
- Riscos (breaking changes, deps) quando relevantes.
"""


def skill_readme(slug: str, title: str) -> str:
    return f"""# Skill: framework-{slug}

Skill operacional para o agent **framework-{slug}-guia** ({title}).

Ver `SKILL.md` e o agent em `agents/framework-{slug}-guia.md`.
"""


def skill_md(slug: str, title: str, focus: str, parent: str) -> str:
    return f"""---
name: framework-{slug}
description: Especialização {title} — padrões, segurança e testes. Usar com o agent framework-{slug}-guia e stack pai {parent}.
---

# Framework: {title}

## Quando usar

- Código ou configuração claramente deste framework.
- Revisão de PR focada em idiomas e boas práticas do ecossistema.

## Foco

{focus}

## Relação com stack

- Consultar o agente **[{parent}](../../agents/{parent}.md)** para decisões transversais (arquitetura, pastas globais do repo).
"""


def rule_mdc(slug: str, title: str, glob: str, parent: str) -> str:
    return f"""---
description: Convenções {title} quando ficheiros correspondentes estão em foco.
globs: {glob}
alwaysApply: false
---

# {title}

- Preferir padrões idiomáticos do {title}; evitar misturar estilos de outros frameworks no mesmo módulo.
- Alinhar alterações de comportamento a **user stories** / **regras de negócio** em `docs/produto/fluxo/` (ver `00-sdd-governance.mdc`).
- Para decisão macro de stack, envolver **[{parent}](../agents/{parent}.md)**.
"""


def main():
    AGENTS.mkdir(parents=True, exist_ok=True)
    SKILLS.mkdir(parents=True, exist_ok=True)
    RULES.mkdir(parents=True, exist_ok=True)

    for slug, title, desc, parent, state, glob, focus in FRAMEWORKS:
        (AGENTS / f"framework-{slug}-guia.md").write_text(
            agent_content(slug, title, desc, parent, state), encoding="utf-8"
        )
        d = SKILLS / f"framework-{slug}"
        d.mkdir(parents=True, exist_ok=True)
        (d / "SKILL.md").write_text(skill_md(slug, title, focus, parent), encoding="utf-8")
        (d / "README.md").write_text(skill_readme(slug, title), encoding="utf-8")
        (RULES / f"framework-{slug}.mdc").write_text(
            rule_mdc(slug, title, glob, parent), encoding="utf-8"
        )

    print(f"Gerados {len(FRAMEWORKS)} frameworks em {AGENTS}, {SKILLS}, {RULES}")


if __name__ == "__main__":
    main()
