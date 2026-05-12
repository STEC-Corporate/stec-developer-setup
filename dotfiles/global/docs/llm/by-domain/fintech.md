---
domain: fintech
keywords: fintech, bolsa, investimento, compliance financeiro, B3, derivativo, carteira, risco, regulação financeira, bacen
complexity: high
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-opus-4-7
- **Razão:** 36% hallucination rate (OBRIGATÓRIO) — erros em contexto financeiro têm consequências legais e monetárias diretas

### Cursor IDE
- **Primary:** claude-opus-4-7
- **Budget Cursor:** claude-sonnet-4-6 (apenas para código utilitário sem lógica financeira crítica)
- **Quando Haiku:** NUNCA para domínio fintech

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 — cuidado com alucinações em dados regulatórios
- **Upgrade recomendado:** o3 ($5/M) — mais preciso para raciocínio financeiro complexo
- **Migração sugerida:** → Claude Code com opus-4-7 para qualquer lógica de compliance ou cálculo financeiro crítico

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| o3 | $5.00 | Raciocínio profundo para modelos financeiros |
| gpt-5.4 | $8.75 | Alta precisão, 99.4% MATH-500 |

### Budget (usar apenas com validação humana obrigatória)
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| qwen3-235b | $1.72 | Código utilitário, formatação de relatórios (sem cálculo crítico) |
| gemini-3.1-pro | $6.56 | Pesquisa regulatória (BrowseComp 85.9%) |

### Open-source (com validação humana obrigatória)
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | Apenas com revisão humana total em contexto financeiro |

---

## ⚠️ Aviso Crítico
Nunca use modelos Budget ou Open-source sem validação humana para cálculos financeiros, compliance ou dados regulatórios. Prefira sempre opus-4-7 ou o3.
