---
name: cloud-architecture-discover
description: Inventário de serviços cloud a partir de IaC e código. Usar com o agent cloud-architecture-discover-guia.
---

# Skill: Descoberta de arquitetura cloud

## Quando usar

- Pastas com `*.tf`, `*.tfvars`, `template.yaml`, `*.bicep`, `azuredeploy.json`, `Pulumi.yaml`.
- `kubernetes/`, `helm/`, `kustomization.yaml`, `docker-compose*.yml`.

## Passos

1. Identificar **provedor** por provider block Terraform ou recursos nomeados.
2. Agrupar por **família** (compute, storage, rede, dados, identidade, mensagens, observabilidade).
3. Marcar confiança e lacunas.

## Checklist rápido

- [ ] IaC cobre rede e dados ou só aplicação?
- [ ] Segredos referenciados via vault/KMS/Parameter Store — não valores em claro?
- [ ] Ambiente (`dev`/`stg`/`prd`) identificável por tags ou naming?

## Agente

- **[cloud-architecture-discover-guia](../../agents/cloud-architecture-discover-guia.md)**
