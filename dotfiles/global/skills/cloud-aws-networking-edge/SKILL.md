---
name: cloud-aws-networking-edge
description: Rede, CDN e DNS em AWS (VPC, ALB/NLB, CloudFront, Route 53). Usar com cloud-aws-networking-edge-guia.
---

# Skill: Rede, CDN e DNS (AWS)

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
| **AWS** | VPC, ALB/NLB/GWLB, CloudFront, Route 53 |
| **GCP** | VPC, LB, Cloud CDN, Cloud DNS |
| **Azure** | VNet, LB, Front Door / CDN, DNS |
| **OCI** | VCN, LB, DNS |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-aws-networking-edge-guia](../../agents/cloud-aws-networking-edge-guia.md)**
