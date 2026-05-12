---
name: testes-executar-testes
description: Executar suite de testes do BFF de forma padronizada (unit, integration, e2e).
---

## Objetivo

Executar os testes do BFF SoundLink de forma controlada e repetível. Os scripts desta skill localizam o root do projeto (onde está o package.json) e garantem dependências instaladas antes de rodar os testes.

## Quando usar

- Use esta skill quando precisar rodar testes (unit, integration, e2e ou todos).
- Use quando quiser garantir dependências instaladas antes de testar.
- Use para obter resultado padronizado (passou/falhou) e relato de erros.

## Scripts (relativos à raiz da skill)

Execute a partir do **root do repositório BFF** (diretório que contém `package.json`). Caminhos abaixo são relativos à pasta da skill.

- **Garantir dependências:** `scripts/ensure-deps.sh` — verifica `node_modules` e roda `npm ci` se necessário.
- **Unit:** `scripts/run-unit.sh` — roda `npm test`; chama ensure-deps se faltar node_modules.
- **Integration:** `scripts/run-integration.sh` — roda `npm run test:integration`.
- **E2E:** `scripts/run-e2e.sh` — roda `npm run test:e2e`.
- **Todos:** `scripts/run-all.sh` — roda `npm run test:all` (unit + integration + e2e).
- **Coverage:** `scripts/run-coverage.sh` — roda `npm run test:cov`; relatório em `coverage/`.

Exemplo a partir do root do projeto:
`./.cursor/skills/testes-executar-testes/scripts/run-unit.sh`

## Passos (quando não usar os scripts)

1. Confirmar que as dependências estão instaladas (`npm ci` ou `npm install`), ou rodar `scripts/ensure-deps.sh`.
2. Executar o tipo de teste solicitado (unit, integration, e2e ou todos) via script correspondente ou npm.
3. Reportar resultado: passou/falhou; se falhou, resumir erros e arquivos envolvidos.
4. Não alterar código nesta skill; apenas executar e reportar.

## Comandos npm equivalentes

- **Unit:** `npm test` (ou `npm run test:cov` para coverage).
- **Integration:** `npm run test:integration`.
- **E2E:** `npm run test:e2e`.
- **Todos:** `npm run test:all`.
- **Coverage:** `npm run test:cov`.

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

