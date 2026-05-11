# 📋 Plano V2: Integração Total do AI-ProjectDeveloper em dotfiles/global

## 🎯 Objetivo

Trazer **todos os arquivos** do repositório **AI-ProjectDeveloper** (316+ skills, agents, rules, hooks, etc.) para uma pasta centralizada `dotfiles/global/`, removendo o git submodule e redistribuindo esses recursos através do `install.sh` para as configurações das 3 IDEs (Claude, Cursor, Codex), respeitando as especificações de cada ferramenta conforme mapeado em `docs/ferramentas/Mapeamento-Arquivos-IDEs.md`.

---

## 📊 Estado Atual

### Estrutura Existente
```
stec-developer-setup/
├── .cursor/                (git submodule → SERÁ REMOVIDO)
│   ├── agents/
│   ├── skills/
│   ├── rules/
│   ├── codex-skills/
│   ├── hooks/
│   ├── mcp/
│   └── plans/
├── dotfiles/
│   ├── claude/
│   │   └── scripts/
│   ├── cursor/
│   │   ├── agents/         (base mínimo)
│   │   ├── skills/         (16 skills)
│   │   └── scripts/
│   ├── codex/
│   │   ├── skills/         (2 skills)
│   │   ├── rules/
│   │   └── scripts/
│   └── home/
│       └── CLAUDE.md
├── install.sh              (atual: copia dotfiles → home)
├── .gitmodules             (SERÁ REMOVIDO)
└── ...
```

### Install.sh Atual
```bash
copy_recursive_tree "$DOTFILES_DIR/claude" "$CLAUDE_CONFIG_DIR" "Claude Code"
copy_recursive_tree "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor IDE"
copy_recursive_tree "$DOTFILES_DIR/codex" "$CODEX_CONFIG_DIR" "Codex CLI"
```

---

## 🔄 Arquitetura Nova (Proposta)

### Estrutura de Pastas

```
dotfiles/
├── global/                          ← NOVO: Catálogo centralizado (do AI-ProjectDeveloper)
│   ├── agents/                      # 77 agents corporativos
│   ├── skills/                      # 316 skills corporativas
│   ├── rules/                       # Regras MDC corporativas
│   ├── codex-skills/                # Skills específicas para Codex
│   ├── hooks/                       # Hooks de integração
│   ├── mcp/                         # Configurações MCP
│   ├── plans/                       # Planos de trabalho
│   ├── schemas/                     # Schemas JSON
│   └── README.md                    # Documentação (origem: AI-ProjectDeveloper)
│
├── claude/                          ← Recursos específicos de Claude (override)
│   ├── scripts/                     # Scripts próprios de Claude
│   └── [skills personalizadas]      # Se houver
│
├── cursor/                          ← Recursos específicos de Cursor (override)
│   ├── agents/                      # Se houver customizações locais
│   ├── skills/                      # Se houver customizações locais
│   └── scripts/                     # Scripts próprios de Cursor
│
├── codex/                           ← Recursos específicos de Codex (override)
│   ├── skills/                      # Se houver customizações locais
│   ├── rules/                       # Se houver customizações locais
│   └── scripts/                     # Scripts próprios de Codex
│
└── home/
    └── CLAUDE.md
```

### Fluxo de Distribuição (install.sh)

```
Fase 1: Copia global → home
├── dotfiles/global/agents/* → ~/.cursor/agents/, ~/.codex/agents/
├── dotfiles/global/skills/* → ~/.claude/skills/, ~/.cursor/skills/, ~/.codex/skills/
├── dotfiles/global/rules/* → ~/.cursor/rules/, ~/.codex/rules/
├── dotfiles/global/codex-skills/* → ~/.codex/agents/ ⭐ (SEM CONVERSÃO — já estão em formato Codex)
├── dotfiles/global/hooks/* → ~/.cursor/hooks.json, ~/.codex/rules/
└── dotfiles/global/mcp/* → ~/.claude/mcp/

Fase 2: Copia específicas → home (sobrescreve Fase 1, se houver)
├── dotfiles/claude/* → ~/.claude/
├── dotfiles/cursor/* → ~/.cursor/
└── dotfiles/codex/ → ~/.codex/

Resultado Final: Recursos globais + customizações locais
```

