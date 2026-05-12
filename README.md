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

A instalação opera em **duas fases** e distribui 779+ artefatos corporativos para as 3 IDEs:

- **Fase 1:** `dotfiles/global/` → catálogo base corporativo (316 skills, 230 agents, 93 rules)
- **Fase 2:** `dotfiles/[ide]/` → customizações IDE-específicas (sobrescrevem Fase 1 se conflito)

### Claude Code (`~/.claude/`)
| Recurso | Qtd | Origem | Função |
|---------|-----|--------|--------|
| `skills/` | 316 | `dotfiles/global/skills/` | Catálogo completo AI-ProjectDeveloper |
| `rules/` | 93 | `dotfiles/global/rules/` | Rules MDC corporativas |
| `mcp/` | 2 | `dotfiles/global/mcp/` | Templates de configuração MCP |
| `settings.json` | — | `dotfiles/claude/` | Hooks PreToolUse, PostToolUse, Stop |
| `HARNESS.md` | — | `dotfiles/claude/` | Referência conceitual |
| `scripts/` | 5 | `dotfiles/claude/scripts/` + `global/scripts/` | harness-apply, typecheck-hook, progress-update, guard-shell, checklist |
| `templates/` | 12 | `templates/` | Templates Python, Node, Java, generic |

### Cursor IDE (`~/.cursor/`)
| Recurso | Qtd | Origem | Função |
|---------|-----|--------|--------|
| `skills/` | 316 | `dotfiles/global/skills/` | Catálogo completo AI-ProjectDeveloper |
| `agents/` | 230 | `dotfiles/global/agents/` | Agentes corporativos (arch, code, security, etc.) |
| `rules/` | 93 | `dotfiles/global/rules/` | Rules MDC corporativas |
| `hooks.json` | — | `dotfiles/cursor/` | Hooks beforeShellExecution, afterFileEdit, stop |
| `HARNESS.md` | — | `dotfiles/cursor/` | Referência conceitual |
| `scripts/` | 6 | `dotfiles/cursor/scripts/` + `global/scripts/` | guard-shell, progress-update, checklist, harness-apply |

### Codex CLI (`~/.codex/`)
| Recurso | Qtd | Origem | Função |
|---------|-----|--------|--------|
| `skills/` | 320 | `global/skills/` + `global/codex/skills/` | 316 genéricas + 4 Codex-específicas |
| `agents/` | 229 | `dotfiles/global/agents/` | Agentes corporativos |
| `rules/` | 93 | `dotfiles/global/rules/` | Rules MDC corporativas |
| `HARNESS.md` | — | `dotfiles/codex/` | Referência conceitual |
| `instructions.md` | — | `dotfiles/codex/` | Instruções automáticas |
| `scripts/` | 6 | `dotfiles/codex/scripts/` + `global/scripts/` | guard-shell, progress-update, checklist, harness-apply |

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

## 🎓 Tutorial: Onboarding para Novo Developer

Este é um guia passo-a-passo para um novo developer configurar um projeto STEC pela primeira vez.

### ⏱️ Tempo estimado: 15 minutos

### 📋 Pré-requisitos (Check-in)

Antes de começar, verifique se você tem:

```bash
# 1. Git instalado
git --version
# Output esperado: git version 2.x.x

# 2. Node.js (se for projeto Node/TypeScript)
node --version
npm --version

# 3. Python 3 (se for projeto Python)
python3 --version

# 4. Java JDK (se for projeto Java)
java -version
```

Se algo estiver faltando, passe para o seu Tech Lead para instalação.

---

### 🚀 Passo 1: Clonar o Projeto (2 min)

```bash
# Substituir <repo-url> com a URL real do repositório
git clone <repo-url>
cd seu-projeto

# Verificar que é um repositório Git real
ls -la | grep ".git"
```

**Esperado:** Você vê `.git/` e outros arquivos/pastas do projeto.

---

