---
name: debug-buscar-kb-por-erro
description: Buscar na base de conhecimento por mensagem ou stack e sugerir solucao.
---

# buscar-kb-por-erro

## Documentos

docs/knowledge-base/, Docs/error-codes-reference.md.

## Passos

1. Receber mensagem de erro ou stack trace.
2. Buscar em docs/knowledge-base/ entradas que coincidam ou sejam similares.
3. Retornar entradas encontradas com descricao, motivo e solucao.
4. Se houver codigo na error-codes-reference, cruzar e sugerir.

## Saida

Entradas da KB relevantes. Sugestao de solucao quando houver match.

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

