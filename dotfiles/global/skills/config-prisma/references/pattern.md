# Pattern — Prisma Setup

## Objetivo
Padronizar a configuração mínima de Prisma no backend de forma **idempotente**.

## Itens mínimos
- `prisma/schema.prisma`
- `.env.example` com `DATABASE_URL`
- scripts no `package.json` do backend para `prisma:generate`, `migrate`, `seed` (no projeto pai)

