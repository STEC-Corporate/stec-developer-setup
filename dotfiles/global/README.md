# AI-ProjectDeveloper — Submodule de Configuração Cursor (Holding STEC)

> **Premissa arquitetural:** Este repositório é um **submodule Git** da holding STEC. As pastas `agents/`, `skills/`, `rules/` e `plans/` estão na raiz **intencionalmente** — ao ser adicionado como submodule em `.cursor/` de um projeto pai, estas pastas se tornam `.cursor/agents/`, `.cursor/skills/` etc., sendo descobertas automaticamente pelo Cursor.
>
> ```bash
> # Adiciona este repositório como submodule em .cursor
> git submodule add https://github.com/STEC-Corporate/AI-ProjectDeveloper .cursor
> # Inicializa e baixa o conteúdo do submodule adicionado
> git submodule update --init --recursive
> ```
>
> **Nunca mover** estas pastas para dentro de `.cursor/` neste repo. A estrutura na raiz é o design correto. Ver [`rules/submodule-premise.mdc`](rules/submodule-premise.mdc) para detalhes completos.

Guia completo (configuração global, clone/pull e troubleshooting): [`SUBMODULES.md`](SUBMODULES.md).

---

Esta pasta contém a configuração do Cursor para **agentes**, **skills**, **regras** e **planos** do projeto.

## Taxonomia do Catálogo

Para separar o que é realmente global do que ainda depende de domínio, o catálogo passa a ser lido por três blocos lógicos:

- `core`: assets portáteis e transversais, candidatos ao bundle principal
- `packs/soundlink`: assets específicos do ecossistema SoundLink, mantidos como preset opcional
- `packs/java`: assets técnicos Java e JavaFX, mantidos como preset opcional

Nesta etapa a separação é **semântica**, não física: os diretórios permanecem na raiz para preservar a descoberta automática do Cursor quando este repositório é montado como `.cursor/`.

Referências operacionais:

- [docs/codex/catalog-taxonomy.md](docs/codex/catalog-taxonomy.md)
- [docs/codex/catalog-routing-matrix.md](docs/codex/catalog-routing-matrix.md)
- [docs/codex/catalog-semantic-audit.md](docs/codex/catalog-semantic-audit.md)

## Pastas

| Pasta | Função |
|-------|--------|
| [agents/](agents/) | Subagentes customizados (um `.md` por agente) |
| [skills/](skills/) | Skills do projeto (uma pasta por skill, com `SKILL.md`) |
| [rules/](rules/) | Regras de contexto (arquivos `.mdc`) |
| [plans/](plans/) | Planos de trabalho (`*.plan.md`) |

Neste repositório, **agentes** estão achatados em `.cursor/agents/` (raiz), com nome no formato `${prefix}-${role}` (ex.: `arquitetura-validar-limpa`). **Skills** também foram padronizadas por prefixo funcional em `.cursor/skills/` (ex.: `code-consultar-regras-para-correcao`, `gate-arquitetura`). Ver [skills/README.md](skills/README.md).

O arquivo **AGENTS.md** na **raiz do projeto** (fora de `.cursor/`), se existir, define papéis e fluxo do agente principal (ex.: spec-driven). A pasta `.cursor/agents/` contém **subagentes** especializados invocáveis pelo Cursor.

---

## 1. Agents (`agents/`)

**Para que serve:** Subagentes especializados que o Cursor pode invocar para delegar tarefas (cada um com seu próprio system prompt).

**Formato:** Um arquivo `.md` por agente.

- **Frontmatter obrigatório (YAML):**
  - `name` — identificador em kebab-case (ex.: `code-reviewer`)
  - `description` — quando delegar a este agente; o modelo usa isso para decidir
- **Corpo:** Markdown com o system prompt do subagente.

**Exemplo mínimo:**

```markdown
---
name: meu-agente
description: Descrição específica de quando usar este agente.
---

Você é um especialista em [domínio]. Quando invocado...
```

