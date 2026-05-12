---
name: cloud-aws-observability
description: Observabilidade em AWS (CloudWatch, X-Ray, CloudTrail). Usar com cloud-aws-observability-guia.
---

# Skill: Observabilidade (AWS)

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
| **AWS** | CloudWatch, X-Ray, CloudTrail |
| **GCP** | Cloud Monitoring, Cloud Trace, Audit Logs |
| **Azure** | Monitor, App Insights, Activity Log |
| **OCI** | Monitoring, Logging, Audit |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-aws-observability-guia](../../agents/cloud-aws-observability-guia.md)**
