---
name: core-use-case
description: Criar ou revisar casos de uso (application services) no padrao DDD/Clean Architecture, com orquestracao de dependencias, validacao, retorno consistente e testes. Use quando o pedido envolver \"use case\", \"caso de uso\", orquestracao de fluxo, ou regras de aplicacao
---

# core-use-case

## Quando usar
- Criar um novo caso de uso (ex.: `CreateUserUseCase`).
- Refatorar lógica de aplicação fora do domínio/infra.

## Passos
1. Definir `InputDto` e `OutputDto` (ver `core-dto`).
2. Definir dependências por interfaces (repos, queries, providers).
3. Implementar `execute(input)` com validações e early return em falhas.
4. Delegar invariantes para VOs/Entidades/Domain Services.
5. Escrever testes (feliz, validações, falha de dependência).

## Saida
- Use case implementado e testado.

## References
- `references/pattern.md`
- `references/examples.md`

