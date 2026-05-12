---
name: cloud-azure-identity-security
description: Identidade, chaves e segredos em Azure (IAM, KMS, Secrets Manager, Cognito). Usar com cloud-azure-identity-security-guia.
---

# Skill: Identidade, chaves e segredos (Azure)

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
| **Azure** | Entra ID / RBAC, Key Vault |
| **AWS** | IAM, KMS, Secrets Manager, Cognito |
| **GCP** | IAM, Cloud KMS, Secret Manager |
| **OCI** | IAM, Vault/KMS OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-azure-identity-security-guia](../../agents/cloud-azure-identity-security-guia.md)**
