---
name: cloud-oci-storage
description: Armazenamento em OCI (S3, EBS, EFS, FSx). Usar com cloud-oci-storage-guia.
---

# Skill: Armazenamento (OCI)

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
| **OCI** | Object Storage, Block Volume, File Storage |
| **AWS** | S3, EBS, EFS |
| **GCP** | Cloud Storage, Persistent Disk, Filestore |
| **Azure** | Blob, Managed Disks, Files |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-oci-storage-guia](../../agents/cloud-oci-storage-guia.md)**
