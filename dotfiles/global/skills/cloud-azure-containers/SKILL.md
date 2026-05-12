---
name: cloud-azure-containers
description: Contentores e orquestração em Azure (ECS, EKS, Fargate, ECR). Usar com cloud-azure-containers-guia.
---

# Skill: Contentores e orquestração (Azure)

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
| **Azure** | AKS, ACR, Container Apps |
| **AWS** | ECS, EKS, Fargate, ECR |
| **GCP** | GKE, Artifact Registry, Cloud Run (containers) |
| **OCI** | OKE, OCIR |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-azure-containers-guia](../../agents/cloud-azure-containers-guia.md)**
