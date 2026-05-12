# Skills Standards — AI-ProjectDeveloper (STEC)

Convenções globais de naming, estrutura e boas práticas para todas as skills deste repositório.
Consulte este arquivo antes de criar ou modificar qualquer skill.

---

## 1. Naming

### Pasta e campo `name`

- Formato: `{dominio}-{funcao}` em **kebab-case**.
- O nome da pasta deve ser **idêntico** ao campo `name` no frontmatter do `SKILL.md`.
- Máximo: 64 caracteres.
- Apenas letras minúsculas, números e hífens. Sem underscores, pontos ou espaços.

**Exemplos válidos:**
```
gate-arquitetura
code-criar-novo-microsservico
cicd-criar-commit-release
orquestracao-executor-sentinelas
```

### Prefixos de domínio

| Prefixo | Domínio |
|---|---|
| `arquitetura-` | Clean Architecture, SOLID, DDD, hexagonal |
| `cicd-` | CI/CD, commits, releases, GitHub Actions |
| `code-` | Implementação de código, revisão, qualidade |
| `custos-` | Estimativas e otimização de custos AWS |
| `debug-` | Diagnóstico de erros e bugs |
| `docker-` | Docker, docker-compose, políticas de container |
| `docs-` | Documentação, business rules, user flows, API specs |
| `gate-` | Gates de qualidade (bloqueantes no fluxo sentinelas) |
| `infra-` | Infraestrutura AWS, Terraform, ambientes locais |
| `java-` | Stack Java / Spring Boot |
| `kotlin-` | Stack Kotlin |
| `kubernetes-` | Kubernetes, manifests, K8s |
| `migracao-` | Migração de arquitetura (hexagonal, etc.) |
| `nestjs-` | Stack NestJS |
| `nextjs-` | Stack Next.js |
| `observabilidade-` | Métricas, tracing, SLO, dashboards |
| `openspec-` | Ciclo OpenSpec (explore, propose, apply, archive) |
| `orquestracao-` | Orquestração de fluxos multi-agente |
| `planejamento-` | Sprint, OKR, North Star, go-to-market |
| `python-` | Stack Python |
| `qualidade-` | Programa de qualidade, sentinelas |
| `react-` | Stack React |
| `react-native-` | Stack React Native |
| `replicacao-` | Replicação de templates e assets entre projetos |
| `seguranca-` | Segurança, guardrails, auth, endpoints |
| `template-` | Cópia e adaptação de templates |
| `terraform-` | Terraform, módulos IaC |
| `testes-` | Testes unitários, integração, E2E, cobertura |
| `typescript-` | Stack TypeScript |

---

## 2. Estrutura de pasta

Estrutura mínima obrigatória:

```
skills/
└── {dominio}-{funcao}/
    ├── SKILL.md          # Obrigatório
    └── README.md         # Obrigatório neste projeto
```

Estrutura completa (quando aplicável):

```
skills/
└── {dominio}-{funcao}/
    ├── SKILL.md
    ├── README.md
    ├── references/       # Documentação técnica carregada sob demanda
    │   └── {topico}.md
    ├── scripts/          # Scripts executáveis (bash, python, js)
    │   └── {acao}.sh
    └── assets/           # Templates, configs, arquivos estáticos
        └── {recurso}.{ext}
```

---

## 3. Formato do SKILL.md

```markdown
---
name: {dominio}-{funcao}
description: {O que faz e quando usar — máx. 1024 caracteres, em terceira pessoa, incluindo termos de acionamento}
---

# {Titulo da Skill}

## Quando usar
- Listar cenários de uso específicos.

## Documentos
- Listar arquivos de referência (cursorrules, docs/, etc.)

## Passos
1. Passo numerado e objetivo.
2. ...

## Saida
- O que a skill produz/entrega.

## Pre-condicoes
- Escopo e contexto da tarefa definidos.
- Arquivos-alvo identificados.
- Criterios de aceite minimos estabelecidos.

## Checklist de saida
- Resultado entregue e verificavel.
- Evidencias objetivas registradas.
- Riscos e proximos passos documentados.

## Cobertura de stack e dominio
- Stacks suportadas: Java, Kotlin, Python, TypeScript, React, React Native, NextJS, NestJS.
- Dominios: backend, frontend e mobile.
```

### Regras do campo `description`

- Escrita em terceira pessoa.
- Inclui **o que faz** + **quando usar** + **termos de acionamento** (palavras que o agente usa para decidir invocar).
- Máximo 1024 caracteres.
- Não termina com ponto final.

---

## 4. Formato do README.md

```markdown
# {nome-da-skill}

{Descrição de 1-2 linhas sobre o propósito.}

## Origem
- Documento(s) de origem (ex.: docs/programa-qualidade/README.md)
- Agente relacionado (ex.: qualidade-programa-orquestrador)

## Rastreabilidade
- Agente: `{agente-relacionado}`
- Domínio: `{quality_domain}`
```

---

## 5. Boas práticas

### `references/`
- Use `references/` para documentação técnica específica que **não cabe** no corpo do `SKILL.md`.
- O agente carrega arquivos de `references/` **sob demanda** (carregamento progressivo).
- Mantenha o `SKILL.md` focado; mova detalhes para `references/{topico}.md`.
- Referencie os arquivos no `SKILL.md`: `Consultar references/{topico}.md antes de executar.`

### `scripts/`
- Scripts devem ser **autocontidos** e incluir mensagens de erro claras.
- Nomear no formato `{acao}.sh` / `{acao}.py` / `{acao}.mjs`.
- Tornar executável: `chmod +x scripts/{acao}.sh`.
- Referenciar no `SKILL.md` com caminho relativo: `scripts/{acao}.sh`.

### `assets/`
- Arquivos estáticos: templates de código, configs de exemplo, JSONs.
- Não incluir binários ou arquivos gerados.

### Tamanho do SKILL.md
- Objetivo: **menos de 150 linhas**.
- Se ultrapassar, mova seções detalhadas para `references/`.

### Consistência entre skills do mesmo domínio
- Skills do mesmo prefixo devem ter estrutura equivalente.
- Reutilizar seções comuns (`Pre-condicoes`, `Checklist de saida`, `Cobertura de stack e dominio`).

---

## 6. Submodule e descoberta automática

Este repositório é um **submodule Git** da holding STEC. As skills em `skills/` desta raiz são injetadas como `.cursor/skills/` nos projetos pai, onde o Cursor as descobre automaticamente.

Ver `rules/submodule-premise.mdc` para detalhes completos.

---

## 7. Checklist antes de criar uma nova skill

- [ ] Nome da pasta igual ao campo `name` no frontmatter
- [ ] Prefixo de domínio correto (ver tabela da Seção 1)
- [ ] `SKILL.md` com frontmatter completo (`name` + `description`)
- [ ] `README.md` com origem e rastreabilidade
- [ ] `description` em terceira pessoa com termos de acionamento
- [ ] `SKILL.md` com menos de 150 linhas (mover excesso para `references/`)
- [ ] Scripts em `scripts/` com permissão de execução
