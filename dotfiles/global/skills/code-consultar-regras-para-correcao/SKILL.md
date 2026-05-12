---
name: code-consultar-regras-para-correcao
description: Mapeia tipo de falha (type-check, lint, audit, unit, e2e) para documentos e seções a consultar e checklist resumido. Use pelo agent testes-guia-falha ou outro fluxo que precise orientar correção.
---

# Consultar regras para correção

## Quando usar

- Quando o agent **testes-guia-falha** (ou outro fluxo) precisar saber quais regras e documentos consultar para um dado tipo de falha de testes/validação.

## Entrada

- **Tipo de falha:** `type-check` | `lint` | `audit` | `unit` | `e2e`
- **Opcional:** uma linha ou resumo muito curto do erro (para refinar seções)

## Passos

1. Para o tipo informado, listar **documentos e seções obrigatórias**:
   - **type-check:** `.cursor/rules/frontend-code-patterns.mdc` (TypeScript Strict), `docs/dev/BASE-CONHECIMENTO-ERROS.md`, agent/skill typescript-estrito (SOLID, import type, exactOptionalPropertyTypes, verbatimModuleSyntax).
   - **lint:** `.cursor/rules/frontend-code-patterns.mdc` (Imports, Nomenclatura), `.cursor/rules/frontend-tailwind-ui.mdc` (Tailwind), `.cursor/rules/guardrails.md` quando houver dúvida de arquitetura ou regras de negócio.
   - **audit:** `.cursor/rules/frontend-code-patterns.mdc` (Segurança e Autenticação), `.cursor/rules/guardrails.md` se aplicável.
   - **unit / e2e:** `.cursor/skills/testes-frontend-conventions/SKILL.md` (Jest, RTL, Playwright, Test Doubles), `.cursor/rules/frontend-clean-architecture.mdc` (estrutura por feature); skills validate-clean-architecture e validate-guardrails quando a falha puder ser estrutural.
2. Devolver **checklist resumido** de regras que costumam se aplicar, por tipo:
   - **type-check:** exactOptionalPropertyTypes, verbatimModuleSyntax, `import type`, sem `any`, tipos opcionais vs undefined, SOLID.
   - **lint:** ordem de classes Tailwind, convenções de nomenclatura, imports, max-warnings 0.
   - **audit:** dependências vulneráveis, audit-level moderate.
   - **unit/e2e:** role-based locators, web-first assertions, coverage thresholds, Test Doubles.
3. **Resultado:** lista de paths/seções + checklist; não substitui o diagnóstico do agent, apenas orienta a consulta.

## Regras

- Somente leitura; não alterar código nem executar comandos.

## Pre-condicoes
- Escopo e contexto da tarefa definidos.
- Arquivos-alvo identificados.
- Criterios de aceite minimos estabelecidos.

## Checklist de saida
- Resultado entregue e verificavel.
- Evidencias objetivas registradas.
- Riscos e proximos passos documentados.

## Cobertura de stack e dominio
- Stacks suportadas: Java, Kotlin, Python, TypeScript, React, React Native, NextJS, NestJS.
- Dominios: backend, frontend e mobile.

