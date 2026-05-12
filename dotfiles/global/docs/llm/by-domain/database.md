---
domain: database
keywords: SQL, schema, migration, query, índice, sharding, banco de dados, PostgreSQL, MongoDB, Redis, otimização de query, normalização
complexity: medium
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** Excelente para queries SQL complexas, design de schema, planos de migração e otimização de índices

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** claude-haiku-4-5 (para queries simples, CRUD básico)
- **Quando Haiku:** Geração de queries SELECT simples, formatação de schema

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 ✅ adequado para SQL padrão
- **Upgrade recomendado:** — para uso geral; o3 para otimização de queries complexas
- **Migração sugerida:** → Claude Code para design de schema crítico e migrações de produção

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gpt-5.4 | $8.75 | Máxima precisão para otimização de queries críticas |
| gemini-2.5-pro | $5.63 | Integração BigQuery, AlloyDB |

### Budget
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | Geração de migrations, queries em volume |
| qwen3-235b | $1.72 | Review de schema e índices |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | Otimização de queries on-premise com dados sensíveis |
| qwen3-235b | Apache 2.0 | Boa para SQL e NoSQL patterns |
