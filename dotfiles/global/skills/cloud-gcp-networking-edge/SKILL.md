---
name: cloud-gcp-networking-edge
description: Rede, CDN e DNS em GCP (VPC, ALB/NLB, CloudFront, Route 53). Usar com cloud-gcp-networking-edge-guia.
---

# Skill: Rede, CDN e DNS (GCP)

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
| **GCP** | VPC, LB, Cloud CDN, Cloud DNS |
| **AWS** | VPC, ALB/NLB/GWLB, CloudFront, Route 53 |
| **Azure** | VNet, LB, Front Door / CDN, DNS |
| **OCI** | VCN, LB, DNS |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-gcp-networking-edge-guia](../../agents/cloud-gcp-networking-edge-guia.md)**
