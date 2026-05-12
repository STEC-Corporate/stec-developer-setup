---
domain: security
keywords: vuln, OWASP, auth, XSS, injection, segurança, pentest, CVE, exploit, hardening, SAST, secrets
complexity: high
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-opus-4-7
- **Razão:** 36% hallucination rate — vulnerabilidades reportadas incorretamente são perigosas; opus tem menor taxa de falsos negativos

### Cursor IDE
- **Primary:** claude-opus-4-7
- **Budget Cursor:** claude-sonnet-4-6 (para hardening de configuração e revisão de headers)
- **Quando Haiku:** NUNCA para análise de segurança crítica

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 — adequado para OWASP Top 10 básico
- **Upgrade recomendado:** o3 ($5/M) para análise profunda de vetores de ataque
- **Migração sugerida:** → Claude Code com opus-4-7 para auditorias completas ou análise de CVE

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| o3 | $5.00 | Raciocínio multi-step para análise de attack chains |
| gpt-5.4 | $8.75 | Alta precisão em threat modeling |

### Budget (para tarefas de segurança não-críticas)
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| qwen3-235b | $1.72 | Revisão de configurações, checklist de hardening |
| grok-4 | mid-range | Conhecimento atualizado de CVEs recentes |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | Análise de segurança on-premise (air-gapped) |
| llama-3.3-nemotron | Llama Community | Alternativa para ambientes isolados |
