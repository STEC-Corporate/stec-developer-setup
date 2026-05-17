---
title: LLM Recommendation System — Implementation Plan V2
subtitle: "Com Integração stec-developer-setup para Distribuição Global"
date: 2026-05-10
status: Approved
---

# 📋 Plano Integrado: Sistema de Recomendação LLM v2.0

## 🎯 Objetivo

Implementar um **sistema inteligente de recomendação de modelos LLM** baseado em domínio e tipo de tarefa, distribuir documentação para todos os colaboradores via `stec-developer-setup`, e integrar com o `stec-LLM-gateway` existente.

**Fórmula:**
```
User Task → Hook (recomenda modelo baseado em domínio)
         → Gateway (valida recomendação vs token-count)
         → Provider (executa com modelo escolhido)
```

---

## 📍 Mapa de Projetos — Distribuição de Trabalho

| Bloco | Fases | Projeto | Responsável | Horas | Escopo |
|-------|-------|---------|-------------|-------|--------|
| **1** | 1-5 | `tasklink-harness-core` | Jesus | 13h | Criar docs locais + hook + config + testes |
| **2** | 6-9 | `stec-LLM-gateway` | Jesus | 5.5h | Integrar recomendação no gateway |
| **3** | 10-15 | `stec-developer-setup` | Jesus | 7.5h | Distribuir docs para todos via setup |
| | | | **TOTAL** | **25h+** | Sistema completo end-to-end |

---

## 📊 Estrutura de Fases

| Fase | Projeto | Escopo | Duração | Status |
|------|---------|--------|---------|--------|
| **FASE 1-2** | `tasklink-harness-core` | Criar estrutura LLM docs localmente | 6h | Pendente |
| **FASE 3** | `tasklink-harness-core` | Hook funcional em harness-core | 2h | Pendente |
| **FASE 4-5** | `tasklink-harness-core` | Config + testes E2E | 3h | Pendente |
| **FASE 6** | `stec-LLM-gateway` | Estender gateway com `recommended_model` | 1.5h | Pendente |
| **FASE 7** | `stec-LLM-gateway` | Integrar gateway na recomendação | 1h | Pendente |
| **FASE 8** | `stec-LLM-gateway` | Documentação de integração no gateway | 1.5h | Pendente |
| **FASE 9** | `stec-LLM-gateway` | Testes E2E hook → gateway → provider | 2h | Pendente |
| **FASE 10** | `stec-developer-setup` | Adicionar docs LLM ao repo | 2h | Pendente |
| **FASE 11** | `stec-developer-setup` | Atualizar install.sh para distribuir | 1h | Pendente |
| **FASE 12** | `stec-developer-setup` | Criar script de update incremental | 1h | Pendente |
| **FASE 13** | `stec-developer-setup` | Integrar com dotfiles | 1.5h | Pendente |
| **FASE 14** | `stec-developer-setup` | Validar distribuição em CI/CD | 1h | Pendente |
| **FASE 15** | `stec-developer-setup` | Documentar setup para colaboradores | 1h | Pendente |
| | | **TOTAL** | **25+ horas** | |

---

# BLOCO 1: Criação Local de Recursos LLM (FASE 1-5)

## FASE 1 ✅ — Criar Estrutura de Diretórios

**Responsabilidade:** User (manual ou via script)  
**Localização:** `~/.claude/docs/llm/`  
**Duração:** 1h

