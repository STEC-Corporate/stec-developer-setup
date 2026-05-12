---
name: cloud-aws-containers
description: Contentores e orquestração em AWS (ECS, EKS, Fargate, ECR). Usar com cloud-aws-containers-guia.
---

# Skill: Contentores e orquestração (AWS)

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
| **AWS** | ECS, EKS, Fargate, ECR |
| **GCP** | GKE, Artifact Registry, Cloud Run (containers) |
| **Azure** | AKS, ACR, Container Apps |
| **OCI** | OKE, OCIR |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-aws-containers-guia](../../agents/cloud-aws-containers-guia.md)**