**Referência:** skill oficial do Cursor *create-subagent* (subagentes customizados).

### Classificacao operacional dos agentes

Para padronizar governanca e consolidacao de achados, todos os agentes possuem os campos abaixo no frontmatter:

- `role_type`: `sentinela-estrito` ou `operacional`
- `blocking_authority`: `true` ou `false`
- `quality_domain`: dominio principal do agente (ex.: `arquitetura`, `testes`, `seguranca`, `codigo`, `cicd`)
- `report_format`: contrato de saida esperado (`gate-v1` ou `operacional-v1`)

Resumo atual do catalogo:
- Total de agentes classificados: 77
- `sentinela-estrito`: 28
- `operacional`: 49
- `blocking_authority=true`: 28
- `blocking_authority=false`: 49

Cobertura por dominio (`quality_domain`):
- `arquitetura`: 6
- `cicd`: 6
- `codigo`: 12
- `custos`: 1
- `debug`: 2
- `docker`: 2
- `docs`: 7
- `infra`: 2
- `kubernetes`: 1
- `migracao`: 3
- `observabilidade`: 3
- `orquestracao`: 6
- `planejamento`: 6
- `replicacao`: 8
- `seguranca`: 4
- `template`: 2
- `terraform`: 1
- `testes`: 5


---



### Prefixos tecnologicos (camada por stack)

Padrao adotado para agentes tecnologicos:
- `java-`, `kotlin-`, `python-`, `typescript-`, `react-`, `react-native-`, `nextjs-`, `nestjs-`

Padrao de nomenclatura:
- agentes: `stack-funcaodoagente.md`
- skills: `stack-funcao/SKILL.md`

Roteamento recomendado:
- use agente tecnologico para regras especificas da stack;
- use agentes funcionais/sentinelas para validacao transversal (arquitetura, testes, seguranca, ci).


### Mapeamento atual por stack (agentes)

- `java`: 1
- `kotlin`: 1
- `python`: 1
- `typescript`: 1
- `react`: 2
- `react-native`: 0
- `nextjs`: 1
- `nestjs`: 3

- Indice e roteamento por stack: agente `qualidade-stack-prefixo-guia`.

### Agentes de dominio (programa, bundle, submodule, CI)

| Agente | Funcao |
|--------|--------|
| `replicacao-submodule-ai-projectdeveloper` | Uso como git submodule e apontamento do catalogo |
| `replicacao-cursor-global-bundle` | Pipeline manifest, build do bundle, `install.sh` |
| `replicacao-classificacao-assets-cursor` | Classificacao global vs especifico vs MCP para manifest |
| `qualidade-programa-orquestrador` | Fluxo executor + sentinelas e severidade |
| `qualidade-stack-prefixo-guia` | Prefixos tecnologicos e roteamento |
| `technical-spec-driven-cursor` | Spec-driven, skills vs subagentes, Automations |
| `observabilidade-programa-qualidade-kpis` | Metricas e cadencia de tuning |
| `cicd-quality-gates-advisor` | Gates CI/CD e adaptacao de workflows |

Mapa fonte ↔ agente: arquivado em `~/Projetos/temp/AGENT-KNOWLEDGE-MAP.md`. Documentacao historica do programa pode estar arquivada fora do repo (ver README na raiz).

## 2. Skills (`skills/`)

**Para que serve:** Instruções reutilizáveis que o agente carrega como contexto (como executar uma tarefa: formato, passos, scripts).

**Formato:** Uma **pasta** por skill. Dentro dela:

