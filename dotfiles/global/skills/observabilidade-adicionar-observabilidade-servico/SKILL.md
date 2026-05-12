---
name: observabilidade-adicionar-observabilidade-servico
description: Adicionar metricas, tracing e SLO a servico ou endpoint conforme observability.md.
---

# adicionar-observabilidade-servico

## Documentos

Docs/observability.md, packages/common metrics tracing alerting.

## Passos

1. Identificar servico ou endpoint a instrumentar.
2. Adicionar BusinessMetricsService e decorators MonitorSLO conforme observability.md.
3. Expor endpoint /metrics se necessario. Manter labels e nomes compatíveis com Prometheus.
4. Nao alterar logica de negocio.

## Saida

Metricas de negocio e tecnicas. Tracing e SLO configurados.

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

