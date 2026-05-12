# Improve Agents And Skills

## Matriz

| Item | Prioridade | Esforço | Risco | Dependências |
|---|---|---:|---|---|
| A1. Normalizar aliases em agents de documentação | P0 | M | Baixo | Nenhuma |
| A2. Normalizar aliases em agents de template/replicação | P0 | M | Baixo | Nenhuma |
| A3. Normalizar aliases em agents de CI/CD | P0 | P | Baixo | Nenhuma |
| B4. Inventariar agents operacionais com template sentinela | P0 | M | Baixo | A1-A3 recomendados |
| B5. Definir contrato `operacional-v1` | P1 | M | Médio | B4 |
| B6. Planejar migração por lotes do contrato de saída | P1 | P | Baixo | B5 |
| C7. Classificar agents por portabilidade | P1 | G | Médio | A1-A3 recomendados |
| C8. Classificar skills por portabilidade | P1 | G | Médio | A1-A3 recomendados |
| D10. Criar índice central de roteamento | P1 | M | Médio | C7, C8 |
| C9. Definir estratégia de desacoplamento | P2 | M | Médio | C7, C8, D10 |
| D11. Revisar rules específicas de projeto | P2 | P | Baixo | C9 recomendado |
| D12. Especificar lint estrutural do catálogo | P2 | M | Baixo | D10 |

## Detalhamento

### A1. Normalizar aliases em agents de documentação

Arquivos:
- [.cursor/agents/docs-user-flows.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/docs-user-flows.md)
- [.cursor/agents/docs-regras-negocio.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/docs-regras-negocio.md)
- [.cursor/agents/docs-especificacoes-api.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/docs-especificacoes-api.md)
- [.cursor/agents/docs-inicializador.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/docs-inicializador.md)

Aceite:
- referências textuais batem com [.cursor/skills/docs-gerar-fe-docs/SKILL.md](/home/jesus/Projetos/RAG-Memories/.cursor/skills/docs-gerar-fe-docs/SKILL.md)
- referências textuais batem com [.cursor/skills/code-gerar-especificacoes-api/SKILL.md](/home/jesus/Projetos/RAG-Memories/.cursor/skills/code-gerar-especificacoes-api/SKILL.md)
- referências textuais batem com [.cursor/skills/docs-criar-doc-structure/SKILL.md](/home/jesus/Projetos/RAG-Memories/.cursor/skills/docs-criar-doc-structure/SKILL.md)
- frontmatter permanece inalterado

### A2. Normalizar aliases em agents de template/replicação

Arquivos:
- [.cursor/agents/template-copiador.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/template-copiador.md)
- [.cursor/agents/template-estrutura.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/template-estrutura.md)
- [.cursor/agents/replicacao-verificador-template.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/replicacao-verificador-template.md)
- [.cursor/agents/seguranca-adaptador-guardrails.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/seguranca-adaptador-guardrails.md)

Aceite:
- nomes citados batem com [.cursor/skills/template-copiar-adapt-templates/SKILL.md](/home/jesus/Projetos/RAG-Memories/.cursor/skills/template-copiar-adapt-templates/SKILL.md)
- nomes citados batem com [.cursor/skills/template-clone-template-structure/SKILL.md](/home/jesus/Projetos/RAG-Memories/.cursor/skills/template-clone-template-structure/SKILL.md)
- nomes citados batem com [.cursor/skills/replicacao-validar-template-completeness/SKILL.md](/home/jesus/Projetos/RAG-Memories/.cursor/skills/replicacao-validar-template-completeness/SKILL.md)
- nomes citados batem com [.cursor/skills/seguranca-adapt-guardrails-domain/SKILL.md](/home/jesus/Projetos/RAG-Memories/.cursor/skills/seguranca-adapt-guardrails-domain/SKILL.md)
- links internos para skills seguem válidos

### A3. Normalizar aliases em agents de CI/CD

Arquivos:
- [.cursor/agents/cicd-repo-github.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/cicd-repo-github.md)
- [.cursor/agents/cicd-commit-e-release.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/cicd-commit-e-release.md)

Aceite:
- referências batem com [.cursor/skills/cicd-criar-github-repo/SKILL.md](/home/jesus/Projetos/RAG-Memories/.cursor/skills/cicd-criar-github-repo/SKILL.md)
- referências batem com [.cursor/skills/cicd-enviar-para-remoto/SKILL.md](/home/jesus/Projetos/RAG-Memories/.cursor/skills/cicd-enviar-para-remoto/SKILL.md)
- fluxo descrito continua semanticamente igual

