# 📊 Progress — Integração AI-ProjectDeveloper v2

**Projeto:** stec-developer-setup  
**Objetivo:** Centralizar catálogo corporativo em `dotfiles/global/`, remover submodule `.cursor`  
**Data Início:** 2026-05-11  
**Status Geral:** 🟡 **Em Progresso** (Fase 1 → 2)
**Progresso:** TODO-1 ✅ Completo | TODO-2-6 ⏳ Pendentes

---

## ✅ Histórico de Conclusões

### Arquitetura (Decisões Fechadas — 11 mai 2026)
- ✅ **P1:** Todos os 316 skills versionados em `dotfiles/global/`
- ✅ **P2:** Tamanho viável (sem restrição)
- ✅ **P3:** stec-developer-setup = repositório oficial (`.cursor` será removido)
- ✅ **P4:** Overlays em `dotfiles/[claude|cursor|codex]` mantidos como customizações

### Documentação
- ✅ PLANO-INTEGRACAO-AI-PROJECTDEVELOPER-V2.md criado e atualizado
- ✅ Decisões arquiteturais registradas no plano

---

## 📋 TODOs — 6 Tarefas Principais

### Fase 1️⃣ — Preparação e Análise

#### TODO-1: Inventariar AI-ProjectDeveloper
- **Descrição:** Catalogar estrutura completa do AI-ProjectDeveloper e validar contagem de arquivos
- **Atividades:**
  - [x] Exportar/clonar AI-ProjectDeveloper em local temporário ✅ (submodule em `.cursor/`)
  - [x] Validar quantidade real de agents (encontrado: **230** em vez de ~77) ✅
  - [x] Validar quantidade real de skills (confirmado: **316**) ✅
  - [x] Mapear dependências internas (mínimo 9 skills referenciam agents) ✅
  - [x] Documentar tamanho total (**7.6M**, 779+ artefatos) ✅
  - [x] Criar checklist final de arquivos para migração (23 itens) ✅
- **Bloqueante:** Não
- **Estimado:** 2-3 horas
- **Status:** ✅ **Completo** (duração real: ~45 min)
- **Documento:** `@docs/TODO-1-INVENTARIO-AI-PROJECTDEVELOPER.md`

**Descobertas:**
- 230 subagents em `agents/` (não 77)
- 316 skills em `skills/` (conforme esperado)
- 93 rules em `rules/`
- 3 codex-skills em `codex-skills/`
- 42 plans em `plans/`
- 163 arquivos de docs
- Estrutura: pastas + `SKILL.md` para skills; arquivos `.md` para agents; `.mdc` para rules
- 315/316 skills possuem arquivo `SKILL.md` (1 pasta vazia?)

---

### Fase 2️⃣-3️⃣ — Criação e Migração

#### TODO-2: Criar e Popular `dotfiles/global/`
- **Descrição:** Preparar estrutura de `dotfiles/global/` e migrar conteúdo do AI-ProjectDeveloper
- **Atividades:**
  - [ ] Criar pasta `dotfiles/global/` com subdiretorias (agents, skills, rules, hooks, mcp, plans, schemas, docs)
  - [ ] Copiar `agents/` → `dotfiles/global/agents/`
  - [ ] Copiar `skills/` → `dotfiles/global/skills/`
  - [ ] Copiar `rules/` → `dotfiles/global/rules/`
  - [ ] Copiar `codex-skills/` → `dotfiles/codex/skills/` ⭐ (ex-erro arquitetural)
  - [ ] Copiar `hooks/` → `dotfiles/global/hooks/`
  - [ ] Copiar `mcp/` → `dotfiles/global/mcp/`
  - [ ] Copiar `plans/` → `dotfiles/global/plans/`
  - [ ] Copiar `schemas/` → `dotfiles/global/schemas/`
  - [ ] Copiar `docs/` → `dotfiles/global/docs/`
  - [ ] Copiar `README.md` → `dotfiles/global/README.md`
  - [ ] Validar integridade após migração (nenhum arquivo perdido)
- **Bloqueante:** Após TODO-1
- **Estimado:** 4-6 horas
- **Status:** ⏳ **Pending**

---

### Fase 4️⃣ — Reorganização e Transcrição

#### TODO-3: Mover/Dedup Conteúdos de Overlays
- **Descrição:** Reorganizar `dotfiles/[claude|cursor|codex]/` removendo duplicatas, mantendo apenas customizações
- **Atividades:**
  - [ ] Revisar `dotfiles/claude/` — remover duplicatas com global
  - [ ] Revisar `dotfiles/cursor/` — remover duplicatas com global
  - [ ] Revisar `dotfiles/codex/` — confirmar que skills Codex-específicas estão aqui
  - [ ] Consolidar scripts repetidos (harness, guard-shell, etc.) em fonte única
  - [ ] Documentar o que fica em cada overlay (e por quê)
- **Bloqueante:** Após TODO-2
- **Estimado:** 3-4 horas
- **Status:** ⏳ **Pending**

#### TODO-4: Transcrições de Formato por IDE
- **Descrição:** Garantir que recursos específicos de IDE estão no formato correto
- **Atividades:**
  - [ ] Validar `global/skills/` em formato Markdown (genérico para 3 IDEs)
  - [ ] Validar `global/rules/*.mdc` com frontmatter YAML (Claude + Cursor nativo, Codex converte)
  - [ ] Validar `global/agents/*.md` com frontmatter YAML (Cursor + Codex nativo)
  - [ ] Validar `global/hooks.json` com paths absolutos `~/.cursor/hooks/...`
  - [ ] Validar `global/mcp/` conforme spec Claude
  - [ ] Confirmar que `codex/skills/` está em formato específico do Codex (sem conversão na Fase 2)
  - [ ] Criar script de validação de formatos (check-formats.sh)
