---
domain: ux-design
keywords: UX, wireframe, usabilidade, persona, jornada, protótipo, design system, acessibilidade, UI review, heurística, fluxo de usuário
complexity: medium
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-opus-4-7
- **Razão:** Melhor análise holística de experiência do usuário e raciocínio sobre trade-offs de design

### Cursor IDE
- **Primary:** claude-opus-4-7
- **Budget Cursor:** claude-sonnet-4-6 (para especificações técnicas de componentes)
- **Quando Haiku:** Geração de variações de copy em UI, never para análise de UX

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 — limitado sem capacidade multimodal ativa
- **Upgrade recomendado:** gemini-2.5-pro ($5.63/M) — nativo multimodal, analisa screenshots de UI
- **Migração sugerida:** → Claude Code com opus-4-7 para análise completa de jornadas e heurísticas

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gemini-3.1-pro | $6.56 | **Melhor para UX**: multimodal nativo — analisa screenshots, wireframes, protótipos |
| o3 | $5.00 | Raciocínio profundo para análise de jornada do usuário |
| gpt-5.4 | $8.75 | Alta precisão geral + análise de imagem |

### Budget (para tarefas de UX não-críticas)
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| gemini-2.5-pro | $5.63 | Análise visual de UI/protótipos com custo menor |
| grok-4 | mid-range | Copy de interface, micro-textos |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| llama-3.3-nemotron | Llama Community | Para análise textual de especificações de UX |
| mistral-large-2 | Apache 2.0 | Análise de acessibilidade baseada em texto |
