---
name: cloud-gcp-cicd-devops
description: CI/CD no provedor em GCP (CodePipeline, CodeBuild, CodeDeploy). Usar com cloud-gcp-cicd-devops-guia.
---

# Skill: CI/CD no provedor (GCP)

## Quando usar

- Arquivos IaC e configuração que referenciem serviços **GCP** desta família.
- Revisão de PR focada em padrões do ecossistema GCP.

## Checklist

- [ ] Recursos na região correta e com etiquetas de custo/ambiente.
- [ ] Segredos via serviço gerido de secrets / KMS do provedor — não em texto claro.
- [ ] Princípio do menor privilégio em IAM/RBAC.

## Equivalência entre provedores (orientativa)

| Provedor | Serviços exemplificativos (equivalência orientativa) |
|----------|------------------------------------------------------|
| **GCP** | Cloud Build, Deploy (e integração GitHub Actions) |
| **AWS** | CodePipeline, CodeBuild, CodeDeploy |
| **Azure** | DevOps / GitHub Actions + Azure |
| **OCI** | DevOps / external CI para OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-gcp-cicd-devops-guia](../../agents/cloud-gcp-cicd-devops-guia.md)**
