---
name: workflow-ferramentas-ia
description: Usa o mesmo pacote de spec (Markdown/OpenSpec) em Cursor, Codex ou Claude sem duplicar agentes. Usar quando fores trocar de ferramenta ou padronizar prompts e entregáveis.
---

# Workflow — Ferramentas de IA (Cursor / Codex / Claude)

## Princípio

O **catálogo** (agents/skills/rules) vive no repositório **uma vez**. Cada ferramenta é um **executor**: mesma entrada (spec + contexto), mesmo contrato de saída acordado.

## Entrada comum

- Objetivo em 1 parágrafo.
- Ligação a **user story** ou ID de requisito.
- Arquivos ou pastas em anexo (`@` no Cursor, anexos no Claude, contexto no Codex).
- Restrições: stack, não fazer X, manter padrão Y.

## Saída comum (sugerida)

- Plano em passos **ou** diff unificado por arquivo.
- Lista de **arquivos tocados**.
- **Riscos** e **testes** a correr.
- Se faltar spec: **bloquear** e pedir doc em `docs/produto/fluxo/` antes de código amplo.

## Diferenças operacionais

| Aspeto | Cursor | Codex / extensões | Claude (web/API) |
|--------|--------|---------------------|------------------|
| Contexto | @files, codebase | Repositório / seleção | Anexos / projeto zip |
| Planos | `plans/*.plan.md` | Checklist no chat | Mesmo Markdown exportado |
| Automação | Rules + skills locais | Scripts / CI | Colar skill em system |

## Quando invocar

- Onboarding de colega numa stack nova.
- Evitar drift entre o que foi decidido no Cursor e o que outro modelo gera noutro canal.
