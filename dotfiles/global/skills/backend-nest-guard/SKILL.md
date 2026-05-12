---
name: backend-nest-guard
description: Criar e padronizar guards de autenticacao/autorizacao no NestJS (JWT, roles) com decorators e testes basicos. Use quando o pedido envolver \"guard\", \"roles\", \"jwt\", protecao de endpoint ou RBAC
---

# backend-nest-guard

## Quando usar
- Proteger endpoints com JWT.
- Implementar roles (`ADMIN`, `USER`) e guard de autorização.

## Passos
1. Definir modelo de roles (enum) e decorator `@Roles(...)`.
2. Implementar `RolesGuard` e combinar com `JwtAuthGuard`.
3. Aplicar em controllers com `@UseGuards(...)`.
4. Documentar no Swagger quando endpoint requer auth.

## References
- `references/pattern.md`
- `references/examples.md`

