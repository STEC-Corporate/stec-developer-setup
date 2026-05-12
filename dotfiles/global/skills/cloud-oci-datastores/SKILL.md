---
name: cloud-oci-datastores
description: Bases de dados e cache em OCI (RDS, Aurora, DynamoDB, ElastiCache). Usar com cloud-oci-datastores-guia.
---

# Skill: Bases de dados e cache (OCI)

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
| **OCI** | Autonomous DB, NoSQL, Redis OCI |
| **AWS** | RDS, Aurora, DynamoDB, ElastiCache |
| **GCP** | Cloud SQL, Firestore, Spanner, Memorystore |
| **Azure** | Azure SQL, Cosmos DB, Cache for Redis |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-oci-datastores-guia](../../agents/cloud-oci-datastores-guia.md)**