### ⚙️ Passo 2: Executar o Bootstrap Automático (5 min)

```bash
bash scripts/init.sh
```

Este script faz **automaticamente**:
- ✅ Detecta a plataforma (Linux, Windows, WSL2, macOS)
- ✅ Gera `.env.local` com seus paths pessoais
- ✅ Instala dependências (npm, pip, Maven, etc.)
- ✅ Gera tipos (Prisma, TypeScript, etc.)
- ✅ Verifica scripts disponíveis (build, test, lint)

**Esperado:** Verá saída verde com checkmarks ✅

```
🚀 Inicializando projeto Node.js em /home/seu-usuario/Projetos/seu-projeto
✅ Node.js instalado: v18.16.0
✅ npm instalado: 9.6.7
📦 Usando: npm
...
✨ Ambiente Node.js configurado!
```

---

### 🔍 Passo 3: Verificar que Tudo Funciona (3 min)

```bash
# 1. Verificar que .env.local foi criado com seus paths
cat .env.local
```

**Esperado:** Arquivo com variáveis como:
```bash
PLATFORM=wsl2
PROJECT_ROOT=/home/seu-usuario/Projetos/seu-projeto
USER_NAME=seu-usuario
CLAUDE_CONFIG_DIR=/home/seu-usuario/.claude
```

```bash
# 2. Rodar um teste rápido
npm test    # (ou yarn test / pnpm test / python -m pytest / mvn test)
```

**Esperado:** Testes passando ou informação clara de quais falharam (normal em setup inicial).

```bash
# 3. Verificar linting/type-checking
npm run lint     # (se existir)
npm run typecheck # (se existir)
```

---

### 📖 Passo 4: Ler o Contexto do Projeto (2 min)

```bash
# Entender para quem você está desenvolvendo
cat CLAUDE.md
```

Este arquivo explica:
- 🎯 Objetivo do projeto
- 📋 Stack técnico
- 👥 Quem você está ajudando
- 🚫 O que NÃO fazer
- ✅ Como trabalhar aqui

```bash
# (Opcional) Ver o progresso atual
cat progress.md
```

---

### ✅ Passo 5: Fazer seu Primeiro Commit (2 min)

Se o harness foi aplicado automaticamente, você verá arquivo(s) novos como `.env.local`, `progress.md`, etc.

```bash
# Ver o que mudou
git status

# Adicionar arquivo(s) de configuração pessoal
git add .env.local    # (já está em .gitignore, safe)
git add progress.md   # (se criado)

# Commit
git commit -m "setup: configurar ambiente local"

# Ver log
git log --oneline -3
```

---

### 🎯 Passo 6: Próximos Passos — Começar a Trabalhar

#### Se você é novo no projeto:
```bash
# 1. Encontrar a primeira tarefa
cat CLAUDE.md  # (leia a seção de "Próximos passos")

# 2. Criar um branch
git checkout -b feature/sua-feature

# 3. Fazer uma pequena mudança e testar
npm test
git add .
git commit -m "feat: descrição breve"
git push origin feature/sua-feature
```

#### Se você tem uma ideia/bug to fix:
```bash
# 1. Registrar no TaskLink (obrigatório)
tasklink idea create \
  --title "Minha ideia" \
  --problem "O problema que resolve" \
  --hypothesis "Por que vai funcionar" \
  --profile "Quem vai usar"

# 2. Criar feature branch
git checkout -b fix/seu-fix

# 3. Fazer mudanças + tests + commit
# 4. Push and PR
```

---

### 🐛 Troubleshooting Rápido

| Problema | Solução |
|----------|---------|
| `.env.local` não foi criado | Rodar novamente: `bash scripts/init.sh` |
| `scripts/init.sh` não encontrado | Verificar que você está na raiz do projeto (`pwd`) |
| Node/Python/Java não encontrado | Instalar via `brew`, `apt`, `choco`, etc. Pedir ajuda ao Tech Lead |
| Teste falha | Normal em setup inicial. Ver error. Pedir ajuda no Slack #dev-support |
| Git permission denied | Configurar SSH keys: `ssh-keygen -t ed25519` |

