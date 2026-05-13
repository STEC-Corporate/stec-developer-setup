# Identidade do Desenvolvedor

## Perfil
- 20+ anos: Java, C#, .NET, JavaScript, Angular, Next.js, TypeScript
- Intermediário: Python
- MBA Arquitetura de Software em andamento
- Estudando IA há 1 ano: CursorAI, SDD, Harness

## Preferências de resposta
- Direto ao ponto, sem explicar o óbvio
- Sugira sempre a abordagem mais simples primeiro
- Apresente argumentos para decisões arquiteturais
- Português, exceto termos técnicos

## Plataforma atual
- Múltiplos monorepos + repos satélites
- Gateway LLM próprio: MCP + REST
- Skills: locais (.md) + via gateway
- Infra: AWS + Terraform + Docker local
- CI/CD: GitHub Actions
- SO: Windows WSL

## Critério de conclusão de qualquer tarefa
Só está 100% quando:
- Testes passando ✅
- Lint sem erros ✅
- Build sem warnings ✅
- Sem secrets expostos ✅

## Padrão de Commits
Use este modelo para **TODOS** os projetos:

```
<tipo>: <descrição curta e objetiva>

- <mudança específica 1>
- <mudança específica 2>
- <mudança específica N>
```

**Tipos:** `feat`, `fix`, `chore`, `docs`, `refactor`

**Regras obrigatórias:**
- ❌ Sem referências a Claude, AI, agent, "Generated with"
- ❌ Sem Co-Authored-By automático
- ✅ Foco no **que** foi feito e **por quê**
- ✅ Mensagem objetiva e técnica
- ✅ Lista de mudanças específicas

# Instruções Globais — Harness Automático

## 🎯 Ação Obrigatória ao Iniciar Sessão

Ao começar qualquer sessão em um projeto, execute estas verificações **automaticamente** (sem confirmação):

### 1️⃣ Verificar se é um projeto real

```bash
if [ -d ".git" ]; then
    # É um repositório Git real — prosseguir
else
    # Não é projeto — pular
    exit 0
fi
```

**Exceções — NÃO aplicar harness em:**
- `/tmp`, `/var`, `/home` (diretório raiz)
- `~/.claude`, `~/.cursor`, `~/.codex`, `~/.config`
- Qualquer diretório sem `.git`

### 2️⃣ Verificar estrutura do harness

Procurar por **TODOS** estes arquivos:
- `CLAUDE.md` (de projeto — não o global `~/CLAUDE.md`)
- `progress.md`
- `scripts/init.sh`

Se **qualquer um** estiver faltando:
→ **Executar `~/.claude/scripts/harness-apply.sh` AUTOMATICAMENTE**

Se **todos existem**:
→ Continuar normalmente

### 3️⃣ O que harness-apply.sh faz

O script `/home/jesus/Projetos/stec-developer-setup/dotfiles/claude/scripts/harness-apply.sh`:

1. Detecta stack do projeto (Python, Node, Java, genérico)
2. Copia templates apropriados
3. Cria arquivos faltantes (nunca sobrescreve)
4. Faz `git add + git commit`
5. Pronto para começar

---

## 📝 Padrão de Resposta Esperado

Ao entrar em sessão **com harness incompleto**, Claude deve:

1. Detectar automaticamente quais arquivos faltam
2. Chamar o script de aplicação
3. Confirmar: "✅ Harness aplicado em [projeto]"
4. Pronto para trabalhar no projeto

```
Sessão iniciada em /home/jesus/Projetos/novo-projeto/

🔍 Verificando harness...
❌ Faltando: progress.md, scripts/init.sh

📝 Aplicando estrutura do harness...
✅ progress.md criado
✅ scripts/init.sh criado
✅ Harness aplicado com sucesso

📋 Próximos passos:
  1. bash scripts/init.sh
  2. Editar CLAUDE.md com contexto específico
  3. Registrar ideia no TaskLink
```

---

## ⚙️ Como Implementar no Claude Code

Este arquivo (`~/CLAUDE.md`) é **lido automaticamente** em toda sessão do Claude Code.

Instruir o Claude: "Ao iniciar sessão, verificar harness e aplicar automaticamente se incompleto. Usar o script em `~/.claude/scripts/harness-apply.sh`."

---

## 🔗 Referências

- **Harness guia completo:** `@~/.claude/HARNESS.md`
- **Setup e instalação:** `/home/jesus/Projetos/stec-developer-setup/README.md`
- **Tutorial detalhado:** `/home/jesus/Projetos/tasklink/docs/tutoriais/Tutorial-Harness.md`

---

**Data de criação:** 2026-05-06  
**Última atualização:** 2026-05-06  
**Status:** Ativo (todo projeto deve ter harness)
