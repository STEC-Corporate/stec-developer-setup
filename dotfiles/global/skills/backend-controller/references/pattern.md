# Pattern — NestJS Controller

## Regras
- Controller não contém regra de negócio.
- Validação de entrada via DTO + `class-validator`.
- Use case retorna Result/erro tipado; controller mapeia para HTTP.
- Swagger obrigatório.