- **SKILL.md** (obrigatório) — frontmatter + corpo em Markdown
- **README.md** (obrigatório neste projeto) — origem, rastreabilidade e metadados da skill
- **reference.md**, **examples.md**, **scripts/** (opcionais)

### Pacote cursor-global (template no repo pai)

- **Skill** `replicacao-cursor-global-scaffold`: contém `scaffold/packages-cursor-global/` (`manifest.json`, `install.sh`, `README-fragment.md`), `scaffold/scripts/build_cursor_global_bundle.py` (espelho do script canônico; usar `CURSOR_GLOBAL_MANIFEST` no repo pai) e `scaffold/scripts/build_bundle_snippet.md`. O **agente** `replicacao-cursor-global-bundle` descreve o pipeline; a skill fornece os arquivos de partida.

### Gates de qualidade (programa atual)

Além das skills de domínio, este projeto possui gates reutilizáveis:
- `gate-arquitetura`
- `gate-testes`
- `gate-seguranca`
- `gate-ci`

Esses gates suportam o fluxo executor + sentinelas; ver agente `qualidade-programa-orquestrador` e skill `qualidade-executor-sentinelas-checklist`.

**SKILL.md — frontmatter:**

- `name` — kebab-case, máx. 64 caracteres
- `description` — em terceira pessoa; descreve O QUE a skill faz e QUANDO usar (máx. 1024 caracteres). Inclua termos que acionem o uso da skill.

**Exemplo de estrutura:**

```
.cursor/skills/nome-da-skill/
├── SKILL.md         # Obrigatório
├── reference.md     # Opcional
├── examples.md      # Opcional
└── scripts/        # Opcional
```

**Referência:** skill oficial do Cursor *create-skill* (criação de skills).

---

## 3. Rules (`rules/`)

**Para que serve:** Regras persistentes de contexto (padrões de código, convenções, regras por tipo de arquivo).

**Formato:** Arquivos `.mdc` com YAML frontmatter e conteúdo em Markdown.

**Frontmatter:**

- `description` — o que a regra faz (exibido no seletor de regras)
- `globs` — padrão de arquivos (ex.: `**/*.ts`). Regra aplicada quando arquivos que batem com o glob estão abertos
- `alwaysApply` — se `true`, a regra vale em toda conversa

**Exemplo mínimo:**

```yaml
---
description: Padrões TypeScript do projeto
globs: "**/*.ts"
alwaysApply: false
---
# Conteúdo da regra...
```

**Referência:** skill oficial do Cursor *create-rule* (regras em `.cursor/rules/`).

---

## 4. Plans (`plans/`)

**Para que serve:** Planos de trabalho estruturados (tarefas com múltiplas etapas). Podem ser criados pela ferramenta **CreatePlan** do Cursor ou escritos manualmente.

**Formato:** Arquivos `*.plan.md` com YAML frontmatter e corpo em Markdown (fases, ações, referências a skills).

**Frontmatter típico:**

- `name` — nome do plano
- `overview` — descrição em 1–2 frases
- `todos` — lista de itens com `id`, `content`, `status` (ex.: pending, completed)
- `isProject` — opcional (ex.: false para plano de usuário)

**Exemplo:**

```yaml
---
name: Nome do Plano
overview: Descrição em 1-2 frases
todos:
  - id: id-do-todo
    content: Descrição
    status: pending