```bash
mkdir -p ~/.claude/docs/llm/{by-domain,by-speed,by-budget,templates,references}

# Estrutura final:
~/.claude/docs/llm/
├── README.md                        # Guia geral
├── _index.yaml                      # Índice central (FASE 4)
├── by-domain/
│   ├── software-development.md      # Python, JS, Go, etc.
│   ├── software-engineering.md      # Testing, refactoring, architecture
│   ├── architecture.md              # System design, patterns
│   ├── idea-management.md           # TaskLink ideas
│   ├── task-management.md           # Todoist, task breakdown
│   ├── product-management.md        # Specs, requirements, roadmaps
│   ├── data-science.md              # ML, notebooks, stats
│   ├── statistics.md                # Analysis, interpretation
│   ├── technology-selection.md      # Stack decisions
│   ├── language-translation.md      # i18n, transcription
│   ├── fintech.md                   # Financial systems
│   └── other-domains.md             # Catchall
├── by-speed/
│   ├── quick-answers.md             # <1 min → fast models
│   ├── coding-tasks.md              # 2-5 min → balanced
│   └── complex-analysis.md          # >10 min → large context
├── by-budget/
│   ├── cost-optimized.md            # moonshot-v1-8k
│   ├── mid-tier.md                  # abab6.5s-chat
│   └── premium.md                   # moonshot-v1-128k
├── templates/
│   ├── domain-template.md           # Template para novo domínio
│   └── recommendation-template.md   # Template para recomendação
├── references/
│   ├── gateway-models.md            # Modelos disponíveis no gateway
│   ├── token-counts.md              # Estimativas de tokens por tarefa
│   └── performance-matrix.md        # Speed/accuracy trade-offs
└── task-llm-matrix.md               # Matriz centralizada (FASE 4)
```

---

## FASE 2 ✅ — Documentar 12 Domínios

**Responsabilidade:** User (com templates)  
**Localização:** `~/.claude/docs/llm/by-domain/`  
**Duração:** 4h  
**Saída:** 12 arquivos .md com recomendações LLM

Cada arquivo segue o template:
```markdown
# {Domínio}

## 🎯 Quando usar

- Tarefa 1: [Descrição]
- Tarefa 2: [Descrição]

## 📊 Recomendações LLM

### Quick Tasks (< 500 tokens)
- **Modelo:** moonshot-v1-8k
- **Caso:** {descrição}
- **Custo:** ⭐ Otimizado

### Tarefas Padrão (500-4000 tokens)
- **Modelo:** abab6.5s-chat
- **Caso:** {descrição}
- **Custo:** ⭐⭐ Balanceado

### Análises Complexas (> 4000 tokens)
- **Modelo:** moonshot-v1-128k
- **Caso:** {descrição}
- **Custo:** ⭐⭐⭐ Premium

## 🔗 Referências
- [Documentação do modelo](#)
- [Exemplos](#)
```

**Domínios (12 arquivos):**

1. **software-development.md** — Coding: Python, Node, Go, Java, etc.
2. **software-engineering.md** — Testing, refactoring, PR reviews, debugging
3. **architecture.md** — System design, patterns, scalability
4. **idea-management.md** — TaskLink: create, triage, approve ideas
5. **task-management.md** — Todoist: breakdown, prioritization, sequencing
6. **product-management.md** — Requirements, specs, user stories, roadmaps
7. **data-science.md** — ML, notebooks, EDA, model training
8. **statistics.md** — Analysis, hypothesis testing, visualization
9. **technology-selection.md** — Framework/library decisions, trade-off analysis
10. **language-translation.md** — i18n, code-switching, transcription
11. **fintech.md** — Financial calculations, compliance, risk analysis
12. **other-domains.md** — Default recommendations for unlisted domains

---

## FASE 3 ✅ — Hook Funcional em harness-core

**Responsabilidade:** harness-core  
**Arquivo:** `harness/hooks/next_task_llm_recommender.py`  
**Duração:** 2h  
**Saída:** Hook que intercepta "next task" e recomenda modelos

