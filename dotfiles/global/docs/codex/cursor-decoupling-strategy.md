# Cursor Decoupling Strategy

## Objetivo

Definir como separar o catálogo `.cursor/` em três camadas sem quebrar o uso atual:

- pacote `global`
- pacote `holding`
- pacote `projeto`

Esta estratégia é deliberadamente não destrutiva. Ela organiza a futura extração do catálogo, mas não altera ainda `agents`, `skills` ou `rules`.

## Princípios

1. preservar compatibilidade primeiro
2. separar por dependência semântica, não só por prefixo
3. extrair famílias coesas, não arquivos isolados sem contexto
4. manter o mínimo de aliases temporários necessário durante a migração
5. não mover `rules` sensíveis antes de documentar pré-requisitos

## Modelo-alvo

### Pacote Global

Conteúdo que pode rodar em múltiplos projetos, inclusive fora da holding, com pouco ajuste:

- agents de arquitetura, código, debug, docker, segurança genérica, testes e stacks
- workflow-base por stack
- gates técnicos genéricos
- skills utilitárias de documentação, código, testes, terraform, kubernetes, docker e arquitetura
- rules genéricas de linguagem e arquitetura

Exemplos:
- agents: `arquitetura-*`, `code-*`, `debug-*`, `docker-*`, `java-especialista`, `python-especialista`, `react-especialista`, `nestjs-especialista`, `testes-*`, `terraform-arquiteto`, `typescript-estrito`
- skills: `arquitetura-*`, `backend-*`, `core-*`, `docker-*`, `gate-*`, `java-workflow-base`, `python-workflow-base`, `react-workflow-base`, `nestjs-workflow-base`, `terraform-*`, `testes-*`, `typescript-workflow-base`
- rules: `clean-architecture-guardrails`, `typescript-conventions`, `nestjs-conventions`, `react-conventions`

### Pacote Holding

Conteúdo que é reutilizável entre projetos da STEC, mas depende de padrões internos, bundles, sentinelas, submodule ou governança da holding:

- orquestração executor + sentinelas
- bundles e scaffold `cursor-global`
- fluxos de replicação do Modelo
- qualidade e observabilidade do programa
- templates base e adaptação de catálogo entre projetos da holding
- regras de submodule e checklist padronizado do programa

Exemplos:
- agents: `cicd-quality-gates-advisor`, `qualidade-programa-orquestrador`, `qualidade-stack-prefixo-guia`, `replicacao-*` centrais, `technical-spec-driven-cursor`, `template-*`, `planejamento-config-ia`, `planejamento-estrutura`
- skills: `replicacao-*` de catálogo/modelo, `qualidade-executor-sentinelas-checklist`, `planejamento-configure-agents-skills`, `replicacao-cursor-global-scaffold`, `template-*`, `orquestracao-executor-sentinelas`
- rules: `submodule-premise`, `post-implementation-checklist`

### Pacote Projeto

Conteúdo fortemente acoplado ao domínio SoundLink, ao BFF, ao fluxo de migração local, ao Modelo contextualizado ou a regras concretas do projeto:

- agents `docs-*`
- `orquestracao-*` específicos de SoundLink
- `migracao-*`
- integração BFF/API/Template
- guardrails adaptados por domínio
- regras de RAG e replicação músico como template

Exemplos:
- agents: `docs-*`, `orquestracao-assessor-estrategico`, `orquestracao-bff`, `orquestracao-especialista-erp-crm`, `orquestracao-metricas-north-star`, `migracao-*`, `seguranca-adaptador-guardrails`, `infra-aws`
- skills: `orquestracao-mapear-endpoint-bff-api`, `orquestracao-mapear-endpoint-template-bff-api`, `migracao-*`, `seguranca-adapt-guardrails-domain`, `infra-mapear-infra-aws-por-servico`
- rules: `rag-docs-context`, `replication-musician-as-template`

## Estratégia de Extração

### Fase 1: Consolidar o pacote global

Objetivo:
- isolar o que já é tecnicamente genérico e mais estável

Escopo recomendado:
- agents `global-reutilizavel`
- skills `global-reutilizavel`
- rules genéricas

Pré-condições:
- manter aliases temporários para referências legadas
- definir uma convenção clara de publicação para esse pacote

Risco:
- baixo a médio

Valor:
- alto, porque reduz ruído do catálogo local e cria base reaproveitável imediata

