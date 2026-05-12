# Pattern — Core Entity (DDD)

## O que é uma entidade

Entidade é um objeto com **identidade estável** ao longo do tempo. Ela encapsula **estado** e **comportamento** relevantes para o domínio.

## Regras

- Identidade obrigatória (ex.: `id`).
- Invariantes devem estar **dentro** da entidade (ou em VOs e serviços de domínio), não no controller.
- Evitar domínio anêmico: entidade com apenas props + getters/setters.
- Preferir métodos com intenção (`ativate()`, `changeEmail()`) ao invés de `setX()`.

## Factory e validação

Padrões aceitos:
- `static create(input): Result<Entity>` (falhas tipadas)
- `static tryCreate(input): Entity` (lança erro tipado) — apenas se o projeto padronizar exceções

## Testes mínimos

- Criação com input válido
- Falha por invariantes (cada invariável relevante)
- Transição de estado (métodos) + invariantes preservadas

