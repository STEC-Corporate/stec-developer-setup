---
name: testes-verificar-cobertura-microsservico
description: Listar arquivos sem testes ou com cobertura baixa e sugerir casos prioritarios.
---

# verificar-cobertura-microsservico

## Quando usar

Auditoria de cobertura; priorizar testes; cumprir minimo do plano-testes.

## Documentos

Docs/plano-testes.md.

## Passos

1. Identificar microsservico em apps/.
2. Listar arquivos de logica e verificar existencia de testes.
3. Se houver relatorio de cobertura, listar arquivos abaixo do minimo.
4. Sugerir casos de teste prioritarios.

## Saida

Lista de arquivos sem testes ou com cobertura insuficiente. Sugestoes de casos prioritarios.

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

