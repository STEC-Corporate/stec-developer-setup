---
name: cloud-aws-storage
description: Armazenamento em AWS (S3, EBS, EFS, FSx). Usar com cloud-aws-storage-guia.
---

# Skill: Armazenamento (AWS)

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
| **AWS** | S3, EBS, EFS |
| **GCP** | Cloud Storage, Persistent Disk, Filestore |
| **Azure** | Blob, Managed Disks, Files |
| **OCI** | Object Storage, Block Volume, File Storage |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-aws-storage-guia](../../agents/cloud-aws-storage-guia.md)**
