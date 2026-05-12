---
name: cloud-aws-identity-security
description: Identidade, chaves e segredos em AWS (IAM, KMS, Secrets Manager, Cognito). Usar com cloud-aws-identity-security-guia.
---

# Skill: Identidade, chaves e segredos (AWS)

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
| **AWS** | IAM, KMS, Secrets Manager, Cognito |
| **GCP** | IAM, Cloud KMS, Secret Manager |
| **Azure** | Entra ID / RBAC, Key Vault |
| **OCI** | IAM, Vault/KMS OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-aws-identity-security-guia](../../agents/cloud-aws-identity-security-guia.md)**
