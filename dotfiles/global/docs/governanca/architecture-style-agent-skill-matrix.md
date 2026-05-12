# Matriz: estilo arquitetural -> agent -> skills -> artefatos

> **Estado:** ATIVO | **Data:** 2026-04-09  
> **Relação:** [architecture-profile.schema.md](./architecture-profile.schema.md)

Matriz de referência para automação assistida. O objetivo é padronizar como escolher agents e skills para cada estilo arquitetural.

## Leitura rápida

- **Agent arquitetural**: decide fronteiras, riscos e trade-offs.
- **Skill de scaffold**: cria estrutura inicial do artefato.
- **Skill core/framework/stack**: aplica regras de qualidade e implementação concreta.

## Matriz

| Estilo | Agent principal | Skills de scaffold | Skills de qualidade/execução | Artefatos alvo |
|---|---|---|---|---|
| DDD | `arch-clean-architecture-guia` (com DDD) | `scaffold-ddd-aggregate` | `core-entity`, `core-value-object`, `core-domain-service`, `core-use-case` | `aggregate`, `entity`, `value_object`, `domain_service`, `use_case` |
| MVC/MVP/MVVM | `arch-mvc-e-padroes-ui-guia` | `scaffold-mvc-module` | `stack-typescript-frontend` ou stack equivalente | `model`, `view`, `controller` (ou `presenter`/`view_model`) |
| Hexagonal | `arch-hexagonal-guia` | `scaffold-hexagonal-ports-adapters` | `core-repository`, `core-use-case` e stack do módulo | `port`, `adapter`, `service`, `repository` |
| Clean Architecture | `arch-clean-architecture-guia` | `scaffold-clean-layer-skeleton` | `core-use-case`, `core-dto`, `core-repository` | `entity`, `use_case`, `dto`, `repository`, `controller` |
| Microserviços | `arch-microservicos-guia` | (futuro) `scaffold-microservice-contract` | `code-criar-novo-microsservico`, `config-new-module` | `service`, `api_contract`, `handler` |
| Monólito modular | `arch-monolito-modular-guia` | (futuro) `scaffold-monolith-module` | stack/framework do módulo | `module_boundary`, `service`, `controller` |
| Distribuído | `arch-sistemas-distribuidos-guia` | (futuro) `scaffold-idempotent-handler` | `arch-sagas-orquestracao`, `arch-mensageria` | `handler`, `event_contract`, `service` |
| Cliente/Servidor | `arch-separacao-frontend-backend-guia` | (futuro) `scaffold-bff-route` | `code-validar-contrato-api-frontend` | `api_contract`, `dto`, `service` |
| Serverless | `arch-serverless-guia` | (futuro) `scaffold-serverless-handler-<provider>` | stack cloud/provider relevante | `handler`, `adapter`, `event_contract` |
| Camadas | `arch-clean-architecture-guia` / `arch-hexagonal-guia` | (futuro) `scaffold-layered-service`, `scaffold-dao-repository` | stack/framework do módulo | `service`, `dao`, `repository` |

## Regras de seleção

1. Ler `architecture-profile` para obter `stack`, `styles` e `artifacts_enabled`.
2. Escolher primeiro o **agent arquitetural** do estilo dominante.
3. Executar scaffold só se o artefato estiver em `artifacts_enabled`.
4. Aplicar skill de stack/framework para concretizar implementação.
5. Se houver conflito entre estilos, priorizar regra explícita de produto/arquitetura e registrar decisão em docs.
