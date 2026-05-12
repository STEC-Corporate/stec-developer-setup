---
name: cloud-oci-cicd-devops
description: CI/CD no provedor em OCI (CodePipeline, CodeBuild, CodeDeploy). Usar com cloud-oci-cicd-devops-guia.
---

# Skill: CI/CD no provedor (OCI)

## Quando usar

- Arquivos IaC e configuração que referenciem serviços **OCI** desta família.
- Revisão de PR focada em padrões do ecossistema OCI.

## Checklist

- [ ] Recursos na região correta e com etiquetas de custo/ambiente.
- [ ] Segredos via serviço gerido de secrets / KMS do provedor — não em texto claro.
- [ ] Princípio do menor privilégio em IAM/RBAC.

## Equivalência entre provedores (orientativa)

| Provedor | Serviços exemplificativos (equivalência orientativa) |
|----------|------------------------------------------------------|
| **OCI** | DevOps / external CI para OCI |
| **AWS** | CodePipeline, CodeBuild, CodeDeploy |
| **GCP** | Cloud Build, Deploy (e integração GitHub Actions) |
| **Azure** | DevOps / GitHub Actions + Azure |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-oci-cicd-devops-guia](../../agents/cloud-oci-cicd-devops-guia.md)**
