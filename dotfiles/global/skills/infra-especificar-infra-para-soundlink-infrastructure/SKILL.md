---
name: infra-especificar-infra-para-soundlink-infrastructure
description: Gerar especificacao ou modulos Terraform para o repo soundlink-infrastructure com ECS Fargate.
---

# especificar-infra-para-soundlink-infrastructure

## Quando usar

Implementar infra no repo soundlink-infrastructure; adicionar recurso AWS; IaC com Terraform.

## Documentos

Mapeamento de S25 (mapear-infra-aws-por-servico), path soundlink-infrastructure /home/jesus/Projetos/soundlink-infrastructure.

## Passos

1. Usar mapeamento de recursos (S25) como entrada.
2. Gerar especificacao ou modulos Terraform para soundlink-infrastructure.
3. Compute: ECS Fargate para containers dos microsservicos; state remoto S3 + DynamoDB quando aplicavel.
4. Manter consistencia com Docs/infraestrutura-aws.md do soundlink-api.

## Saida

Especificacao ou codigo Terraform para soundlink-infrastructure. Nao alterar codigo de aplicacao em soundlink-api.

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