```python
# harness/hooks/next_task_llm_recommender.py

async def recommend_llm_for_next_task(
    task_context: Dict[str, Any],  # {domain, task_type, token_estimate, ...}
    llm_docs_root: str = None,      # ~/.claude/docs/llm/
) -> Dict[str, Any]:
    """
    Intercepta quando uma LLM indicar a próxima tarefa e recomenda os melhores modelos.
    
    Args:
        task_context: Contexto da tarefa (domínio, tipo, estimativa de tokens)
        llm_docs_root: Raiz dos documentos LLM (env var: LLM_DOCS_ROOT)
    
    Returns:
        {
            "recommended_model": "moonshot-v1-128k",  # Recomendação principal
            "fallback_models": ["abab6.5s-chat", "moonshot-v1-8k"],
            "reasoning": "Análise complexa (5K+ tokens) requer contexto grande",
            "cost_estimate": "$0.15",
            "speed_estimate": "15s",
            "source": "by-domain/architecture.md"
        }
    """
    
    # 1. Classificar tarefa
    domain = classify_domain(task_context)  # ex: "architecture"
    task_type = task_context.get("type", "general")  # ex: "system-design"
    token_estimate = estimate_tokens(task_context)  # ex: 5200
    
    # 2. Carregar documentação LLM
    llm_docs = load_llm_docs(llm_docs_root)
    domain_doc = llm_docs[domain]  # ex: by-domain/architecture.md
    
    # 3. Extrair recomendações
    recommendations = extract_recommendations(domain_doc)
    
    # 4. Selecionar modelo baseado em tokens + domínio
    selected = select_model(token_estimate, recommendations)
    
    # 5. Retornar com fallback chain
    return {
        "recommended_model": selected["model"],
        "fallback_models": get_fallback_chain(selected["model"]),
        "reasoning": selected["reasoning"],
        "cost_estimate": selected["cost"],
        "speed_estimate": selected["speed"],
        "source": f"by-domain/{domain}.md"
    }
```

**Integração com harness:**
- Exportar em `harness/hooks/__init__.py`
- Registrar em `harness/__init__.py`
- Usar em hooks do Claude Code (settings.json)

---

## FASE 4 ✅ — Config + Índice Centralizado

**Responsabilidade:** harness-core  
**Arquivos:**
- `harness/config.py` — Adicionar config para LLM
- `~/.claude/docs/llm/_index.yaml` — Índice centralizado
- `~/.claude/docs/llm/task-llm-matrix.md` — Matriz de decisão

**Duração:** 1h

**Config em harness/config.py:**
```python
class HarnessConfig:
    # ... existing config ...
    
    # LLM Recommendation
    LLM_DOCS_ROOT = os.getenv("LLM_DOCS_ROOT", "~/.claude/docs/llm")
    LLM_RECOMMENDATION_ENABLED = os.getenv("LLM_RECOMMENDATION_ENABLED", "true").lower() == "true"
    GATEWAY_URL = os.getenv("GATEWAY_URL", "http://localhost:8200")
    GATEWAY_API_KEY = os.getenv("GATEWAY_API_KEY", "")
```

**Índice em _index.yaml:**
```yaml
# ~/.claude/docs/llm/_index.yaml
name: LLM Recommendation System
version: "1.0"
last_updated: 2026-05-10

domains:
  - id: software-development
    file: by-domain/software-development.md
    priority: high
  - id: software-engineering
    file: by-domain/software-engineering.md
  # ... 10 mais ...

models:
  - id: moonshot-v1-8k
    cost: cheap
    speed: fast
    max_tokens: 8000
  - id: abab6.5s-chat
    cost: medium
    speed: balanced
    max_tokens: 4096
  - id: moonshot-v1-128k
    cost: premium
    speed: slow
    max_tokens: 128000

gateway:
  enabled: true
  url: "http://localhost:8200"
  health_check: "/v1/models"
```

---

## FASE 5 ✅ — Testes E2E da Recomendação

**Responsabilidade:** harness-core  
**Arquivo:** `tests/test_llm_recommender.py`  
**Duração:** 1h  
**Saída:** 8+ testes

```python
# tests/test_llm_recommender.py

@pytest.mark.asyncio
async def test_recommend_software_development():
    """Recomenda moonshot-v1-8k para coding task pequena"""
    result = await recommend_llm_for_next_task({
        "domain": "software-development",
        "task_type": "code-generation",
        "tokens": 300
    })
    assert result["recommended_model"] == "moonshot-v1-8k"

@pytest.mark.asyncio
async def test_recommend_architecture_large_context():
    """Recomenda moonshot-v1-128k para design complexo"""
    result = await recommend_llm_for_next_task({
        "domain": "architecture",
        "task_type": "system-design",
        "tokens": 5200
    })
    assert result["recommended_model"] == "moonshot-v1-128k"

# ... 6 testes mais ...
```

---

# BLOCO 2: Integração com Gateway (FASE 6-9)

## FASE 6 ✅ — Estender Gateway com `recommended_model`

