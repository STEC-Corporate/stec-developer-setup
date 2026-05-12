---
name: cloud-azure-networking-edge
description: Rede, CDN e DNS em Azure (VPC, ALB/NLB, CloudFront, Route 53). Usar com cloud-azure-networking-edge-guia.
---

# Skill: Rede, CDN e DNS (Azure)

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
| **Azure** | VNet, LB, Front Door / CDN, DNS |
| **AWS** | VPC, ALB/NLB/GWLB, CloudFront, Route 53 |
| **GCP** | VPC, LB, Cloud CDN, Cloud DNS |
| **OCI** | VCN, LB, DNS |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-azure-networking-edge-guia](../../agents/cloud-azure-networking-edge-guia.md)**
