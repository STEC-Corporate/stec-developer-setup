---
name: cloud-aws-cicd-devops
description: CI/CD no provedor em AWS (CodePipeline, CodeBuild, CodeDeploy). Usar com cloud-aws-cicd-devops-guia.
---

# Skill: CI/CD no provedor (AWS)

## Quando usar

- Arquivos IaC e configuração que referenciem serviços **AWS** desta família.
- Revisão de PR focada em padrões do ecossistema AWS.

## Checklist

- [ ] Recursos na região correta e com etiquetas de custo/ambiente.
- [ ] Segredos via serviço gerido de secrets / KMS do provedor — não em texto claro.
- [ ] Princípio do menor privilégio em IAM/RBAC.

## Equivalência entre provedores (orientativa)

| Provedor | Serviços exemplificativos (equivalência orientativa) |
|----------|------------------------------------------------------|
| **AWS** | CodePipeline, CodeBuild, CodeDeploy |
| **GCP** | Cloud Build, Deploy (e integração GitHub Actions) |
| **Azure** | DevOps / GitHub Actions + Azure |
| **OCI** | DevOps / external CI para OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-aws-cicd-devops-guia](../../agents/cloud-aws-cicd-devops-guia.md)**