**Responsabilidade:** stec-LLM-gateway  
**Arquivos:**
- `src/llm_gateway/schemas.py` — Adicionar campo ChatRequest
- `src/llm_gateway/router.py` — Atualizar lógica de roteamento

**Duração:** 1.5h

**Mudança em schemas.py:**
```python
class ChatRequest(BaseModel):
    model: str  # ex: "abab6.5s-chat" (opcional, usa roteamento default)
    recommended_model: str = None  # ex: "moonshot-v1-128k" (nova recomendação)
    messages: List[Dict[str, str]]
    task_type: str = None  # ex: "critical"
    max_tokens: int = None
    temperature: float = 0.7

class ChatResponse(BaseModel):
    model_used: str  # Qual modelo foi realmente usado
    recommended_model: str = None  # Qual foi recomendado (se fornecido)
    completion: str
    tokens_used: int
    cost: float
    routing_logic: str  # Como chegou ao modelo final
```

**Mudança em router.py:**
```python
def choose_provider(
    chat_request: ChatRequest,
    prompt_tokens: int,
) -> str:
    """
    Roteamento inteligente:
    1. Se recommended_model foi recomendado e é válido → usar
    2. Se task_type=critical → usar moonshot-v1-128k
    3. Senão → usar token-based routing
    """
    
    # Prioridade 1: Recomendação da hook
    if chat_request.recommended_model and is_valid_model(chat_request.recommended_model):
        return chat_request.recommended_model
    
    # Prioridade 2: Critical tasks
    if chat_request.task_type == "critical":
        return "moonshot-v1-128k"
    
    # Prioridade 3: Token-based (default)
    if prompt_tokens < 500:
        return "moonshot-v1-8k"
    elif prompt_tokens < 4000:
        return "abab6.5s-chat"
    else:
        return "moonshot-v1-128k"
```

---

## FASE 7 ✅ — Integrar Gateway na Recomendação

**Responsabilidade:** harness-core  
**Arquivo:** `harness/hooks/next_task_llm_recommender.py`  
**Duração:** 1h

```python
async def recommend_llm_for_next_task(
    task_context: Dict[str, Any],
    llm_docs_root: str = None,
    call_gateway: bool = True,  # Novo parâmetro
) -> Dict[str, Any]:
    """
    Versão melhorada: chama gateway para validar recomendação
    """
    
    # 1-3. Classificar + carregar docs + extrair recomendações
    domain = classify_domain(task_context)
    recommendations = extract_recommendations(load_llm_docs(llm_docs_root))
    selected = select_model(task_context.get("tokens", 1000), recommendations)
    
    # NOVO: Chamar gateway para validação/refinamento
    if call_gateway and HarnessConfig.GATEWAY_URL:
        async with httpx.AsyncClient() as client:
            response = await client.post(
                f"{HarnessConfig.GATEWAY_URL}/v1/models",
                json={
                    "recommended_model": selected["model"],
                    "task_type": task_context.get("type"),
                    "tokens": task_context.get("tokens"),
                }
            )
            if response.status_code == 200:
                gateway_validation = response.json()
                selected["model"] = gateway_validation.get("model_used", selected["model"])
                selected["routing_logic"] = gateway_validation.get("routing_logic")
    
    return {
        "recommended_model": selected["model"],
        "fallback_models": get_fallback_chain(selected["model"]),
        "reasoning": selected["reasoning"],
        "routing_logic": selected.get("routing_logic", "recommendation-based"),
        "source": f"by-domain/{domain}.md",
        "gateway_validated": call_gateway and HarnessConfig.GATEWAY_URL != ""
    }
```

---

## FASE 8 ✅ — Documentação de Integração no Gateway

**Responsabilidade:** stec-LLM-gateway  
**Arquivo:** `docs/INTEGRATION_LLM_RECOMMENDATIONS.md`  
**Duração:** 1.5h

Documento com:

### 📋 Setup Guide
```markdown
## 1. Instalar harness-core
pip install tasklink-harness-core

## 2. Configurar env vars
export LLM_DOCS_ROOT=~/.claude/docs/llm
export GATEWAY_URL=http://localhost:8200
export GATEWAY_API_KEY=your-api-key
export LLM_RECOMMENDATION_ENABLED=true

## 3. Ativar hook
# Em Claude Code settings.json:
{
  "hooks": {
    "pre_tool_use": "python ~/.claude/hooks/llm_recommender.py"
  }
}
```

