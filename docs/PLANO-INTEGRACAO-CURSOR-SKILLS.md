# ⚠️ DEPRECADO — ver `progress.md` e `PLANO-INTEGRACAO-AI-PROJECTDEVELOPER-V2.md`

> Este plano foi superado pela integração v2 (2026-05-11). TODO-1 a TODO-6 estão completos.
> O catálogo foi migrado para `dotfiles/global/` e o submodule `.cursor` foi removido.

---

# 📋 Plano: Integração de Skills do `.cursor` Submodule aos Dotfiles

## 🎯 Objetivo

Integrar os **316 skills** (+ agents, rules, hooks) do submodule `.cursor` (AI-ProjectDeveloper da STEC) aos `dotfiles/claude/`, `dotfiles/cursor/` e `dotfiles/codex/` de forma que sejam distribuídos via `install.sh` para as ferramentas de cada developer.

---

## 📊 Estado Atual

### Estrutura de Origem
```
.cursor/ (submodule externo: STEC-Corporate/AI-ProjectDeveloper)
├── agents/        (77 agentes classificados)
├── skills/        (316 skills com prefixos funcionais)
├── rules/         (Regras .mdc)
├── codex-skills/  (Skills específicas para Codex)
├── hooks/         (Hooks de integração)
├── mcp/           (Configurações MCP)
└── plans/         (Planos de trabalho)
```

### Estrutura de Destino
```
dotfiles/
├── claude/
│   └── scripts/
├── cursor/
│   ├── agents/
│   ├── skills/        (16 skills base)
│   └── scripts/
├── codex/
│   ├── skills/        (2 skills base)
│   ├── rules/
│   └── scripts/
└── home/
```

### Como Instala Hoje
```bash
install.sh
├── copia dotfiles/claude → ~/.claude/
├── copia dotfiles/cursor → ~/.cursor/
└── copia dotfiles/codex  → ~/.codex/
```

---

## 🔄 Três Cenários de Solução

### **CENÁRIO 1: Centralizado em `.cursor` Submodule**

**Descrição:** O `install.sh` copia diretamente de `.cursor/` (sem intermediário em `dotfiles/`).

```bash
install.sh (novo)
├── copia .cursor/agents → ~/.cursor/agents
├── copia .cursor/skills → ~/.cursor/skills
├── copia .cursor/rules  → ~/.cursor/rules
├── copia .cursor/codex-skills → ~/.codex/skills
├── copia .cursor/hooks  → ~/.cursor/hooks
├── copia dotfiles/claude/scripts → ~/.claude/scripts
└── ...
```

#### ✅ Pros
- **Single Source of Truth:** Todas as 316+ skills vêm de um único lugar
- **Sem Redundância:** Evita duplicação entre `.cursor` e `dotfiles/`
- **Fácil Atualizar:** Git pull no submodule traz novas skills automaticamente
- **Versionamento Limpo:** Submodule gerencia versão do catálogo corporativo
- **Menos Manutenção:** Não duplicar skills locais vs corporativas
- **Alinhamento STEC:** Usa o repositório oficial corporativo como fonte

#### ❌ Contras
- **Complexidade do Install.sh:** Precisa saber mapear `.cursor/*` → `~/.claude/`, `~/.cursor/`, `~/.codex/` (requer transformações)
- **Acoplamento ao Submodule:** Se submodule for deletado/movido, instação quebra
- **Sem Override Local:** Difícil adicionar skills específicas de projeto sem editar submodule
- **Menos Flexível:** Dificilmente developer pode customizar sem afetar todos
- **CI/CD Complexity:** Deploy precisa cuidado extra com submodule checkout

