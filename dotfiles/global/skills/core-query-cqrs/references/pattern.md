# Pattern — CQRS Query

## Regras
- Query é para **leitura**: não altera estado.
- Retorno otimizado para a UI/consumidor (read model), não necessariamente entidade de domínio.
- Paginação e ordenação determinística.

## Testes mínimos
- Filtro por campo
- Paginação (limit/offset ou cursor)
- Ordenação

