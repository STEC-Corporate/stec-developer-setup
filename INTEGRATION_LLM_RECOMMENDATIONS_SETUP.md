---
title: stec-developer-setup Integration — LLM Recommendations Distribution
date: 2026-05-10
status: Implementation Ready
---

# 📦 Distribuição Automática de Docs LLM via stec-developer-setup

## 📌 Visão Geral

Este documento detalha as **15 tarefas** para integrar a distribuição automática de documentação LLM no `stec-developer-setup`, garantindo que todos os colaboradores recebam recomendações de modelos ao rodar `install.sh` ou atualizarem com `update-llm-docs.sh`.

**Objetivo:** Fazer com que documentação LLM seja distribuída automaticamente para Claude Code, Cursor IDE e Codex CLI.

---

## 🎯 Fluxo de Distribuição

```
stec-developer-setup (repositório central)
    ├── docs/llm/                    ← 27 arquivos com recomendações
    ├── install.sh                   ← Distribui na instalação
    └── scripts/update-llm-docs.sh  ← Atualiza incremental

Quando colaborador roda: bash install.sh
    ├── Copia para ~/.claude/docs/llm/
    ├── Copia para ~/.cursor/docs/llm/
    └── Copia para ~/.codex/docs/llm/

Quando roda: update-llm-docs.sh
    └── Atualiza APENAS docs LLM (sem afetar config)
```

---

## 📋 Resumo das 15 Tarefas

| Fase | Tarefas | Horas | Escopo |
|------|---------|-------|--------|
| **10: Adicionar Docs** | 10.1-10.2 | 2h | Criar docs/llm/ com 27 arquivos |
| **11: Atualizar install.sh** | 11.1-11.2 | 1h | Função copy_llm_docs(), integração |
| **12: Script Update** | 12.1-12.2 | 1h | update-llm-docs.sh, .gitignore |
| **13: Dotfiles** | 13.1-13.3 | 1.5h | Atualizar HARNESS.md em 3 ferramentas |
| **14: CI/CD** | 14.1 | 1h | Workflow validate-setup.yml |
| **15: Docs** | 15.1-15.2 | 1h | README.md, EXAMPLES.md |
| | **TOTAL** | **7.5h** | |

---

## 🚀 Próximas Ações

1. **FASE 10** — Criar docs/llm/ com 12 domínios + referências (2h)
2. **FASE 11** — Integrar copy_llm_docs() em install.sh (1h)
3. **FASE 12** — Criar scripts/update-llm-docs.sh (1h)
4. **FASE 13** — Atualizar HARNESS.md em claude/, cursor/, codex/ (1.5h)
5. **FASE 14** — Criar .github/workflows/validate-setup.yml (1h)
6. **FASE 15** — Documentação para colaboradores (1h)

Para detalhes completos de cada tarefa, veja: [LLM_RECOMMENDATION_PLAN_V2.md](../tasklink-harness-core/LLM_RECOMMENDATION_PLAN_V2.md)

---

**Criado:** 2026-05-10  
**Status:** ✅ Pronto para implementação  
**Duração estimada:** 7.5 horas
