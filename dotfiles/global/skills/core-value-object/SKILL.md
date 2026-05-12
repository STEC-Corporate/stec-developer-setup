---
name: core-value-object
description: Criar ou revisar Value Objects (DDD) imutaveis com validacao, igualdade por valor e testes unitarios. Use quando o pedido envolver \"value object\", \"VO\", tipos como Email, Money, CPF/CNPJ, ou quando houver primitivas vazando para o dominio
---

# core-value-object

## Quando usar
- Criar VO para encapsular validação e invariantes (ex.: `EmailVO`, `MoneyVO`).
- Substituir uso de `string/number` por tipos ricos no domínio.

## Passos
1. Definir regras de validação e representação interna.
2. Implementar criação via factory (`create`) com validação.
3. Implementar igualdade por valor (`equals`).
4. Escrever testes (válidos, inválidos, normalização).

## Saida
- VO imutável + testes unitários.

## References
- `references/pattern.md`
- `references/examples.md`

