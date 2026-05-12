---
name: core-dto
description: Criar ou revisar DTOs de aplicacao (entrada e saida) para use cases, garantindo separacao entre dominio e bordas (HTTP/infra). Use quando o pedido envolver \"DTO\", contratos de entrada/saida, validacao e mapeamento de erros
---

# core-dto

## Quando usar
- Definir contrato de entrada/saída de um use case.
- Padronizar DTOs entre camadas (application vs presentation).

## Passos
1. Definir `InputDto` e `OutputDto` do use case (tipos serializáveis).
2. Mapear VO/Entity ↔ DTO (funções puras).
3. Definir estratégia de erro (Result/erro tipado) e códigos estáveis.
4. Testar mapeamentos e edge cases.

## Saida
- DTOs consistentes e mapeamentos claros.

## References
- `references/pattern.md`
- `references/examples.md`

