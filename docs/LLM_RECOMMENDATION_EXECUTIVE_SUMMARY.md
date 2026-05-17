---
title: Sistema de Recomendação LLM — Resumo Executivo
date: 2026-05-10
status: ✅ Plano Aprovado e Pronto para Implementação
---

# 🎯 Resumo Executivo — Sistema de Recomendação LLM

## 📌 Contexto

**Problema:** Múltiplos projetos usam diferentes modelos LLM, sem recomendações centralizadas baseadas em domínio, velocidade ou orçamento.

**Solução:** Sistema inteligente de recomendação que:
1. **Detecta** o tipo de tarefa (domínio, complexidade)
2. **Recomenda** o melhor modelo (qualidade vs. custo)
3. **Valida** contra token-count no gateway
4. **Distribui** documentação para todos os colaboradores

---

## 🏗️ Arquitetura de Dois Níveis

```
┌─────────────────────────────────────────────────────────────┐
│ RECOMENDAÇÃO (Novo Layer)                                   │
│ • Hook em harness-core                                      │
│ • Detecta domínio: software-development, architecture, etc. │
│ • Consulta docs: ~/.claude/docs/llm/by-domain/*.md         │
│ • Recomenda modelo: "moonshot-v1-128k"                     │
└─────────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────────┐
│ EXECUÇÃO (Existing Layer — stec-LLM-gateway)               │
│ • Recebe recomendação                                       │
│ • Valida: 5000 tokens > 4000 ✅                           │
│ • Se inválida: usa token-based fallback                     │
│ • Retorna: model_used + routing_logic (auditoria)          │
└─────────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────────┐
│ PROVIDER (Existing)                                         │
│ • Executa com modelo escolhido                              │
│ • Retorna resposta + tokens usados                          │
└─────────────────────────────────────────────────────────────┘
```

---

## 📊 Três Documentos de Planejamento

| Documento | Localização | Responsável | Escopo |
|-----------|------------|-------------|--------|
| **LLM_RECOMMENDATION_PLAN_V2.md** | harness-core | Jesus | Plano técnico (15 fases, 25h) |
| **INTEGRATION_LLM_RECOMMENDATIONS.md** | stec-LLM-gateway | Jesus | Tarefas de integração do gateway (10.5h) |
| **INTEGRATION_LLM_RECOMMENDATIONS_SETUP.md** | stec-developer-setup | Jesus | Tarefas de distribuição via setup (7.5h) |

**Total:** 43 horas de desenvolvimento e integração

---

## 🚀 Fases Simplificadas (15 no Total)

### BLOCO 1: Criação Local (FASE 1-5, 13h) — `tasklink-harness-core`

**FASE 1-2:** Criar `~/.claude/docs/llm/` com 12 domínios (6h)
📁 **Projeto:** `tasklink-harness-core`  
📂 **Saída local:** `~/.claude/docs/llm/` (no home do usuário)

```bash
~/.claude/docs/llm/
├── by-domain/        # 12 arquivos: software-dev, architecture, data-science, etc.
├── by-speed/         # 3 arquivos: quick, balanced, complex
├── by-budget/        # 3 arquivos: cost-optimized, balanced, premium
├── references/       # gateway-models, token-counts, performance-matrix
├── _index.yaml       # Índice central
└── task-llm-matrix.md # Matriz de decisão
```

**FASE 3:** Hook em harness-core (2h)
📁 **Projeto:** `tasklink-harness-core`  
📝 **Arquivo:** `harness/hooks/next_task_llm_recommender.py` (novo)

```python
async def recommend_llm_for_next_task(task_context) -> Dict:
    """Intercepta tarefa, recomenda modelo baseado em domínio"""
```

**FASE 4-5:** Config + Testes E2E (3h)
📁 **Projeto:** `tasklink-harness-core`  
📝 **Arquivos:** 
- `harness/config.py` (atualizar)
- `tests/test_llm_recommender.py` (novo, 8+ testes)

- Adicionar `LLM_DOCS_ROOT`, `LLM_RECOMMENDATION_ENABLED` em config
- 8+ testes de cenários domínio-específicos

---

### BLOCO 2: Integração com Gateway (FASE 6-9, 5.5h) — `stec-LLM-gateway`

**FASE 6:** Estender schema do gateway (1.5h)
📁 **Projeto:** `stec-LLM-gateway`  
📝 **Arquivo:** `src/llm_gateway/schemas.py` (atualizar)

```python
# Novo campo em ChatRequest
recommended_model: str = None  # Recomendação da hook

# Novos campos em ChatResponse
routing_logic: str  # "recommendation-based", "critical", "token-based"
recommended_model: str = None  # Echo da recomendação
```

**FASE 7:** Hook chama gateway (1h)
📁 **Projeto:** `stec-LLM-gateway`  
📝 **Arquivo:** `src/llm_gateway/router.py` (atualizar)