---

### ✨ Pronto!

Você agora tem:
- ✅ Projeto clonado
- ✅ Ambiente configurado (`.env.local` com seus paths)
- ✅ Dependências instaladas
- ✅ Testes passando (ou informado qual está quebrando)
- ✅ Contexto do projeto claro (CLAUDE.md)
- ✅ Pronto para contribuir

**Próxima ação:** Comece a trabalhar! Siga o CLAUDE.md do projeto.

---

## 🔄 Como atualizar e validar

O harness evolui. Para manter sincronizado e validar:

```bash
cd ~/Projetos/stec-developer-setup
git pull
bash install.sh                    # Distribui tudo (recursivo)
bash scripts/validate-install.sh   # Valida paridade IDE ↔ repositório
```

O `install.sh` é **idempotente**: na Fase 1 pula arquivos existentes (seguro rodar múltiplas vezes); na Fase 2 sobrescreve com os overlays customizados. Para atualizar o catálogo completo, basta rodar `bash install.sh` novamente.

O `validate-install.sh` verifica os 35 arquivos de overlay críticos, reportando presença/ausência em cada IDE.

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
├── install.sh                      # Instalador (Fase 1 + Fase 2)
├── install.ps1                     # Instalador Windows PowerShell
├── scripts/
│   ├── detect-env.sh               # Detecção de plataforma (sourced)
│   └── validate-install.sh         # Valida 35 arquivos de overlay críticos
├── dotfiles/
│   ├── global/                     # Catálogo corporativo AI-ProjectDeveloper
│   │   ├── agents/  (230 agents)   # Agentes arch, code, security, etc.
│   │   ├── skills/  (316 skills)   # Skills genéricas (Claude + Cursor + Codex)
│   │   ├── rules/   (93 rules)     # Rules MDC corporativas
│   │   ├── hooks/                  # Hooks de integração
│   │   ├── mcp/                    # Templates MCP (.example.json)
│   │   ├── scripts/                # Scripts corporativos
│   │   ├── plans/                  # Planos de trabalho
│   │   ├── docs/   (163 docs)      # Documentação AI-ProjectDeveloper
│   │   └── codex/
│   │       └── skills/  (4 skills) # Skills Codex-específicas (sobrescrevem global)
│   ├── home/
│   │   └── CLAUDE.md               # ~/CLAUDE.md (instrução global)
│   ├── claude/                     # Overlay Claude Code (customizações)
│   │   ├── HARNESS.md
│   │   ├── settings.json           # Hooks: PreToolUse + PostToolUse + Stop
│   │   └── scripts/
│   │       ├── harness-apply.sh
│   │       ├── typecheck-hook.sh
│   │       └── progress-update.sh
│   ├── cursor/                     # Overlay Cursor IDE (customizações)
│   │   ├── HARNESS.md
│   │   ├── hooks.json              # Hooks Cursor (paths absolutos)
│   │   └── scripts/
│   │       ├── guard-shell.sh
│   │       ├── progress-update.sh
│   │       ├── checklist.sh
│   │       └── harness-apply.sh
│   └── codex/                      # Overlay Codex CLI (customizações)
│       ├── HARNESS.md
│       ├── instructions.md
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
| 2026-05-11 | v3.0 — Integração AI-ProjectDeveloper: catálogo corporativo (316 skills, 230 agents, 93 rules) migrado para `dotfiles/global/`. `install.sh` reescrito com arquitetura de duas fases. Submodule `.cursor` removido. |

---

## 📄 Licença

Interno STEC. Não distribuir.

---

**Última atualização:** 2026-05-11  
**Manutenção:** Jesus (jesus@soundlink.com)  
**Status:** ✅ Ativo (v3.0 — AI-ProjectDeveloper integrado)
