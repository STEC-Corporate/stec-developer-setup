---
name: cloud-azure-datastores
description: Bases de dados e cache em Azure (RDS, Aurora, DynamoDB, ElastiCache). Usar com cloud-azure-datastores-guia.
---

# Skill: Bases de dados e cache (Azure)

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
| **Azure** | Azure SQL, Cosmos DB, Cache for Redis |
| **AWS** | RDS, Aurora, DynamoDB, ElastiCache |
| **GCP** | Cloud SQL, Firestore, Spanner, Memorystore |
| **OCI** | Autonomous DB, NoSQL, Redis OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-azure-datastores-guia](../../agents/cloud-azure-datastores-guia.md)**
