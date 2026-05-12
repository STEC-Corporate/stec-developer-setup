---
name: stack-go-backend
description: Workflow de backend Go para APIs HTTP, modulos, testes, context e observabilidade. Usar ao criar ou alterar servicos .go ou dependencias Go.
---

# Stack - Backend Go

## Pre-requisitos

- Spec ou historia em `docs/produto/fluxo/` para mudancas de comportamento.

## Passos

1. Identificar o modulo, packages e contrato HTTP afetados.
2. Preferir `net/http` e biblioteca padrao quando suficientes; usar framework apenas com ganho claro.
3. Separar transporte, dominio e infra no nivel minimo necessario para o repositorio.
4. Garantir uso correto de `context.Context`, erros e logging.
5. Testes com `go test`, preferindo testes de tabela e mocks simples.

## Anti-padroes

- Interfaces criadas antes de haver variacao real.
- Estrutura de pastas enterprise para servicos pequenos.
- Uso de framework apenas por habito quando `net/http` resolveria.

## Relacao com outros guias

- Contratos partilhados: skill [stack-openapi-contracts](../stack-openapi-contracts/SKILL.md).
