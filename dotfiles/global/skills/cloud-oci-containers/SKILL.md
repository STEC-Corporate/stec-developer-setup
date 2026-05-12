---
name: cloud-oci-containers
description: Contentores e orquestração em OCI (ECS, EKS, Fargate, ECR). Usar com cloud-oci-containers-guia.
---

# Skill: Contentores e orquestração (OCI)

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
| **OCI** | OKE, OCIR |
| **AWS** | ECS, EKS, Fargate, ECR |
| **GCP** | GKE, Artifact Registry, Cloud Run (containers) |
| **Azure** | AKS, ACR, Container Apps |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-oci-containers-guia](../../agents/cloud-oci-containers-guia.md)**
