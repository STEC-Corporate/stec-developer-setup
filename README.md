# STEC Developer Setup — Harness Global

**Configuração automática de Harness para Claude Code, Cursor e Codex CLI.**

Harness é o padrão que estrutura como toda ferramenta de IA trabalha em projetos STEC/Olinket.

**Fórmula:** `Agent = Model + Harness`

---

## 🎯 O que é este repositório

Este repositório contém a **configuração global de harness** — tudo que uma ferramenta de IA precisa saber para trabalhar efetivamente em qualquer projeto:

- **CLAUDE.md** — Instruções imperatIvas para aplicar harness automaticamente
- **HARNESS.md** — Referência conceitual (3 camadas do harness)
- **harness-apply.sh** — Script que detecta stack e cria estrutura
- **Templates** — Arquivos prontos para Python, Node, Java, genérico
- **Scripts de instalação** — Para todas as plataformas

---

## 🤔 Por que este repositório existe

Sem harness, novos projetos começam do zero: sem contexto, sem rastreamento, sem auditoria.

Com harness, **todo novo projeto têm automaticamente:**
- ✅ Contexto para a IA (CLAUDE.md)
- ✅ Rastreamento de estado (progress.md)
- ✅ Bootstrap reprodutível (scripts/init.sh)
- ✅ Auditoria completa (git discipline)
- ✅ Governança de gates (aprovações, transições)

---

## 📦 O que será instalado (Distribuição Completa)

A instalação distribui automaticamente hooks, agents, skills, scripts e rules para as 3 IDEs:

### Claude Code (`~/.claude/`)
| Recurso | Origem | Função |
|---------|--------|--------|
| `settings.json` | `dotfiles/claude/` | Hooks PreToolUse, PostToolUse, Stop (Guard-shell + Audit + Auto-progress + Checklist) |
| `HARNESS.md` | `dotfiles/claude/` | Referência conceitual |
| `scripts/harness-apply.sh` | `dotfiles/claude/scripts/` | Aplica harness universal (Claude+Cursor+Codex) em projetos |
| `scripts/typecheck-hook.sh` | `dotfiles/claude/scripts/` | Hook TypeScript |
| `scripts/progress-update.sh` | `dotfiles/claude/scripts/` | Atualiza `progress.md` automaticamente |
| `templates/` | `templates/` | Templates Python, Node, Java, generic |

### Cursor IDE (`~/.cursor/`)
| Recurso | Origem | Função |
|---------|--------|--------|
| `hooks.json` | `dotfiles/cursor/` | Hooks beforeShellExecution, afterFileEdit, stop |
| `HARNESS.md` | `dotfiles/cursor/` | Referência conceitual |
| `agents/` (8 agents) | `dotfiles/cursor/agents/` | harness-apply, java/kotlin/nestjs/nextjs/python/react/react-native especialistas |
| `skills/` (12 skills) | `dotfiles/cursor/skills/` | gates (arquitetura/ci/segurança/testes) + workflows-base por stack |
| `scripts/` (4 scripts) | `dotfiles/cursor/scripts/` | guard-shell, progress-update, checklist, harness-apply |

### Codex CLI (`~/.codex/`)
| Recurso | Origem | Função |
|---------|--------|--------|
| `HARNESS.md` | `dotfiles/codex/` | Referência conceitual |
| `instructions.md` | `dotfiles/codex/` | Instruções automáticas |
| `skills/` (2 skills) | `dotfiles/codex/skills/` | cursor-agent-orchestrator, cursor-project-standards |
| `rules/default.rules` | `dotfiles/codex/rules/` | Rules globais |
| `scripts/` (4 scripts) | `dotfiles/codex/scripts/` | guard-shell, progress-update, checklist, harness-apply |

### Home Level
| Arquivo | Onde vai | O que é |
|---------|----------|--------|
| `CLAUDE.md` | `~/CLAUDE.md` | Instrução imperativa global (lido por todas IDEs) |

---

## ✅ Pré-requisitos

- **Git** instalado (`git --version`)
- **Pelo menos uma** das ferramentas:
  - Claude Code (instalado e funcional)
  - Cursor (IDE)
  - Codex CLI (OpenAI Codex line)

---

## 🚀 Instalação por Plataforma

### Linux / macOS

```bash
bash install.sh
```

Padrão: instala em `~/.claude/`, `~/.cursor/`, `~/.codex/`

### WSL2 (Ubuntu no Windows)

```bash
bash install.sh
```

O script detecta WSL2 e pergunta:
- **1 — Linux (WSL2)** — ferramentas instaladas no WSL
- **2 — Windows** — ferramentas instaladas no Windows, usa `/mnt/c/Users/...`
- **3 — Ambos** — instala nos dois locais

