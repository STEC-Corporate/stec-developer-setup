---
name: cloud-oci-identity-security
description: Identidade, chaves e segredos em OCI (IAM, KMS, Secrets Manager, Cognito). Usar com cloud-oci-identity-security-guia.
---

# Skill: Identidade, chaves e segredos (OCI)

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
| **OCI** | IAM, Vault/KMS OCI |
| **AWS** | IAM, KMS, Secrets Manager, Cognito |
| **GCP** | IAM, Cloud KMS, Secret Manager |
| **Azure** | Entra ID / RBAC, Key Vault |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-oci-identity-security-guia](../../agents/cloud-oci-identity-security-guia.md)**
