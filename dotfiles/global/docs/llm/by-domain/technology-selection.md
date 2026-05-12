---
domain: technology-selection
keywords: comparar, avaliar, escolher lib, benchmark, trade-off, tecnologia, stack, framework decision, linguagem, ferramenta
complexity: medium
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-opus-4-7
- **Razão:** Decisões de stack impactam toda a arquitetura futura — menor hallucination garante análise honesta de limitações de cada tecnologia

### Cursor IDE
- **Primary:** claude-opus-4-7
- **Budget Cursor:** claude-sonnet-4-6 (para comparações de bibliotecas dentro de uma stack já definida)
- **Quando Haiku:** NUNCA para decisões de stack principal

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 — adequado para comparações gerais com dados de treinamento
- **Upgrade recomendado:** gemini-3.1-pro ($6.56/M) para benchmarks mais recentes via web search
- **Migração sugerida:** → Claude Code com opus-4-7 para decisões de stack críticas

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| o3 | $5.00 | Análise de trade-offs multi-dimensional profunda |
| gemini-3.1-pro | $6.56 | BrowseComp 85.9% — pesquisa de benchmarks atuais via web |
| gpt-5.4 | $8.75 | Alta precisão com dados de treinamento rico em tech |

### Budget
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | Comparações de bibliotecas de código |
| qwen3-235b | $1.72 | Análises de stack em volume |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | Para avaliações internas de stack com dados sensíveis |
| mistral-large-2 | Apache 2.0 | Boa cobertura de ecossistema open-source |
