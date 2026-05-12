---
name: cloud-gcp-observability
description: Observabilidade em GCP (CloudWatch, X-Ray, CloudTrail). Usar com cloud-gcp-observability-guia.
---

# Skill: Observabilidade (GCP)

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
| **GCP** | Cloud Monitoring, Cloud Trace, Audit Logs |
| **AWS** | CloudWatch, X-Ray, CloudTrail |
| **Azure** | Monitor, App Insights, Activity Log |
| **OCI** | Monitoring, Logging, Audit |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-gcp-observability-guia](../../agents/cloud-gcp-observability-guia.md)**
