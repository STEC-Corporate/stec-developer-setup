---
domain: frontend
keywords: React, Vue, CSS, HTML, Tailwind, componente, frontend, SSR, SPA, estado, Redux, Next.js, Svelte, animação
complexity: medium
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** Excelente para componentes React/Vue, lógica de estado e CSS-in-JS

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** claude-haiku-4-5 (para componentes simples, estilos Tailwind, templates)
- **Quando Haiku:** Criação de componentes de UI básicos, aplicação de classes CSS, HTML estático

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 ✅ adequado — bem treinado em React/TypeScript
- **Upgrade recomendado:** gemini-2.5-pro (análise visual de componentes com screenshot)
- **Migração sugerida:** → Claude Code com Sonnet para SPAs complexas com caching

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gpt-5.4 | $8.75 | Alta precisão para lógica de estado complexa |
| gemini-2.5-pro | $5.63 | Multimodal — analisa screenshots de UI para referência |

### Budget
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | Geração de componentes em volume, scaffolding |
| qwen3-235b | $1.72 | Componentes complexos com lógica de negócio |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | Desenvolvimento frontend on-premise |
| llama-3.3-nemotron | Llama Community | Para projetos com restrição de dados |
