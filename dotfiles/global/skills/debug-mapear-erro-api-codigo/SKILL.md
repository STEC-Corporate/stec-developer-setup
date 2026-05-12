---
name: debug-mapear-erro-api-codigo
description: Dado cenario de erro retornar codigo e estrutura de resposta conforme error-codes-reference.
---

# mapear-erro-api-codigo

## Documentos

Docs/error-codes-reference.md.

## Passos

1. Receber cenario (ex.: 400, 401, 404, 409).
2. Consultar error-codes-reference para codigo e estrutura de resposta.
3. Retornar codigo, message e formato esperado.

## Saida

Codigo de erro e estrutura de resposta conforme documentacao.

## Quando usar
- Use quando a tarefa estiver alinhada ao objetivo da skill.
- Use quando for necessario padrao tecnico e repetibilidade.

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