---
```

O conteúdo dos planos é gerado por projeto; esta pasta pode ficar vazia ou conter apenas planos versionados neste repositório.

---

## Como mapear Agents e Skills dentro do Projeto AI-ProjectDeveloper

> Registro histórico de decisão arquitetural sobre onde posicionar os diretórios `agents/` e `skills/`.

O Cursor descobre subagentes e skills exclusivamente a partir de caminhos predefinidos:

| Tipo | Caminho reconhecido pelo Cursor |
|------|--------------------------------|
| Agents | `.cursor/agents/` |
| Skills | `.cursor/skills/` ou `.agents/skills/` |

Os diretórios `agents/` e `skills/` na **raiz do repositório** não são reconhecidos automaticamente.

### Opção avaliada: Symlinks (escolhida para histórico)

Criar links simbólicos dentro de `.cursor/` apontando para os diretórios na raiz:

```bash
ln -s ../agents .cursor/agents
ln -s ../skills .cursor/skills
```

Com isso, os arquivos permanecem versionados na raiz (visíveis no explorador de arquivos e no GitHub) e o Cursor os enxerga via `.cursor/`.

**Prós:**
- Mantém `agents/` e `skills/` acessíveis na raiz do repositório
- O Cursor segue symlinks e reconhece os caminhos normalmente
- Nenhuma duplicação de arquivos

**Contras:**
- Symlinks no git são rastreados como arquivos especiais; podem não funcionar ao clonar em Windows sem `core.symlinks=true`
- Requer execução manual do `ln -s` após cada clone (ou script de setup)
- Adiciona complexidade desnecessária para colaboradores

### Por que não foi adotado

A estrutura oficial recomendada pelo Cursor é manter os arquivos diretamente em `.cursor/agents/` e `.cursor/skills/`. Mover os diretórios de volta para `.cursor/` é mais simples, portável e sem dependências adicionais. Esta seção existe apenas como registro da análise realizada.

---

## Conteúdo incorporado de AI-Develop-Resources

Trechos e referências do catálogo **AI-Develop-Resources** (AcoustiCore / SDD) que complementam este README sem substituir a premissa STEC acima.

### Visão do catálogo-fonte

Catálogo **SDD** (Specification-Driven): o arquiteto aprova gates; agentes e skills **propoem**.

### Uso como submodule (referência cruzada)

O repositório-fonte segue o mesmo padrão de submodule em `.cursor/` no projeto pai; guia operacional compartilhado: [`SUBMODULES.md`](SUBMODULES.md) (seção adicional incorporada no mesmo arquivo).

### Índices (origem)

| Área | Índice |
|------|--------|
| Agents | [agents/INDEX.md](agents/INDEX.md) |
| Skills | [skills/INDEX.md](skills/INDEX.md) |
| Rules | [rules/INDEX.md](rules/INDEX.md) |

### Verticais de stack (guias)

Os agents `stack-*-guia` cobrem: **Java/Spring**, **Java desktop**, **TypeScript** (web/Node), **Python**, **.NET (geral)**, **.NET Core/ASP.NET Core**, **OpenAPI**, **React Native**, **Android nativo**. Detalhe e estado em [agents/INDEX.md](agents/INDEX.md).

### Agents por arquitetura e por framework

- **`arch-*-guia`:** decisão macro, padrões (monólito, microserviços, EDA, CQRS, cache, gateway, etc.). Matriz: [docs/governanca/catalogo-arch-agents-ia.md](docs/governanca/catalogo-arch-agents-ia.md).
- **`framework-*-guia`:** tecnologias de mercado (Spring, FastAPI, NestJS, React, Next.js, Quarkus, Svelte, etc.) com skill e rule correspondentes. Matriz: [docs/governanca/catalogo-frameworks-ia.md](docs/governanca/catalogo-frameworks-ia.md).

### Documentação de governação (origem)

- Fluxo humano + IA + gates: [docs/governanca/fluxo-ia-sdd.md](docs/governanca/fluxo-ia-sdd.md)
- **Workflow Agent + hooks + CI + tarefas:** [docs/governanca/fluxo-workflow-agent-hooks-ci.md](docs/governanca/fluxo-workflow-agent-hooks-ci.md) — máquina de estados de referência; configuração em [hooks.json](hooks.json) e [hooks/](hooks/)
- Catálogo de frameworks (IA): [docs/governanca/catalogo-frameworks-ia.md](docs/governanca/catalogo-frameworks-ia.md)

### Pastas adicionais citadas na origem

| Pasta | Conteúdo (origem) |
|-------|-------------------|
| [`skills/`](skills/) | Geradores de catálogo em `skills/catalogo-*-ia/scripts/` (ver [catalogo-scripts-skills.md](docs/governanca/catalogo-scripts-skills.md)) |
| [`plans/`](plans/) | Planos `*.plan.md` e [templates](plans/template-sdd-feature.plan.md) |

Referência de formato: [Cursor — Documentation](https://cursor.com/docs) · [Hooks](https://cursor.com/docs/hooks)
