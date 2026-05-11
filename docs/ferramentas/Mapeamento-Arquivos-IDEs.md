# 🗺️ Mapeamento de Arquivos: Skills, Agents e Hooks

Documentação completa sobre onde cada ferramenta (Claude Code, Cursor IDE, Codex CLI) espera encontrar e organizar os arquivos de **Skills**, **Agents** e **Hooks**, tanto em nível global quanto local (projeto).

---

## 📋 Índice Rápido

| Categoria | Claude Code | Cursor IDE | Codex CLI |
|-----------|-------------|------------|-----------|
| **Skills Global** | `~/.claude/skills/` | `~/.cursor/extensions/` | `~/.codex/skills/` |
| **Skills Local** | `.claude/skills/` | `.cursor/` | `.codex/skills/` |
| **Agents Global** | `CLAUDE.md` (home) | Não usa | `~/.codex/AGENTS.md` |
| **Agents Local** | `CLAUDE.md` (projeto) | `.cursorrules` | `.codex/AGENTS.md` |
| **Hooks Global** | Integração MCP | `~/.cursor/hooks.json` | `~/.codex/rules/` |
| **Hooks Local** | Integração MCP | `.cursor/hooks.json` | `.codex/rules/` |

---

## 📌 Diferença: Rules vs Hooks vs Agents

Antes de detalhar cada ferramenta, é importante entender as diferenças:

| Conceito | Propósito | Exemplo |
|----------|-----------|---------|
| **Rules** | Controlar/policiar execução de comandos e ações | "Bloquear commits sem testes" |
| **Hooks** | Interceptar eventos e executar automações | "Rodar testes antes de commit" |
| **Agents** | Instruções de comportamento da IA | "Sempre usar TypeScript strict mode" |

---

## 🔴 CLAUDE CODE

### 0️⃣ Rules (Políticas de Execução)

Claude Code **não possui um sistema de Rules explícito** como Cursor e Codex. 

**Alternativa:** Usar CLAUDE.md para definir "guardrails" (limitações que a IA deve respeitar) e `~/.claude/settings.json` para configurar permissões de MCP.

**Localização de Configuração:**
```
~/.claude/settings.json      # Configuração de MCP (user scope)
projeto/.claude/settings.json # Configuração de MCP (project scope)
projeto/CLAUDE.md             # Guardrails e instruções
```

**Exemplo em CLAUDE.md (guardrails):**
```markdown
# CLAUDE.md - Guardrails

## Restrições
- Nunca commitar sem testes passando
- Nunca alterar migrations já deployadas
- Nunca fazer force push em main/master

## Aprovações Necessárias
- Mudanças em API contracts requerem aprovação
- Deletions requerem confirmação dupla
```



### 1️⃣ Skills (Habilidades/Comandos Personalizados)

#### Localização Global
```
~/.claude/skills/
├── skill-name-1/
│   ├── SKILL.md
│   └── [arquivos auxiliares]
├── skill-name-2/
│   ├── SKILL.md
│   └── [arquivos auxiliares]
└── ...
```

**Localização:** `~/.claude/skills/{skill-name}/SKILL.md`

**Formato:**
- Extensão: `.md` (Markdown)
- Frontmatter: YAML (obrigatório)
- Conteúdo: Markdown + instruções

**Estrutura de Arquivo:**
```markdown
---
name: skill-display-name
description: Uma breve descrição da habilidade
icon: 🔧
```

Exemplo prático:
```yaml
---
name: Run Tests
description: Executa suite de testes do projeto
icon: ✅
---

# Run Tests

Executa todos os testes e mostra cobertura.

## Uso
\`\`\`bash
npm test
\`\`\`
```

#### Localização Local (Projeto)
```
projeto/
├── .claude/
│   └── skills/
│       ├── custom-skill-1/
│       │   └── SKILL.md
│       └── custom-skill-2/
│           └── SKILL.md
└── ...
```

**Localização:** `projeto/.claude/skills/{skill-name}/SKILL.md`

#### Precedência de Carregamento
1. Skills do projeto local (`.claude/skills/`)
2. Skills globais do usuário (`~/.claude/skills/`)
3. Skills padrão do Claude Code (built-in)

#### Invocação
```bash
/skill-name
```

