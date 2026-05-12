---
name: terraform-criar-terraform-module
description: Structures a new Terraform module with main.tf, variables.tf, outputs.tf and project conventions. Use when creating a new module under modules/ in modelo-infrastructure.
---

# Create Terraform Module

## Structure

Create under `modules/<module-name>/`:

```
modules/<module-name>/
├── main.tf      # Resources
├── variables.tf # Input variables with type and description
├── outputs.tf   # Output values
└── (optional)   # manifests/, templates/, values/ as needed
```

## Conventions

- **variables.tf:** Use `variable` blocks with `type`, `description`; add `validation` blocks where it helps.
- **outputs.tf:** Document each output; expose only what callers need.
- **main.tf:** Use `terraform { required_providers }` if the module pins providers; no backend in modules.
- **Naming:** Align with existing modules (e.g. network, eks, auth-service). Use tags via variables (Environment, Project, ManagedBy).

## Example (minimal)

```hcl
# variables.tf
variable "environment" { type = string }
variable "name_prefix" { type = string }

# main.tf
resource "aws_example" "this" {
  tags = {
    Environment = var.environment
    Project     = "Modelo"
    ManagedBy   = "Terraform"
  }
}

# outputs.tf
output "id" { value = aws_example.this.id }
```

## References

- Existing modules: `modules/`
- `.cursorrules` (Terraform section)

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
