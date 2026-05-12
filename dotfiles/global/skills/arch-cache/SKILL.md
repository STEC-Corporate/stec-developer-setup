---
name: arch-cache
description: Especialização em Cache — trade-offs e padrões. Usar com arch-cache-guia.
---

# Arquitetura: Cache

## Quando usar

- Decisões ou revisões de desenho alinhadas a este tema.
- Avaliação de PRs que alteram fronteiras entre módulos, serviços ou camadas.

## Foco

Cache-aside vs write-through; invalidação; consistência percebida; stampede.

## Relação com outros agents

- Implementação concreta: agents `stack-*` e `framework-*`.
- Documentação de produto: `docs/produto/fluxo/` e regras SDD.

## Agent

- **[arch-cache-guia](../../agents/arch-cache-guia.md)**
