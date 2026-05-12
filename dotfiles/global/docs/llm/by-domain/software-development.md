---
domain: software-development
keywords: python, javascript, typescript, java, kotlin, rust, bash, código, função, classe, bug, implementar, debugar, feature
complexity: medium
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** Melhor custo-benefício para desenvolvimento geral — 99.1% MATH-500, excelente para código em todas as linguagens principais

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** claude-haiku-4-5 (para autocompletar, pequenas correções, boilerplate)
- **Quando Haiku:** Geração de getters/setters, snippets repetitivos, renomeações simples

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 ✅ adequado — modelo bem alinhado para código
- **Upgrade recomendado:** — (gpt-5.5 já é excelente para dev padrão)
- **Migração sugerida:** → Claude Code com Sonnet para sessões longas com caching

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gpt-5.4 | $8.75 | Máxima precisão para código crítico |
| gemini-2.5-pro | $5.63 | Integração Google Cloud, multi-linguagem |

### Budget (código de qualidade, custo mínimo)
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | **Melhor budget para código**: MoE 1T/32B ativo, domina coding benchmarks |
| qwen3-235b | $1.72 | Alto volume de geração de código |
| qwen3-30b | $0.13 | Scaffolding, boilerplate em massa |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | Excelente para código, melhor on-premise |
| llama-3.3-nemotron | Llama Community | 98.3% MATH — boa para lógica de código |
| qwen3-235b | Apache 2.0 | 98.4% MATH — auto-hospedável |

---

## Tip de Caching
Sessão de desenvolvimento com contexto de codebase fixo (ex: múltiplas perguntas sobre o mesmo arquivo)? Claude caching: $0.30/M cache hit em Sonnet, 90% mais barato.
