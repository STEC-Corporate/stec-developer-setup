# Pattern — Domain Service

## Quando usar
- A regra não pertence claramente a uma entidade específica.
- A regra combina múltiplas entidades/VOs.

## Regras
- Sem dependências de infra (HTTP/DB).
- Preferir funções puras quando possível.
- Se precisar de dependência (ex.: clock), injetar via interface definida no domínio.

