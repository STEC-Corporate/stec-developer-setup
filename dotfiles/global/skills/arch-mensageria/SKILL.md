---
name: arch-mensageria
description: Especialização em Mensageria — trade-offs e padrões. Usar com arch-mensageria-guia.
---

# Arquitetura: Mensageria

## Quando usar

- Decisões ou revisões de desenho alinhadas a este tema.
- Avaliação de PRs que alteram fronteiras entre módulos, serviços ou camadas.

## Foco

Semântica de fila; poison messages; particionamento; back-pressure.

## Relação com outros agents

- Implementação concreta: agents `stack-*` e `framework-*`.
- Documentação de produto: `docs/produto/fluxo/` e regras SDD.

## Agent

- **[arch-mensageria-guia](../../agents/arch-mensageria-guia.md)**
