---
domain: ai-ml-engineering
keywords: LLM, agente, prompt, embedding, RAG, fine-tuning, AI agent, vector, transformer, tokenizer, langchain, langgraph
complexity: high
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-opus-4-7
- **Razão:** Meta-competência: o modelo mais capaz entende melhor os trade-offs de outros modelos. 36% hallucination crítico para design de sistemas AI

### Cursor IDE
- **Primary:** claude-opus-4-7
- **Budget Cursor:** claude-sonnet-4-6 (para código de integração, wrappers, pipelines)
- **Quando Haiku:** NUNCA para design de arquitetura AI/ML

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 — bem informado sobre ecossistema AI/ML (treinado em GPT family)
- **Upgrade recomendado:** o3 ($5/M) para arquitetura de sistemas multi-agent complexos
- **Migração sugerida:** → Claude Code com opus-4-7 para design de sistemas RAG, agentes ou fine-tuning

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| o3 | $5.00 | Raciocínio profundo para arquitetura de agentes |
| gemini-2.5-pro | $5.63 | Integração com Vertex AI, Google AI ecosystem |
| gpt-5.4 | $8.75 | Alta precisão para especificações técnicas AI |

### Budget (≥97% benchmark)
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | MoE architecture — excelente para código de integração LLM |
| qwen3-235b | $1.72 | Pipelines de processamento de texto em volume |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | On-premise — para sistemas AI em ambientes restritos |
| llama-3.3-nemotron | Llama Community | 98.3% MATH — boa base para fine-tuning próprio |

---

## Tip de Caching
Sessões de design de RAG ou agentes com contexto longo reutilizado: Claude caching com Sonnet = $0.30/M cache hit. Útil para iterar sobre a mesma especificação.
