---
domain: language-translation
keywords: tradução, i18n, localização, idioma, translate, internacionalização, PT, EN, ES, ZH, JP, AR, strings de interface
complexity: low
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-haiku-4-5
- **Razão:** Rápido e suficientemente preciso para traduções técnicas — economiza custo em alto volume

### Cursor IDE
- **Primary:** claude-haiku-4-5
- **Budget Cursor:** claude-haiku-4-5
- **Quando Haiku:** Sempre — tradução é o caso de uso ideal para modelos menores

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 ✅ excelente para tradução (forte em PT/EN/ES)
- **Upgrade recomendado:** — (não necessário para tradução padrão)
- **Migração sugerida:** → gemini para idiomas asiáticos (melhor cobertura CJK)

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gemini-2.5-pro | $5.63 | **Melhor para CJK** (Chinês, Japonês, Coreano) |
| o4-mini | menor | Tradução com contexto técnico |

### Budget (máxima economia)
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| qwen3-30b | $0.13 | **Excelente PT/EN/ZH** — melhor budget para CJK |
| mistral-small | Apache 2.0 | PT/EN/ES/FR com custo mínimo |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| qwen3-235b | Apache 2.0 | Melhor open-source para idiomas asiáticos |
| mistral-large-2 | Apache 2.0 | Bom para idiomas europeus |