### 💻 API Examples
```python
# Chamada com recomendação
response = await client.post(
    "http://localhost:8200/v1/chat/completions",
    json={
        "messages": [...],
        "recommended_model": "moonshot-v1-128k",  # Recomendação da hook
        "task_type": "architecture",
    }
)
```

### ✅ Integration Checklist
- [ ] harness-core instalado
- [ ] LLM docs distribuídos via stec-developer-setup
- [ ] Hook testado em Claude Code
- [ ] Gateway retorna `model_used` e `routing_logic`
- [ ] Fallback chain funcionando
- [ ] Métricas sendo coletadas

### 🐛 Troubleshooting
- Gateway não encontrado → Verificar GATEWAY_URL
- Modelo recomendado ignorado → Gateway usa token-based como fallback
- Sem recomendação → Usar endpoint padrão (roteamento por tokens)

---

## FASE 9 ✅ — Testes E2E Hook → Gateway → Provider

**Responsabilidade:** harness-integration  
**Arquivo:** `tests/test_llm_e2e.py`  
**Duração:** 2h  
**Saída:** 5+ cenários E2E

```python
# tests/test_llm_e2e.py

@pytest.mark.asyncio
async def test_e2e_architecture_task_to_gateway():
    """
    Fluxo completo:
    Task (architecture) → Hook (recommends model) → Gateway → Provider
    """
    task = {"domain": "architecture", "tokens": 5000}
    
    # 1. Hook recomenda
    recommendation = await recommend_llm_for_next_task(task)
    assert recommendation["recommended_model"] == "moonshot-v1-128k"
    
    # 2. Gateway valida
    gateway_response = await mock_gateway_call(recommendation)
    assert gateway_response["model_used"] == "moonshot-v1-128k"
    
    # 3. Provider executa
    result = await call_provider(gateway_response["model_used"])
    assert result.status_code == 200

# ... 4 testes E2E mais (dev, data-science, fintech, fallback) ...
```

---

# BLOCO 3: Distribuição via stec-developer-setup (FASE 10-15)

## FASE 10 — Adicionar Docs LLM ao stec-developer-setup

**Responsabilidade:** stec-developer-setup  
**Localização:** `docs/llm/` (novo diretório)  
**Duração:** 2h  
**Saída:** 12 documentos LLM no repositório setup

```bash
stec-developer-setup/
├── docs/                    # NOVO
│   └── llm/                # NOVO — Documentação LLM central
│       ├── README.md
│       ├── _index.yaml
│       ├── by-domain/
│       │   ├── software-development.md
│       │   ├── software-engineering.md
│       │   ├── architecture.md
│       │   ├── idea-management.md
│       │   ├── task-management.md
│       │   ├── product-management.md
│       │   ├── data-science.md
│       │   ├── statistics.md
│       │   ├── technology-selection.md
│       │   ├── language-translation.md
│       │   ├── fintech.md
│       │   └── other-domains.md
│       ├── by-speed/
│       │   ├── quick-answers.md
│       │   ├── coding-tasks.md
│       │   └── complex-analysis.md
│       ├── by-budget/
│       │   ├── cost-optimized.md
│       │   ├── mid-tier.md
│       │   └── premium.md
│       ├── references/
│       │   ├── gateway-models.md
│       │   ├── token-counts.md
│       │   └── performance-matrix.md
│       └── task-llm-matrix.md
├── dotfiles/               # Existente
│   ├── claude/
│   ├── cursor/
│   ├── codex/
│   └── home/
└── install.sh             # ATUALIZAR (FASE 11)
```

**Tarefas:**
1. Criar diretório `docs/llm/` no repositório
2. Copiar os 12 documentos de `~/.claude/docs/llm/by-domain/` para cá
3. Copiar `_index.yaml` e arquivos de referência
4. Adicionar `docs/llm/README.md` com guia de uso local

---

## FASE 11 — Atualizar install.sh para Distribuir LLM Docs

**Responsabilidade:** stec-developer-setup  
**Arquivo:** `install.sh`  
**Duração:** 1h

