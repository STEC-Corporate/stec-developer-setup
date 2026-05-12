---
domain: legal-compliance
keywords: LGPD, GDPR, contrato, regulação, auditoria jurídica, compliance, lei, jurídico, BACEN, CVM, licença
complexity: high
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-opus-4-7
- **Razão:** 36% hallucination rate (OBRIGATÓRIO) — informações jurídicas incorretas têm consequências legais sérias

### Cursor IDE
- **Primary:** claude-opus-4-7
- **Budget Cursor:** claude-sonnet-4-6 (apenas para código de implementação técnica de compliance, nunca para análise jurídica)
- **Quando Haiku:** NUNCA para domínio legal-compliance

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 — inadequado para análise jurídica precisa
- **Upgrade recomendado:** o3 ($5/M) com referências explícitas às leis
- **Migração sugerida:** → Claude Code com opus-4-7 para qualquer análise de compliance ou auditoria

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| o3 | $5.00 | Raciocínio preciso + referências legais |
| gpt-5.4 | $8.75 | Alta precisão geral |
| gemini-3.1-pro | $6.56 | Pesquisa jurídica web (BrowseComp 85.9%) |

### Budget (com validação por advogado obrigatória)
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| qwen3-235b | $1.72 | Rascunho inicial apenas — sempre revisar |

### Open-source (nunca para output final jurídico)
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | Pesquisa interna apenas, jamais output para clientes |

---

## ⚠️ Aviso Crítico
Output jurídico SEMPRE requer validação humana por profissional qualificado, independente do modelo usado. Este sistema oferece assistência técnica, não consultoria jurídica.
