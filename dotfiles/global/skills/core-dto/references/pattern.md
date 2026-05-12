# Pattern — DTOs (Application Boundary)

## Regras
- DTOs são **serializáveis** (sem métodos, sem dependências).
- DTOs não expõem entidades do domínio diretamente.
- DTOs de aplicação ≠ DTOs HTTP (presentation). HTTP pode ter validações adicionais.

## Estrutura recomendada
- `CreateXInputDto`
- `CreateXOutputDto`
- `XResponseDto` (se for usado como resposta HTTP)

## Erros
Preferir códigos estáveis (`user_not_found`, `email_invalid`) para facilitar mapeamento e i18n.

