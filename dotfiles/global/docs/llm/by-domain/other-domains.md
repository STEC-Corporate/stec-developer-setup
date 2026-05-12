---
domain: other-domains
keywords: []
complexity: medium
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** Fallback genérico — Sonnet cobre a maioria dos casos com bom custo-benefício

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** claude-haiku-4-5 (para tarefas simples não classificadas)
- **Quando Haiku:** Quando a tarefa parecer simples e repetitiva

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 ✅ adequado como fallback
- **Upgrade recomendado:** Avalie o tipo de tarefa para escolha mais específica
- **Migração sugerida:** → Identificar o domínio real e consultar o arquivo específico em `~/.claude/docs/llm/by-domain/`

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gpt-5.4 | $8.75 | Máxima qualidade geral |
| gemini-2.5-pro | $5.63 | Boa alternativa multi-propósito |

### Budget
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | Tasks genéricas de código |
| qwen3-235b | $1.72 | Tarefas gerais de análise |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | Fallback on-premise |
| mistral-large-2 | Apache 2.0 | Boa opção geral auto-hospedável |

---

## Catálogo de Domínios
Domínio não reconhecido? Consulte: `~/.claude/docs/llm/_index.yaml`
