---
name: core-repository
description: Criar interfaces e implementacoes de repositorios alinhadas a DDD e Clean Architecture (interfaces no dominio, implementacoes na infraestrutura), com contratos, mapeamento e testes. Use quando o pedido envolver \"repository\", persistencia, Prisma/ORM, ou quando infra estiver vazando para o dominio
---

# core-repository

## Quando usar
- Criar contrato de repositório para entidades/agregados.
- Implementar repositório com Prisma/ORM sem violar dependências.

## Passos
1. Definir interface no domínio (ex.: `IUserRepository`).
2. Definir métodos: `getById`, `findByEmail`, `save`, `delete`, etc.
3. Implementar em infraestrutura (ex.: `PrismaUserRepository`) e mapear `record ↔ entity`.
4. Testar comportamento com mocks/integração conforme padrão do projeto alvo.

## Saida
- Interface + implementação + mapeamentos documentados.

## References
- `references/pattern.md`
- `references/examples.md`

