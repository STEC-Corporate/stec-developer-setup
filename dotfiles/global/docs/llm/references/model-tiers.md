# Guia de Substituição de Modelos LLM

> Referência rápida: qual modelo usar quando o primário não estiver disponível ou for caro demais.
> Dados: MATH-500, BrowseComp, AA-Omniscience benchmarks (2026-05).

---

## Substituição Direta por Tier

### Claude (Anthropic)
| Modelo | Preço/M | Substitutos Equivalents | Substitutos Budget |
|--------|---------|------------------------|-------------------|
| claude-opus-4-7 | ~$15 | o3 ($5), gpt-5.4 ($8.75), gemini-3.1-pro ($6.56) | qwen3-235b ($1.72) |
| claude-sonnet-4-6 | ~$3 | gemini-2.5-pro ($5.63), kimi-k2 (~$0.15 input), qwen3-235b ($1.72) | grok-3-mini ($0.36), qwen3-30b ($0.13) |
| claude-haiku-4-5 | ~$0.25 | grok-3-mini ($0.36), o4-mini, qwen3-30b ($0.13) | mistral-small (free tier) |

### OpenAI (Codex / API)
| Modelo | Substitutos Equivalents | Substitutos Budget |
|--------|------------------------|-------------------|
| gpt-5.5 | gemini-2.5-pro, kimi-k2, grok-4 | qwen3-235b, kimi-k2 |
| o3 | claude-opus-4-7, gpt-5.4 | qwen3-235b |
| o4-mini | grok-3-mini ($0.36), qwen3-30b ($0.13) | mistral-small |
| gpt-5.4 | claude-opus-4-7, o3, gemini-3.1-pro | qwen3-235b |

---

## Destaques de Benchmark (2026)

### MATH-500 (raciocínio matemático)
| Posição | Modelo | Score | Custo/M input |
|---------|--------|-------|---------------|
| 1 | gpt-5.4 | 99.4% | $8.75 |
| 2 | o3 | 99.2% | $5.00 |
| 2 | grok-3-mini | 99.2% | **$0.36** ← budget winner |
| 4 | claude-sonnet-4-6 | 99.1% | $3.00 |
| 5 | o4-mini | 98.7% | menor |
| 6 | gemini-2.5-pro | 98.6% | $5.63 |
| 7 | qwen3-235b | 98.4% | $1.72 |
| 8 | llama-3.3-nemotron | 98.3% | open-source |
| 9 | qwen3-30b | 97.5% | **$0.13** ← cheapest |
| 10 | deepseek-r1 | 97.3% | MIT |

### BrowseComp (pesquisa web)
| Posição | Modelo | Score | Nota |
|---------|--------|-------|------|
| 1 | gpt-5.5 Pro | 90.1% | Melhor para pesquisa web |
| 2 | gpt-5.4 Pro | 89.3% | — |
| 3 | Claude Mythos | 86.9% | — |
| 4 | gemini-3.1-pro | 85.9% | Melhor valor para pesquisa |
| 5 | claude-opus-4-7 | 79.3% | **36% hallucination** ← mais seguro |

### AA-Omniscience (taxa de alucinação — menor é melhor)
| Modelo | Taxa | Uso recomendado |
|--------|------|-----------------|
| claude-opus-4-7 | 36% | Fintech, legal, arquitetura crítica |
| Outros modelos | 45-70% | Uso geral |

---

## Decisão Rápida por Domínio

| Domínio | Primary Claude | Alternativa Budget | Nunca usar |
|---------|---------------|-------------------|-----------|
| fintech | opus-4-7 | — (sem budget aqui) | haiku, open-source sem validação |
| legal-compliance | opus-4-7 | — | haiku, open-source sem validação |
| architecture | opus-4-7 | kimi-k2 (código apenas) | haiku |
| security | opus-4-7 | qwen3-235b | haiku |
| statistics | sonnet-4-6 | grok-3-mini (math!) | — |
| data-science | sonnet-4-6 | grok-3-mini, qwen3-30b | — |
| software-development | sonnet-4-6 | kimi-k2 | — |
| task-management | haiku-4-5 | qwen3-30b | opus (caro demais) |
| language-translation | haiku-4-5 | qwen3-30b | opus (caro demais) |

---

## Modelos Open-Source por Caso de Uso

| Modelo | Licença | Melhor para |
|--------|---------|-------------|
| deepseek-r1 | MIT | Código + matemática on-premise |
| qwen3-235b | Apache 2.0 | Código + multilíngue + math |
| llama-3.3-nemotron | Llama Community | Código + raciocínio geral |
| mistral-large-2 | Apache 2.0 | Texto, redação, PT/EN/FR/ES |
| mistral-small | Apache 2.0 | Tarefas simples, custo zero |

---

## Kimi K2 — Moonshot AI (Especial Budget)
- **Arquitetura:** MoE 1T parâmetros / 32B ativos
- **Custo:** ~$0.15/M input (um dos mais baratos)
- **Força:** Código e tarefas agenticas — domina benchmarks de coding
- **Fraqueza:** Menos preciso em domínios de negócio complexo vs opus
- **Nota:** Moonshot AI = mesma empresa do moonshot-v1-128k usado no gateway
- **Usar quando:** kimi-k2 é o "sonnet barato" para tasks de código

---

_Atualizado: 2026-05-12 | Fonte: math-model-statistic benchmarks + market data_
