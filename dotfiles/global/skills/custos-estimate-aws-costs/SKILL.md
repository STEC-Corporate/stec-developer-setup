---
name: custos-estimate-aws-costs
description: Uses project estimation docs (estimativa-custo-operacao, GUIA_AMBIENTE_DEV) to guide AWS costs per environment and resource sizing. Use when sizing resources or explaining costs for Modelo infrastructure.
---

# Estimate AWS Costs

## Sources

- **Full operation estimate:** [docs/estimativa-custo-operacao.md](../../docs/estimativa-custo-operacao.md)
- **Dev environment:** [docs/GUIA_AMBIENTE_DEV.md](../../docs/GUIA_AMBIENTE_DEV.md) (section "Estimativa de Custos")

Use these documents to:

1. Quote approximate monthly/daily costs per environment (dev, staging, prod).
2. Explain main cost drivers (EKS control plane, EC2/NAT, DocumentDB, EBS, ECR, CloudWatch).
3. Suggest cost-reduction strategies (SPOT, auto-shutdown, lower retention) when the user asks for optimization.

## When answering

- Prefer numbers and tables from the docs; if extrapolating, state assumptions.
- For dev, reference the "TOTAL ESTIMADO" and "Estratégias para Redução de Custos" in GUIA_AMBIENTE_DEV.

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
