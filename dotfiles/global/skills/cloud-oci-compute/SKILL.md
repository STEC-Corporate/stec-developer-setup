---
name: cloud-oci-compute
description: Compute e escalonamento em OCI (EC2, Auto Scaling, Lambda, App Runner). Usar com cloud-oci-compute-guia.
---

# Skill: Compute e escalonamento (OCI)

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
| **OCI** | Compute, Functions, OKE worker nodes |
| **AWS** | EC2, ASG, Lambda, App Runner |
| **GCP** | GCE, Cloud Run, Cloud Functions, GKE node pools |
| **Azure** | VMs, VMSS, Azure Functions, Container Apps |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-oci-compute-guia](../../agents/cloud-oci-compute-guia.md)**
