---
name: stack-rust-backend
description: Workflow de backend Rust para servicos HTTP, modulos, async, erros e testes. Usar ao criar ou alterar servicos .rs ou dependencias Rust.
---

# Stack - Backend Rust

## Pre-requisitos

- Spec ou historia em `docs/produto/fluxo/` para mudancas de comportamento.

## Passos

1. Identificar crate, modulos e contrato HTTP afetados.
2. Preferir tipos explicitos, tratamento de erro claro e runtime async apenas quando necessario.
3. Separar transporte, dominio e infra no nivel minimo necessario para o repositorio.
4. Modelar erros e estado compartilhado com clareza antes de extrair abstractions.
5. Testes com `cargo test`, priorizando unidade e integracao conforme risco.

## Anti-padroes

- Uso excessivo de macros ou generics sem ganho concreto.
- Multiplicacao prematura de crates e modulos.
- Introduzir async em todo o sistema sem necessidade real.

## Relacao com outros guias

- Contratos partilhados: skill [stack-openapi-contracts](../stack-openapi-contracts/SKILL.md).
