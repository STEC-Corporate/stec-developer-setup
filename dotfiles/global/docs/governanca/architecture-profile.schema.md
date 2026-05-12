# Architecture Profile Schema (v1)

> **Estado:** ATIVO | **Data:** 2026-04-09  
> **Relação:** [fluxo-workflow-agent-hooks-ci.md](./fluxo-workflow-agent-hooks-ci.md)

Este documento define o contrato mínimo de um arquivo `architecture-profile` para orientar agents e skills de geração de código por arquitetura.

## Objetivo

- Declarar, por módulo/pacote, **stack**, **estilos arquiteturais** e **artefatos permitidos**.
- Reduzir ambiguidade na escolha de skills (`core-*`, `scaffold-*`, `framework-*`, `stack-*`).
- Evitar geração de artefatos fora do desenho do projeto.

## Localização recomendada

- Preferencial: `architecture-profile.yaml` na raiz do repositório consumidor.
- Alternativa documentada: `docs/governanca/architecture-profile.yaml`.

## Estrutura (YAML)

```yaml
version: 1
modules:
  - id: backend_api
    path: apps/backend
    stack: nestjs
    styles:
      - clean_architecture
      - ddd
      - hexagonal
    artifacts_enabled:
      - entity
      - value_object
      - use_case
      - repository
      - port
      - adapter
```

## Campos obrigatórios

- `version`: inteiro. Versão atual `1`.
- `modules`: lista de módulos com:
  - `id`: identificador estável do módulo.
  - `path`: caminho raiz do módulo/pacote.
  - `stack`: stack principal para seleção de scaffold.
  - `styles`: estilos arquiteturais ativos no módulo.
  - `artifacts_enabled`: artefatos que podem ser gerados.

## Enum recomendada

### `stack`

- `nestjs`
- `spring`
- `aspnet_core`
- `fastapi`
- `flask`
- `nextjs`
- `react`
- `react_native`
- `android_native`
- `java_desktop`
- `dotnet`
- `node_generic`

### `styles`

- `ddd`
- `mvc`
- `mvp`
- `mvvm`
- `hexagonal`
- `clean_architecture`
- `microservices`
- `monolith`
- `modular_monolith`
- `distributed_system`
- `client_server`
- `serverless`
- `layered`

### `artifacts_enabled`

- `entity`
- `value_object`
- `aggregate`
- `domain_service`
- `use_case`
- `dto`
- `repository`
- `dao`
- `service`
- `controller`
- `view`
- `presenter`
- `view_model`
- `port`
- `adapter`
- `handler`
- `event_contract`
- `api_contract`

## Regras de decisão para agents

1. **Profile-first:** se existir `architecture-profile`, ele é a fonte de verdade.
2. **Stack gate:** só usar `scaffold-*` compatível com `stack`.
3. **Style gate:** só usar skills coerentes com `styles`.
4. **Artifact gate:** não gerar artefato fora de `artifacts_enabled` sem confirmação explícita do usuário.
5. **Fallback seguro:** sem perfil, usar `arch-*-guia` + `stack-*` e pedir confirmação antes de gerar.

## Validação mínima (manual)

- `path` existe no repositório.
- `stack` pertence à enum recomendada.
- `styles` e `artifacts_enabled` não possuem valores fora da lista.
- Pelo menos 1 `style` e 1 `artifact` por módulo.

