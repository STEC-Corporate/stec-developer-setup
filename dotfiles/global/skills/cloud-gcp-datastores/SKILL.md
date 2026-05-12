---
name: cloud-gcp-datastores
description: Bases de dados e cache em GCP (RDS, Aurora, DynamoDB, ElastiCache). Usar com cloud-gcp-datastores-guia.
---

# Skill: Bases de dados e cache (GCP)

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
| **GCP** | Cloud SQL, Firestore, Spanner, Memorystore |
| **AWS** | RDS, Aurora, DynamoDB, ElastiCache |
| **Azure** | Azure SQL, Cosmos DB, Cache for Redis |
| **OCI** | Autonomous DB, NoSQL, Redis OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-gcp-datastores-guia](../../agents/cloud-gcp-datastores-guia.md)**
