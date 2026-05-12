---
name: cloud-azure-messaging-events
description: Mensagens e eventos em Azure (SQS, SNS, EventBridge, Kinesis). Usar com cloud-azure-messaging-events-guia.
---

# Skill: Mensagens e eventos (Azure)

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
| **Azure** | Service Bus, Event Grid |
| **AWS** | SQS, SNS, EventBridge, Kinesis |
| **GCP** | Pub/Sub, Eventarc |
| **OCI** | Streaming, Events OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-azure-messaging-events-guia](../../agents/cloud-azure-messaging-events-guia.md)**
