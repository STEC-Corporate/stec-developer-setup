# Catálogo de agents de arquitetura (`arch-*`)

> **Estado:** ATIVO | **Data:** 2026-04-09  
> **Prefixo de agents:** `arch-*-guia`  
> **Prefixo de skills:** `skills/arch-<slug>/`  
> **Prefixo de rules:** `rules/arch-<slug>.mdc`

Os agents `arch-*` tratam **forma do sistema, fronteiras e trade-offs**. Não substituem decisão de produto ou arquitetura humana. Para tecnologia concreta, usar agents `stack-*` e `framework-*`.

## Legenda de estado

| Estado | Significado |
|--------|-------------|
| stable | Pronto para uso no dia a dia |
| experimental | Nicho ou maior variabilidade por projeto |

## Matriz (tema → arquivos)

| Onda | Tema | Agent | Skill | Rule | Estado |
|------|------|-------|-------|------|--------|
| 1 | Monólito clássico | `arch-monolito-guia.md` | `arch-monolito/` | `arch-monolito.mdc` | stable |
| 1 | Monólito modular | `arch-monolito-modular-guia.md` | `arch-monolito-modular/` | `arch-monolito-modular.mdc` | stable |
| 1 | Separação FE/BE | `arch-separacao-frontend-backend-guia.md` | `arch-separacao-frontend-backend/` | `arch-separacao-frontend-backend.mdc` | stable |
| 1 | Clean Architecture | `arch-clean-architecture-guia.md` | `arch-clean-architecture/` | `arch-clean-architecture.mdc` | stable |
| 1 | Hexagonal | `arch-hexagonal-guia.md` | `arch-hexagonal/` | `arch-hexagonal.mdc` | stable |
| 1 | MVC e padrões UI | `arch-mvc-e-padroes-ui-guia.md` | `arch-mvc-e-padroes-ui/` | `arch-mvc-e-padroes-ui.mdc` | stable |
| 2 | Microserviços | `arch-microservicos-guia.md` | `arch-microservicos/` | `arch-microservicos.mdc` | stable |
| 2 | Sistemas distribuídos | `arch-sistemas-distribuidos-guia.md` | `arch-sistemas-distribuidos/` | `arch-sistemas-distribuidos.mdc` | stable |
| 2 | Orientada a eventos | `arch-orientada-eventos-guia.md` | `arch-orientada-eventos/` | `arch-orientada-eventos.mdc` | stable |
| 2 | CQRS | `arch-cqrs-guia.md` | `arch-cqrs/` | `arch-cqrs.mdc` | stable |
| 2 | Sagas / orquestração | `arch-sagas-orquestracao-guia.md` | `arch-sagas-orquestracao/` | `arch-sagas-orquestracao.mdc` | stable |
| 3 | Mensageria | `arch-mensageria-guia.md` | `arch-mensageria/` | `arch-mensageria.mdc` | stable |
| 3 | Cache | `arch-cache-guia.md` | `arch-cache/` | `arch-cache.mdc` | stable |
| 3 | API Gateway | `arch-api-gateway-guia.md` | `arch-api-gateway/` | `arch-api-gateway.mdc` | stable |
| 3 | BFF | `arch-bff-guia.md` | `arch-bff/` | `arch-bff.mdc` | stable |
| 3 | Dados distribuídos | `arch-dados-distribuidos-guia.md` | `arch-dados-distribuidos/` | `arch-dados-distribuidos.mdc` | stable |
| 4 | Serverless / FaaS | `arch-serverless-guia.md` | `arch-serverless/` | `arch-serverless.mdc` | experimental |
| 4 | Service mesh | `arch-service-mesh-guia.md` | `arch-service-mesh/` | `arch-service-mesh.mdc` | experimental |
| 4 | Padrões de migração | `arch-padroes-migracao-guia.md` | `arch-padroes-migracao/` | `arch-padroes-migracao.mdc` | experimental |
| 4 | Arquitetura em células | `arch-arquitetura-celulas-guia.md` | `arch-arquitetura-celulas/` | `arch-arquitetura-celulas.mdc` | experimental |

## Governação

- Regra transversal: [`rules/00-sdd-governance.mdc`](../../rules/00-sdd-governance.mdc).
- Catálogo de frameworks (tecnologia): [catalogo-frameworks-ia.md](catalogo-frameworks-ia.md) (se existir no repo).

## Nota sobre rules

As `.mdc` usam glob `docs/**/*.md` para evitar colisão com regras por linguagem. Ajuste por repositório (ex.: ADRs noutra pasta) se necessário.
