---
name: cloud-oci-networking-edge
description: Rede, CDN e DNS em OCI (VPC, ALB/NLB, CloudFront, Route 53). Usar com cloud-oci-networking-edge-guia.
---

# Skill: Rede, CDN e DNS (OCI)

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
| **OCI** | VCN, LB, DNS |
| **AWS** | VPC, ALB/NLB/GWLB, CloudFront, Route 53 |
| **GCP** | VPC, LB, Cloud CDN, Cloud DNS |
| **Azure** | VNet, LB, Front Door / CDN, DNS |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-oci-networking-edge-guia](../../agents/cloud-oci-networking-edge-guia.md)**