**Exemplo:**
```
/Run Tests    # Executa a skill
```

#### Configuração em CLAUDE.md
```markdown
# Skills

Este projeto tem skills customizadas em `.claude/skills/`:

- **build** - Compila o projeto
- **test** - Roda testes
- **deploy** - Deploy para produção
```

---

### 2️⃣ Agents (Instrução de Comportamento)

#### Localização Global
```
~/.CLAUDE.md
```

**Arquivo único no home directory do usuário.**

#### Localização Local (Projeto)
```
projeto/CLAUDE.md
```

**Arquivo no root do projeto.**

#### Formato
- Extensão: `.md` (Markdown)
- Sem frontmatter YAML
- Instruções e contexto em formato Markdown livre

**Estrutura:**
```markdown
# CLAUDE.md - Instruções do Projeto

## Contexto
Descrição do projeto e stack.

## Convenções
Como trabalhar neste projeto.

## Guardrails
O que evitar ou não fazer.

## Referências
Links importantes.
```

#### Precedência
1. `CLAUDE.md` do projeto (se existir)
2. `~/.CLAUDE.md` global (se existir)
3. Comportamento padrão do Claude Code

#### Exemplo Prático
```markdown
# CLAUDE.md - TaskLink Project

## Stack
- Node.js 18+
- TypeScript
- PostgreSQL
- NestJS

## Convenções
- Usar `const` ao invés de `let`
- Arquivos em PascalCase (componentes) ou camelCase (utilitários)
- Testes obrigatórios

## Não fazer
- Commits sem testes passando
- Alterar migrations já deployadas
- Push direto em main/master
```

---

### 3️⃣ Hooks (Integrações e Triggers)

Claude Code utiliza **Model Context Protocol (MCP)** para hooks.

#### Localização Global
```
~/.claude/mcp/
├── servers/
│   ├── server-1.json
│   ├── server-2.json
│   └── ...
└── config.json
```

**Arquivo de config:** `~/.claude/config.json`

#### Localização Local (Projeto)
```
projeto/
├── .claude/
│   └── mcp/
│       ├── servers/
│       │   └── custom-server.json
│       └── config.json
└── ...
```

#### Formato
Arquivo JSON com definição de servidor MCP.

**Exemplo:**
```json
{
  "name": "git-helper",
  "command": "node",
  "args": ["scripts/mcp-git-helper.js"],
  "env": {
    "DEBUG": "1"
  }
}
```

#### Configuração em `~/.claude/config.json`
```json
{
  "mcpServers": {
    "git": {
      "command": "python3",
      "args": ["-m", "mcp_git_server"]
    },
    "postgres": {
      "command": "node",
      "args": ["servers/postgres-mcp.js"],
      "env": {
        "DB_URL": "postgresql://..."
      }
    }
  }
}
```

#### Invocação
Hooks MCP são chamados automaticamente pelo Claude Code quando:
- Executar git operations
- Acessar banco de dados
- Fazer requisições HTTP
- Outras integrações

Não há comando de invocação explícita como com skills.

---

## 🔵 CURSOR IDE

### 1️⃣ Skills (Extensões Personalizadas)

#### Localização Global
```
~/.cursor/extensions/
├── extension-1/
│   ├── package.json
│   ├── extension.js
│   └── ...
├── extension-2/
│   └── ...
└── ...
```

**Localização:** `~/.cursor/extensions/{extension-name}/`

**Formato:**
- Tipo: Extensões VS Code compatíveis
- Estrutura: `package.json` + código JavaScript/TypeScript
- Não usa SKILL.md como Claude Code

#### Localização Local (Projeto)
```
projeto/
├── .cursor/
│   ├── extension-1.md
│   ├── extension-2.md
│   └── ...
└── ...
```

**Localização:** `projeto/.cursor/{arquivo}.md`

**Formato:**
- Extensão: `.md` (Markdown)
- Sem frontmatter obrigatório
- Instruções em Markdown livre

#### Precedência de Carregamento
1. Extensões locais (`.cursor/*.md`)
2. Extensões globais (`~/.cursor/extensions/`)
3. Extensões padrão do Cursor

#### Invocação
Através de menu contextual ou comandos paleta.

**Exemplo:**
```
Ctrl+Shift+P → Cursor: Run Extension
```

