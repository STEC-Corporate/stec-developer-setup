---
name: core-entity
description: Criar ou revisar entidades de dominio (DDD) com invariantes, validacao, metodos de comportamento e testes unitarios. Use quando o pedido envolver \"entidade\", \"Entity\", identidade, regras de negocio centrais, ou quando houver dominio anemico a corrigir
---

# core-entity

## Quando usar

- Criar uma nova entidade de domínio (com identidade e invariantes).
- Revisar entidade existente (detectar domínio anêmico, invariantes fora do domínio).
- Padronizar criação/atualização via factories e validações.

## Documentos

- `skills/skills-standards.md`
- `rules/clean-architecture-guardrails.mdc`

## Passos

1. Definir a **identidade** (ex.: `id`) e invariantes principais.
2. Definir o modelo e comportamento (métodos) — evitar getters/setters vazios.
3. Implementar factory (`create`/`tryCreate`) para validação de invariantes.
4. Definir erros de domínio (tipos) e retornos consistentes (`Result<T>` se aplicável no projeto alvo).
5. Escrever testes unitários: cenário feliz, validações, invariantes, transições de estado.

## Saida

- Entidade criada/revisada com invariantes encapsuladas.
- Testes unitários cobrindo sucesso e falhas.

## References

- Consultar `references/pattern.md` e `references/examples.md`.

