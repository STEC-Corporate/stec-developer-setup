---
name: infra-aplicar-infra-tagging
description: Applies the Modelo tagging convention modelo-{env}-{service}-{resource} to Terraform and AWS resources. Use when creating or changing Terraform/AWS resources in modelo-infrastructure.
---

# Apply Infra Tagging

## Convention

All taggable resources should use consistent tags. Standard pattern:

- **AWS resources:** `modelo-{environment}-{service}-{resource}`
- **Tags comuns:** `Environment`, `Project` (e.g. Modelo), `ManagedBy` (Terraform), and service-specific names.

## In Terraform

```hcl
tags = {
  Environment = var.environment
  Project     = "Modelo"
  ManagedBy   = "Terraform"
  Name        = "modelo-${var.environment}-${var.service_name}-<resource-type>"
}
```

Use variables for environment and service; avoid hardcoding. Apply to all resources that support tags (EC2, EKS, RDS, S3, etc.).

## References

- `.cursorrules` (Convenções de Nomenclatura)
- [docs/project-structure.md](../../docs/project-structure.md)

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
