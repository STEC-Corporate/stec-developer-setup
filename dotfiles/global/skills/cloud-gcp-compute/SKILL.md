---
name: cloud-gcp-compute
description: Compute e escalonamento em GCP (EC2, Auto Scaling, Lambda, App Runner). Usar com cloud-gcp-compute-guia.
---

# Skill: Compute e escalonamento (GCP)

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
| **GCP** | GCE, Cloud Run, Cloud Functions, GKE node pools |
| **AWS** | EC2, ASG, Lambda, App Runner |
| **Azure** | VMs, VMSS, Azure Functions, Container Apps |
| **OCI** | Compute, Functions, OKE worker nodes |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-gcp-compute-guia](../../agents/cloud-gcp-compute-guia.md)**
