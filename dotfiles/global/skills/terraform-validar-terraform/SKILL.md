---
name: terraform-validar-terraform
description: Runs terraform fmt and validate and guides use of tflint/terrascan for Terraform code. Use when editing .tf files or creating Terraform modules in modelo-infrastructure.
---

# Validate Terraform

## Quick start

When editing Terraform (`.tf`) or creating modules:

1. **Format:** Run `terraform fmt -recursive` from repo root (or the module directory).
2. **Validate:** Run `terraform validate` (after `terraform init` if needed).
3. **Lint (optional):** If tflint is available, run in module dir; follow project rules for Terraform style and AWS best practices.
4. **Security (optional):** Use terrascan or similar for security checks when the project uses it.

## Checklist

- [ ] No hardcoded values; use variables.
- [ ] Variables have type and validation where appropriate.
- [ ] Outputs are documented.
- [ ] Tags follow convention `modelo-{environment}-{service}-{resource}`.

## References

- Project root: `.cursorrules` (Terraform section)
- Modules: `modules/`

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