### Windows PowerShell (nativo)

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
.\install.ps1
```

Padrão: instala em `%APPDATA%\Claude`, `%USERPROFILE%\.cursor`, `%USERPROFILE%\.codex`

### Git Bash (Windows)

```bash
bash install.sh
```

Padrão: instala em `~/.claude/`, `~/.cursor/`, `~/.codex/` (home do Git Bash)

---

## 📋 O que fazer após instalar

1. **Abrir novo terminal/IDE:**
   ```bash
   # Fechar e abrir de novo para carregar as novas variáveis
   ```

2. **Ir para um projeto com `.git`:**
   ```bash
   cd ~/Projetos/seu-projeto
   ```

3. **Claude/Cursor/Codex aplicam harness automaticamente:**
   ```
   🔍 Verificando harness...
   ✅ CLAUDE.md, progress.md, scripts/init.sh OK
   ```

4. **Inicializar ambiente:**
   ```bash
   bash scripts/init.sh
   ```

5. **Registrar ideia no TaskLink (obrigatório):**
   ```bash
   tasklink idea create \
     --title "Nome da ideia" \
     --problem "O problema que resolve" \
     --hypothesis "Hipótese de valor" \
     --profile "Quem é o usuário"
   ```

6. **Começar a codificar** — siga o `CLAUDE.md` do projeto.

---

## 🔄 Como atualizar e validar

O harness evolui. Para manter sincronizado e validar:

```bash
cd ~/Projetos/stec-developer-setup
git pull
bash install.sh                    # Distribui tudo (recursivo)
bash scripts/validate-install.sh   # Valida paridade IDE ↔ repositório
```

O `install.sh` nunca sobrescreve arquivos existentes — apenas instala novos.

O `validate-install.sh` compara recursivamente cada arquivo de `dotfiles/` com o que está em `~/.claude/`, `~/.cursor/` e `~/.codex/`, reportando o que está faltando.

Para **forçar atualização** de arquivos:
```bash
# Linux/macOS:
bash install.sh --force  # (não implementado yet, use cp manual)

# Windows PowerShell:
.\install.ps1 -Force
```

---

## 📚 Referência Completa

Para entender o harness profundamente:

1. **Quick start:** `@~/.claude/HARNESS.md` ou `~/.cursor/HARNESS.md`
2. **Tutorial detalhado:** `/home/jesus/Projetos/tasklink/docs/tutoriais/Tutorial-Harness.md` (36 KB — deep dive)
3. **Pacotes Python:** Consultar README de cada um
   - `tasklink-harness-core` — tipos, validators, skills
   - `tasklink-harness-cli` — CLI para operações
   - `tasklink-harness-integration` — webhooks, CI/CD, rules

---

## 🏗️ Estrutura do Repositório

```
stec-developer-setup/
├── README.md                       # Este arquivo
├── install.sh                      # Instalador (cópia recursiva)
├── install.ps1                     # Instalador Windows PowerShell
├── scripts/
│   ├── detect-env.sh               # Detecção de plataforma (sourced)
│   └── validate-install.sh         # Valida paridade IDE ↔ repo
├── dotfiles/
│   ├── home/
│   │   └── CLAUDE.md               # ~/CLAUDE.md (instrução global)
│   ├── claude/                     # Claude Code
│   │   ├── HARNESS.md
│   │   ├── settings.json           # Hooks: PreToolUse + PostToolUse + Stop
│   │   └── scripts/
│   │       ├── harness-apply.sh    # Universal (Claude+Cursor+Codex)
│   │       ├── typecheck-hook.sh   # TypeScript hook
│   │       └── progress-update.sh  # Auto-update progress.md
│   ├── cursor/                     # Cursor IDE
│   │   ├── HARNESS.md
│   │   ├── hooks.json              # Hooks Cursor (beforeShellExecution etc)
│   │   ├── agents/                 # 8 agents (harness-apply + 7 especialistas)
│   │   ├── skills/                 # 12 skills (gates + workflows-base)
│   │   └── scripts/
│   │       ├── guard-shell.sh
│   │       ├── progress-update.sh
│   │       ├── checklist.sh
│   │       └── harness-apply.sh
│   └── codex/                      # Codex CLI
│       ├── HARNESS.md
│       ├── instructions.md
│       ├── skills/                 # 2 skills
│       ├── rules/
│       │   └── default.rules
│       └── scripts/
│           ├── guard-shell.sh
│           ├── progress-update.sh
│           ├── checklist.sh
│           └── harness-apply.sh
└── templates/
    ├── python/                     # Template Python
    ├── node/                       # Template Node/TypeScript
    ├── java/                       # Template Java
    └── generic/                    # Template genérico
```

---

## 🐛 Troubleshooting

### "Erro: arquivo já existe"
Se `CLAUDE.md` ou outros já existem, o script pula (não sobrescreve). Para forçar:
```bash
# Remover manualmente ou usar -Force (Windows)
rm ~/.claude/HARNESS.md
bash install.sh
```

### "Permissão negada" (Linux/macOS)
```bash
chmod +x install.sh
bash install.sh
```

### "WSL2: ferramentas no Windows não encontradas"
Se usar WSL2 mas ferramentas estão no Windows e scripts não encontram `/mnt/c/Users/...`:
- Verificar que Windows está montado: `ls /mnt/c/`
- Instalar manualmente em `C:\Users\seu-usuario\AppData\Roaming\Claude\` etc.

### "PowerShell: script desabilitado"
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
.\install.ps1
```

---

## 📞 Suporte

Problemas com o harness?

1. Verificar: `@~/.claude/HARNESS.md`
2. Ler: `/home/jesus/Projetos/tasklink/docs/tutoriais/Tutorial-Harness.md`
3. Executar novamente: `bash install.sh` (ou `.\install.ps1`)
4. Reportar issue no repositório

---

## 📝 Histórico de Mudanças

| Data | Mudança |
|------|---------|
| 2026-05-06 | v1.0 — Setup inicial com templates 4 stacks, dual-platform (Bash + PowerShell) |
| 2026-05-10 | v2.0 — Sincronização completa: hooks, agents (8), skills (12+2), scripts e rules para Claude+Cursor+Codex. Adicionado `validate-install.sh` e cópia recursiva no `install.sh`. |

---

## 📄 Licença

Interno STEC. Não distribuir.

---

**Última atualização:** 2026-05-06  
**Manutenção:** Jesus (jesus@soundlink.com)  
**Status:** ✅ Ativo
