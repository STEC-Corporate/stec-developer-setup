# 📐 Guidelines - Índice

> **Ponto de entrada único para todas as diretrizes do projeto (estratégia, UI/UX, comunicação, código). Fonte de verdade está nos documentos linkados; este arquivo apenas referencia.**

---

## 🎯 O que são Guidelines?

Guidelines são **diretrizes** que orientam como fazer algo no SoundLink: princípios estratégicos, padrões de UI/UX, tom de comunicação, convenções de código. Mantêm consistência para pessoas e para IA.

---

## 📍 Onde está cada tipo de guideline?

| O que preciso | Onde está |
|---------------|------------|
| **🛡️ Princípios invioláveis (estratégia, produto, arquitetura)** | [guardrails.md](./guardrails.md) |
| **🎨 UI/UX: Tailwind, margens, cores de botões, responsividade** | [.cursor/rules/frontend-tailwind-ui.mdc](../../.cursor/rules/frontend-tailwind-ui.mdc) |
| **🎨 UI/UX: Padrão universal (modal, card, busca, tooltips, TabHelp)** | [Skill code-aplicar-ui-ux-patterns](../../.cursor/skills/code-aplicar-ui-ux-patterns/SKILL.md) |
| **💬 Comunicação: Emails, notificações, erros, tooltips, tom de voz** | [playbooks/communication-guidelines.md](./playbooks/communication-guidelines.md) |
| **🏗️ Arquitetura: Clean Architecture, camadas, feature folder, limites** | [.cursor/rules/frontend-clean-architecture.mdc](../../.cursor/rules/frontend-clean-architecture.mdc) |
| **⚙️ Código: TypeScript, imports, error handling, Zod, DI, segurança** | [.cursor/rules/frontend-code-patterns.mdc](../../.cursor/rules/frontend-code-patterns.mdc) |
| **🧪 Testes: Jest, RTL, Playwright, factories, coverage gates** | [Skill testes-frontend-conventions](../../.cursor/skills/testes-frontend-conventions/SKILL.md) |
| **📋 Regras de negócio (fe-*.md)** | [Skill docs-criar-doc-regras-negocio](../../.cursor/skills/docs-criar-doc-regras-negocio/SKILL.md) |
| **🗂️ Índice geral (guardrails + links)** | [.cursorrules](../../.cursorrules) |
| **📦 Replicação neutra `gestao-*` (outro repositório STEC)** | [`_stec-process-bootstrap/README.md`](../_stec-process-bootstrap/README.md) · agente `tasklink-docs-scaffold-orchestrator` · regra `plan-mode-vs-execution.mdc` |

---

## 📚 Relação com outros documentos

| Documento | Uso |
|-----------|-----|
| [guardrails.md](./guardrails.md) | Consultar antes de qualquer feature ou decisão; contém também tabela "Relação com Outros Documentos" |
| [.cursor/docs/ia/README.md](./README.md) | Estrutura completa da pasta `.cursor/docs/ia/` e onde estão agents/skills |
| [CARTAO-REFERENCIA.md](../../../docs/gestao-ideias/04-referencia-tecnica/referencia/CARTAO-REFERENCIA.md) | Referência rápida geral do projeto (OKRs, fluxos, playbooks, etc.) |

---

**Atualização**: Este índice não duplica conteúdo; ao alterar uma diretriz, edite apenas o documento de origem. O `.cursorrules` agora é índice enxuto — as regras detalhadas vivem nas rules `.mdc` e skills acima.
