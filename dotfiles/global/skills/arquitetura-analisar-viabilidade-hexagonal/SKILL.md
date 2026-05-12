---
name: arquitetura-analisar-viabilidade-hexagonal
description: Analisar codigo do microsservico para dependencias, acoplamento e candidatos a portas e adaptadores. Nao altera codigo.
---

# analisar-viabilidade-hexagonal

## Quando usar

Avaliacao de migracao para Hexagonal; identificar pontos de acoplamento; alimentar plano de migracao.

## Documentos

.cursorrules, estrutura apps/.

## Passos

1. Analisar dependencias do microsservico (imports, injecoes).
2. Mapear acoplamento a frameworks e detalhes (DB, HTTP).
3. Identificar candidatos a portas (interfaces de entrada/saida) e adaptadores (implementacoes).
4. Documentar achados; nao alterar codigo.

## Saida

Relatorio de analise: dependencias, acoplamento, candidatos a portas/adaptadores. Entrada para criar-plano-migracao-hexagonal.

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

