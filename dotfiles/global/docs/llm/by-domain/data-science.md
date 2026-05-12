---
domain: data-science
keywords: machine learning, dataset, treinamento, sklearn, notebook, modelo ML, feature engineering, pandas, numpy, visualização, EDA
complexity: high
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** Excelente para código Python científico, notebooks Jupyter, pipelines sklearn/pandas com bom custo-benefício

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** claude-haiku-4-5 (para EDA simples, transformações de dados)
- **Quando Haiku:** Limpeza de dados, renomeação de colunas, plots básicos

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 — adequado para data science convencional
- **Upgrade recomendado:** o4-mini (98.7% MATH-500) para análise matemática avançada
- **Migração sugerida:** → Claude Code com Sonnet para notebooks longos com caching ativo

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gpt-5.4 | $8.75 | 99.4% MATH-500 — máxima precisão para ML research |
| gemini-2.5-pro | $5.63 | Integração nativa com BigQuery, Vertex AI |
| o4-mini | menor | 98.7% MATH-500 — ótimo para análise matemática em DS |

### Budget (≥97% benchmark, custo reduzido)
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| grok-3-mini | $0.36 | 99.2% MATH-500 — estatística e ML math ao preço mínimo |
| qwen3-30b | $0.13 | 97.5% MATH-500 — processamento de datasets em lote |
| kimi-k2 | ~$0.15 | Pipelines de código, feature engineering repetitivo |

### Open-source (self-hostable)
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | 97.3% MATH-500 — para dados sensíveis on-premise |
| qwen3-235b | Apache 2.0 | 98.4% MATH-500 — melhor open-source para DS |

---

## Tip de Caching
Notebook com schema de dados fixo e múltiplas análises? Claude caching: 90% desconto após primeira chamada no mesmo contexto (TTL 5min).
