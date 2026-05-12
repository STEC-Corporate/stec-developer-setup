---
name: cloud-gcp-identity-security
description: Identidade, chaves e segredos em GCP (IAM, KMS, Secrets Manager, Cognito). Usar com cloud-gcp-identity-security-guia.
---

# Skill: Identidade, chaves e segredos (GCP)

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
| **GCP** | IAM, Cloud KMS, Secret Manager |
| **AWS** | IAM, KMS, Secrets Manager, Cognito |
| **Azure** | Entra ID / RBAC, Key Vault |
| **OCI** | IAM, Vault/KMS OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-gcp-identity-security-guia](../../agents/cloud-gcp-identity-security-guia.md)**
