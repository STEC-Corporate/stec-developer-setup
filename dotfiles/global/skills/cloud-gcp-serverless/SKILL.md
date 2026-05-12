---
name: cloud-gcp-serverless
description: Serverless e APIs geridas em GCP (Lambda, API Gateway, AppSync). Usar com cloud-gcp-serverless-guia.
---

# Skill: Serverless e APIs geridas (GCP)

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
| **GCP** | Cloud Functions + API Gateway (managed) |
| **AWS** | Lambda + API Gateway / AppSync |
| **Azure** | Azure Functions + API Management |
| **OCI** | Functions + API Gateway (OCI) |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-gcp-serverless-guia](../../agents/cloud-gcp-serverless-guia.md)**
