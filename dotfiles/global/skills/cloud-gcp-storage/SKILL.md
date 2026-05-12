---
name: cloud-gcp-storage
description: Armazenamento em GCP (S3, EBS, EFS, FSx). Usar com cloud-gcp-storage-guia.
---

# Skill: Armazenamento (GCP)

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
| **GCP** | Cloud Storage, Persistent Disk, Filestore |
| **AWS** | S3, EBS, EFS |
| **Azure** | Blob, Managed Disks, Files |
| **OCI** | Object Storage, Block Volume, File Storage |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-gcp-storage-guia](../../agents/cloud-gcp-storage-guia.md)**
