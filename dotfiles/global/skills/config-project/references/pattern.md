# Pattern — Project Bootstrap (Monorepo)

## Objetivo
Criar estrutura mínima repetível para projetos fullstack da holding.

## Estrutura mínima
- `apps/backend`
- `apps/web`
- `packages/shared`
- `turbo.json` com pipeline base

## Idempotência
Scripts devem:
- Criar diretórios faltantes
- Não sobrescrever arquivos existentes (a menos que explicitamente pedido)
- Ter modo `--dry-run`

