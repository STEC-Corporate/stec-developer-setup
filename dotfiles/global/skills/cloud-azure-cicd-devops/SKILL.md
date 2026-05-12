---
name: cloud-azure-cicd-devops
description: CI/CD no provedor em Azure (CodePipeline, CodeBuild, CodeDeploy). Usar com cloud-azure-cicd-devops-guia.
---

# Skill: CI/CD no provedor (Azure)

## Quando usar

- Arquivos IaC e configuração que referenciem serviços **Azure** desta família.
- Revisão de PR focada em padrões do ecossistema Azure.

## Checklist

- [ ] Recursos na região correta e com etiquetas de custo/ambiente.
- [ ] Segredos via serviço gerido de secrets / KMS do provedor — não em texto claro.
- [ ] Princípio do menor privilégio em IAM/RBAC.

## Equivalência entre provedores (orientativa)

| Provedor | Serviços exemplificativos (equivalência orientativa) |
|----------|------------------------------------------------------|
| **Azure** | DevOps / GitHub Actions + Azure |
| **AWS** | CodePipeline, CodeBuild, CodeDeploy |
| **GCP** | Cloud Build, Deploy (e integração GitHub Actions) |
| **OCI** | DevOps / external CI para OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-azure-cicd-devops-guia](../../agents/cloud-azure-cicd-devops-guia.md)**