#### Diferença Principal do Claude Code
- Cursor usa **extensões VS Code**, não SKILL.md
- Suporta JavaScript/TypeScript nativamente
- Pode acessar API do VS Code

---

### 2️⃣ Agents (Instrução de Comportamento)

#### Localização Global
Cursor **não suporta** arquivo de configuração global equivalente a CLAUDE.md.

#### Localização Local (Projeto)
```
projeto/
├── .cursorrules
└── ...
```

**Arquivo único:** `.cursorrules` (sem extensão)

**Formato:**
- Extensão: Sem extensão (arquivo oculto)
- Conteúdo: Texto livre (não Markdown estruturado)
- Sem frontmatter

**Estrutura:**
```
Objetivo: Descrever como trabalhar neste projeto

Stack: Node.js 18+, TypeScript, PostgreSQL

Convenções:
- Usar const
- Files em PascalCase (componentes)

Guardrails:
- Sem commits sem testes
- Sem alterações em migrations deployadas
```

#### Precedência
1. `.cursorrules` do projeto (se existir)
2. Comportamento padrão do Cursor

#### Exemplo Prático
```
# TaskLink Project Rules

Project Type: Node.js/TypeScript NestJS

Technology Stack:
- Runtime: Node.js 18+
- Language: TypeScript
- Framework: NestJS
- Database: PostgreSQL
- ORM: TypeORM

Code Conventions:
- Use const over let
- Components in PascalCase
- Utilities in camelCase
- Tests in .spec.ts

Testing:
- Jest with 80% coverage minimum
- E2E tests for API endpoints
- Unit tests for services

Git Workflow:
- Feature branches: feature/JIRA-123-description
- All branches require PR review
- No direct push to main/master

What NOT to do:
- No commits without passing tests
- No migrations without rollback plan
- No .env files in version control
```

---

### 3️⃣ Hooks (Integrações e Triggers)

Cursor IDE suporta hooks através de dois sistemas:

#### 1. Hooks de Segurança (MCP Interception)

**Localização Global:**
```
~/.cursor/hooks.json
```

**Localização Local:**
```
projeto/
├── .cursor/
│   └── hooks.json
└── ...
```

**Formato:**
Arquivo JSON com definição de hooks para interceptar execuções MCP.

**Exemplo:**
```json
{
  "hooks": {
    "mcp": {
      "before_execution": {
        "script": "scripts/verify-mcp-execution.js",
        "timeout": "5s"
      }
    }
  }
}
```

**Funcionalidade:**
- Inspecciona contexto antes de execução MCP
- Retorna `allow`, `warn`, `deny` ou `require-approval`
- Enforça policies (MCPs aprovados, proteção production, guardrails)

#### 2. Automations (Agentes Schedulados)

**Localização Global:**
```
~/.cursor/automations/
├── automation-1.json
├── automation-2.json
└── ...
```

**Localização (Cloud/Workspace):**
Configurado em cursor.com/automations (integração cloud)

**Formato:**
Automations JSON com schedule e triggers.

**Exemplo:**
```json
{
  "name": "Weekly Security Audit",
  "schedule": "cron(0 9 * * 1)",
  "trigger": "git.merged_pr",
  "agent": "security-reviewer",
  "actions": [
    "run_security_scan",
    "analyze_changes",
    "create_pr_comment"
  ],
  "mcp_config": {
    "git": true,
    "github": true
  }
}
```

**Triggers Suportados:**
- Schedule (CRON)
- `github.merged_pr` - PR mergeado
- `slack.message` - Mensagem no Slack
- `linear.issue` - Issue criado
- `pagerduty.incident` - Incident do PagerDuty
- Webhooks customizados

#### 3. VS Code Tasks (Alternativa)

**Localização:**
```
projeto/
├── .vscode/
│   └── tasks.json
└── ...
```

