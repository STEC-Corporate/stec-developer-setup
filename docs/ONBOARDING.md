# 🚀 Onboarding de Desenvolvedor — STEC Developer Setup

## 📋 Visão Geral

Este guia garante que novos desenvolvedores tenham acesso completo ao catálogo de 779+ artefatos (skills, agents, rules) e configurações padronizadas para **Claude Code**, **Cursor IDE** e **Codex CLI**.

## 🎯 Pré-requisitos

### Sistema Operacional
- **Linux / macOS** — nativo
- **Windows** — via WSL2 (Ubuntu 22.04+ recomendado)
- **Git Bash** — Windows (alternativa ao WSL2)

### Ferramentas Essenciais
```bash
# Verificar instalações
git --version          # Git 2.30+
node --version         # Node.js 18+
python3 --version      # Python 3.9+
curl --version         # cURL para downloads
```

### Acesso ao Repositório
```bash
# Clonar repositório central
git clone https://github.com/stec/stec-developer-setup.git
cd stec-developer-setup
```

## ⚡ Instalação Rápida (1-2 minutos)

### 1️⃣ Executar instalador
```bash
bash install.sh
```

**O que acontece:**
- **Fase 1:** Distribui `dotfiles/global/` → `~/.claude/`, `~/.cursor/`, `~/.codex/`
- **Fase 2:** Aplica overlays específicos de cada IDE
- **Backup automático:** Cria backup de `~/CLAUDE.md` se existir
- **Verificação inteligente:** Atualiza apenas se necessário (por hash MD5)

### 2️⃣ Validar instalação
```bash
bash scripts/validate-install.sh
```

**Validações realizadas:**
- ✅ Contagem de skills (316+ esperados)
- ✅ Contagem de agents (230+ esperados)
- ✅ Contagem de rules (93+ esperados)
- ✅ Estrutura completa do `~/CLAUDE.md`
- ✅ Sincronização com `dotfiles/home/CLAUDE.md`

### 3️⃣ Aplicar em primeira sessão
```bash
# Abrir nova sessão
source ~/.bashrc

# Ir para projeto existente
cd ~/Projetos/seu-projeto

# Aplicar harness automaticamente (se necessário)
bash ~/.claude/scripts/harness-apply.sh
```

## 🔧 Troubleshooting

### ❌ Problema: validate-install.sh falha
```bash
# Diagnóstico
bash scripts/validate-install.sh

# Correção
bash install.sh  # Re-executa instalação completa
```

### ❌ Problema: ~/CLAUDE.md desatualizado
```bash
# Diagnóstico
ls -la ~/CLAUDE.md
ls -la dotfiles/home/CLAUDE.md

# Correção automática
bash install.sh  # Detecta diferença e atualiza
```

### ❌ Problema: Skills/agents faltando
```bash
# Diagnóstico detalhado
find ~/.claude -name "*.md" | wc -l
find ~/.cursor -name "*.md" | wc -l

# Correção
rm -rf ~/.claude ~/.cursor ~/.codex  # Reset completo
bash install.sh                      # Reinstalação limpa
```

## 📚 Estrutura Instalada

### ~/.claude/ (Claude Code)
```
~/.claude/
├── skills/          # 316 skills genéricas
├── rules/           # 93 rules MDC
├── mcp/             # Configurações MCP
├── scripts/         # harness-apply.sh + helpers
├── hooks/           # task-completion.sh
├── docs/llm/        # 25 domínios de especialização
└── settings.json    # Configurações Claude-específicas
```

### ~/.cursor/ (Cursor IDE)
```
~/.cursor/
├── skills/          # 316 skills + específicas Cursor
├── agents/          # 230 agents
├── rules/           # 93 rules MDC
├── hooks/           # task-completion.sh + hooks.json
├── scripts/         # Scripts específicos do Cursor
└── settings.json    # Configurações Cursor-específicas
```

### ~/.codex/ (Codex CLI)
```
~/.codex/
├── skills/          # 316 skills + 4 Codex-específicas
├── agents/          # 229 agents (sem INDEX.md)
├── rules/           # 93 rules MDC
├── hooks/           # task-completion.sh
└── settings.json    # Configurações Codex-específicas
```

### ~/CLAUDE.md (Global)
Arquivo **único** lido automaticamente pelo Claude Code em **toda sessão**:
- 👤 **Identidade do Desenvolvedor** — perfil técnico, preferências
- 🤖 **Harness Automático** — instruções imperativas para aplicação de harness
- ⚙️ **Critérios de conclusão** — definições de "100% completo"

## 🔄 Atualizações

### Para Desenvolvedores Existentes
```bash
cd ~/Projetos/stec-developer-setup
git pull origin main
bash install.sh                    # Atualiza todas as IDEs
bash scripts/validate-install.sh   # Confirma atualização
```

### Para Administradores
```bash
# Adicionar nova skill
echo "nova-skill.md" > dotfiles/global/skills/nova-skill/nova-skill.md
git add dotfiles/global/skills/nova-skill/
git commit -m "feat: adiciona skill nova-skill para domínio X"
git push

# Notificar equipe para atualização
# Devs executam: git pull && bash install.sh
```

## 📊 Métricas de Sucesso

### ✅ Onboarding bem-sucedido quando:
1. `validate-install.sh` retorna **exit 0**
2. Desenvolvedor consegue usar `/review` em sessão Claude
3. Harness aplica automaticamente em projetos novos
4. Skills corporativas acessíveis via MCP/REST

### 📈 KPIs do Setup (por trimestre):
- **Tempo médio de onboarding:** < 5 minutos
- **Taxa de sucesso na primeira tentativa:** > 95%
- **Feedback de desenvolvedores:** > 4.5/5.0

## 🆘 Suporte

### Canais de Suporte
- **GitHub Issues:** [stec-developer-setup/issues](https://github.com/stec/stec-developer-setup/issues)
- **Slack:** #stec-dev-tools
- **Documentação:** `docs/` neste repositório

### Logs de Diagnóstico
```bash
# Gerar diagnóstico completo
bash scripts/validate-install.sh > diagnostic.log 2>&1

# Anexar ao ticket de suporte
```

---

**Versão:** v3.0.x (maio 2026)  
**Manutenção:** Engineering Platform Team  
**Atualização:** A cada 2 semanas (sync com AI-ProjectDeveloper)