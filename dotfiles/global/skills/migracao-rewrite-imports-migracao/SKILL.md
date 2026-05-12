---
name: migracao-rewrite-imports-migracao
description: Aplica regras de rewrite de imports a arquivos copiados do Template conforme docs/gestao-ideias/04-referencia-tecnica/referencia/migracao/premissa-migracao-template-oficial.md (no Template).
---

# Reescrever imports na migração

## Objetivo

Aplicar regras de import-rewrite a arquivos copiados do Template para o Frontend Oficial, apenas em casos especiais.

## Quando usar

- Após copiar arquivos na migração; quando import relativo quebrou ou quando for preciso apontar para app.

## Regras (premissa no Template)

- Não reescrever por padrão; baseline @/* para ./src/*.
- Reescrever somente imports relativos quebrados por realocação ou imports para app quando convenção diferente.

## Passos

1. Identificar arquivos copiados com imports.
2. Para cada import: verificar se quebrou ou precisa apontar para app.
3. Aplicar alteração mínima conforme premissa-migracao-template-oficial.md (Template).

## Resultado

Arquivos com imports corrigidos; lista do que foi alterado.

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