⭐ **Nota Importante:**
- A pasta `dotfiles/global/skills/` contém skills genéricas em Markdown que são redistribuídas para **Claude Code** (`~/.claude/skills/`), **Cursor** (`~/.cursor/skills/`) e **Codex** (`~/.codex/skills/`).
- A pasta `dotfiles/global/codex-skills/` contém skills já convertidas e formatadas especificamente para o **Codex CLI**. Diferente das skills genéricas, **estes arquivos devem ser copiados para `~/.codex/agents/` SEM qualquer transformação adicional**, pois já estão no formato esperado pelo Codex.

---

## 📐 Regra de Transcrição por IDE

**Referência:** `@docs/ferramentas/Mapeamento-Arquivos-IDEs.md`

### Origem: dotfiles/global/ → Destino: ~/.claude/, ~/.cursor/, ~/.codex/

| Recurso | Origem | Claude | Cursor | Codex |
|---------|--------|--------|--------|-------|
| **agents/** | global/agents/ | (não usa) | ~/.cursor/agents/ | ~/.codex/agents/ |
| **skills/** | global/skills/ | ~/.claude/skills/ | ~/.cursor/skills/ | ~/.codex/skills/ |
| **rules/** | global/rules/ | (guardrails em CLAUDE.md) | ~/.cursor/rules/ | ~/.codex/rules/ |
| **codex-skills/** | global/codex-skills/ | - | - | ~/.codex/agents/ ⭐ |
| **hooks/** | global/hooks/ | ~/.claude/mcp/ (converter) | ~/.cursor/hooks.json | ~/.codex/rules/ |
| **mcp/** | global/mcp/ | ~/.claude/mcp/ | - | - |

### Nota Especial: codex-skills

⭐ A pasta `global/codex-skills/` é um **conjunto de skills pré-convertidas especificamente para Codex**. Diferente das skills genéricas em `global/skills/`, os arquivos em `codex-skills/` já estão no formato esperado pelo Codex e devem ser copiados **diretamente** para `~/.codex/agents/` **sem conversão adicional**. Esta é uma migração direta: `global/codex-skills/* → ~/.codex/agents/`.

### Regra de Conversão (Se Necessário)

Se um recurso for **formatado diferentemente** para cada IDE, deve ser transcrito conforme esperado:

**Exemplo:**

1. **Skills** (`global/skills/*/SKILL.md`) — Formato unificado, usado por TODOS
   - → Para Claude: Copiar como-é em `~/.claude/skills/` (Skills em Markdown)
   - → Para Cursor: Copiar como-é em `~/.cursor/skills/` (Skills em Markdown)
   - → Para Codex: Copiar como-é em `~/.codex/skills/` (Skills em Markdown)

2. **Agents** (`global/agents/*.md`) — Formato Markdown+YAML, usado por Cursor e Codex
   - → Para Claude: Ignorar (não utiliza agents)
   - → Para Cursor: Copiar como-é em `~/.cursor/agents/`
   - → Para Codex: Copiar como-é em `~/.codex/agents/`

3. **Hooks** (`global/hooks/`) — Formato JSON, requer conversão
   - → Para Claude: Converter para MCP server config em `~/.claude/mcp/`
   - → Para Cursor: Copiar como `hooks.json` em `~/.cursor/hooks.json`
   - → Para Codex: Converter para `.rules` DSL em `~/.codex/rules/`

---

## ⭐ Tratamento Especial: `claude-skills/` (global/skills/)

A pasta `dotfiles/global/skills/` contém um conjunto de **skills em Markdown** que definem agentes especializados personalizados para o Claude Code. Estas skills são formato genérico que funciona diretamente em todas as três IDEs sem necessidade de conversão.

### Regra de Cópia para Claude Skills

| Origem | Destino | Conversão | Nota |
|--------|---------|-----------|------|
| `global/skills/*/SKILL.md` | `~/.claude/skills/` | **NENHUMA** | Copiar diretamente, Claude lê Markdown nativamente |

### Justificativa

- Claude Code utiliza **Skills em Markdown** como mecanismo nativo de personalização
- Cada skill é uma pasta em `global/skills/{skill-name}/` contendo `SKILL.md`
- O arquivo `SKILL.md` define o comportamento e diretrizes da skill em linguagem natural
- Skills são automaticamente descobertas e invocáveis dentro do Claude Code quando presentes em `~/.claude/skills/`
- Não requer conversão — o formato Markdown é nativo e portável

### No install.sh

A linha de cópia deve ser:
```bash
copy_recursive_tree "$DOTFILES_DIR/global/skills" "$CLAUDE_CONFIG_DIR/skills" "Global Skills → Claude"
```

**Nota:** Diferente de agents (que Claude não usa), skills são **o mecanismo principal** de personalização do Claude Code.

---

## ⭐ Tratamento Especial: `codex-skills/`

A pasta `dotfiles/global/codex-skills/` contém um conjunto de **skills já pré-convertidas e formatadas especificamente para o Codex CLI**. Diferente das skills genéricas em `global/skills/` (que são aplicáveis a múltiplas IDEs), o conteúdo de `codex-skills/` já foi transposto para o formato esperado pelo Codex.

### Regra de Cópia para codex-skills

| Origem | Destino | Conversão | Nota |
|--------|---------|-----------|------|
| `global/codex-skills/*` | `~/.codex/agents/` | **NENHUMA** | Copiar diretamente, arquivos já estão em formato Codex |

### Justificativa

- Estes arquivos já passaram por uma **transcrição prévia** do formato genérico para o formato específico do Codex
- Copiar para `~/.codex/agents/` (não `~/.codex/skills/`) porque Codex organiza agents (não skills)
- **Não aplicar conversão adicional** — os arquivos já estão prontos

### No install.sh

Isso significa que a linha de cópia deve ser:
```bash
copy_recursive_tree "$DOTFILES_DIR/global/codex-skills" "$CODEX_CONFIG_DIR/agents" "Codex Skills (pre-converted)"
```

**Atenção:** Diferente de `dotfiles/global/skills/` que vai para `~/.codex/skills/`, os `codex-skills/` vão para `~/.codex/agents/`.

---

## 🗂️ Estrutura de Pastas Esperada em dotfiles/global/

(Replica exata da estrutura do AI-ProjectDeveloper após migração)

```
dotfiles/global/
├── agents/                           # Agentes classificados
│   ├── INDEX.md
│   ├── arquitetura-validar-limpa.md
│   ├── cicd-quality-gates-advisor.md
│   ├── ...                           # ~77 agents totais
│   └── README.md
│
├── skills/                           # 316 skills com prefixos funcionais
│   ├── code-consultar-regras/
│   │   ├── SKILL.md
│   │   ├── README.md
│   │   └── scripts/
│   ├── gate-arquitetura/
│   │   ├── SKILL.md
│   │   └── ...
│   ├── ...                           # ~316 skills
│   ├── INDEX.md
│   └── README.md
│
├── rules/                            # Regras MDC corporativas
│   ├── submodule-premise.mdc
│   ├── INDEX.md
│   └── ...
│
├── codex-skills/                     # Skills específicas de Codex
│   ├── ...
│   └── README.md
│
├── hooks/                            # Hooks de integração
│   ├── hooks.json
│   ├── ...
│   └── README.md
│
├── mcp/                              # Configurações MCP
│   ├── servers/
│   │   ├── server-1.json
│   │   └── ...
│   └── config.json
│
├── plans/                            # Planos de trabalho
│   ├── template-sdd-feature.plan.md
│   └── ...
│
├── schemas/                          # Schemas JSON
│   ├── ...
│   └── README.md
│
├── docs/                             # Documentação (origem AI-ProjectDeveloper)
│   ├── governanca/
│   ├── codex/
│   └── ...
│
└── README.md                         # Cópia do README.md do AI-ProjectDeveloper
```

---

## 📝 Fases de Implementação

### **Fase 1: Preparação e Análise**

**Objetivo:** Catalogar e validar estrutura do AI-ProjectDeveloper

- [ ] Exportar/clonar repositório AI-ProjectDeveloper em local temporário
- [ ] Validar quantidade real de arquivos (agents, skills, rules, etc.)
- [ ] Mapeaar dependências internas (ex: skills que referenciam agents)
- [ ] Documentar tamanho total (para decidir se vai versionado em stec-developer-setup)
- [ ] Criar checklist de arquivos para migração

**Saídas:**
- Lista de arquivos a migrar
- Documentação de dependências

---

### **Fase 2: Criar Estrutura de dotfiles/global/**

**Objetivo:** Preparar pasta de destino e validar mapeamento

- [ ] Criar pasta `dotfiles/global/` com subdiretorias
- [ ] Criar `dotfiles/global/README.md` (documentação de origem)
- [ ] Validar que estrutura espelha AI-ProjectDeveloper
- [ ] Preparar script de cópia/migração (pode ser parcial inicialmente)

**Saídas:**
- Estrutura vazia pronta para receber arquivos
- Script de migração (se necessário)

---

### **Fase 3: Migrar Arquivos do AI-ProjectDeveloper**

**Objetivo:** Trazer conteúdo para dotfiles/global/

**Opções:**
- **3a (Recomendado):** Copiar arquivos manualmente em commits pequenos (rastreabilidade)
- **3b:** Bulk copy com script (mais rápido)
- **3c:** Usar `git subtree` para trazer AI-ProjectDeveloper como subdir histórico

- [ ] Copiar `agents/` → `dotfiles/global/agents/`
- [ ] Copiar `skills/` → `dotfiles/global/skills/`
- [ ] Copiar `rules/` → `dotfiles/global/rules/`
- [ ] Copiar `codex-skills/` → `dotfiles/global/codex-skills/`
- [ ] Copiar `hooks/` → `dotfiles/global/hooks/`
- [ ] Copiar `mcp/` → `dotfiles/global/mcp/`
- [ ] Copiar `plans/` → `dotfiles/global/plans/`
- [ ] Copiar `schemas/` → `dotfiles/global/schemas/`
- [ ] Copiar `docs/` → `dotfiles/global/docs/`
- [ ] Validar integridade após cópia

**Saídas:**
- Todos os arquivos em `dotfiles/global/`
- Commits documentando migração

---

### **Fase 4: Ajustar dotfiles/[claude|cursor|codex]/**

**Objetivo:** Mover/reorganizar recursos específicos por IDE

- [ ] Revisar `dotfiles/claude/` — manter apenas scripts específicos (remover duplicatas)
- [ ] Revisar `dotfiles/cursor/` — mover base mínimo para `global/`, manter customizações
- [ ] Revisar `dotfiles/codex/` — mover base mínimo para `global/`, manter customizações
- [ ] Aplicar **Regra de Transcrição** se houver formatos diferentes
- [ ] Documentar o que fica em cada pasta (e por quê)

**Exemplo:**
```
# Antes
dotfiles/cursor/skills/ → 16 skills base (duplicadas em global)
                       
# Depois
dotfiles/cursor/skills/ → [vazio ou apenas customizações locais]
                        
# E em global:
dotfiles/global/skills/ → 316 skills (inclui as 16 anteriores)
```

**Saídas:**
- Estrutura limpa sem redundâncias
- Documentação clara de precedência

---

### **Fase 5: Ajustar install.sh**

**Objetivo:** Implementar novo fluxo de cópia

**Pseudocódigo:**

```bash
# Fase 1: Copiar global para configurações
copy_from_global() {
    # Cópia que faz broadcast para 3 IDEs
    copy_recursive_tree "$DOTFILES_DIR/global/agents" "$CURSOR_CONFIG_DIR/agents" "Global Agents → Cursor"
    copy_recursive_tree "$DOTFILES_DIR/global/skills" "$CLAUDE_CONFIG_DIR/skills" "Global Skills → Claude"
    copy_recursive_tree "$DOTFILES_DIR/global/skills" "$CURSOR_CONFIG_DIR/skills" "Global Skills → Cursor"
    copy_recursive_tree "$DOTFILES_DIR/global/skills" "$CODEX_CONFIG_DIR/skills" "Global Skills → Codex"
    
    copy_recursive_tree "$DOTFILES_DIR/global/rules" "$CURSOR_CONFIG_DIR/rules" "Global Rules → Cursor"
    copy_recursive_tree "$DOTFILES_DIR/global/rules" "$CODEX_CONFIG_DIR/rules" "Global Rules → Codex"
    
    # Codex-skills: já estão em formato Codex, cópia direta SEM conversão
    copy_recursive_tree "$DOTFILES_DIR/global/codex-skills" "$CODEX_CONFIG_DIR/agents" "Global Codex Skills → Codex Agents (no conversion needed)"
    
    copy_recursive_tree "$DOTFILES_DIR/global/mcp" "$CLAUDE_CONFIG_DIR/mcp" "Global MCP → Claude"
    
    # Hooks: precisam conversão
    copy_hooks_to_tools
}

# Fase 2: Copiar específicas (sobrescrita, se houver)
copy_specific_overrides() {
    copy_recursive_tree "$DOTFILES_DIR/claude" "$CLAUDE_CONFIG_DIR" "Claude Overrides"
    copy_recursive_tree "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor Overrides"
    copy_recursive_tree "$DOTFILES_DIR/codex" "$CODEX_CONFIG_DIR" "Codex Overrides"
}

# Executar
copy_from_global
copy_specific_overrides
```

**Saídas:**
- `install.sh` atualizado com novo fluxo
- Testado em ambiente local

---

### **Fase 6: Remover Git Submodule**

**Objetivo:** Limpar repositório de submodule

- [ ] Remover `.cursor/` do git
- [ ] Remover entrada em `.gitmodules`
- [ ] Remover configuração do `.git/config`
- [ ] Validar que `.cursor/` pode ser completamente deletado
- [ ] Commit: "chore: remove .cursor submodule, migrated to dotfiles/global/"

**Comandos:**
```bash
git rm --cached .cursor
rm -rf .cursor
git config --file .gitmodules --remove-section submodule.".cursor"
git config --file .git/config --remove-section submodule.".cursor"
git add .gitmodules .git/config
git commit -m "chore: remove .cursor submodule, migrated to dotfiles/global/"
```

**Saídas:**
- Submodule completamente removido
- Repositório limpo

---

### **Fase 7: Testar em Projeto Piloto**

**Objetivo:** Validar novo fluxo de instalação

- [ ] Criar projeto teste (ou usar projeto existente)
- [ ] Executar `bash install.sh`
- [ ] Validar que ~/.claude/, ~/.cursor/, ~/.codex/ recebem arquivos corretos
- [ ] Testar descoberta de skills em cada IDE (Claude, Cursor, Codex)
- [ ] Testar invocação de agents em Cursor e Codex
- [ ] Validar que não há conflitos ou sobrescritas indesejadas
- [ ] Testar que customizações locais (dotfiles/[claude|cursor|codex]/) sobrescrevem global se necessário

**Saídas:**
- Validação de funcionalidade
- Documentação de issues encontrados (se houver)

---

### **Fase 8: Documentação e Comunicação**

**Objetivo:** Documentar nova arquitetura para equipe

- [ ] Atualizar `docs/ferramentas/Mapeamento-Arquivos-IDEs.md` com nova estrutura
- [ ] Criar `docs/ARQUITETURA-DOTFILES-V2.md` explicando nova estrutura
- [ ] Atualizar `README.md` do repo (sessão de instalação)
- [ ] Criar guia de migração para projetos existentes (se necessário)
- [ ] Documentar precedência de carregamento (global < específicas)
- [ ] Atualizar CLAUDE.md com referências novas

**Saídas:**
- Documentação clara
- Guias para manutenção futura

---

## 🎯 Decisões Arquiteturais a Tomar

### **D1: Versionar dotfiles/global/ em stec-developer-setup?**

**Opções:**
- **Sim (A):** Incluir todos os 316 skills no repositório stec-developer-setup
  - ✅ Offline-friendly, sem dependência de submodule
  - ✅ Histórico versionado neste repositório
  - ❌ Repo fica maior (~XX MB, estimar)
  - ❌ Sincronização manual com AI-ProjectDeveloper futura

- **Não (B):** Deixar dotfiles/global/ como submodule (nova solução)
  - ✅ Mantém clean stec-developer-setup
  - ✅ Sincronização automática com AI-ProjectDeveloper
  - ❌ Volta a ter dependência de submodule (problema que tentamos resolver)
  - ❌ Requer clone do submodule para usar localmente

**Recomendação:** **Opção A** (versionar tudo)
- Motivo: Remove complexidade de submodule, simplifica install.sh, offline-friendly

---

### **D2: Estrutura de dotfiles/global/ será imutável?**

**Opções:**
- **Sim (A):** dotfiles/global/ é cópia exata do AI-ProjectDeveloper (read-only logicamente)
  - ✅ Rastreabilidade clara (origem = AI-ProjectDeveloper)
  - ✅ Sem risco de divergência
  - ❌ Dificuldade se precisar corrigir algo localmente
  - ❌ Difícil de manter sincronizado com origem futura

- **Não (B):** Permitir edições locais em dotfiles/global/
  - ✅ Flexibilidade para correções e adaptações
  - ❌ Risco de divergência com AI-ProjectDeveloper
  - ❌ Difícil rastrear origem real de um recurso

**Recomendação:** **Opção A** (imutável logicamente)
- Motivo: Clareza de origem, menos confusão futura. Se precisar editar, faz em dotfiles/[claude|cursor|codex]/ específicas.

---

### **D3: Como atualizar dotfiles/global/ quando AI-ProjectDeveloper muda?**

**Opções:**
- **Manual:** Git pull do AI-ProjectDeveloper, cópia manual para stec-developer-setup
- **Script:** Criar `scripts/sync-from-ai-projectdeveloper.sh` que automatiaza cópia
- **Merge Request:** Alguém cria MR com mudanças do AI-ProjectDeveloper

**Recomendação:** **Script automatizado**
- Criar `scripts/update-global-from-source.sh` que:
  1. Clona/puxa AI-ProjectDeveloper em `/tmp/`
  2. Copia para `dotfiles/global/`
  3. Gera commit com mensagem "chore: sync dotfiles/global from AI-ProjectDeveloper (rev: XXX)"
  4. Pede review antes de push (safety check)

---

## 📊 Comparação: Anterior vs Novo

| Aspecto | V1 (Submodule) | V2 (Centralizado) |
|---------|----------------|-----------------|
| **Dependência Submodule** | ✅ Sim | ❌ Não |
| **Complexidade install.sh** | 🟡 Média | 🟡 Média |
| **Tamanho repo** | 🟢 Pequeno | 🟡 Maior (~XX MB) |
| **Offline-friendly** | ❌ Requer submodule | ✅ Sim |
| **Sincronização com origem** | 🟢 Automática (git) | 🟡 Manual (script) |
| **Clareza de arquivo** | 🟡 Incerta (onde vem) | ✅ Clara (dotfiles/global/) |
| **Customizações locais** | 🟡 Difícil | ✅ Fácil (dotfiles/[claude\|...]) |
| **Rastreabilidade** | 🟢 Via submodule | 🟢 Via commits |
| **Manutenção** | 🟡 Média | 🟢 Baixa |

---

## ❓ Perguntas para Decisão Final

**P1:** Deve versionarmos todos os 316 skills em dotfiles/global/?  
→ **Decisão necessária:**
  - A) Sim, versionado (offline, sem submodule)
  - B) Não, deixar como submodule novo

**P2:** Qual é o tamanho estimado de dotfiles/global/ (com todos os arquivos)?  
→ **Necessário para confirmar que é viável versionado**

**P3:** Existe processo de atualização esperado do AI-ProjectDeveloper?  
→ **Decisão sobre frequência de sincronização e processo**

**P4:** Os arquivos existentes em dotfiles/[claude|cursor|codex] devem ser preservados ou descartados?  
→ **Decisão sobre migração de assets existentes**

---

## 🚀 Próximas Ações (após aprovação)

1. Responder perguntas de decisão acima
2. Executar Fase 1 (preparação e catalogação)
3. Executar Fase 2-3 (criar estrutura e migrar)
4. Testar em projeto piloto (Fase 7)
5. Comunicar mudanças para equipe (Fase 8)
6. Remover V1 (submodule) do repositório

---

**Documento criado em:** 10 de maio de 2026  
**Status:** Aguardando aprovação do plano  
**Próximo documento a ser deletado:** `docs/PLANO-INTEGRACAO-CURSOR-SKILLS.md` (versão anterior)
