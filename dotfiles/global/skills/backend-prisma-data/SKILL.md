---
name: backend-prisma-data
description: Modelar e manter dados no Prisma (schema, migrations, seeds) e padronizar repositorios Prisma sem vazar ORM para o dominio. Use quando o pedido envolver \"prisma\", \"schema.prisma\", migrations, seeds, ou repositorios baseados em prisma
---

# backend-prisma-data

## Quando usar
- Criar/alterar `schema.prisma` e migrations.
- Criar repositórios Prisma que implementam interfaces do domínio.

## Passos
1. Definir model Prisma alinhado ao domínio (nomes, constraints, índices).
2. Criar migration (no projeto pai) e validar.
3. Implementar repositório Prisma mapeando Record ↔ Entity/VO.
4. Seed idempotente quando necessário.

## References
- `references/pattern.md`
- `references/examples.md`

