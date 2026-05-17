---
title: "Sistema de Recomendação LLM — Documentação de Navegação"
date: 2026-05-10
---

# 📚 Documentação do Sistema de Recomendação LLM

## 🎯 Qual documento ler?

### ❓ "Quero entender o plano em 5 minutos"
👉 Leia: **[LLM_RECOMMENDATION_EXECUTIVE_SUMMARY.md](./LLM_RECOMMENDATION_EXECUTIVE_SUMMARY.md)**
- Resumo executivo
- Arquitetura de 2 níveis
- Benefícios finais
- Timeline

### 📋 "Quero ver o plano técnico completo"
👉 Leia: **[LLM_RECOMMENDATION_PLAN_V2.md](./LLM_RECOMMENDATION_PLAN_V2.md)**
- 15 fases detalhadas
- Blocos 1-3 (Local, Gateway, Setup)
- Código de exemplo
- Estrutura final de diretórios
- **~15 páginas de planejamento**

### 🔗 "Trabalho no gateway (stec-LLM-gateway)"
👉 Leia: **[../stec-LLM-gateway/INTEGRATION_LLM_RECOMMENDATIONS.md](../stec-LLM-gateway/INTEGRATION_LLM_RECOMMENDATIONS.md)**
- 15 tarefas específicas do gateway
- Schema & router updates
- Testes de integração
- Documentação de API
- Checklist de integração

### ⚙️ "Trabalho no setup (stec-developer-setup)"
👉 Leia: **[../stec-developer-setup/INTEGRATION_LLM_RECOMMENDATIONS_SETUP.md](../stec-developer-setup/INTEGRATION_LLM_RECOMMENDATIONS_SETUP.md)**
- 15 tarefas do setup
- Como distribuir docs LLM
- Atualizar install.sh
- Criar update script
- CI/CD validation

---

## 🗂️ Estrutura de Documentos

```
Sistema de Recomendação LLM
│
├── 📄 Este arquivo (você está aqui)
│   └─ Guia de navegação rápida
│
├── 📋 LLM_RECOMMENDATION_EXECUTIVE_SUMMARY.md
│   ├─ Contexto & solução
│   ├─ Arquitetura 2-layer
│   ├─ 15 fases simplificadas
│   ├─ Benefícios & ROI
│   └─ Status: ✅ Pronto para implementação
│
├── 📘 LLM_RECOMMENDATION_PLAN_V2.md
│   ├─ BLOCO 1: Criação Local (FASE 1-5)
│   ├─ BLOCO 2: Integração Gateway (FASE 6-9)
│   ├─ BLOCO 3: Distribuição Setup (FASE 10-15)
│   ├─ Código de exemplo completo
│   ├─ Estrutura de diretórios final
│   └─ Timeline (25+ horas)
│
├─ stec-LLM-gateway/
│   └─ 📘 INTEGRATION_LLM_RECOMMENDATIONS.md
│       ├─ 15 tarefas do gateway
│       ├─ BLOCO 1: Schema & Router (T1-4)
│       ├─ BLOCO 2: Testes & Docs (T5-8)
│       ├─ BLOCO 3: Integração (T9-10)
│       ├─ BLOCO 4-5: DevOps & Observabilidade
│       └─ Checklist & timeline
│
└─ stec-developer-setup/
   └─ 📘 INTEGRATION_LLM_RECOMMENDATIONS_SETUP.md
       ├─ FASE 10: Adicionar docs ao repo
       ├─ FASE 11: Atualizar install.sh
       ├─ FASE 12: Script update incremental
       ├─ FASE 13: Integrar com dotfiles
       ├─ FASE 14: CI/CD validation
       ├─ FASE 15: Documentação
       └─ Checklist & timeline
```

---

## 🚀 Como Começar

### Passo 1: Revisar Plano (5-10 min)
```bash
# Leia o resumo executivo
cat LLM_RECOMMENDATION_EXECUTIVE_SUMMARY.md
```

### Passo 2: Entender Arquitetura Completa (20-30 min)
```bash
# Leia o plano técnico detalhado
cat LLM_RECOMMENDATION_PLAN_V2.md
```

### Passo 3: Aprovar Plano
> Confirme ao Jesus que o plano V2 (com distribuição setup) está aprovado

### Passo 4: Começar FASE 1-2 (Criar docs locais)
```bash
# Executor vai criar ~/.claude/docs/llm/ com 12 domínios
# Duração: 6 horas
```

### Passo 5: Executar FASE 3 (Hook em harness-core)
```bash
# Implementar /harness/hooks/next_task_llm_recommender.py
# Duração: 2 horas
```

### Passo 6: Executar FASE 6-9 (Gateway integration)
```bash
# Consulte: stec-LLM-gateway/INTEGRATION_LLM_RECOMMENDATIONS.md
# Duração: 5.5 horas
```

### Passo 7: Executar FASE 10-15 (Setup distribution)
```bash
# Consulte: stec-developer-setup/INTEGRATION_LLM_RECOMMENDATIONS_SETUP.md
# Duração: 7.5 horas
```

---

## 📊 Resumo da Implementação

