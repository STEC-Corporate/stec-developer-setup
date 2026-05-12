---
name: arquitetura-avaliar-ddd-contexto
description: Avaliar se um bounded context (microsservico/modulo) se beneficiaria de DDD (agregados, entities, value objects) e propor modelo de dominio alinhado a Clean Architecture.
---

# avaliar-ddd-contexto

## Quando usar

Dominio rico (ex.: contratos, pagamentos, booking); duvida sobre agregados e value objects; alinhar DDD ao Domain Layer existente.

## Documentos

.cursorrules (Domain Layer = nucleo; entities, value objects, repository interfaces).

## Passos

1. Identificar bounded context (microsservico ou modulo).
2. Avaliar riqueza do dominio: entidades com identidade, regras de negocio, invariantes.
3. Sugerir agregados, entities e value objects onde fizer sentido; manter Domain Layer como nucleo (sem dependencia de framework).
4. Propor modelo alinhado a Clean Architecture; DDD como opcao, nao reescrita total.

## Saida

Avaliacao (beneficio ou nao de DDD) e proposta de modelo (agregados, entities, value objects) com localizacao nas pastas existentes.

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

