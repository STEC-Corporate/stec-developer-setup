---
domain: architecture
keywords: arquitetura, microsserviço, DDD, CQRS, escalabilidade, design pattern, bounded context, event sourcing, hexagonal, clean architecture
complexity: high
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-opus-4-7
- **Razão:** 36% hallucination rate (menor do mercado) — crítico para decisões que impactam toda a stack

### Cursor IDE
- **Primary:** claude-opus-4-7
- **Budget Cursor:** claude-sonnet-4-6 (para revisão de padrões existentes)
- **Quando Haiku:** Q&A rápido sobre nomenclatura — nunca para decisões de design

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 — limitado para raciocínio arquitetural profundo
- **Upgrade recomendado:** o3 ($5/M) — raciocínio multi-step superior
- **Migração sugerida:** → Claude Code com opus-4-7 para decisões críticas de trade-off

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| o3 | $5.00 | Raciocínio multi-step — ideal para análise de trade-offs |
| gpt-5.4 | $8.75 | Máxima precisão, 99.4% MATH-500 |
| gemini-3.1-pro | $6.56 | Se já no ecossistema Google Cloud |

### Budget (≥97% benchmark, custo reduzido)
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 input | Arquitetura de código, menos complexidade de domínio de negócio |
| qwen3-235b | $1.72 | Alto volume de revisões de arquitetura |
| gemini-2.5-pro | $5.63 | Quando há diagramas de arquitetura para análise visual |

### Open-source (self-hostable)
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | 97.3% MATH-500 — melhor opção on-premise |
| llama-3.3-nemotron | Llama Community | 98.3% MATH-500 |

---

## Tip de Caching
Sessão longa de revisão de arquitetura com contexto repetido? Claude caching: 90% desconto em cache hits (TTL 5min). Sonnet: $0.30/M cache hit vs $3.00/M normal.
