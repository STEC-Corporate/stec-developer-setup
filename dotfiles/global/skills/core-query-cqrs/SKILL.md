---
name: core-query-cqrs
description: Criar queries de leitura (CQRS) separadas dos use cases de escrita, com contratos, filtros, paginacao e testes. Use quando o pedido envolver \"query\", \"listagem\", \"read model\", performance de leitura, ou separacao leitura/escrita
---

# core-query-cqrs

## Quando usar
- Criar listagens/consultas com filtros e paginação.
- Separar leitura (query) de escrita (use case).

## Passos
1. Definir contrato `Query<Input, Output>` (se aplicável no projeto alvo).
2. Definir filtros/paginação e índices necessários.
3. Implementar query em camada apropriada (geralmente infra/read-model) sem vazar para domínio.
4. Escrever testes (filtros, paginação, ordenação).

## Saida
- Query de leitura documentada e testada.

## References
- `references/pattern.md`
- `references/examples.md`