**Exemplo:**
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Test",
      "type": "shell",
      "command": "npm",
      "args": ["test"],
      "problemMatcher": ["$eslint-compact"],
      "runOptions": {
        "runOn": "folderOpen"
      }
    }
  ]
}
```

**Invocação:**
- Manual: `Ctrl+Shift+B` → Select task
- On folder open: configurable em `runOptions`
- On save: via extension

#### Precedência de Carregamento
1. `.cursor/hooks.json` do projeto (se existir)
2. `~/.cursor/hooks.json` global (se existir)
3. Cloud Automations (cursor.com/automations)
4. VS Code Tasks padrão

#### Diferença do Claude Code
- **Claude Code:** Usa MCP servers (protocolo)
- **Cursor:** Usa hooks.json para interceptar + Automations para eventos
- **Ambos:** Suportam automação, mas com arquiteturas diferentes

---

### 4️⃣ Rules (Políticas e Instruções Persistentes)

Cursor IDE suporta um sistema robusto de Rules para controlar comportamento da IA.

#### Localização Global
```
~/.cursor/
├── settings.json              # Configuração global
└── rules/                      # Regras globais do usuário
    ├── default.mdc
    ├── coding-standards.mdc
    └── security.mdc
```

**Arquivo de config:** `~/.cursor/settings.json`

#### Localização Local (Projeto)
```
projeto/
├── .cursor/
│   └── rules/
│       ├── index.mdc           # Regras principais do projeto
│       ├── api-guidelines.mdc
│       ├── database.mdc
│       └── security.mdc
└── ...
```

#### Tipos de Rules

**1. Project Rules** (versionados em `.cursor/rules/`)
```
projeto/.cursor/rules/
├── index.mdc           # Regras principais (sempre aplicadas)
├── features/
│   ├── auth.mdc        # Regras para feature de autenticação
│   └── api.mdc         # Regras para APIs
└── standards/
    ├── testing.mdc     # Padrões de teste
    └── performance.mdc # Otimizações
```

**2. User Rules** (globais, não versionados)
```
~/.cursor/rules/
├── default.mdc
└── ...
```

**3. Team Rules** (para planos Enterprise)
- Configuradas em workspace settings
- Aplicam-se a todos os projetos do time

**4. Legacy .cursorrules** (deprecated, mas ainda funciona)
```
projeto/.cursorrules
```

#### Formato de Rules

Arquivo `.mdc` (Markdown com frontmatter YAML).

**Estrutura:**
```markdown
---
title: API Guidelines
description: Padrões para desenvolvimento de APIs
applies_to:
  - files: ["src/api/**/*.ts"]
    always: true
---

# API Guidelines

## Conventions
- Use RESTful patterns
- Versão em URL: /api/v1/...

## Tests Required
- Unit tests para cada endpoint
- Integration tests para fluxos
```

#### Precedência de Carregamento
1. **Team Rules** (Enterprise)
2. **Project Rules** (`.cursor/rules/`)
3. **User Rules** (`~/.cursor/rules/`)
4. **AGENTS.md** (alternativa simples)

#### Configuração em Settings
```json
{
  "rules": {
    "enabled": true,
    "project_rules_path": ".cursor/rules",
    "apply_intelligently": true
  }
}
```

#### Ativação de Rules

Rules podem ser ativadas de 3 formas:

1. **Always Apply** — Em toda sessão
   ```yaml
   applies_to:
     - always: true
   ```

2. **Apply Intelligently** — Quando relevante (usando descrição)
   ```yaml
   applies_to:
     - description: "API development guidelines"
   ```

3. **Apply to Specific Files** — Quando arquivos específicos estão ativos
   ```yaml
   applies_to:
     - files: ["src/api/**/*.ts", "src/services/**/*.ts"]
   ```

4. **Apply Manually** — Via `@mention` no chat
   ```
   @database-rules
   ```

#### Best Practices para Rules

- ✅ Manter < 500 linhas por rule
- ✅ Referenciar arquivos ao invés de copiar conteúdo
- ✅ Focar em essenciais (convenções, padrões)
- ✅ Evitar duplicação com docs já existentes
- ✅ Usar múltiplos arquivos compostos ao invés de um grande
- ❌ Não copiar conteúdo de código no rule
- ❌ Não usar para guias genéricos de style

#### Exemplo Completo

**`.cursor/rules/index.mdc`:**
```markdown
---
title: Project Standards
description: Padrões principais do projeto
applies_to:
  - always: true
---

# Project Standards

## Stack
- Node.js 18+, TypeScript, NestJS
- Database: PostgreSQL
- ORM: TypeORM

## Code Quality
- ESLint + Prettier (enforced)
- 80%+ test coverage
- No any types