| Bloco | Fases | Projeto | Horas | Status |
|-------|-------|---------|-------|--------|
| **Local Creation** | 1-5 | `tasklink-harness-core` | 13h | Pendente |
| **Gateway Integration** | 6-9 | `stec-LLM-gateway` | 5.5h | Pendente |
| **Setup Distribution** | 10-15 | `stec-developer-setup` | 7.5h | Pendente |
| | | **TOTAL** | **25h+** | |

---

## 🎯 O que Cada Repositório Faz

### tasklink-harness-core
**Responsabilidade:** Recomendação inteligente
- Hook que detecta tarefa
- Consulta documentação LLM
- Recomenda modelo baseado em domínio
- **Arquivo:** `harness/hooks/next_task_llm_recommender.py`

### stec-LLM-gateway
**Responsabilidade:** Validação e roteamento
- Recebe recomendação da hook
- Valida contra token-count
- Escolhe modelo com 3 níveis de prioridade
- Registra decisão para auditoria
- **Arquivo:** `src/llm_gateway/router.py`

### stec-developer-setup
**Responsabilidade:** Distribuição automática
- Fornece documentação LLM centralizada
- Distribui via `install.sh` a todos os colaboradores
- Permite updates via `update-llm-docs.sh`
- Valida estrutura em CI/CD
- **Arquivo:** `docs/llm/` (27 arquivos)

---

## 💡 Conceitos-Chave

### "Dois Níveis"
```
Recomendação (O que usar) → Execução (Como usar)
Hook (harness-core)      → Gateway (stec-LLM-gateway)
```

### "Três Prioridades no Gateway"
1. **Recomendação da hook** (se válida)
2. **Task crítica** (se task_type="critical")
3. **Token-based** (default)

### "12 Domínios"
software-development, software-engineering, architecture, idea-management, task-management, product-management, data-science, statistics, technology-selection, language-translation, fintech, other-domains

### "3 Modelos Suportados"
- moonshot-v1-8k (< 500 tokens, rápido)
- abab6.5s-chat (500-4000 tokens, balanceado)
- moonshot-v1-128k (> 4000 tokens, contexto grande)

---

## ❓ Perguntas Frequentes

**P: Por onde começo?**
R: Leia o Executive Summary (5 min), depois o plano completo (20 min).

**P: Quanto tempo leva?**
R: 25+ horas de desenvolvimento + 1h por colaborador para setup.

**P: Preciso fazer tudo agora?**
R: Não. FASE 1-5 é prerequisito para FASE 6-9 que é prerequisito para FASE 10-15.

**P: Quem implementa cada parte?**
R: Jesus (todos os 3 repositórios). Colaboradores apenas rodamInstall.sh.

**P: E se quebrar algo?**
R: Cada repositório tem CI/CD para validar. update-llm-docs.sh não afeta config.

**P: Como adicionar novo domínio?**
R: Criar `by-domain/novo-dominio.md`, rodar `update-llm-docs.sh`.

**P: Gateway é obrigatório?**
R: Não. Hook recomenda mesmo sem gateway. Gateway apenas valida.

**P: Posso usar sem harness-core?**
R: Não. Hook está em harness-core. Outros podem consultar docs diretamente.

---

## 🔗 Links Rápidos

| Link | Descrição |
|------|----------|
| [Executive Summary](./LLM_RECOMMENDATION_EXECUTIVE_SUMMARY.md) | Visão geral (5 min) |
| [Plan V2](./LLM_RECOMMENDATION_PLAN_V2.md) | Plano técnico completo (25h) |
| [Gateway Tasks](../stec-LLM-gateway/INTEGRATION_LLM_RECOMMENDATIONS.md) | 15 tarefas do gateway |
| [Setup Tasks](../stec-developer-setup/INTEGRATION_LLM_RECOMMENDATIONS_SETUP.md) | 15 tarefas do setup |

---

## ✅ Checklist de Aprovação

Antes de começar implementação:

- [ ] **Executive Summary** lido e entendido
- [ ] **Plan V2** lido e revisado
- [ ] **Arquitetura 2-layer** compreendida
- [ ] **15 fases** mapeadas
- [ ] **25+ horas** confirmadas como viável
- [ ] **3 repositórios** prontos para mudanças
- [ ] **Plano aprovado** por todos os stakeholders

Após aprovação:
- [ ] FASE 1-5: Criação local iniciada
- [ ] FASE 6-9: Gateway pronto para integração
- [ ] FASE 10-15: Setup pronto para distribuição

---

## 📞 Contatos

- **Arquiteto:** Jesus (jesus@soundlink.com)
- **Implementation:** Jesus (todos os repos)
- **Review:** User

---

## 📝 Histórico de Mudanças

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 2026-05-09 | Plano inicial com 9 fases |
| 2.0 | 2026-05-10 | Integração com stec-developer-setup (15 fases total) |

---

## 🎉 Status Final

✅ **Plano V2.0 Completo**
- 15 fases documentadas
- 3 repositórios com tarefas específicas
- 25+ horas de desenvolvimento
- Distribuição automática para colaboradores
- CI/CD validation incluída
- 100% pronto para implementação

**Próximo passo:** Aprovação do User → Começar FASE 1

---

**Criado:** 2026-05-10  
**Mantém:** Jesus  
**Status:** ✅ Pronto para Implementação
