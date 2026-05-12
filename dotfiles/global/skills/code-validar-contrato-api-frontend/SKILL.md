---
name: code-validar-contrato-api-frontend
description: Comparar contrato atual de endpoint com CONSOLIDADO e listar divergencias.
---

# validar-contrato-api-frontend

## Quando usar

Revisao de alinhamento API vs frontend. Apos alterar endpoint.

## Documentos

Docs/CONSOLIDADO_FUNCIONALIDADES_FRONTEND.md, Docs/error-codes-reference.md.

## Passos

1. Identificar endpoint.
2. Localizar no CONSOLIDADO a secao que consome esse endpoint.
3. Comparar body, query, tipos, codigos de erro e estrutura de resposta.
4. Listar divergencias com sugestao de ajuste.

## Saida

Lista de divergencias. Conformidade ou nao com CONSOLIDADO e error-codes-reference.

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