```bash
# Adicionar função helper para copiar docs
copy_llm_docs() {
    local SOURCE_DIR="$REPO_DIR/docs/llm"
    local DEST_DIR="$1"  # ~/.claude/docs/llm
    local TOOL_NAME="$2"

    echo "📚 Instalando LLM Recommendation Docs ($TOOL_NAME)..."

    if [ ! -d "$SOURCE_DIR" ]; then
        echo "  ⚠️  LLM docs não encontrados em $SOURCE_DIR"
        return
    fi

    mkdir -p "$DEST_DIR"

    # Copiar estrutura completa
    cp -r "$SOURCE_DIR"/* "$DEST_DIR/" 2>/dev/null || true
    echo "  ✅ LLM docs instalados em $DEST_DIR"
}

# ... dentro da função main ...

# Instalar Claude Code com LLM docs
if [[ "$INSTALL_WSL" == "1" ]]; then
    copy_dotfiles "$DOTFILES_DIR/claude" "$CLAUDE_CONFIG_DIR" "Claude Code (WSL/Linux)"
    copy_llm_docs "$CLAUDE_CONFIG_DIR/docs/llm" "Claude Code"
fi

# Instalar Cursor com LLM docs
if [[ "$INSTALL_WSL" == "1" ]]; then
    copy_dotfiles "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor (WSL/Linux)"
    copy_llm_docs "$CURSOR_CONFIG_DIR/docs/llm" "Cursor"
fi

# Instalar Codex com LLM docs
if [[ "$INSTALL_WSL" == "1" ]]; then
    copy_dotfiles "$DOTFILES_DIR/codex" "$CODEX_CONFIG_DIR" "Codex (WSL/Linux)"
    copy_llm_docs "$CODEX_CONFIG_DIR/docs/llm" "Codex"
fi
```

---

## FASE 12 — Criar Script de Update Incremental

**Responsabilidade:** stec-developer-setup  
**Arquivo:** `scripts/update-llm-docs.sh` (novo)  
**Duração:** 1h

Script que permite atualizar APENAS os docs LLM sem afetar outros arquivos:

```bash
#!/bin/bash
# scripts/update-llm-docs.sh
# Atualiza apenas LLM recommendation docs (sem sobrescrever config)

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "🔄 Atualizando LLM Recommendation Docs..."

# Detectar ambientes
source "$REPO_DIR/scripts/detect-env.sh"

# Update apenas docs (não sobrescreve CLAUDE.md, settings.json, etc.)
cp -r "$REPO_DIR/docs/llm/by-domain"/* "$CLAUDE_CONFIG_DIR/docs/llm/by-domain/" 2>/dev/null || true
cp -r "$REPO_DIR/docs/llm/by-speed"/* "$CLAUDE_CONFIG_DIR/docs/llm/by-speed/" 2>/dev/null || true
cp -r "$REPO_DIR/docs/llm/by-budget"/* "$CLAUDE_CONFIG_DIR/docs/llm/by-budget/" 2>/dev/null || true
cp -r "$REPO_DIR/docs/llm/references"/* "$CLAUDE_CONFIG_DIR/docs/llm/references/" 2>/dev/null || true
cp "$REPO_DIR/docs/llm/_index.yaml" "$CLAUDE_CONFIG_DIR/docs/llm/" 2>/dev/null || true
cp "$REPO_DIR/docs/llm/task-llm-matrix.md" "$CLAUDE_CONFIG_DIR/docs/llm/" 2>/dev/null || true

echo "✅ LLM docs atualizados em:"
echo "   • $CLAUDE_CONFIG_DIR/docs/llm/"
echo "   • $CURSOR_CONFIG_DIR/docs/llm/"
echo "   • $CODEX_CONFIG_DIR/docs/llm/"
```

**Uso:**
```bash
cd ~/Projetos/stec-developer-setup
bash scripts/update-llm-docs.sh
```

---

## FASE 13 — Integrar com Dotfiles (claude/, cursor/, codex/)

**Responsabilidade:** stec-developer-setup  
**Arquivos:**
- `dotfiles/claude/HARNESS.md` — Mencionar LLM docs
- `dotfiles/cursor/HARNESS.md` — Mencionar LLM docs
- `dotfiles/codex/instructions.md` — Mencionar LLM docs

