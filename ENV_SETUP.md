# Setup de Ambiente Per-Developer com `.env.local`

## 🎯 Objetivo

Cada developer tem seu próprio caminho para ferramentas, IDEs e configurações — sem necessidade de versionamento ou configuração manual.

```
Linux dev:    PROJECT_ROOT=/home/alice/Projetos/meu-projeto
Windows dev:  PROJECT_ROOT=C:\Users\bob\Projects\meu-projeto
WSL2 dev:     PROJECT_ROOT=/home/carlos/Projetos/meu-projeto + Windows paths
```

---

## 📦 Arquivos Principais

| Arquivo | Tipo | Propósito |
|---------|------|----------|
| `.env.example` | Versionado | Template com variáveis obrigatórias |
| `.env.local` | Ignorado | Gerado automaticamente para cada dev (não commitar) |
| `.gitignore` | Versionado | Inclui `.env.local` e patterns por stack |
| `scripts/init-env-helper.sh` | Versionado | Helper com função `setup_env_local()` |
| `scripts/init.sh` | Versionado (template) | Bootstrap que sourça o helper |

---

## 🚀 Como Funciona

### 1️⃣ No Novo Projeto

Quando um dev clona/cria um novo projeto:

```bash
cd ~/Projetos/seu-projeto
bash scripts/init.sh
```

### 2️⃣ O que Acontece

O `init.sh` sourça o helper e executa:

```bash
source scripts/init-env-helper.sh
setup_env_local
```

Isso:
- ✅ Procura `detect-env.sh` em múltiplos locais
- ✅ Detecta plataforma automaticamente (Linux/Windows/WSL2)
- ✅ Gera `.env.local` com variáveis de caminho corretas
- ✅ Cria `.env.example` (se não existir)
- ✅ Cria `.gitignore` com padrões por stack

### 3️⃣ Resultado

```bash
# Linux dev
PLATFORM=linux
PROJECT_ROOT=/home/alice/Projetos/seu-projeto
CLAUDE_CONFIG_DIR=/home/alice/.claude

# Windows dev (WSL2)
PLATFORM=wsl2
PROJECT_ROOT=/home/bob/Projetos/seu-projeto
WIN_USER=bob
CLAUDE_CONFIG_DIR=/home/bob/.claude
CLAUDE_WIN=/mnt/c/Users/bob/AppData/Roaming/Claude
```

---

## 🔍 Detecção de Plataforma

O helper procura `detect-env.sh` (que identifica Windows vs Linux vs WSL2) em:

1. **Local:** `scripts/detect-env.sh` (no projeto)
2. **Global:** `$HOME/.claude/scripts/detect-env.sh` (instalado via `install.sh`)
3. **Fallback:** Define valores defaults se não encontrar

Se encontrar, executa:

```bash
source detect-env.sh
detect_platform()   # → "linux" | "wsl2" | "windows" | "macos" | "unknown"
resolve_paths()     # → Define CLAUDE_CONFIG_DIR, CURSOR_CONFIG_DIR, etc
```

---

## 📝 Variáveis em `.env.local`

```bash
# Auto-detecção (não mexer)
PLATFORM=wsl2
PROJECT_ROOT=/home/usuario/Projetos/meu-projeto
USER_NAME=usuario

# Paths de configuração (detectados automaticamente)
CLAUDE_CONFIG_DIR=/home/usuario/.claude
CURSOR_CONFIG_DIR=/home/usuario/.cursor
CODEX_CONFIG_DIR=/home/usuario/.codex
WIN_USER=usuario  # (apenas se WSL2)

# Customizações (descomentar conforme necessário)
# DEBUG=false
# LOG_LEVEL=info
```

---

## 🔄 Fluxo Completo

```
1. Dev clona projeto
   └─ .env.local não existe
   
2. Dev executa: bash scripts/init.sh
   └─ init.sh sourça scripts/init-env-helper.sh
   
3. Helper detecta plataforma:
   └─ Sourça detect-env.sh (local ou global)
   └─ Executa detect_platform() + resolve_paths()
   
4. Helper gera .env.local:
   └─ PLATFORM, PROJECT_ROOT, USER_NAME (auto)
   └─ Todos os XXXXX_CONFIG_DIR (detectados)
   
5. Dev tem arquivo .env.local com seus paths
   └─ Pronto para usar
   └─ .gitignore garante que não vai ser versionado
```

---

## 🛠️ Para Diferentes Stacks

Os templates de `init.sh` já incluem a lógica:

| Stack | Template | Próximo passo |
|-------|----------|---------------|
| Python | `templates/python/init.sh` | Cria venv, instala deps |
| Node.js | `templates/node/init.sh` | Instala npm/yarn/pnpm deps |
| Java | `templates/java/init.sh` | Compila com Maven/Gradle |
| Genérico | `templates/generic/init.sh` | Cria estrutura básica |

---

## 🌐 Distribuição Global

Após rodar `bash install.sh` em `stec-developer-setup`:

```
~/.claude/scripts/init-env-helper.sh   ← Copiado automaticamente
~/.cursor/scripts/init-env-helper.sh   ← Copiado automaticamente
~/.codex/scripts/init-env-helper.sh    ← Copiado automaticamente
```

Isso permite que qualquer IDE/CLI acesse a função `setup_env_local()`.

---

## ✅ Checklist para Novo Dev

1. **Clonar projeto:**
   ```bash
   git clone <repo>
   cd seu-projeto
   ```

2. **Executar init:**
   ```bash
   bash scripts/init.sh
   ```

3. **Verificar .env.local:**
   ```bash
   cat .env.local
   ```
   - [ ] PLATFORM correto (linux/wsl2/unknown)
   - [ ] PROJECT_ROOT aponta para seu diretório
   - [ ] USER_NAME é seu username

4. **Pronto!** O `.env.local` está gerado e customizado

---

## 🔧 Troubleshooting

### Problema: `.env.local` não foi criado

**Causa:** `scripts/init-env-helper.sh` não encontrado

**Solução:**
```bash
# Opção 1: Cópia manual
cp ~/.claude/scripts/init-env-helper.sh scripts/

# Opção 2: Reinstalar harness
cd ~/Projetos/stec-developer-setup
bash install.sh
```

### Problema: PLATFORM detectado como "unknown"

**Causa:** `detect-env.sh` não foi encontrado

**Solução:**
- Verificar se `scripts/detect-env.sh` existe no projeto
- Ou verificar se `~/.claude/scripts/detect-env.sh` foi instalado
- O helper usa fallbacks defaults, então funciona mesmo sem detecção

### Problema: Caminhos Windows não detectados (WSL2)

**Causa:** Windows não montado em `/mnt/c`

**Solução:**
```bash
# Verificar montagem
ls /mnt/c/

# Se não existir, Windows pode estar desligado ou WSL2 não tem acesso
# Editar .env.local manualmente com caminho correto
```

---

## 📚 Referência

- `@~/.claude/HARNESS.md` — Conceitos de harness
- `scripts/detect-env.sh` — Detecção de plataforma
- `scripts/init-env-helper.sh` — Implementação do helper
- `.env.example` — Template de variáveis

---

**Última atualização:** 2026-05-10  
**Status:** ✅ Pronto para uso
