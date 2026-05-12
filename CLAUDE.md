# 📋 STEC Developer Setup — Instruções do Projeto

## 🎯 Objetivo

Centralizar o catálogo **AI-ProjectDeveloper** (316+ skills, 77 agents, rules, hooks) em `dotfiles/global/`, removendo o git submodule `.cursor` e redistribuindo esses recursos via `install.sh` para **Claude Code**, **Cursor IDE** e **Codex CLI**.

## 📊 Arquitetura Adotada

**Cenário 2 (Centralizado em dotfiles/):**
- Todos os 316 skills, agents, rules, hooks, mcp e plans são **versionados em `dotfiles/global/`**
- `dotfiles/[claude|cursor|codex]/` mantêm **overlays** (customizações específicas por IDE)
- `install.sh` executa **duas fases**:
  1. **Fase 1:** Copia `dotfiles/global/` → `~/.claude/`, `~/.cursor/`, `~/.codex/`
  2. **Fase 2:** Copia `dotfiles/[ide]/` → `~/.*/` (sobrescreve Fase 1 se conflito)
- **Submodule `.cursor`** será removido após TODO-6 ✨

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

## 📝 TODOs (6 tarefas principais — ver progress.md)

| ID | Atividade | Fase | Status |
|----|-----------|------|--------|
| TODO-1 | Inventariar AI-ProjectDeveloper | 1 | ⏳ Pending |
| TODO-2 | Criar e popular `dotfiles/global/` | 2-3 | ⏳ Pending |
| TODO-3 | Reorganizar overlays (dedup) | 4 | ⏳ Pending |
| TODO-4 | Transcrições de formato por IDE | 4 | ⏳ Pending |
| TODO-5 | Reescrever `install.sh` (2 fases) | 5 | ⏳ Pending |
| TODO-6 | Validar e testar `install.sh` | 5-7 | ⏳ Pending |

## 🔗 Documentação Relacionada

- **Plano detalhado:** `@docs/PLANO-INTEGRACAO-AI-PROJECTDEVELOPER-V2.md`
- **Mapeamento de IDEs:** `@docs/ferramentas/Mapeamento-Arquivos-IDEs.md`
- **Estrutura harness:** `~/.claude/HARNESS.md`

---

**Status:** Harness aplicado em 2026-05-11  
**Próximo passo:** TODO-1 (Inventário AI-ProjectDeveloper)