**Duração:** 1.5h

**Adicionar seção em HARNESS.md:**
```markdown
## 📚 LLM Recommendation Docs

Após instalar, você tem acesso a documentação que recomenda os melhores modelos LLM para sua tarefa:

```bash
# Visualizar recomendações para desenvolvimento de software
cat ~/.claude/docs/llm/by-domain/software-development.md

# Ou navegar por velocidade
cat ~/.claude/docs/llm/by-speed/quick-answers.md

# Ou por orçamento
cat ~/.claude/docs/llm/by-budget/cost-optimized.md
```

Os docs são automáticos carregados quando Claude, Cursor ou Codex iniciam.

**Env vars:**
```bash
export LLM_DOCS_ROOT=~/.claude/docs/llm           # Onde estão os docs
export LLM_RECOMMENDATION_ENABLED=true            # Ativar recomendações
export GATEWAY_URL=http://localhost:8200          # Gateway URL
export GATEWAY_API_KEY=your-key                   # API key (opcional)
```
```

---

## FASE 14 — Validar Distribuição em CI/CD

**Responsabilidade:** stec-developer-setup  
**Arquivo:** `.github/workflows/validate-setup.yml` (novo)  
**Duração:** 1h

Workflow que valida:
1. ✅ Todos os 12 domínios existem em `docs/llm/by-domain/`
2. ✅ `_index.yaml` é válido
3. ✅ `install.sh` copia arquivos corretamente
4. ✅ Markdown sintaxe está correta
5. ✅ Referências entre arquivos funcionam

```yaml
name: Validate Setup Distribution

on: [push, pull_request]

jobs:
  validate-llm-docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Check LLM docs structure
        run: |
          # Verificar domínios
          for domain in software-development software-engineering architecture \
                        idea-management task-management product-management \
                        data-science statistics technology-selection \
                        language-translation fintech other-domains; do
            if [ ! -f "docs/llm/by-domain/$domain.md" ]; then
              echo "❌ Missing: docs/llm/by-domain/$domain.md"
              exit 1
            fi
          done
          echo "✅ All 12 domains present"
      
      - name: Validate YAML index
        run: |
          pip install pyyaml
          python -c "import yaml; yaml.safe_load(open('docs/llm/_index.yaml'))"
          echo "✅ _index.yaml is valid YAML"
      
      - name: Check install.sh references LLM docs
        run: |
          if ! grep -q "copy_llm_docs" install.sh; then
            echo "❌ install.sh missing LLM docs integration"
            exit 1
          fi
          echo "✅ install.sh integrates LLM docs"
```

---

## FASE 15 — Documentar Setup para Colaboradores

**Responsabilidade:** stec-developer-setup  
**Arquivo:** `docs/llm/README.md` (criar) + atualizar `README.md` principal  
**Duração:** 1h

**docs/llm/README.md:**
```markdown
# 📚 LLM Recommendation Documentation

Esta documentação está **automaticamente distribuída** para todos os colaboradores via `stec-developer-setup`.

## 🎯 O que é

Um sistema que recomenda os **melhores modelos LLM** baseado em:
- **Domínio** da tarefa (software-development, architecture, data-science, etc.)
- **Token count** estimado (quick, standard, complex)
- **Orçamento** disponível (cost-optimized, balanced, premium)

## 📁 Estrutura

- **by-domain/** — Recomendações por tipo de atividade (12 domínios)
- **by-speed/** — Recomendações por tempo de execução
- **by-budget/** — Recomendações por custo
- **references/** — Informações técnicas (modelos, tokens, performance)

## 🚀 Como Usar

### Ver recomendações para seu domínio
```bash
cat ~/.claude/docs/llm/by-domain/software-development.md
```

### Navegar por velocidade/custo
```bash
cat ~/.claude/docs/llm/by-speed/quick-answers.md
cat ~/.claude/docs/llm/by-budget/cost-optimized.md
```

### Ver matriz de decisão centralizada
```bash
cat ~/.claude/docs/llm/task-llm-matrix.md
```

## 🔄 Como é distribuído

1. **Install:** `bash ~/Projetos/stec-developer-setup/install.sh`
   - Copia docs para `~/.claude/docs/llm/`
   - Copia docs para `~/.cursor/docs/llm/`
   - Copia docs para `~/.codex/docs/llm/`

2. **Update:** `bash ~/Projetos/stec-developer-setup/scripts/update-llm-docs.sh`
   - Atualiza docs sem afetar configurações

3. **Automático:** Quando Claude/Cursor/Codex iniciam, carregam docs do local

## 📖 Referência Completa

- [_index.yaml](./_index.yaml) — Índice centralizado de todas as recomendações
- [task-llm-matrix.md](./task-llm-matrix.md) — Matriz de decisão por tarefa
- [gateway-models.md](./references/gateway-models.md) — Modelos disponíveis no stec-LLM-gateway

## 🔗 Integração com Gateway

O `stec-LLM-gateway` usa estas recomendações para validar/refinar escolhas de modelos:

```
Tarefa → Hook recomenda modelo
       → Gateway valida contra token-count
       → Provider executa
