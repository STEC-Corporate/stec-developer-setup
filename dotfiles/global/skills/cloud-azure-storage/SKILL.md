---
name: cloud-azure-storage
description: Armazenamento em Azure (S3, EBS, EFS, FSx). Usar com cloud-azure-storage-guia.
---

# Skill: Armazenamento (Azure)

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
| **Azure** | Blob, Managed Disks, Files |
| **AWS** | S3, EBS, EFS |
| **GCP** | Cloud Storage, Persistent Disk, Filestore |
| **OCI** | Object Storage, Block Volume, File Storage |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-azure-storage-guia](../../agents/cloud-azure-storage-guia.md)**
