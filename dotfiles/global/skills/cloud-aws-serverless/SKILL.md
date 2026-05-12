---
name: cloud-aws-serverless
description: Serverless e APIs geridas em AWS (Lambda, API Gateway, AppSync). Usar com cloud-aws-serverless-guia.
---

# Skill: Serverless e APIs geridas (AWS)

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
| **AWS** | Lambda + API Gateway / AppSync |
| **GCP** | Cloud Functions + API Gateway (managed) |
| **Azure** | Azure Functions + API Management |
| **OCI** | Functions + API Gateway (OCI) |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-aws-serverless-guia](../../agents/cloud-aws-serverless-guia.md)**