#### 🔧 Implementação
```bash
# Estrutura do install.sh seria:

# Copy from .cursor (submodule) → local tools
copy_from_cursor_to_tools() {
    # Cursor IDE
    cp -rn ".cursor/agents" "$CURSOR_CONFIG_DIR/"
    cp -rn ".cursor/skills" "$CURSOR_CONFIG_DIR/"
    cp -rn ".cursor/rules" "$CURSOR_CONFIG_DIR/"
    
    # Codex CLI
    cp -rn ".cursor/codex-skills" "$CODEX_CONFIG_DIR/skills"
    cp -rn ".cursor/rules" "$CODEX_CONFIG_DIR/"
    
    # Claude Code
    # (menos suporte, talvez não copia de .cursor)
}
```

---

### **CENÁRIO 2: Centralizado em `dotfiles/`**

**Descrição:** Copiar 316+ skills de `.cursor/` para `dotfiles/cursor/skills/`, `dotfiles/codex/skills/` etc. (sincronização periódica).

```
dotfiles/
├── claude/
│   └── scripts/
├── cursor/
│   ├── agents/        ← Cópia de .cursor/agents
│   ├── skills/        ← Cópia de .cursor/skills (316 items)
│   ├── rules/
│   └── scripts/
├── codex/
│   ├── skills/        ← Cópia de .cursor/codex-skills + mapeadas
│   ├── rules/         ← Cópia de .cursor/rules
│   └── scripts/
└── home/
```

**Install.sh permanece igual:**
```bash
copy_recursive_tree "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor IDE"
```

#### ✅ Pros
- **Simplicidade Máxima:** Install.sh não muda estruturalmente
- **Flexibilidade Total:** Podem adicionar/remover skills locais sem afetar submodule
- **Versionamento em Uma Plataforma:** Tudo em stec-developer-setup (um histórico limpo)
- **Offline Friendly:** Não precisa de clone do submodule para usar localmente
- **Menos Surpresas:** Developers sabem exatamente o que vai instalar
- **Melhor para CI/CD:** Sem dependência de submodule checkout extra

#### ❌ Contras
- **Redundância Imensa:** 316 skills duplicadas em dois repositórios
- **Dessincronização:** Atualizações do submodule corporativo não chegam automaticamente
- **Manutenção Dupla:** Se corrigir skill no submodule, precisa copiar para cá também
- **Conflitos de Merge:** Dois repositórios = mais chance de conflito
- **Sem Semver Claro:** Difícil rastrear "qual versão do catálogo corporativo estou usando?"
- **Scalability:** Quando temos 500+ skills, `.git` fica pesado

#### 🔧 Implementação
```bash
# Script de sincronização (ex: sync-from-cursor.sh)
CURSOR_SOURCE="./.cursor"
DOTFILES_TARGET="./dotfiles"

# Sincronizar cursor skills
cp -r "$CURSOR_SOURCE/skills"/* "$DOTFILES_TARGET/cursor/skills/"
cp -r "$CURSOR_SOURCE/agents"/* "$DOTFILES_TARGET/cursor/agents/"
cp -r "$CURSOR_SOURCE/rules"/* "$DOTFILES_TARGET/cursor/rules/"

# Sincronizar codex
cp -r "$CURSOR_SOURCE/codex-skills"/* "$DOTFILES_TARGET/codex/skills/"
cp -r "$CURSOR_SOURCE/rules"/* "$DOTFILES_TARGET/codex/rules/"

git add dotfiles/
git commit -m "chore: sync skills from .cursor submodule"
```

---

### **CENÁRIO 3: Híbrido — Separação Lógica**

**Descrição:** Manter `.cursor` como **catálogo corporativo**, copiar skills **base/essenciais** para `dotfiles/`, e script copia ambos.

```
.cursor/ (Corporativo — 316 skills)
└── skills/

dotfiles/cursor/skills/ (Base — ~30-50 skills essenciais)
└── [Skill.md base específicas de stec-developer-setup]

install.sh
├── Copia dotfiles/cursor/skills → ~/.cursor/skills/ (primeiro)
├── Copia .cursor/skills → ~/.cursor/skills/ (sobrepõe, sem -n)
└── Resultado: Versão corporativa + customizações locais
```