### Fase 2: Formalizar o pacote holding

Objetivo:
- separar ativos internos da STEC que não devem parecer universais

Escopo recomendado:
- replicação do Modelo
- sentinelas e qualidade de programa
- cursor-global scaffold
- technical-spec-driven
- templates e configuração de catálogo da holding

Pré-condições:
- documentar dependências de path, submodule e convenções da holding
- explicitar quais itens exigem contexto institucional

Risco:
- médio

Valor:
- alto, porque impede que conteúdo de holding contamine projetos genéricos

### Fase 3: Delimitar o pacote projeto

Objetivo:
- manter no projeto apenas o que depende do contexto real de negócio ou do fluxo local

Escopo recomendado:
- `docs-*`
- `orquestracao-*` específicos
- `migracao-*`
- `infra-aws`
- `seguranca-adaptador-guardrails`
- rules de projeto

Pré-condições:
- garantir que o restante já esteja extraído para não forçar duplicação

Risco:
- médio a alto

Valor:
- alto, porque deixa explícito o que é realmente local e reduz falsa generalização

## Ordem Recomendada

1. publicar o pacote `global`
2. publicar o pacote `holding`
3. reduzir o projeto para o pacote `projeto`

Não recomendo inverter essa ordem, porque:

- extrair o `holding` antes do `global` mistura reaproveitamento genérico com regra institucional
- mexer primeiro no `projeto` aumenta o risco de quebrar o catálogo atual sem limpar a base compartilhada

## Critérios de Entrada por Pacote

Um item entra em `global` se:

- não cita SoundLink, Modelo, Template, BFF, BeachLink ou um produto Java legado como pré-condição semântica
- faz sentido em outro domínio com baixo esforço de adaptação
- depende mais de stack ou disciplina técnica do que de negócio

Um item entra em `holding` se:

- depende de convenções da STEC
- pressupõe uso como submodule, bundle ou catálogo interno
- orquestra processos transversais comuns à holding

Um item fica em `projeto` se:

- fala de documentos, fluxos, métricas, guardrails ou integrações específicas do produto
- depende de caminhos, repositórios ou decisões concretas do SoundLink
- perderia sentido fora do contexto do projeto

## Candidatos por Prioridade

### Prioridade Alta para Extração Global

- agents de arquitetura e código
- specialists por stack
- skills workflow-base
- skills de testes
- rules de linguagem e arquitetura

### Prioridade Alta para Extração Holding

- `replicacao-cursor-global-bundle`
- `replicacao-submodule-ai-projectdeveloper`
- `qualidade-programa-orquestrador`
- `technical-spec-driven-cursor`
- `planejamento-config-ia`
- `planejamento-estrutura`

### Prioridade Alta para Permanecer no Projeto

- `orquestracao-bff`
- `orquestracao-assessor-estrategico`
- `orquestracao-metricas-north-star`
- `migracao-*`
- `docs-*`
- `rag-docs-context`
- `replication-musician-as-template`

## Riscos de Execução

### Risco 1: Extrair família incompleta

Exemplo:
- mover um agent global sem as skills que ele espera

Mitigação:
- mover por família funcional
- validar no índice `agent -> skills -> rules` antes de qualquer extração

### Risco 2: Tornar genérico o que é da holding

Exemplo:
- publicar `replicacao-*` ou `submodule-premise` como se fossem universais

Mitigação:
- exigir revisão explícita de contexto institucional antes de classificar como global

### Risco 3: Manter regras de projeto em pacote compartilhado

Exemplo:
- `rag-docs-context` ou `replication-musician-as-template`

Mitigação:
- tratar `rules` como primeiro-class citizens na separação, não como apêndice

### Risco 4: Drift entre inventário e catálogo real

Mitigação:
- na fase seguinte, criar lint estrutural que compare classificação esperada com o estado real

## Resultado Esperado

Quando essa estratégia for aplicada:

- o pacote `global` vira base reaproveitável entre projetos
- o pacote `holding` concentra os padrões institucionais da STEC
- o pacote `projeto` fica mais leve, explícito e honesto sobre seu acoplamento
- o roteamento do Codex e do Cursor fica mais previsível

## Próximo passo recomendado

Usar esta estratégia para:

1. revisar `rules` específicas em `D11`
2. definir a especificação do lint em `D12`
3. só depois decidir se vale iniciar a extração real por pacote
