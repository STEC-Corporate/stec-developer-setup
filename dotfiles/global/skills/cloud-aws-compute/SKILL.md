---
name: cloud-aws-compute
description: Compute e escalonamento em AWS (EC2, Auto Scaling, Lambda, App Runner). Usar com cloud-aws-compute-guia.
---

# Skill: Compute e escalonamento (AWS)

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
| **AWS** | EC2, ASG, Lambda, App Runner |
| **GCP** | GCE, Cloud Run, Cloud Functions, GKE node pools |
| **Azure** | VMs, VMSS, Azure Functions, Container Apps |
| **OCI** | Compute, Functions, OKE worker nodes |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-aws-compute-guia](../../agents/cloud-aws-compute-guia.md)**
