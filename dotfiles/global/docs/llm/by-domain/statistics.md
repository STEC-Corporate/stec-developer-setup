---
domain: statistics
keywords: estatística, regressão, ANOVA, inferência, p-valor, distribuição, correlação, hipótese, bayesiano, intervalo de confiança
complexity: high
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** 99.1% MATH-500 — excelente para raciocínio estatístico com bom custo-benefício

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** grok-3-mini via API ($0.36/M — 99.2% MATH-500, supera Sonnet no benchmark)
- **Quando Haiku:** Apenas para formatação de fórmulas já conhecidas

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 — adequado para estatística básica
- **Upgrade recomendado:** o4-mini (98.7% MATH-500, custo menor que o3) ou o3 (99.2%)
- **Migração sugerida:** → Claude Code com Sonnet para tutoria estatística intensiva com caching

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gpt-5.4 | $8.75 | 99.4% MATH-500 — máxima precisão estatística |
| o3 | $5.00 | 99.2% MATH-500 + raciocínio de prova matemática |
| o4-mini | menor | 98.7% MATH-500 — melhor custo entre os equivalents |

### Budget (≥97% benchmark, muito mais barato)
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| grok-3-mini | $0.36 | **Melhor budget para math/stats**: 99.2% MATH-500 ao preço de haiku |
| qwen3-30b | $0.13 | 97.5% MATH-500 — análises em lote de alto volume |
| qwen3-235b | $1.72 | 98.4% MATH-500 — para análises mais complexas |

### Open-source (self-hostable)
| Modelo | Licença | Notas |
|--------|---------|-------|
| qwen3-235b | Apache 2.0 | 98.4% MATH-500 — melhor open-source para estatística |
| deepseek-r1 | MIT | 97.3% MATH-500 — on-premise para dados sensíveis |

---

## Tip de Caching
Análises com datasets e contexto fixo repetidos: Claude caching ativa em 5min de sessão. $0.30/M cache hit vs $3.00/M (Sonnet).