### B4. Inventariar agents operacionais com template sentinela

Arquivos:
- família `docs-*`
- família `template-*`
- família `planejamento-*`
- família `orquestracao-*`
- especialistas como [.cursor/agents/python-especialista.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/python-especialista.md)
- especialistas como [.cursor/agents/java-especialista.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/java-especialista.md)
- especialistas como [.cursor/agents/react-especialista.md](/home/jesus/Projetos/RAG-Memories/.cursor/agents/react-especialista.md)

Aceite:
- inventário fechado dos `operacional-v1` que ainda embutem “Formato de saida padrao (sentinela)”

### B5. Definir contrato `operacional-v1`

Arquivo sugerido:
- novo documento de referência do catálogo

Aceite:
- formato curto definido
- diferença explícita entre executor, orquestrador e gate
- exemplos mínimos prontos para replicação

Status:
- concluído em [operational-v1-contract.md](/home/jesus/Projetos/RAG-Memories/.cursor/docs/codex/operational-v1-contract.md)

### B6. Planejar migração por lotes do contrato de saída

Aceite:
- lotes definidos
- ordem segura definida
- rollback lógico simples por família

Pré-requisito imediato:
- usar [operational-v1-contract.md](/home/jesus/Projetos/RAG-Memories/.cursor/docs/codex/operational-v1-contract.md) como contrato-alvo de todos os agents `operacional-v1` identificados no B4

Plano de lotes:
- **Lote 1 — Documentação e template**
  - `docs-*`
  - `template-*`
  - motivo: alto volume, baixa complexidade, padrão repetitivo
- **Lote 2 — Especialistas de stack**
  - `python-*`, `java-*`, `kotlin-*`, `react-*`, `nextjs-*`, `nestjs-*`, `typescript-*`
  - motivo: contratos semelhantes e baixo acoplamento entre si
- **Lote 3 — Apoio técnico transversal**
  - `infra-*`, `docker-*`, `terraform-*`, `kubernetes-*`, `custos-*`, `code-*`
  - motivo: agentes operacionais técnicos com risco moderado, mas sem papel de orquestração central
- **Lote 4 — Migração e replicação**
  - `migracao-*`
  - `replicacao-*`
  - motivo: maior acoplamento com fluxo e contexto da holding
- **Lote 5 — Planejamento e orquestração**
  - `planejamento-*`
  - `orquestracao-*`
  - motivo: maior sensibilidade semântica; devem migrar por último

Ordem segura:
1. Lote 1
2. Lote 2
3. Lote 3
4. Lote 4
5. Lote 5

Critério de avanço entre lotes:
- concluir o lote atual
- revisar diff integral do lote
- validar que não houve mudança em frontmatter
- confirmar que o texto passou a aderir ao contrato `operacional-v1`

Rollback lógico por lote:
- cada lote deve ser commitado separadamente
- se a regressão aparecer, reverter apenas o commit do lote
- não misturar migração de contrato com renomeação de skills no mesmo commit

Risco por lote:
- Lote 1: baixo
- Lote 2: baixo
- Lote 3: baixo a médio
- Lote 4: médio
- Lote 5: médio a alto

Status:
- concluído como plano de execução

### C7. Classificar agents por portabilidade

Arquivos:
- todos em [.cursor/agents](/home/jesus/Projetos/RAG-Memories/.cursor/agents)

Aceite:
- cada agent marcado como `global-reutilizavel`, `programa-holding` ou `projeto-especifico`

Status:
- concluído em [cursor-portability-inventory.md](/home/jesus/Projetos/RAG-Memories/.cursor/docs/codex/cursor-portability-inventory.md)

### C8. Classificar skills por portabilidade

Arquivos:
- todos em [.cursor/skills](/home/jesus/Projetos/RAG-Memories/.cursor/skills)

Aceite:
- mesma taxonomia aplicada às skills
- candidatas globais identificadas

Status:
- concluído em [cursor-portability-inventory.md](/home/jesus/Projetos/RAG-Memories/.cursor/docs/codex/cursor-portability-inventory.md)

### D10. Criar índice central de roteamento

Arquivo sugerido:
- novo índice do catálogo

Aceite:
- mapeia `agent -> skills -> rules -> portabilidade`
- cobre pelo menos os grupos mais usados

Status:
- concluído em [cursor-routing-index.md](/home/jesus/Projetos/RAG-Memories/.cursor/docs/codex/cursor-routing-index.md)

