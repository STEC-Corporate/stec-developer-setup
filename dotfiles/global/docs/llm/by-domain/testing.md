---
domain: testing
keywords: teste, TDD, BDD, cobertura, mock, assert, unit test, integration test, e2e, cypress, jest, pytest, cobertura de código
complexity: medium
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** Excelente para estratégias de teste, geração de casos de teste e análise de cobertura

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** claude-haiku-4-5 (para testes unitários simples, geração de mocks padrão)
- **Quando Haiku:** Testes unitários CRUD, fixtures simples, snapshots

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 ✅ adequado para testes convencionais
- **Upgrade recomendado:** o4-mini para lógica de testes complexa
- **Migração sugerida:** → Claude Code para estratégias de teste em sistemas distribuídos

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gpt-5.4 | $8.75 | Alta precisão para testes críticos de negócio |
| o4-mini | menor | Bom para análise de casos de teste complexos |

### Budget
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | Geração de testes em volume (cobertura rápida) |
| qwen3-30b | $0.13 | Testes unitários em massa |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| llama-3.3-nemotron | Llama Community | Geração de testes on-premise |
| deepseek-r1 | MIT | Para pipelines de teste em ambientes restritos |
