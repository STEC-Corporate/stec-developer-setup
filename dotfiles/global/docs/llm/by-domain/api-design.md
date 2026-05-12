---
domain: api-design
keywords: REST, GraphQL, OpenAPI, endpoint, versionamento, API, contrato, gateway, swagger, gRPC, webhook
complexity: medium
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** Excelente para especificações OpenAPI, design de contratos e revisão de consistência de API

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** claude-haiku-4-5 (para geração de schemas simples, documentação de endpoints)
- **Quando Haiku:** Documentação de campos, geração de exemplos de request/response

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 ✅ adequado — bem treinado em OpenAPI e REST patterns
- **Upgrade recomendado:** — (gpt-5.5 já é excelente para API design)
- **Migração sugerida:** → Claude Code com Sonnet para contratos complexos e versionamento de API

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gpt-5.4 | $8.75 | Alta precisão para especificações técnicas |
| gemini-2.5-pro | $5.63 | Integração com Google Cloud API Gateway |

### Budget
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | Geração de código de cliente/servidor a partir de spec |
| qwen3-235b | $1.72 | Validação de consistência em APIs grandes |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | Design de API on-premise |
| mistral-large-2 | Apache 2.0 | Boa para especificações de API em formato OpenAPI |
