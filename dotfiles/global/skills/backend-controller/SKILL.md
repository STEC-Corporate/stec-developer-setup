---
name: backend-controller
description: Criar controllers NestJS alinhados a Clean Architecture (DTOs, validacao, Swagger) delegando a use cases e evitando logica de negocio no controller. Use quando o pedido envolver \"controller\", \"endpoint\", \"NestJS controller\" ou exposicao HTTP de um use case
---

# backend-controller

## Quando usar
- Criar endpoint HTTP para um use case existente.
- Padronizar DTOs HTTP e Swagger.

## Passos
1. Definir rota e método HTTP (REST).
2. Criar DTOs HTTP (request/response) com validação (`class-validator`).
3. Controller chama o use case (application) e mapeia erro para HTTP.
4. Adicionar Swagger (`@ApiTags`, `@ApiOperation`, `@ApiResponse`).
5. Testar (unit do controller ou e2e conforme stack).

## Scripts
- `scripts/generate-controller.mjs` (gerador base; ajustar templates do projeto pai)

## References
- `references/pattern.md`
- `references/examples.md`