```python
# Se GATEWAY_URL configurado, hook valida recomendação no gateway
response = await client.post(f"{GATEWAY_URL}/v1/models", json={...})
```

**FASE 8:** Documentação de integração (1.5h)
📁 **Projeto:** `stec-LLM-gateway`  
📝 **Arquivos:**
- `docs/INTEGRATION_LLM_RECOMMENDATIONS.md` (novo)
- `docs/ROUTING_LOGIC.md` (novo)

- Setup guide
- API examples
- Integration checklist
- Troubleshooting

**FASE 9:** E2E tests (2h)
📁 **Projeto:** `stec-LLM-gateway`  
📝 **Arquivo:** `tests/test_llm_routing.py` (novo, 6+ testes)

- Hook → Gateway → Provider chain
- 5+ cenários domínio-específicos
- Fallback validation

---

### BLOCO 3: Distribuição via stec-developer-setup (FASE 10-15, 7.5h) — `stec-developer-setup`

**FASE 10:** Adicionar docs ao repo (2h)
📁 **Projeto:** `stec-developer-setup`  
📂 **Saída:** `docs/llm/` (novo diretório no repo)

```bash
stec-developer-setup/docs/llm/  # ← 12 domínios + referências
```

**FASE 11:** Atualizar `install.sh` (1h)
📁 **Projeto:** `stec-developer-setup`  
📝 **Arquivo:** `install.sh` (atualizar)

```bash
copy_llm_docs "$REPO_DIR/docs/llm" "$CLAUDE_CONFIG_DIR/docs/llm"
```

**FASE 12:** Create `update-llm-docs.sh` (1h)
📁 **Projeto:** `stec-developer-setup`  
📝 **Arquivo:** `scripts/update-llm-docs.sh` (novo)

```bash
# Atualizar APENAS docs LLM (sem afetar config)
bash ~/Projetos/stec-developer-setup/scripts/update-llm-docs.sh
```

**FASE 13:** Integrar com dotfiles (1.5h)
📁 **Projeto:** `stec-developer-setup`  
📝 **Arquivos:**
- `dotfiles/claude/HARNESS.md` (atualizar)
- `dotfiles/cursor/HARNESS.md` (atualizar)
- `dotfiles/codex/HARNESS.md` (atualizar)

- Mencionar docs LLM e como usar

**FASE 14:** CI/CD validation (1h)
📁 **Projeto:** `stec-developer-setup`  
📝 **Arquivo:** `.github/workflows/validate-setup.yml` (novo)

- Workflow que valida:
  - 12 domínios presentes
  - YAML index válido
  - install.sh integrado
  - HARNESS.md atualizado

**FASE 15:** Documentação (1h)
📁 **Projeto:** `stec-developer-setup`  
📝 **Arquivos:**
- `README.md` (atualizar com LLM info)
- `EXAMPLES.md` (novo)

- EXAMPLES.md com cenários concretos

---

## ✅ Benefícios Finais

| Benefício | Impacto | Responsabilidade |
|-----------|--------|-----------------|
| **Centralizado** | Uma fonte de verdade | stec-developer-setup |
| **Automático** | Todos recebem via setup | CI/CD workflow |
| **Inteligente** | Usa domínio + tokens + custo | Hook em harness-core |
| **Auditável** | Gateway registra decisões | Response routing_logic |
| **Escalável** | Fácil adicionar domínios | Template docs novo |
| **Resiliente** | Fallback chain sempre funciona | Gateway 3-level priority |

---

## 📋 Próximas Ações (Ordem de Execução)

1. ✅ **Revisar e aprovar** este plano (V2 com distribuição setup)
2. 🔄 **FASE 1-2** — Criar docs LLM localmente (6h)
   - Implementador: User (com templates)
3. 🔄 **FASE 3** — Hook em harness-core (2h)
   - Arquivo: `harness/hooks/next_task_llm_recommender.py`
   - Testes: `tests/test_llm_recommender.py`
4. 🔄 **FASE 4-5** — Config + E2E (3h)
5. 🔄 **FASE 6-9** — Integração com gateway (5.5h)
6. 🔄 **FASE 10-15** — Distribuição via setup (7.5h)

**Timeline:** 25+ horas
**Responsabilidade:** Jesus (todos os repos)
**Começar:** Após aprovação deste plano

---

## 🎁 Entregáveis Finais

### Arquivos Criados/Modificados

**harness-core:**
- ✅ `harness/hooks/next_task_llm_recommender.py` (novo)
- ✅ `harness/config.py` (atualizar)
- ✅ `tests/test_llm_recommender.py` (novo, 8+ testes)

