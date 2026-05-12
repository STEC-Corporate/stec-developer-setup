# Pattern — New Module (Fullstack)

## Objetivo
Padronizar o “mínimo útil” de um módulo:
- Package compartilhado (`packages/{module}`)
- Backend módulo (`apps/backend/src/modules/{module}`)
- Frontend módulo/rota (`apps/web/src/modules/{module}`)

## Regras
- Script deve ser idempotente (não sobrescreve arquivos existentes).
- Deve suportar `--dry-run`.
- Não impor UI/DB específicos; gerar placeholders.