## Git Workflow
- Feature branches: `feature/JIRA-XXX-description`
- PRs require review
- Commits must reference JIRA
```

**`.cursor/rules/testing.mdc`:**
```markdown
---
title: Testing Standards
description: Como escrever testes
applies_to:
  - files: ["src/**/*.spec.ts"]
    description: "When writing tests"
---

# Testing Standards

- Use Jest + @testing-library
- Arrange-Act-Assert pattern
- Mock external dependencies
- Test behavior, not implementation
```

---

## 🟢 CODEX CLI

### 1️⃣ Skills (Comandos Personalizados)

#### Localização Global
```
~/.codex/skills/
├── skill-name-1/
│   ├── SKILL.md
│   └── [arquivos auxiliares]
├── skill-name-2/
│   ├── SKILL.md
│   └── [arquivos auxiliares]
└── ...
```

**Localização:** `~/.codex/skills/{skill-name}/SKILL.md`

**Formato:**
- Extensão: `.md` (Markdown)
- Frontmatter: YAML (obrigatório)
- Conteúdo: Markdown + instruções

**Estrutura de Arquivo (idêntica a Claude Code):**
```markdown
---
name: skill-display-name
description: Uma breve descrição da habilidade
icon: 🔧
```

#### Localização Local (Projeto)
```
projeto/
├── .codex/
│   └── skills/
│       ├── custom-skill-1/
│       │   └── SKILL.md
│       └── custom-skill-2/
│           └── SKILL.md
└── ...
```

**Localização:** `projeto/.codex/skills/{skill-name}/SKILL.md`

#### Precedência de Carregamento
1. Skills do projeto local (`.codex/skills/`)
2. Skills globais do usuário (`~/.codex/skills/`)
3. Skills padrão do Codex

#### Invocação
```bash
$skill-name
```

**Diferença de Claude Code:** Usa `$` ao invés de `/`

**Exemplo:**
```
$run-tests    # Executa a skill
```

---

### 2️⃣ Agents (Instrução de Comportamento)

#### Localização Global
```
~/.codex/AGENTS.md
```

**Arquivo único no diretório global.**

#### Localização Local (Projeto)
```
projeto/
├── .codex/
│   └── AGENTS.md
└── ...
```

**Arquivo opcional no projeto.**

#### Precedência de Carregamento
1. `.codex/AGENTS.md` do projeto (se existir)
2. `~/.codex/AGENTS.md` global (se existir)
3. `~/.codex/AGENTS.override.md` global (último override)
4. Comportamento padrão do Codex

**Nota:** AGENTS.md é padrão aberto `agents.md` (não proprietário).

#### Formato
```markdown
---
title: Project Name
description: Descrição do projeto
---

## Repository Layout
Estrutura de diretórios

## Build & Test
Comandos de build e test

## Engineering Conventions
Convenções de código
```

#### Exemplo Prático
```markdown
---
title: TaskLink API
description: API de gerenciamento de tarefas
version: 1.0.0
---

## Repository Layout

```
projects/
├── apps/
│   ├── api/                 # NestJS API
│   ├── worker/              # Bull queues
│   └── web/                 # Next.js frontend
├── packages/
│   ├── shared-types/        # Types compartilhados
│   └── database/            # Schemas
└── docs/
```

## Build & Test

- Build: `npm run build`
- Test: `npm run test`
- E2E: `npm run test:e2e`

## Engineering Conventions

- TypeScript strict mode
- ESLint + Prettier
- Components in PascalCase
- Utilities in camelCase
- Tests in .spec.ts files
```

---

### 3️⃣ Hooks (Rules e Triggers)

#### Localização Global
```
~/.codex/
├── rules/
│   ├── git-hooks.rules
│   ├── test-hooks.rules
│   └── ...
└── config.toml (seção [rules])
```

#### Localização Local (Projeto)
```
projeto/
├── .codex/
│   └── rules/
│       ├── custom-rule.rules
│       └── ...
└── ...
```

#### Formato
Arquivo `.rules` com sintaxe DSL própria do Codex.

**Exemplo:**
```rules
# git-hooks.rules
rule "pre-commit-tests" {
  trigger = "git.pre-commit"
  action = "run_tests"
  config = {
    timeout = "5m"
    fail_on_error = true
  }
}

