---
name: cloud-gcp-messaging-events
description: Mensagens e eventos em GCP (SQS, SNS, EventBridge, Kinesis). Usar com cloud-gcp-messaging-events-guia.
---

# Skill: Mensagens e eventos (GCP)

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
| **GCP** | Pub/Sub, Eventarc |
| **AWS** | SQS, SNS, EventBridge, Kinesis |
| **Azure** | Service Bus, Event Grid |
| **OCI** | Streaming, Events OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-gcp-messaging-events-guia](../../agents/cloud-gcp-messaging-events-guia.md)**
