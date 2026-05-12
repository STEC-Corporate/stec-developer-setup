---
name: cloud-oci-messaging-events
description: Mensagens e eventos em OCI (SQS, SNS, EventBridge, Kinesis). Usar com cloud-oci-messaging-events-guia.
---

# Skill: Mensagens e eventos (OCI)

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
| **OCI** | Streaming, Events OCI |
| **AWS** | SQS, SNS, EventBridge, Kinesis |
| **GCP** | Pub/Sub, Eventarc |
| **Azure** | Service Bus, Event Grid |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-oci-messaging-events-guia](../../agents/cloud-oci-messaging-events-guia.md)**