rule "post-commit-lint" {
  trigger = "git.post-commit"
  action = "run_lint"
  config = {
    files = "src/**/*.ts"
  }
}
```

#### Configuração em `config.toml`
```toml
[rules]
enabled = true
search_paths = [
  "~/.codex/rules",
  ".codex/rules"
]
fail_on_error = true

[rules.hooks]
pre_commit = ["pre-commit-tests.rules"]
post_commit = ["post-commit-lint.rules"]
```

#### Invocação
Hooks são executados automaticamente conforme triggers:
- `git.pre-commit` - antes de commit
- `git.post-commit` - depois de commit
- `test.before` - antes de testes
- `test.after` - depois de testes
- E mais...

---

### 4️⃣ Rules (Políticas de Execução de Comandos)

Codex CLI possui um sistema experimental de Rules para controlar quais comandos podem ser executados fora do sandbox.

#### Localização Global
```
~/.codex/
├── rules/
│   ├── default.rules
│   ├── git.rules
│   ├── database.rules
│   └── security.rules
└── config.toml (com seção [rules])
```

#### Localização Local (Projeto)
```
projeto/
├── .codex/
│   └── rules/
│       ├── project.rules
│       ├── deployment.rules
│       └── ci-cd.rules
└── ...
```

#### Formato de Rules

Arquivo `.rules` com sintaxe DSL própria do Codex.

**Estrutura Básica:**
```rules
# git.rules
rule "git-push" {
  pattern = ["git", "push"]
  decision = "prompt"
  justification = "Require approval before pushing"
}

rule "git-force-push" {
  pattern = ["git", "push", "--force"]
  decision = "forbidden"
  justification = "Never allow force push without manual intervention"
}
```

#### Decisões (Decision Types)

```rules
decision = "allow"      # Executa sem perguntar
decision = "prompt"     # Requer aprovação do usuário
decision = "forbidden"  # Bloqueia execução
```

**Precedência:** `forbidden` > `prompt` > `allow`

Se múltiplas regras casam, a mais restritiva é aplicada.

#### Pattern Matching

Padrões são arrays de strings (literais ou unions):

```rules
# Literal (exato)
pattern = ["npm", "install"]

# Union (alternativas em um position)
pattern = ["git", ["push", "pull"]]

# Qualquer coisa
pattern = ["docker", "*"]

# Match prefix
pattern = ["codex", "config", "..."]
```

#### Campos Opcionais

```rules
rule "deploy-production" {
  pattern = ["npm", "run", "deploy:prod"]
  decision = "prompt"
  justification = "Deployment to production requires approval"
  
  # Test examples (validação ao carregar)
  match = [
    ["npm", "run", "deploy:prod"],
    ["npm", "run", "deploy:production"]
  ]
  
  not_match = [
    ["npm", "run", "deploy:staging"]
  ]
}
```

#### Precedência de Carregamento

1. `.codex/rules/` do projeto (mais específicos)
2. `~/.codex/rules/` global (padrões)
3. `~/.codex/requirements.toml` (enforced, admin)

#### Configuração em `config.toml`

```toml
[rules]
enabled = true
fail_on_forbidden = true

# Paths to search for rules
search_paths = [
  "~/.codex/rules",
  ".codex/rules"
]

# Executar regras automaticamente
auto_check = true

# Escalar para aprovação manual
smart_approvals = true
```

#### Testing e Validação

Usar `codex execpolicy check` para validar rules:

```bash
# Verificar como um comando será tratado
codex execpolicy check --rules ~/.codex/rules/default.rules -- npm install

# Resultado:
# Pattern: ["npm", "install"]
# Decision: allow
# Matching rules: default.rules (npm-install)
```

#### Smart Command Parsing

Codex inteligentemente parseia scripts:

```bash
# Simples (cada comando checado)
npm run build && npm run test
# ✅ Cada comando é validado separadamente

# Complexo (trata como um)
npm run deploy > output.log && cat output.log
# ⚠️ Redirection/substitution = single command check
```

#### Exemplo Completo de Rules

**`~/.codex/rules/default.rules`:**
```rules
# Permitir leitura
rule "ls-and-pwd" {
  pattern = ["ls"]
  decision = "allow"
}

