---
domain: documentation
keywords: README, changelog, guia, tutorial, API docs, documentação, wiki, docstring, ADR, runbook, manual
complexity: low
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** Excelente redação técnica — clareza, estrutura e completude em documentação

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** claude-haiku-4-5 (para docstrings simples, comentários inline, changelogs)
- **Quando Haiku:** Docstrings de funções, comentários de código, geração de changelog

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 ✅ adequado para documentação técnica
- **Upgrade recomendado:** — (gpt-5.5 é suficiente para docs padrão)
- **Migração sugerida:** → Claude Code para documentação extensiva com caching ativo

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gpt-5.4 | $8.75 | Máxima qualidade para docs de produto público |
| gemini-2.5-pro | $5.63 | Integração Google Docs/Drive |

### Budget
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | Geração de docs em volume (ex: docstrings para todo codebase) |
| qwen3-30b | $0.13 | Documentação em massa |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| mistral-large-2 | Apache 2.0 | Boa para redação técnica on-premise |
| llama-3.3-nemotron | Llama Community | Para pipelines de documentação automatizados |

---

## Tip de Caching
Documentando um codebase inteiro? Claude caching: envie o contexto uma vez, documente todos os módulos por $0.30/M ao invés de $3.00/M (Sonnet, TTL 5min).