#### ✅ Pros
- **Melhor Dos Dois Mundos:** Catálogo corporativo + flexibilidade local
- **Escalável:** `.cursor` cresce sem inchar stec-developer-setup
- **Versionamento Claro:** Sabemos qual é "base STEC" vs "customizado"
- **Backward Compatible:** Developers que não usam submodule ainda conseguem skills base
- **Fácil Customizar:** Adicionar override local sem editar submodule
- **Sincronização Optional:** Pode fazer pull do submodule quando quiser
- **Git Limpo:** Sem 316 arquivos a sincronizar a cada commit

#### ❌ Contras
- **Mais Complexo:** Script precisa lidar com dois fontes (ordem importa)
- **Possível Confusão:** Developer não sabe "qual skill estou usando — a local ou corporativa?"
- **Mais Documentação Necessária:** Precisa explicar precedência (local > corporativo)
- **Dois Lugares para Manter:** Se skill está em ambos, qual atualizar?
- **Cache/Desincronização:** Se não sincronizar, skills antigas em dotfiles ficam para trás

#### 🔧 Implementação
```bash
# install.sh com precedência "local > corporativo"

# 1º: Copiar base (dotfiles)
copy_recursive_tree "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor IDE"

# 2º: Sobrepor com catálogo corporativo (submodule)
if [ -d ".cursor/skills" ]; then
    echo "📦 Adicionando skills corporativas..."
    cp -r ".cursor/skills"/* "$CURSOR_CONFIG_DIR/skills/"
    cp -r ".cursor/agents"/* "$CURSOR_CONFIG_DIR/agents/"
fi

# Resultado: skills base + corporativas, com corporate como default
```

---

## 🎯 Recomendação Final

### **CENÁRIO 3 (Híbrido) é o recomendado** ✨

#### Por quê?

1. **Respeita Arquitetura Existente:**
   - `.cursor` já é um submodule **intencional** para catálogo corporativo
   - `dotfiles/` já é template de instalação local
   - Mesclar os dois mantém cada um com seu propósito

2. **Suporta Três Padrões de Uso:**
   - **Desenvolvedores Novos:** Recebem skills base + corporativas
   - **Projetos Customizados:** Podem adicionar `.cursor/skills/meu-projeto` sem afetar stec-developer-setup
   - **STEC Corporate:** Atualiza AI-ProjectDeveloper e pull traz novas skills

3. **Escalável:**
   - `.cursor` pode crescer para 500+ skills sem inchar stec-developer-setup
   - Cada repositório Filho pode ter seu próprio `.cursor` customizado

4. **Manutenção Baixa:**
   - Install.sh só precisa 2 linhas de cópia (simples)
   - Sem sincronização bidirecional complexa
   - Sem risco de sobrescrever submodule acidentalmente

---

## 📝 Plano de Implementação (Híbrido)

### Fase 1: Reorganizar `dotfiles/`
```bash
# Estrutura nova
dotfiles/
├── claude/
│   └── scripts/
├── cursor/
│   ├── agents/             # Skills base STEC (não corporativo)
│   ├── skills/             # Skills base STEC
│   ├── hooks.json
│   └── scripts/
├── codex/
│   ├── skills/             # Skills base STEC
│   ├── rules/              # Rules base STEC
│   └── scripts/
└── home/
    └── CLAUDE.md
```

**Objetivo:** `dotfiles/` contém apenas **configuração base** (templates, scripts, fundamentos).

