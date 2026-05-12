# Pattern — NestJS Auth Guards

## Regras
- Separar autenticação (JWT) de autorização (roles).
- Decorator `@Roles(...)` para declarar permissões.
- Guard de roles lê metadata via Reflector.

