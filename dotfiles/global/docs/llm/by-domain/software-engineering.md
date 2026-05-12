---
domain: software-engineering
keywords: refactor, code review, cobertura, lint, clean code, SOLID, princípios, qualidade, débito técnico, design pattern, code smell
complexity: medium
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** Excelente para análise de código existente, refatoração e aplicação de princípios SOLID

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** claude-haiku-4-5 (para lint fixes, formatação, renomeações)
- **Quando Haiku:** Correções de estilo, imports organizados, comentários

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 ✅ adequado para code review padrão
- **Upgrade recomendado:** o4-mini para análise de patterns complexos
- **Migração sugerida:** → Claude Code para revisões profundas com contexto extenso (caching ativo)

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gpt-5.4 | $8.75 | Alta precisão para detecção de code smells |
| o4-mini | menor | Bom para análise de padrões com custo menor |

### Budget
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | Refatoração em volume, revisões de PR automatizadas |
| qwen3-235b | $1.72 | Análise de qualidade em múltiplos arquivos |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | Análise de qualidade on-premise |
| llama-3.3-nemotron | Llama Community | Para pipelines de CI de code review |