### Fase 2: Atualizar `install.sh`
```bash
# Copiar base (dotfiles/)
copy_recursive_tree "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor IDE"

# Adicionar catálogo corporativo (se submodule presente)
if [ -d ".cursor" ] && [ -d ".cursor/skills" ]; then
    echo "📦 Integrando catálogo corporativo STEC..."
    cp -r ".cursor/agents"/* "$CURSOR_CONFIG_DIR/agents/" 2>/dev/null || true
    cp -r ".cursor/skills"/* "$CURSOR_CONFIG_DIR/skills/" 2>/dev/null || true
    cp -r ".cursor/rules"/* "$CURSOR_CONFIG_DIR/rules/" 2>/dev/null || true
fi

# Similar para Codex
if [ -d ".cursor/codex-skills" ]; then
    cp -r ".cursor/codex-skills"/* "$CODEX_CONFIG_DIR/skills/" 2>/dev/null || true
fi
```

### Fase 3: Documentar Precedência
Adicionar em `docs/ferramentas/Mapeamento-Arquivos-IDEs.md`:

```markdown
## Precedência de Carregamento de Skills (Híbrido)

1. **Skills locais** (`dotfiles/cursor/skills/`) — Carregadas primeiro
2. **Skills corporativas** (`.cursor/skills/` submodule) — Sobrepõem locais
3. **Resultado:** Desenvolvedor recebe skills base + catálogo corporativo

Se existe `skill-name` em ambos, a **versão corporativa** (submodule) é usada.
```

### Fase 4: Criar `.gitignore` para Submodule
```bash
# stec-developer-setup/.gitignore

# Submodule (externo, versionado separadamente)
.cursor/skills/
.cursor/agents/
.cursor/rules/
.cursor/codex-skills/
# (ou especificar em .git/config para não versionar)
```

---

## 📊 Comparação Final

| Aspecto | Cenário 1 | Cenário 2 | Cenário 3 ✅ |
|---------|-----------|-----------|------------|
| **Complexidade Script** | 🟡 Alta | 🟢 Baixa | 🟢 Baixa |
| **Sincronização** | 🟢 Automática | 🟡 Manual | 🟢 Automática |
| **Redundância** | 🟢 Zero | 🔴 Alta | 🟢 Baixa |
| **Flexibilidade Local** | 🟡 Limitada | 🟢 Máxima | 🟢 Boa |
| **Manutenção** | 🟡 Média | 🔴 Alta | 🟢 Baixa |
| **Escalabilidade** | 🟢 Excelente | 🟡 Limitada | 🟢 Excelente |
| **Offline Friendly** | 🟡 Requer submodule | 🟢 Sim | 🟢 Sim |
| **Versionamento** | 🟢 Claro | 🟡 Confuso | 🟢 Claro |

---

## 🚀 Próximas Ações (se aprovar Cenário 3)

1. **Revisar Conteúdo de `dotfiles/`**
   - Quais skills devem ser "base STEC"?
   - Quais devem vir só de `.cursor`?

2. **Criar Script de Sincronização (Optional)**
   - Para manter referência de "qual versão do submodule estou usando"
   - `scripts/sync-from-cursor.sh` (informativo, não obrigatório)

3. **Atualizar `install.sh`**
   - Adicionar fase de cópia de `.cursor` se presente

4. **Testar em Projeto Piloto**
   - Instalar em novo projeto
   - Verificar se Cursor descobre skills corretamente
   - Testar override local

5. **Documentar em CLAUDE.md**
   - Explicar como adicionar skills específicas de projeto

---

## ❓ Dúvidas para Você Decidir

**P1:** Quantas das 316 skills devem ser "base" em `dotfiles/cursor/skills/`?  
→ Recomendo: Apenas as **essenciais** (10-20), corporativas vêm do submodule.

**P2:** Os agents em `.cursor/agents/` devem ser mantidos sincronizados em `dotfiles/cursor/agents/`?  
→ Recomendo: **Não**. Deixar em `.cursor` apenas (corporativo).

**P3:** E quanto a regras (rules/) e hooks?  
→ Recomendo: Copiar base simples para `dotfiles/` (ex: padrões), corporativas vêm de `.cursor/`.

**P4:** Se developer não clonar submodule, recebe versão completa das skills?  
→ Sim, pelo menos as base de `dotfiles/`. Mas perde as 300+ corporativas.