rule "pwd" {
  pattern = ["pwd"]
  decision = "allow"
}

# Requer aprovação para npm
rule "npm-install" {
  pattern = ["npm", "install"]
  decision = "prompt"
  justification = "New dependencies require review"
  match = [
    ["npm", "install"],
    ["npm", "i"]
  ]
}

# Bloquear delete crítico
rule "rm-critical" {
  pattern = ["rm", "-rf", "/"]
  decision = "forbidden"
  justification = "Never allow rm -rf /"
}
```

**`.codex/rules/deployment.rules`:**
```rules
rule "deploy-production" {
  pattern = ["kubectl", "apply"]
  decision = "prompt"
  justification = "Production deployment requires team approval"
}

rule "scale-pods" {
  pattern = ["kubectl", "scale"]
  decision = "prompt"
  justification = "Scaling changes should be reviewed"
}
```

#### Admin Enforcement

Admins podem forçar rules via `requirements.toml`:

```toml
[execution_policy]
mode = "strict"
required_rules = [
  "~/.codex/rules/security.rules",
  "~/.codex/rules/compliance.rules"
]

# Usuários não podem desativar
readonly = true
```

---

## 📊 Tabela Comparativa Completa

| Aspecto | Claude Code | Cursor IDE | Codex CLI |
|---------|-------------|------------|-----------|
| **Skills Global** | `~/.claude/skills/` | `~/.cursor/extensions/` | `~/.codex/skills/` |
| **Skills Local** | `.claude/skills/` | `.cursor/` | `.codex/skills/` |
| **Skills Formato** | SKILL.md (YAML+MD) | Extensões JS/TS | SKILL.md (YAML+MD) |
| **Skills Invocação** | `/skill-name` | UI/Paleta | `$skill-name` |
| **Agents Global** | `~/.CLAUDE.md` | N/A | `~/.codex/AGENTS.md` |
| **Agents Local** | `CLAUDE.md` | `.cursorrules` | `.codex/AGENTS.md` |
| **Agents Formato** | Markdown livre | Texto livre | Markdown estruturado |
| **Hooks Global** | `~/.claude/mcp/` | `~/.cursor/hooks.json` | `~/.codex/rules/` |
| **Hooks Local** | `.claude/mcp/` | `.cursor/hooks.json` | `.codex/rules/` |
| **Hooks Tipo** | MCP (Protocolo) | Hooks JSON + Automations | Rules DSL |
| **Rules Global** | CLAUDE.md + settings | `~/.cursor/rules/` | `~/.codex/rules/` |
| **Rules Local** | CLAUDE.md | `.cursor/rules/` | `.codex/rules/` |
| **Rules Formato** | Markdown (guardrails) | .mdc (markdown+YAML) | .rules (DSL) |
| **Rules Função** | Instruções/guardrails | Políticas de IA | Políticas de execução |
| **Precedência Agents** | projeto > global | projeto only | projeto > global > override |
| **Precedência Skills** | local > global > built-in | local > global > built-in | local > global > built-in |
| **Precedência Rules** | projeto > global | Team > Projeto > User | projeto > global > admin |
| **Padrão Aberto?** | Não (Anthropic) | Não (Anysphere) | Sim (agents.md padrão) |

---

## 🎯 Guia Prático: Implementar em Seu Projeto

### Passo 1: Verificar Estrutura Existente

```bash
# Claude Code
ls -la ~/.claude/skills/
ls -la projeto/.claude/skills/
cat projeto/CLAUDE.md

# Cursor
ls -la ~/.cursor/extensions/
cat projeto/.cursorrules

# Codex
ls -la ~/.codex/skills/
cat projeto/.codex/AGENTS.md
```

### Passo 2: Criar Structure Padrão

```bash
# Para Claude Code + Codex (compatíveis)
mkdir -p .claude/skills/
mkdir -p .codex/skills/
mkdir -p .codex/rules/

# Adicionar CLAUDE.md e AGENTS.md
touch CLAUDE.md
touch .codex/AGENTS.md
```

### Passo 3: Adicionar Primeira Skill

**Para Claude Code (`.claude/skills/test-runner/SKILL.md`):**
```markdown
---
name: Run Tests
description: Executa testes do projeto
icon: ✅
---

