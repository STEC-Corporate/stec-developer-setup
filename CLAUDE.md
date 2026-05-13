# 📋 STEC Developer Setup — Instruções do Projeto

## 🎯 Objetivo

Distribuir o catálogo **AI-ProjectDeveloper** (316 skills, 230 agents, 93 rules) via `install.sh` para **Claude Code**, **Cursor IDE** e **Codex CLI**, usando `dotfiles/global/` como catálogo centralizado.

## 📊 Arquitetura Adotada

**Cenário 2 (Centralizado em dotfiles/):**
- Todos os 316 skills, agents, rules, hooks, mcp e plans são **versionados em `dotfiles/global/`**
- `dotfiles/[claude|cursor|codex]/` mantêm **overlays** (customizações específicas por IDE)
- `install.sh` executa **duas fases**:
  1. **Fase 1:** Copia `dotfiles/global/` → `~/.claude/`, `~/.cursor/`, `~/.codex/`
  2. **Fase 2:** Copia `dotfiles/[ide]/` → `~/.*/` (sobrescreve Fase 1 se conflito)
- **Submodule `.cursor`** foi removido (2026-05-11) ✅

## 🔄 Decisões Arquiteturais Fechadas (11 mai 2026)

| Decisão | Status | Impacto |
|---------|--------|--------|
| **P1:** Versionar todos 316 skills em `dotfiles/global/`? | ✅ **SIM** | Offline-friendly, sem submodule |
| **P2:** Tamanho viável para versionamento? | ✅ **CONFIRMADO** | Repo size não é restrição |
| **P3:** stec-developer-setup será repo oficial? | ✅ **SIM, remover `.cursor` futura** | AI-PD externo descontinuado para este setup |
| **P4:** Preservar overlays existentes? | ✅ **SIM** | dotfiles/[claude\|cursor\|codex] mantidos |

## 📐 Regra de Distribuição (Install.sh)

### Skills e Rules (Distribuição Universal)
```
Fase 1:
  dotfiles/global/skills/* → ~/.claude/skills/ ✅
  dotfiles/global/skills/* → ~/.cursor/skills/ ✅
  dotfiles/global/skills/* → ~/.codex/skills/ ✅
  
  dotfiles/global/rules/* → ~/.claude/rules/ ✅
  dotfiles/global/rules/* → ~/.cursor/rules/ ✅
  dotfiles/global/rules/* → ~/.codex/rules/ ✅

Fase 2 (Sobrescreve Fase 1):
  dotfiles/[claude|cursor|codex]/* → ~/.*/
```

### Agents (IDE-específicos)
- **Claude:** Ignorar (Claude não usa agents nativos, apenas skills)
- **Cursor:** `global/agents/* → ~/.cursor/agents/`
- **Codex:** `global/agents/* → ~/.codex/agents/`

### Codex-Specific Skills
- **Origem:** `.cursor/codex-skills/` (migrar para `dotfiles/codex/skills/`)
- **Destino:** `~/.codex/skills/` (Fase 2 sobrescreve global/skills se conflito)
- **Natureza:** Já em formato Codex, cópia direta SEM conversão

## 🗂️ Estrutura de Pastas (Alvo)

```
dotfiles/
├── global/                          ← Catálogo corporativo (ex-AI-ProjectDeveloper)
│   ├── agents/ (77 agents)
│   ├── skills/ (316 skills genéricas)
│   ├── rules/ (regras MDC)
│   ├── hooks/ (hooks de integração)
│   ├── mcp/ (configurações MCP)
│   ├── plans/ (planos de trabalho)
│   ├── schemas/ (schemas JSON)
│   ├── docs/ (documentação)
│   └── README.md
│
├── claude/ (Overlays específicas de Claude)
├── cursor/ (Overlays específicas de Cursor)
├── codex/  (Overlays específicas de Codex — **inclui ex-codex-skills/)
└── home/
    └── CLAUDE.md
```

## ⚠️ Política de Sobrescrita

**CRÍTICO:** Todos os `cp` em `install.sh` devem sobrescrever:
- ✅ Usar: `cp -r` (com sobrescrita)
- ❌ Nunca: `cp -rn` (sem sobrescrita)

Isto garante que toda atualização em `dotfiles/` seja **sempre** refletida em `~/.*/` ao correr `install.sh`.

## 🔗 Documentação Relacionada

- **Mapeamento de IDEs:** `docs/ferramentas/Mapeamento-Arquivos-IDEs.md`
- **Estrutura harness:** `~/.claude/HARNESS.md`

---

**Status:** ✅ Integração v3.0 completa (2026-05-11)  
**Manutenção:** `bash install.sh` para distribuir atualizações

---

## 📋 Tarefas Pendentes

### 🔄 T-SETUP-001: Criar Hook para Finalização de Tarefa
**Descrição:** Implementar hook que detecta finalização de tarefa (status "completed" no TodoWrite) e automaticamente:
1. Identifica próxima tarefa na lista
2. Recomenda LLM adequado para próxima tarefa
3. Exibe mensagem com próximos passos

**Evento alvo:** `PostToolUse` matcher `TodoWrite` quando status muda para "completed"

**Implementação:**
- Criar `dotfiles/global/hooks/task-completion.sh`
- Adicionar matcher no `settings.json` para `TodoWrite` tool
- Script deve:
  - Detectar mudança de status para "completed" 
  - Identificar próxima tarefa pendente
  - Chamar LLM Advisor para próxima tarefa
  - Retornar `systemMessage` com recomendação

**Arquivos afetados:**
- `dotfiles/global/hooks/task-completion.sh` (novo)
- `dotfiles/global/settings.json` (adicionar hook PostToolUse)
- `dotfiles/global/docs/hooks.md` (documentar novo hook)

**Prioridade:** Alta - melhora fluxo de trabalho com tarefas
