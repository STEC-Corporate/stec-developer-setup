---
name: infra-mapear-infra-aws-por-servico
description: Produzir mapa de recursos AWS por microsservico e compartilhados para soundlink-api.
---

# mapear-infra-aws-por-servico

## Quando usar

Planejamento de deploy em AWS; onboarding de novo recurso; documentar infra necessaria.

## Documentos

Docs/microsservicos.md, Docs/observability.md, Docs/plano-seguranca.md.

## Passos

1. Listar 17 microsservicos e dependencias (MongoDB, Redis, Stripe, etc.).
2. Mapear por servico e compartilhados: VPC, compute (ECS Fargate), DB, cache, filas, S3, Secrets Manager, IAM.
3. Considerar observabilidade (Prometheus, Grafana, tracing) e requisitos de rede/seguranca.
4. Produzir output em Docs/infraestrutura-aws.md ou equivalente.

## Saida

Documento de mapeamento de infra AWS. Referencia ao repo soundlink-infrastructure para IaC com Terraform.

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