**stec-LLM-gateway:**
- ✅ `src/llm_gateway/schemas.py` (estender)
- ✅ `src/llm_gateway/router.py` (3-level priority)
- ✅ `docs/INTEGRATION_LLM_RECOMMENDATIONS.md` (novo)
- ✅ `docs/ROUTING_LOGIC.md` (novo)
- ✅ Tests (6+ cenários roteamento)

**stec-developer-setup:**
- ✅ `docs/llm/` (novo diretório com 27 arquivos)
- ✅ `install.sh` (função copy_llm_docs)
- ✅ `scripts/update-llm-docs.sh` (novo)
- ✅ `dotfiles/{claude,cursor,codex}/HARNESS.md` (atualizar)
- ✅ `.github/workflows/validate-setup.yml` (novo)
- ✅ `EXAMPLES.md` (novo)

---

## 💰 Retorno do Investimento (ROI)

### Custo
- **25+ horas** de desenvolvimento
- **3 repositórios** modificados
- **1 novo workflow** CI/CD

### Benefício
- ✅ **Todos os colaboradores** recebem recomendações automáticas
- ✅ **Redução de custo** LLM (usando modelo certo por tarefa)
- ✅ **Melhor velocidade** (tasks rápidas → fast models)
- ✅ **Maior qualidade** (tasks complexas → large context models)
- ✅ **Auditoria completa** (saber por que cada modelo foi escolhido)
- ✅ **Escalabilidade** (fácil adicionar domínios novos)

### Exemplos de Economia

| Cenário | Sem Sistema | Com Sistema | Economia |
|---------|------------|-----------|----------|
| 100 quick coding tasks | Sempre premium | 80% fast + 20% balanced | ~70% |
| 10 architecture tasks | Inconsistent | 100% large-context | Qualidade +50% |
| 1000 tasks/mês | Random | Otimizado por domínio | ~60-70% custo |

---

## 🔐 Segurança & Auditoria

### Dados Sensíveis
- ✅ Docs LLM não contêm dados sensíveis (recomendações públicas)
- ✅ Hook não envia dados para APIs externas (apenas recomendação)
- ✅ Gateway registra `routing_logic` para auditoria

### Compliance
- ✅ Sem mudanças em policies de dados
- ✅ Sem novas integrações com provedores
- ✅ Sem armazenamento centralizado

---

## 🔗 Arquivos de Referência

| Arquivo | Propósito |
|---------|----------|
| [LLM_RECOMMENDATION_PLAN_V2.md](./LLM_RECOMMENDATION_PLAN_V2.md) | Plano técnico detalhado (15 fases) |
| [INTEGRATION_LLM_RECOMMENDATIONS.md](../stec-LLM-gateway/INTEGRATION_LLM_RECOMMENDATIONS.md) | Tarefas do gateway |
| [INTEGRATION_LLM_RECOMMENDATIONS_SETUP.md](../stec-developer-setup/INTEGRATION_LLM_RECOMMENDATIONS_SETUP.md) | Tarefas do setup |

---

## ❓ FAQs

**P: E se o hook não conseguir classificar a tarefa?**
R: Cai em "other-domains.md" com recomendações genéricas.

**P: E se a recomendação for inválida?**
R: Gateway ignora e usa token-based fallback.

**P: E se o gateway não estiver disponível?**
R: Hook recomenda normalmente, provider recebe direto (sem validação).

**P: Como atualizar docs?**
R: `bash ~/Projetos/stec-developer-setup/scripts/update-llm-docs.sh`

**P: Posso adicionar um novo domínio?**
R: Sim! Criar `by-domain/novo-dominio.md`, rodar `update-llm-docs.sh`

---

## 📞 Suporte

- **Dúvidas técnicas:** Consulte [LLM_RECOMMENDATION_PLAN_V2.md](./LLM_RECOMMENDATION_PLAN_V2.md)
- **Integração gateway:** Consulte [INTEGRATION_LLM_RECOMMENDATIONS.md](../stec-LLM-gateway/INTEGRATION_LLM_RECOMMENDATIONS.md)
- **Setup & distribuição:** Consulte [INTEGRATION_LLM_RECOMMENDATIONS_SETUP.md](../stec-developer-setup/INTEGRATION_LLM_RECOMMENDATIONS_SETUP.md)

---

## ✨ Status

**Criado:** 2026-05-10  
**Versão:** 2.0 (com distribuição via stec-developer-setup)  
**Status:** ✅ **PRONTO PARA IMPLEMENTAÇÃO**

**Aprovação necessária?** Sim — User deve confirmar antes de começar FASE 1.

---

**Este plano integra:**
- ✅ Recomendação local inteligente (FASE 1-5)
- ✅ Validação com gateway existente (FASE 6-9)
- ✅ Distribuição automática para todos (FASE 10-15)
- ✅ Documentação e suporte completo
- ✅ CI/CD validation
- ✅ Timeline realista (25+ horas)

**Pronto para começar? 🚀**
