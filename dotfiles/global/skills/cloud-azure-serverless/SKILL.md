---
name: cloud-azure-serverless
description: Serverless e APIs geridas em Azure (Lambda, API Gateway, AppSync). Usar com cloud-azure-serverless-guia.
---

# Skill: Serverless e APIs geridas (Azure)

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
| **Azure** | Azure Functions + API Management |
| **AWS** | Lambda + API Gateway / AppSync |
| **GCP** | Cloud Functions + API Gateway (managed) |
| **OCI** | Functions + API Gateway (OCI) |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-azure-serverless-guia](../../agents/cloud-azure-serverless-guia.md)**
