---
name: cloud-oci-observability
description: Observabilidade em OCI (CloudWatch, X-Ray, CloudTrail). Usar com cloud-oci-observability-guia.
---

# Skill: Observabilidade (OCI)

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
| **OCI** | Monitoring, Logging, Audit |
| **AWS** | CloudWatch, X-Ray, CloudTrail |
| **GCP** | Cloud Monitoring, Cloud Trace, Audit Logs |
| **Azure** | Monitor, App Insights, Activity Log |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-oci-observability-guia](../../agents/cloud-oci-observability-guia.md)**