### C9. Definir estratégia de desacoplamento

Aceite:
- proposta do que será global
- proposta do que fica específico de SoundLink/Java legado/Modelo
- sem refatoração aplicada ainda

Status:
- concluído em [cursor-decoupling-strategy.md](/home/jesus/Projetos/RAG-Memories/.cursor/docs/codex/cursor-decoupling-strategy.md)

### D11. Revisar rules específicas de projeto

Arquivos:
- [.cursor/rules/rag-docs-context.mdc](/home/jesus/Projetos/RAG-Memories/.cursor/rules/rag-docs-context.mdc)
- [.cursor/rules/replication-musician-as-template.mdc](/home/jesus/Projetos/RAG-Memories/.cursor/rules/replication-musician-as-template.mdc)

Aceite:
- escopo e pré-requisitos explícitos
- uso fora de contexto documentado como risco

Status:
- concluído com atualização direta em [.cursor/rules/rag-docs-context.mdc](/home/jesus/Projetos/RAG-Memories/.cursor/rules/rag-docs-context.mdc)
- concluído com atualização direta em [.cursor/rules/replication-musician-as-template.mdc](/home/jesus/Projetos/RAG-Memories/.cursor/rules/replication-musician-as-template.mdc)

### D12. Especificar lint estrutural do catálogo

Aceite:
- checklist técnico pronto para virar script
- cobre referências, frontmatter, coerência de formato e classificação

Status:
- concluído em [cursor-catalog-lint-spec.md](/home/jesus/Projetos/RAG-Memories/.cursor/docs/codex/cursor-catalog-lint-spec.md)

## Sequência de Execução Recomendada

1. A1
2. A2
3. A3
4. B4
5. B5
6. B6
7. C7
8. C8
9. D10
10. C9
11. D11
12. D12

## Sugestão prática

Se a meta for manter risco realmente baixo, o primeiro ciclo de implementação deve parar em `A1-A3 + B4`. Esse bloco já entrega bastante valor sem mexer na arquitetura conceitual do catálogo.

## Execução - B4

### Inventário atual

Foram identificados **41 agents** com `report_format: operacional-v1` que ainda contêm o bloco `Formato de saida padrao (sentinela)`.

### Agrupamento por família

- `code` (2)
  - `code-aplicar-correcoes`
  - `code-corretor-de-linter`
- `custos` (1)
  - `custos-otimizador`
- `docker` (2)
  - `docker-local`
  - `docker-seguranca`
- `docs` (7)
  - `docs-bugs-kb`
  - `docs-contrato-api`
  - `docs-especificacoes-api`
  - `docs-gerador`
  - `docs-inicializador`
  - `docs-regras-negocio`
  - `docs-user-flows`
- `infra` (2)
  - `infra-assistente-dev-local`
  - `infra-aws`
- `java` (1)
  - `java-especialista`
- `kotlin` (1)
  - `kotlin-especialista`
- `kubernetes` (1)
  - `kubernetes-especialista`
- `migracao` (3)
  - `migracao-executor`
  - `migracao-executor-hexagonal`
  - `migracao-plano-hexagonal`
- `nestjs` (1)
  - `nestjs-especialista`
- `nextjs` (1)
  - `nextjs-especialista`
- `orquestracao` (4)
  - `orquestracao-assessor-estrategico`
  - `orquestracao-bff`
  - `orquestracao-especialista-erp-crm`
  - `orquestracao-metricas-north-star`
- `planejamento` (4)
  - `planejamento-config-ia`
  - `planejamento-criador`
  - `planejamento-estrutura`
  - `planejamento-executor`
- `python` (1)
  - `python-especialista`
- `react` (2)
  - `react-especialista`
  - `react-native-especialista`
- `replicacao` (4)
  - `replicacao-atualizacoes-modelo`
  - `replicacao-catalogo-modelo`
  - `replicacao-orquestrador-template`
  - `replicacao-sincronizador-template`
- `template` (2)
  - `template-copiador`
  - `template-estrutura`
- `terraform` (1)
  - `terraform-arquiteto`
- `typescript` (1)
  - `typescript-estrito`

### Leitura do resultado

- O problema não está concentrado só em `docs-*`; ele atravessa boa parte do catálogo operacional.
- As famílias mais sensíveis para a próxima fase são `docs`, `planejamento`, `orquestracao`, `replicacao` e os especialistas de stack.
- A próxima etapa segura é definir o contrato `operacional-v1` antes de editar em lote esses arquivos.