```

Veja [docs/INTEGRATION_LLM_RECOMMENDATIONS.md](../INTEGRATION_LLM_RECOMMENDATIONS.md) no projeto gateway.

## ✨ Mantido Automaticamente

Esta documentação é:
- ✅ Versionada em git
- ✅ Distribuída via install.sh a todos os colaboradores
- ✅ Atualizada via scripts/update-llm-docs.sh
- ✅ Validada em CI/CD

Atualizações aparecem automaticamente na próxima vez que você rodar `install.sh` ou `update-llm-docs.sh`.
```

**Atualizar README.md principal:**
```markdown
## 📚 LLM Recommendation Documentation

A distribuição agora inclui **documentação inteligente de recomendação de modelos LLM**.

### 🆕 Recurso: Docs LLM para Todos

Após instalar o harness, você recebe:
- 12 guias por domínio (software-development, architecture, data-science, etc.)
- Recomendações por velocidade (quick, balanced, complex)
- Recomendações por orçamento (cost-optimized, balanced, premium)
- Matriz centralizada de decisão

```bash
# Ver recomendações
cat ~/.claude/docs/llm/by-domain/software-development.md
```

### 🔄 Manter Atualizado

```bash
# Atualizar APENAS docs LLM (sem afetar config)
bash ~/Projetos/stec-developer-setup/scripts/update-llm-docs.sh
```

Veja [docs/llm/README.md](docs/llm/README.md) para mais detalhes.
```

---

# 📊 Resumo Executivo

| Bloco | Fases | Responsabilidade | Duração | Saída |
|-------|-------|------------------|---------|-------|
| **Local LLM** | 1-5 | User + harness-core | 9h | Hook funcional + docs locais |
| **Gateway** | 6-9 | Gateway + harness-core | 5.5h | Integração hook ↔ gateway |
| **Distribuição** | 10-15 | stec-developer-setup | 9.5h | Setup automático para todos |
| | | **TOTAL** | **24h** | |

---

# 🎯 Benefícios

✅ **Centralizado:** Uma fonte de verdade para recomendações LLM  
✅ **Distribuído:** Todos os colaboradores recebem via setup  
✅ **Automático:** Hook intercepta tarefas e recomenda modelos  
✅ **Inteligente:** Usa domínio + tokens + custo para decisão  
✅ **Resiliente:** Fallback chain garante sempre ter modelo disponível  
✅ **Auditável:** Gateway registra qual modelo foi usado e por quê

---

# 🔗 Próximas Ações

1. **Aprovar este plano** (v2.0 com distribuição setup)
2. **FASE 1-2:** Criar docs LLM localmente (6h)
3. **FASE 3:** Hook em harness-core (2h)
4. **FASE 10-15:** Integração com setup (9.5h)
5. **CI/CD:** Validação automática em cada commit
6. **Rollout:** Próxima vez que colaboradores rodarem `install.sh`, receberão docs LLM

---

**Plano criado:** 2026-05-10  
**Versão:** 2.0 (com distribuição via stec-developer-setup)  
**Status:** ✅ Pronto para aprovação e implementação
