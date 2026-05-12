---
name: infra-deploy-infra-checklist
description: Guides step-by-step deploy based on manual-deploy-infraestrutura (order infra then backend then frontend, prerequisites). Use when planning or executing Modelo infrastructure or application deploy.
---

# Deploy Infra Checklist

## Order of execution

1. **Infrastructure** (modelo-infrastructure) — provision AWS + EKS + databases.
2. **Backend** (modelo-backend) — deploy microsserviços to EKS.
3. **Frontend** (modelo-frontend) — deploy app to EKS.
4. **Integration** — end-to-end checks and monitoring.

## Prerequisites (from GUIA_AMBIENTE_DEV)

- `terraform` >= 1.5.0
- `aws` CLI >= 2.0
- `kubectl` >= 1.28
- AWS credentials configured (`aws configure` or env vars)

## Infrastructure deploy (summary)

- `terraform init`
- Select/create workspace (e.g. `dev`)
- `terraform validate`
- `terraform plan -var-file=... -out=...`
- `terraform apply <planfile>`

## Reference

Full steps and details: [docs/manual-deploy-infraestrutura.md](../../docs/manual-deploy-infraestrutura.md), [docs/GUIA_AMBIENTE_DEV.md](../../docs/GUIA_AMBIENTE_DEV.md).

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
