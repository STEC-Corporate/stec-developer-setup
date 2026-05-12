# ✅ TODO-4: Transcrições de Formato por IDE

**Data:** 2026-05-11  
**Responsável:** Claude Code  
**Status:** ✅ **Completo**

---

## 📊 Resumo Executivo

Validação de formatos de todos os 779+ artefatos em `dotfiles/global/` e transcrições de formato por IDE. Resultado: **todos os artefatos já estão no formato correto** — as "transcrições" são confirmações, não conversões massivas. A única descoberta arquitetural relevante: **dois arquivos `hooks.json` com propósitos distintos**.

**Validação Executada:**
- ✅ 315 skills com SKILL.md válido (+ 1 exceção: `skills/hooks/`)
- ✅ 93 rules com frontmatter YAML válido
- ✅ 229 agents com frontmatter YAML válido
- ✅ 3 codex skills com SKILL.md válido
- ✅ 2 arquivos hooks.json (global e cursor)
- ✅ MCP configs como `.example.json` (templates, não deployed)

---

## 🔍 Validação Detalhada

### 1. Skills (`dotfiles/global/skills/`)

**Status:** ✅ **Todos conformes**

- **Quantidade:** 315 skills (+ 1 exceção)
- **Frontmatter:** YAML com campos `name` e `description`
- **Formato:** Markdown genérico — funciona em Claude, Cursor e Codex sem conversão
- **Exceção:** `skills/hooks/` — não é uma skill, contém scripts shell (referência de hooks genéricos)

**Verificação executada:**
```bash
bash dotfiles/global/scripts/check-formats.sh
# Output: ✅ 315 skills com SKILL.md válido
```

**Exemplo de skill válida:**
```yaml
---
name: arch-api-gateway
description: Especialização em API Gateway — trade-offs e padrões
---
# Conteúdo...
```

---

### 2. Rules (`dotfiles/global/rules/`)

**Status:** ✅ **Todos conformes**

- **Quantidade:** 93 arquivos `.mdc`
- **Frontmatter obrigatório:** `description`
- **Campos opcionais:** `globs` (string, lista ou vazio), `alwaysApply` (default false)
- **Formato:** Markdown com DSL específico do Cursor
- **Caracteres especiais:** Alguns arquivos têm CRLF (Windows), tratados corretamente pelo script

**Verificação executada:**
```bash
bash dotfiles/global/scripts/check-formats.sh
# Output: ✅ 93 rules com frontmatter válido
```

**Exemplo de rule válida:**
```yaml
---
description: Governação SDD — vínculo spec/produto
globs: "**/*"
alwaysApply: true
---
# Conteúdo...
```

---

### 3. Agents (`dotfiles/global/agents/`)

**Status:** ✅ **Todos conformes**

- **Quantidade:** 229 agents (+ INDEX.md que é isento)
- **Frontmatter obrigatório:** `name` e `description`
- **Campos opcionais:** `role_type` (operacional, sentinela-estrito, orquestrador), `blocking_authority`, `quality_domain`, `report_format`, `model: inherit`
- **Dois esquemas válidos:**
  - **Schema 1 (6 campos):** name, description, role_type, blocking_authority, quality_domain, report_format (operacional-v1)
  - **Schema 2 (7 campos):** Schema 1 + `model: inherit` (gate-v1)

**Verificação executada:**
```bash
bash dotfiles/global/scripts/check-formats.sh
# Output: ✅ 229 agents com frontmatter válido
```

**Exemplo de agent válido (Schema 1):**
```yaml
---
name: arch-api-gateway-guia
description: Guia API Gateway: borda, roteamento, agregação
role_type: operacional
blocking_authority: false
quality_domain: arquitetura
report_format: operacional-v1
---
# Conteúdo...
```

---

### 4. Codex Skills (`dotfiles/global/codex/skills/`)

**Status:** ✅ **Todos conformes**

- **Quantidade:** 3 skills Codex-específicas
- **Frontmatter:** Idêntico ao global (name + description)
- **Conteúdo:** Muito mais rico que skills globais (guias operacionais completos vs. cards de referência)
- **Formato:** Compatível com formato global, sem conversão necessária

**Verificação executada:**
```bash
bash dotfiles/global/scripts/check-formats.sh
# Output: ✅ 3 codex skills com SKILL.md válido
```

**Skills:**
1. `cursor-agent-orchestrator/SKILL.md`
2. `cursor-project-standards/SKILL.md`
3. `mcp-fleet-routing/SKILL.md`

---

### 5. Hooks

**Status:** ✅ **Distinção arquitetural identificada**

#### `dotfiles/global/hooks.json`
- **Propósito:** Template para instalação em projetos (paths relativos)
- **Paths:** `.cursor/hooks/...` (relativo)
- **Uso:** Referência/documentação para desenvolvedores entenderem estrutura de hooks
- **Status:** ✅ Existe, válido

#### `dotfiles/cursor/hooks.json`
- **Propósito:** Canônico para `install.sh` → cópia para `~/.cursor/`
- **Paths:** `~/.cursor/hooks/...` (absoluto)
- **Diferenças vs global:**
  - Contém campos `description` em cada hook
  - `afterFileEdit` executa também `~/.cursor/scripts/progress-update.sh`
  - `stop` executa 2 comandos (checklist.sh + on-stop.sh)
- **Status:** ✅ Existe, é o arquivo correto para instalação