- **Bloqueante:** Após TODO-3
- **Estimado:** 2-3 horas
- **Status:** ⏳ **Pending**

---

### Fase 5️⃣ — Reescrita do Install.sh

#### TODO-5: Reescrever `install.sh` (Duas Fases)
- **Descrição:** Implementar novo fluxo: Fase 1 (global) + Fase 2 (overlays), com sobrescrita garantida
- **Atividades:**
  - [ ] Refactorizar função `copy_recursive_tree` para garantir sobrescrita (`cp -r` sem `-n`)
  - [ ] Implementar **Fase 1:** distribuir `global/` para 3 IDEs
    - [ ] `global/skills/* → ~/.claude/skills/` ✅
    - [ ] `global/skills/* → ~/.cursor/skills/` ✅
    - [ ] `global/skills/* → ~/.codex/skills/` ✅
    - [ ] `global/rules/* → ~/.*/rules/` (3 IDEs)
    - [ ] `global/agents/* → ~/.cursor/agents/` + `~/.codex/agents/`
    - [ ] `global/mcp/* → ~/.claude/mcp/`
    - [ ] `global/hooks/` → conversão para cada IDE
  - [ ] Implementar **Fase 2:** aplicar overlays por IDE
    - [ ] `dotfiles/claude/* → ~/.claude/` (sobrescreve Fase 1)
    - [ ] `dotfiles/cursor/* → ~/.cursor/` (sobrescreve Fase 1)
    - [ ] `dotfiles/codex/* → ~/.codex/` (sobrescreve Fase 1, codex/skills/ > global/skills/)
  - [ ] Adicionar validação de escrita (verificar permissões, criar dirs se necessário)
  - [ ] Adicionar logging verbose (`echo "📋 Copiando..."`)
  - [ ] Testar em ambiente local
- **Bloqueante:** Após TODO-4
- **Estimado:** 2-3 horas
- **Status:** ⏳ **Pending**

---

### Fase 5️⃣-7️⃣ — Validação e Teste

#### TODO-6: Validar e Testar `install.sh`
- **Descrição:** Validar que novo fluxo funciona corretamente e resolver issues
- **Atividades:**
  - [ ] Executar `bash install.sh` em projeto teste
  - [ ] Validar que `~/.claude/skills/` contém todos os skills (genéricos + específicos Claude)
  - [ ] Validar que `~/.cursor/skills/` contém todos os skills (genéricos) ✅
  - [ ] Validar que `~/.cursor/agents/` contém todos os agents
  - [ ] Validar que `~/.codex/skills/` contém skills genéricas + Codex-específicas (codex/skills/ sobrescreve se conflito)
  - [ ] Testar descoberta de skills em Claude Code, Cursor e Codex
  - [ ] Testar invocação de agents em Cursor e Codex
  - [ ] Validar que overlays sobrescrevem global em caso de duplicatas
  - [ ] Testar múltiplas execuções de `install.sh` (idempotência)
  - [ ] Atualizar `validate-install.sh` (se existir) com novos checks
  - [ ] Atualizar `README.md` (seção de instalação)
  - [ ] Marcar `PLANO-INTEGRACAO-CURSOR-SKILLS.md` como deprecado/superado
  - [ ] Preparar documentação para remoção de `.gitmodules` + `.cursor/` (Fase 6)
- **Bloqueante:** Após TODO-5
- **Estimado:** 2-3 horas
- **Status:** ⏳ **Pending**

---

### Fase 6️⃣ (Futura) — Remoção de Submodule

#### Fase 6: Remover Git Submodule `.cursor`
- **Descrição:** Limpar repositório após validação de TODO-6
- **Timing:** **APÓS TODO-6 estar 100% completo**
- **Atividades:**
  - [ ] `git rm --cached .cursor`
  - [ ] `rm -rf .cursor`
  - [ ] Remover `.gitmodules` e submodule config
  - [ ] Commit: `"chore: remove .cursor submodule, migrated to dotfiles/global/"`
- **Status:** ⏸️ **Bloqueado** (aguarda TODO-6)

---

## 📊 Estatísticas

| Métrica | Status |
|---------|--------|
| **TODOs Completos** | 1/6 ✅ (TODO-1) |
| **TODOs Pendentes** | 5/6 ⏳ |
| **TODOs Bloqueados** | 0 |
| **Decisões Arquiteturais Fechadas** | 4/4 ✅ |
| **Estimado Restante** | 17-23 horas de trabalho |
| **Tempo Real (TODO-1)** | 45 min (vs. 2-3 horas estimado) ⚡ |

---

## 🎯 Próximos Passos

1. **Iniciar TODO-1:** Inventariar AI-ProjectDeveloper
2. Executar tarefas em sequência (cada uma depende da anterior)
3. Após TODO-6: Remover submodule em Fase 6 (opcional, pós-lançamento)

---

**Última atualização:** 2026-05-11 (Harness aplicado)  
**Responsável:** Projeto stec-developer-setup  
**Próximo Check:** Após TODO-1 completo
