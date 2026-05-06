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

## 📦 O que será instalado

| Arquivo | Onde vai | O que é |
|---------|----------|--------|
| `CLAUDE.md` | `~/CLAUDE.md` | Instrução imperativa: aplica harness automaticamente |
| `HARNESS.md` | `~/.claude/`, `~/.cursor/`, `~/.codex/` | Referência conceitual (fórmula + 3 camadas) |
| `harness-apply.sh` | `~/.claude/scripts/` | Script que detecta stack e cria estrutura |
| `harness-apply.md` | `~/.cursor/agents/` | Agent Cursor (chamável com `@harness-apply`) |
| `instructions.md` | `~/.codex/` | Instrução automática Codex CLI |

**Total:** 5-8 arquivos por ferramenta, ~50KB total.

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

## 🔄 Como atualizar

O harness evolui. Manter sincronizado:

```bash
cd ~/Projetos/stec-developer-setup
git pull
bash install.sh
```

O script nunca sobrescreve arquivos existentes — apenas instala novos.

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
├── README.md                     # Este arquivo
├── install.sh                    # Instalador Linux/macOS/WSL2/Git Bash
├── install.ps1                   # Instalador Windows PowerShell
├── scripts/
│   └── detect-env.sh             # Detecção de plataforma (sourced)
├── dotfiles/
│   ├── home/
│   │   └── CLAUDE.md             # ~/CLAUDE.md (instrução global)
│   ├── claude/
│   │   ├── HARNESS.md            # ~/.claude/HARNESS.md
│   │   └── scripts/
│   │       └── harness-apply.sh  # Script de aplicação
│   ├── cursor/
│   │   ├── HARNESS.md            # ~/.cursor/HARNESS.md
│   │   └── agents/
│   │       └── harness-apply.md  # Agent Cursor
│   └── codex/
│       ├── HARNESS.md            # ~/.codex/HARNESS.md
│       └── instructions.md       # Instrução Codex CLI
└── templates/
    ├── python/
    │   ├── CLAUDE.md             # Template Python
    │   ├── progress.md
    │   └── init.sh
    ├── node/
    │   ├── CLAUDE.md             # Template Node/TypeScript
    │   ├── progress.md
    │   └── init.sh
    ├── java/
    │   ├── CLAUDE.md             # Template Java
    │   ├── progress.md
    │   └── init.sh
    └── generic/
        ├── CLAUDE.md             # Template genérico
        ├── progress.md
        └── init.sh
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

---

## 📄 Licença

Interno STEC. Não distribuir.

---

**Última atualização:** 2026-05-06  
**Manutenção:** Jesus (jesus@soundlink.com)  
**Status:** ✅ Ativo
