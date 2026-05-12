---
name: cloud-oci-serverless
description: Serverless e APIs geridas em OCI (Lambda, API Gateway, AppSync). Usar com cloud-oci-serverless-guia.
---

# Skill: Serverless e APIs geridas (OCI)

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
| **OCI** | Functions + API Gateway (OCI) |
| **AWS** | Lambda + API Gateway / AppSync |
| **GCP** | Cloud Functions + API Gateway (managed) |
| **Azure** | Azure Functions + API Management |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-oci-serverless-guia](../../agents/cloud-oci-serverless-guia.md)**
