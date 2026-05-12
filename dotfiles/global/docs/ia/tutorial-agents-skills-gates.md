# Tutorial — Agents, Skills, Gates e Submodule (.cursor)

Este guia é o **onboarding recomendado** para usar IA no Template do SoundLink após a reorganização (renome de agents/skills, introdução de **gates** e `.cursor/` como **submodule**).

## Conceitos (bem direto)

- **Agents (subagentes)**: especialistas com foco (planejamento, segurança, testes, etc.). Você chama com `/nome-do-agent`.
- **Skills**: procedimentos reutilizáveis que orientam o agente principal (“como fazer” uma tarefa).
- **Gates**: skills de qualidade transversal que produzem **decisão + severidade + evidências** (ex.: `aprovado` / `reprovado`).
- **Automations**: execuções automáticas (cloud) que podem rodar gates em eventos (PR aberto, CI finalizada, etc.).

## 1) Uso diário (fluxo padrão recomendado)

### 1.1 Antes de codar (obrigatório em features novas / decisões grandes)

```
> /seguranca-verificador-guardrails validar esta proposta: [descreva a feature]
```

### 1.2 Planejar (quando o trabalho tem 3+ passos ou risco médio/alto)

```
> /planejamento-criador criar um plano Build-ready para: [objetivo + restrições + paths]
```

### 1.3 Executar o plano

```
> /planejamento-executor executar o plano [nome-do-plano]
```

### 1.4 Validar o que foi “concluído”

```
> /testes-verificador validar a entrega e confirmar que está funcional ponta a ponta
```

### 1.5 Chamadas úteis por domínio (no meio do caminho)

- **Arquitetura (Clean Architecture)**:

```
> /arquitetura-validar-limpa validar a conformidade da feature X
```

- **TypeScript strict**:

```
> /typescript-estrito validar TypeScript strict na feature X
```

- **Testes (rodar e corrigir falhas)**:

```
> /testes-executor rodar testes e corrigir falhas desta mudança
```

- **Debug**:

```
> /debug-depurador investigar este erro: [stack/erro]
```

- **Documentação**:

```
> /docs-gerador atualizar documentação da feature X (user stories, user-flow, specs)
```

## 2) Gates (qualidade) — por que existem e quando usar

### 2.1 O que um gate resolve

Sem gates, revisões viram opinião. Com gates, você tem:
- **Critérios repetíveis**
- **Severidades comparáveis**
- **Decisão explícita** (pass/fail)
- **Evidências rastreáveis**

### 2.2 Quando rodar gates

- **Sempre**: antes de merge/release de mudança relevante.
- **Sempre**: quando tocar auth/pagamentos/dados sensíveis.
- **Sempre**: quando houver refatoração grande ou mudança estrutural.
- **Opcional**: mudanças pequenas e isoladas (mas recomendado).

### 2.3 Quais gates existem

- `gate-arquitetura`: Clean Architecture, SOLID, acoplamento.
- `gate-seguranca`: auth, input validation, secrets.
- `gate-testes`: unit/integration/e2e + risco.
- `gate-ci`: qualidade mínima e critérios de promoção.

Arquivos:
- [`.cursor/skills/gate-arquitetura/SKILL.md`](../../.cursor/skills/gate-arquitetura/SKILL.md)
- [`.cursor/skills/gate-seguranca/SKILL.md`](../../.cursor/skills/gate-seguranca/SKILL.md)
- [`.cursor/skills/gate-testes/SKILL.md`](../../.cursor/skills/gate-testes/SKILL.md)
- [`.cursor/skills/gate-ci/SKILL.md`](../../.cursor/skills/gate-ci/SKILL.md)

## 3) Automations (Cursor Automations) — como aproveitar os gates

Automations (março/2026) permitem rodar agentes em background por evento (GitHub PR opened, CI completed, etc.).

Guia e prompts prontos (para copiar/colar e adaptar):
- [`.cursor/skills/hooks/automations-guide.md`](../../.cursor/skills/hooks/automations-guide.md)

Sugestões práticas que costumam dar mais ROI:
- **PR opened**: rodar `gate-arquitetura` + `gate-seguranca` e comentar achados.
- **CI completed**: se falhar testes, rodar `gate-testes`; se falhar lint/type-check, acionar correção focada.

## 4) `.cursor/` como submodule (AI-ProjectDeveloper)

### 4.1 O que mudou

Neste repositório, a pasta `.cursor/` é um **git submodule** (catálogo central de agents/skills/rules).

Você pode verificar em:
- [`.gitmodules`](../../.gitmodules)

### 4.2 Setup após clone

```
git submodule update --init --recursive
```

### 4.3 Atualizar o submodule

Depende da política do time (fixar commit vs acompanhar upstream). Em geral:
- atualizar o submodule é uma mudança de infraestrutura do projeto (revisar com cuidado, pois altera catálogo).

### 4.4 Bundle global (~/.cursor) (opcional)

Alguns fluxos suportam instalar um subconjunto de tools globalmente. No SoundLink, o submodule é a **fonte de verdade**; o bundle é apenas um canal adicional.

Agent relacionado:
- [`.cursor/agents/replicacao-submodule-ai-projectdeveloper.md`](../../.cursor/agents/replicacao-submodule-ai-projectdeveloper.md)

## Referências

- **Agents (inventário e nomes novos)**: [subagents.md](./subagents.md)
- **Exemplos práticos (só nomes novos)**: [subagents-exemplos-praticos.md](./subagents-exemplos-praticos.md)
- **Skills + Gates**: [skills-recomendadas.md](./skills-recomendadas.md)
- **Guardrails**: [guardrails.md](./guardrails.md)