# Run Tests

Executa suite completa de testes com cobertura.
```

**Para Codex (`.codex/skills/test-runner/SKILL.md`):**
```markdown
---
name: Run Tests
description: Executa testes do projeto
icon: ✅
---

# Run Tests

Executa suite completa de testes com cobertura.
```

**Para Cursor (`.cursor/test-runner.md`):**
```markdown
# Test Runner

Executa suite completa de testes com cobertura.

## Configuração

Adicione em `.vscode/tasks.json`:

\`\`\`json
{
  "label": "Run Tests",
  "type": "shell",
  "command": "npm",
  "args": ["test"]
}
\`\`\`
```

### Passo 4: Documentar em CLAUDE.md / .cursorrules

**CLAUDE.md (Claude Code):**
```markdown
# MyProject CLAUDE.md

## Skills Customizadas

- **test-runner** - Executa testes
- **build-app** - Compila aplicação
```

**.cursorrules (Cursor):**
```
# MyProject Cursor Rules

Executáveis:
- npm test (testes)
- npm run build (compilação)
```

---

## ⚠️ Gotchas e Armadilhas

### Claude Code
- ❌ Skills precisam estar em `SKILL.md`, não `skill.md`
- ❌ Frontmatter YAML é obrigatório
- ❌ Invocar com `/` (slash), não `$`
- ❌ Não possui sistema de Rules explícito (usar CLAUDE.md para guardrails)
- ✅ CLAUDE.md local sobrescreve global
- ✅ MCP servers definem permissões implícitas

### Cursor
- ❌ Não suporta CLAUDE.md global (use User Rules em settings)
- ❌ `.cursorrules` é arquivo sem extensão e deprecated
- ❌ Extensões globais não são recarregadas automaticamente
- ❌ Rules só aplicam ao Agent, não Cursor Tab ou Inline Edit
- ✅ Suporta hooks.json para interceptar MCP
- ✅ Suporta Automations para agentes schedulados (cloud)
- ✅ Suporta todo ecossistema VS Code
- ✅ Multi-nível rules (Team > Project > User)
- ✅ Rules em .mdc são versionados e sharáveis

### Codex
- ❌ Invocar com `$` (dollar), não `/`
- ❌ AGENTS.md é padrão aberto (compatível com agents.md ecosystem)
- ❌ Rules têm sintaxe DSL própria (não Markdown)
- ❌ Rules é feature experimental (pode mudar)
- ✅ Mais similar a Claude Code que Cursor
- ✅ Suporta pattern matching complexo
- ✅ Admin enforcement via requirements.toml
- ✅ Smart command parsing (redirection/substitution detection)

---

## 🔗 Referências Externas

- [Claude Code Documentation](https://claude.ai/code)
- [Cursor IDE Documentation](https://cursor.com)
- [Codex CLI Documentation](https://openai.com/research/codex)
- [agents.md Open Standard](https://github.com/e2b-dev/agents.md)
- [Model Context Protocol (MCP)](https://modelcontextprotocol.io/)

---

## 📝 Histórico de Atualizações

| Data | Versão | Alterações |
|------|--------|-----------|
| 2026-05-10 | 1.1 | Adicionado Rules para Cursor IDE, Claude Code e Codex CLI; Corrigido suporte a Hooks do Cursor; Tabela comparativa expandida |
| 2026-05-10 | 1.0 | Documento inicial criado com mapeamento completo das 3 ferramentas |

**Mantido por:** Jesus (mainjesus@gmail.com)  
**Última atualização:** 10 de maio de 2026

---

## 📚 Referências Específicas por Ferramenta

### Cursor IDE
- [Cursor Rules Documentation](https://cursor.com/docs/rules)
- [Cursor Automations](https://cursor.com/blog/automations)
- [Agent Best Practices](https://cursor.com/blog/agent-best-practices)

### Claude Code
- [Claude Code MCP Documentation](https://code.claude.com/docs/en/mcp)
- [Claude Code Settings](https://code.claude.com/docs/en/settings)

### Codex CLI
- [Codex Rules Reference](https://developers.openai.com/codex/rules)
- [Codex Config Reference](https://developers.openai.com/codex/config-reference)
- [Codex Execution Policy](https://developers.openai.com/codex/execution-policy)
