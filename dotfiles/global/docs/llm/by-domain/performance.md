---
domain: performance
keywords: profiling, benchmark, latência, otimização de performance, throughput, bottleneck, memória, CPU, cache hit rate, GC, flame graph
complexity: high
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** Excelente para análise de flame graphs, identificação de bottlenecks e sugestões de otimização

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** claude-haiku-4-5 (para análise de benchmarks simples)
- **Quando Haiku:** Interpretação de números de benchmark, comparações diretas

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 ✅ adequado para otimização padrão
- **Upgrade recomendado:** o3 ($5/M) para análise de algoritmos com raciocínio matemático
- **Migração sugerida:** → Claude Code com Sonnet + caching para sessões longas de profiling

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| o3 | $5.00 | Raciocínio profundo para análise de complexidade algorítmica |
| gpt-5.4 | $8.75 | Máxima precisão para análise de sistemas críticos |

### Budget
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | Análise de código para quick wins de performance |
| qwen3-235b | $1.72 | Review de algoritmos em volume |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | 97.3% MATH — análise de complexidade algorítmica on-premise |
| llama-3.3-nemotron | Llama Community | Boa para análise de código Python/C++ |
