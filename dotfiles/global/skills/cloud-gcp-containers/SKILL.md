---
name: cloud-gcp-containers
description: Contentores e orquestração em GCP (ECS, EKS, Fargate, ECR). Usar com cloud-gcp-containers-guia.
---

# Skill: Contentores e orquestração (GCP)

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
| **GCP** | GKE, Artifact Registry, Cloud Run (containers) |
| **AWS** | ECS, EKS, Fargate, ECR |
| **Azure** | AKS, ACR, Container Apps |
| **OCI** | OKE, OCIR |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-gcp-containers-guia](../../agents/cloud-gcp-containers-guia.md)**