**Decisão Arquitetural:**
- **Não alterar paths em `global/hooks.json`** — é um template de projeto
- **Usar `cursor/hooks.json` como canônico** no `install.sh` (TODO-5)
- **Documentar essa distinção** no README de hooks para evitar confusão

---

### 6. MCP (`dotfiles/global/mcp/`)

**Status:** ✅ **Templates, sem instalação**

- **Quantidade:** 2 arquivos `.example.json`
  - `mcp.cursor-marketplace.example.json`
  - `mcp.github.example.json`
- **Propósito:** Exemplos de configuração MCP para Cursor
- **Placeholders:** `${CURSOR_MARKETPLACE_TOKEN}`, `${GITHUB_PERSONAL_ACCESS_TOKEN}`
- **Ação:** Ficam no repositório como documentação — usuário configura manualmente quando necessário
- **Não serão copiados por `install.sh`**

---

## 📝 Decisões Arquiteturais

| Artefato | Decisão | Razão |
|----------|---------|-------|
| **Skills** | ✅ Todos conformes, sem alteração | Frontmatter válido, Markdown genérico |
| **Rules** | ✅ Todos conformes, sem alteração | YAML frontmatter válido, DSL Cursor nativo |
| **Agents** | ✅ Todos conformes, sem alteração | Dois esquemas válidos (operacional-v1, gate-v1) |
| **Codex skills** | ✅ Todos conformes, sem alteração | Formato genérico, conteúdo especializado |
| **hooks.json** | 📋 Manter dois arquivos | Propósitos distintos: template (global) vs canônico (cursor) |
| **MCP** | 📋 Manter como templates | Não auto-instalar, usuário configura manualmente |

---

## 🛠️ Script de Validação Criado

**Arquivo:** `dotfiles/global/scripts/check-formats.sh`

Valida:
1. **Skills:** Conta SKILL.md, verifica frontmatter (name + description)
2. **Rules:** Valida frontmatter YAML (obrigatório: description)
3. **Agents:** Valida frontmatter YAML (obrigatório: name + description)
4. **Codex skills:** Valida SKILL.md idêntico ao skills global
5. **Hooks:** Verifica existência de ambos os arquivos
6. **Output:** Resumo visual com cores, exit code 0 se tudo ok, 1 se houver erros

**Uso:**
```bash
bash dotfiles/global/scripts/check-formats.sh
# Output exemplo:
# 🔍 Validando formatos...
# ✅ 315 skills com SKILL.md válido
# ✅ 93 rules com frontmatter válido
# ✅ 229 agents com frontmatter válido
# ✅ 3 codex skills com SKILL.md válido
# ✅ Sem erros detectados (exit 0)
```

---

## 📊 Estatísticas de TODO-4

| Métrica | Valor |
|---------|-------|
| **Skills validadas** | 315 ✅ |
| **Rules validadas** | 93 ✅ |
| **Agents validados** | 229 ✅ |
| **Codex skills validadas** | 3 ✅ |
| **Erros encontrados** | 0 |
| **Warnings** | 1 (skills/hooks é exceção, não erro) |
| **Script criado** | `check-formats.sh` ✅ |
| **Tempo de execução** | ~5 min |

---

## ✅ O que NÃO foi feito (conforme plano)

- **Nenhuma conversão de formato:** Todos os artefatos já estão corretos
- **Nenhuma alteração em .mdc:** 93 rules já têm frontmatter válido
- **Nenhuma alteração em agents:** 229 agents já têm frontmatter correto
- **Nenhuma transcrição de paths em hooks.json:** Ambos os arquivos já têm paths corretos para seus propósitos distintos
- **Nenhuma cópia de MCP para ~/.claude/mcp/:** Templates ficam no repo, configuração manual do usuário

---

## 🎯 Impacto em TODO-5 (install.sh)

TODO-5 pode confiar que:
1. **Todas as skills em `global/skills/`** têm SKILL.md válido — cópia direta funcionará
2. **Todas as rules em `global/rules/`** têm frontmatter YAML — cópia direta funcionará
3. **Agentes em `global/agents/`** têm frontmatter válido — pronto para transcrição para Claude/Cursor/Codex
4. **`hooks.json` em `cursor/` é canônico** — deve ser usado como fonte para `install.sh`
5. **MCP files não precisam ser copiados** — documentação apenas

---

## 🚀 Próximos Passos

### TODO-5: Reescrever `install.sh`
- Fase 1: Distribuir `dotfiles/global/` para 3 IDEs (skills, rules, agents, hooks, mcp, plans)
- Fase 2: Aplicar overlays IDE-específicos (sobrescreve Fase 1 se conflito)
- Testar idempotência

### TODO-6: Validar e Testar `install.sh`
- Executar em ambiente teste
- Validar descoberta de skills/agents em cada IDE
- Testar sobrescrita de overlays

---

## 📝 Artefatos Produzidos por TODO-4

1. **`dotfiles/global/scripts/check-formats.sh`** — Script de validação
2. **Este documento** — Registro de validação e decisões
3. **Progress.md atualizado** — TODO-4 marcado como completo

---

## ✨ Conclusão

O `dotfiles/global/` está **totalmente conforme com as convenções de formato** esperadas por cada IDE. Não há conversões ou correções necessárias. A validação foi 100% positiva.

**Próximo passo:** TODO-5 (Reescrever `install.sh` com distribuição Fase 1 + Fase 2)

---

**Completado em:** 2026-05-11  
**Duração:** ~5 minutos  
**Status:** ✅ **Pronto para TODO-5**
