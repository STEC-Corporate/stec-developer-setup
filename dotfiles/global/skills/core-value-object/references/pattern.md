# Pattern — Value Object (DDD)

## Regras
- **Imutável**: sem setters; estado definido na criação.
- **Validação na borda**: `create()` valida e normaliza.
- **Igualdade por valor**: `equals()` compara valores normalizados.
- **Sem identidade**: VO não tem `id`.

## Normalização
Exemplos:
- Email: trim + lower-case
- Documento: remover máscara

## Testes mínimos
- Caso válido
- Cada regra inválida
- Normalização aplicada
- Igualdade por valor

