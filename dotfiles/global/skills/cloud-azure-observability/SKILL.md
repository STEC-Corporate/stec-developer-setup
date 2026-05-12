---
name: cloud-azure-observability
description: Observabilidade em Azure (CloudWatch, X-Ray, CloudTrail). Usar com cloud-azure-observability-guia.
---

# Skill: Observabilidade (Azure)

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
| **Azure** | Monitor, App Insights, Activity Log |
| **AWS** | CloudWatch, X-Ray, CloudTrail |
| **GCP** | Cloud Monitoring, Cloud Trace, Audit Logs |
| **OCI** | Monitoring, Logging, Audit |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-azure-observability-guia](../../agents/cloud-azure-observability-guia.md)**
