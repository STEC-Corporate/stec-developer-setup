# Matriz de Equivalência — `projeto-ai` → AI-ProjectDeveloper (STEC)

Este documento mapeia as skills do `projeto-ai` (submódulo `.agents/skills`, padrão `agents/openai.yaml` + `SKILL.md`) para as **skills/agents Cursor** no AI-ProjectDeveloper.

## Premissas

- O AI-ProjectDeveloper é consumido como **submodule Git** montado em `.cursor/` nos projetos pai.
- As skills do AI-ProjectDeveloper seguem o padrão Cursor (`skills/{skill}/SKILL.md`) e o padrão STEC (`skills/skills-standards.md`).
- Onde o `projeto-ai` usa `agents/openai.yaml` com `default_prompt`, aqui usamos `SKILL.md` + `references/` + `scripts/` (quando aplicável).

## Equivalência por skill (fullstack)

| `projeto-ai` skill | Tipo | Intenção (resumo) | AI-ProjectDeveloper equivalente | Status no AI-ProjectDeveloper |
|---|---|---|---|---|
| `core-entity` | Core DDD | Criar entidades com invariantes, validação e testes | `skills/core-entity` + `skills/testes-*` | **A implementar** |
| `core-value-object` | Core DDD | Criar Value Objects imutáveis com validação | `skills/core-value-object` | **A implementar** |
| `core-dto` | Core DDD | Criar DTOs para use cases / fronteiras | `skills/core-dto` | **A implementar** |
| `core-repository` | Core DDD | Interfaces de repositório + implementação infra | `skills/core-repository` | **A implementar** |
| `core-use-case` | Core DDD | Use cases com `execute()` e Result | `skills/core-use-case` | **A implementar** |
| `core-domain-service` | Core DDD | Serviços de domínio (regras complexas) | `skills/core-domain-service` | **A implementar** |
| `core-query-cqrs` | Core DDD | Queries de leitura (CQRS) | `skills/core-query-cqrs` | **A implementar** |
| `backend-controller` | Backend | Controller Nest com DTO + Swagger | `skills/backend-controller` | **A implementar** |
| `backend-nest-guard` | Backend | Guards e roles | `skills/backend-nest-guard` | **A implementar** |
| `backend-prisma-data` | Backend | Prisma models, repos, sync | `skills/backend-prisma-data` | **A implementar** |
| `config-project` | Config | Bootstrap monorepo turbo (apps/pkgs) | `skills/config-project` | **A implementar** |
| `config-new-module` | Config | Criar módulo fullstack (pkg+backend+frontend) | `skills/config-new-module` | **A implementar** |
| `config-prisma` | Config | Setup Prisma (schema/migrate/seed) | `skills/config-prisma` | **A implementar** |
| `config-auth-*` | Config/Auth | Auth básica backend/core/web | `skills/config-auth-*` (opcional) | **Backlog** |
| `config-shared-core` | Config | Core shared | `skills/config-shared-core` (opcional) | **Backlog** |
| `config-shared-web` | Config | Web shared / shell | `skills/config-shared-web` (opcional) | **Backlog** |
| `frontend-form-schema` | Frontend | Form + schema + UX | `skills/frontend-form-schema` | **A implementar** |
| `openspec-explore` | OpenSpec | Explorar antes de implementar | `skills/openspec-explore` | **Implementado** |
| `openspec-propose` | OpenSpec | Proposta formal | `skills/openspec-propose` | **Implementado** |
| `openspec-apply-change` | OpenSpec | Aplicar mudança | `skills/openspec-apply` | **Implementado** |
| `openspec-archive-change` | OpenSpec | Arquivar mudança | `skills/openspec-archive` | **Implementado** |

## Notas de arquitetura (diferenças-chave)

- `projeto-ai` usa um padrão “OpenAI/Codex interface” (`agents/openai.yaml`) para dar *prompts* por skill.
- No Cursor, o equivalente é concentrar instrução no `SKILL.md` e anexos em `references/`, usando scripts geradores quando precisamos de scaffolding idempotente.
- No STEC, além disso, conectamos o fluxo ao **programa de qualidade** (gates + sentinelas) e ao ciclo **OpenSpec** para governança de mudanças.

