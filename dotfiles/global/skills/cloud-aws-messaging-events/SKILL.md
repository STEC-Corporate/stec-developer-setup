---
name: cloud-aws-messaging-events
description: Mensagens e eventos em AWS (SQS, SNS, EventBridge, Kinesis). Usar com cloud-aws-messaging-events-guia.
---

# Skill: Mensagens e eventos (AWS)

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
| **AWS** | SQS, SNS, EventBridge, Kinesis |
| **GCP** | Pub/Sub, Eventarc |
| **Azure** | Service Bus, Event Grid |
| **OCI** | Streaming, Events OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-aws-messaging-events-guia](../../agents/cloud-aws-messaging-events-guia.md)**
