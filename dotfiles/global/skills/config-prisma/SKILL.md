---
name: config-prisma
description: Inicializar e reconciliar Prisma no backend (schema, env example, generate, migrate, seed) com comandos idempotentes. Use quando o pedido envolver \"setup prisma\", \"init prisma\", migrations, seeds, ou criacao de modelo no banco
---

# config-prisma

## Quando usar
- Primeira configuração do Prisma em um backend.
- Padronizar scripts e arquivos de ambiente (`.env.example`).

## Passos
1. Rodar o script `scripts/init-prisma-backend.mjs` no projeto pai.
2. Validar se `schema.prisma` foi criado/atualizado e se `prisma generate` funciona.
3. Criar migration inicial (no projeto pai) e rodar seed se aplicável.

## Scripts
- `scripts/init-prisma-backend.mjs` (gera estrutura base; suporta `--dry-run`)

## References
- `references/pattern.md`
- `references/examples.md`

