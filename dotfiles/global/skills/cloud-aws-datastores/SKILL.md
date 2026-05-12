---
name: cloud-aws-datastores
description: Bases de dados e cache em AWS (RDS, Aurora, DynamoDB, ElastiCache). Usar com cloud-aws-datastores-guia.
---

# Skill: Bases de dados e cache (AWS)

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
| **AWS** | RDS, Aurora, DynamoDB, ElastiCache |
| **GCP** | Cloud SQL, Firestore, Spanner, Memorystore |
| **Azure** | Azure SQL, Cosmos DB, Cache for Redis |
| **OCI** | Autonomous DB, NoSQL, Redis OCI |

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-aws-datastores-guia](../../agents/cloud-aws-datastores-guia.md)**
