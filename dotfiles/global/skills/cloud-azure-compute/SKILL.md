---
name: cloud-azure-compute
description: Compute e escalonamento em Azure (EC2, Auto Scaling, Lambda, App Runner). Usar com cloud-azure-compute-guia.
---

# Skill: Compute e escalonamento (Azure)

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
| **Azure** | VMs, VMSS, Azure Functions, Container Apps |
| **AWS** | EC2, ASG, Lambda, App Runner |
| **GCP** | GCE, Cloud Run, Cloud Functions, GKE node pools |
| **OCI** | Compute, Functions, OKE worker nodes |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-azure-compute-guia](../../agents/cloud-azure-compute-guia.md)**
