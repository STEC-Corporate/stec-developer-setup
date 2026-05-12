---
name: docs-transicao-ciclo-vida
description: Executa transição de ciclo de vida de documentos de trabalho (exploracao → execucao → destino final). Invocada pela regra document-lifecycle.mdc ou manualmente. Use quando iniciar execução de um plano/proposta, concluir um plano, ou detectar inconsistência de localização.
---

# Transição de Ciclo de Vida de Documentos

Skill que executa a movimentação física e atualização de metadata de documentos conforme seu estado no ciclo de vida do projeto.

## Quando usar

- Um documento em `exploracao/` vai começar a ser executado
- Um plano em `execucao/` foi concluído e precisa de destino final
- Uma inconsistência de localização vs estado foi detectada
- Invocada automaticamente pela regra `document-lifecycle.mdc`

## Pré-condições

- Documento existe e é acessível
- Ação solicitada é uma de: `iniciar` | `concluir` | `verificar`
- Para `concluir`: todas as tarefas/fases do documento devem estar marcadas como concluídas

## Fluxo: INICIAR (exploracao → execucao)

### Passo 1: Validar origem

- Confirmar que o documento está em `docs/gestao-ideias/01-exploracao/` (qualquer subpasta)
- Se já estiver em `docs/gestao-ideias/02-execucao/`: informar que já está no local correto e encerrar

### Passo 2: Preparar destino

- Destino padrão: `docs/gestao-ideias/02-execucao/planejamento/plans-local-templates/`
- Nome do arquivo: manter o nome original mas garantir extensão `.plan.md`
  - `proposta-xyz.md` → `proposta-xyz.plan.md`
  - `analise-abc.plan.md` → `analise-abc.plan.md` (já correto)

### Passo 3: Mover e atualizar metadata

1. **Mover** o arquivo para o destino
2. **Adicionar/atualizar** no topo do documento (logo após o título `#`, nas primeiras ~25 linhas — alinhado a `scripts/audit-docs-conformity.sh` e `document-lifecycle.mdc`):

```markdown
> **Status:** EM EXECUÇÃO | **Iniciado:** AAAA-MM-DD | **Origem:** gestao-ideias/01-exploracao/... (path relativo a `docs/`)
```

Tokens obrigatórios para o gate **strict** do audit: `**Status:**`, `**Iniciado:**`, `**Origem:**` (não usar `**Iniciado em:**` — não passa no `grep` do script).

3. Se o documento tiver seção de ciclo de vida (tabela com fases), atualizar a linha correspondente

### Passo 4: Atualizar referências

- Executar busca (grep/rg) por referências ao path antigo em:
  - `docs/` (outros documentos que fazem link)
  - `.cursor/rules/` (regras que citam o documento)
  - `.cursor/skills/` (skills que referenciam)
- Atualizar os links encontrados para o novo path
- Se houver INDEX.md na pasta de origem, remover a entrada

### Passo 5: Confirmar

- Informar ao usuário: "Documento movido de `<origem>` para `<destino>`. Referências atualizadas: N arquivos."

## Fluxo: CONCLUIR (execucao → destino final)

### Passo 1: Validar estado

- Confirmar que o documento está em `docs/gestao-ideias/02-execucao/`
- Verificar se todas as tarefas/fases estão marcadas como concluídas
- Se houver tarefas pendentes: listar e perguntar ao usuário se deseja concluir mesmo assim

### Passo 2: Determinar destino

Analisar o conteúdo do documento e classificar:

| Conteúdo predominante | Destino | Justificativa |
|----------------------|---------|---------------|
| Processos, padrões, convenções reutilizáveis | `docs/gestao-ideias/04-referencia-tecnica/referencia/<subpasta-tematica>/` | Vira norma/referência viva |
| Decisão arquitetural formal | `docs/gestao-ideias/00-governanca/decisoes/` | ADR ou decisão registada |
| Política, guardrail, regra permanente | `docs/gestao-ideias/00-governanca/` (subpasta adequada) | Norma ativa |
| Atualização de processo existente | Fundir no documento de governança existente + arquivar plano | Evita duplicação |
| Registro histórico sem valor normativo | `docs/gestao-ideias/02-execucao/planejamento/plans-local-templates/executados/` | Rastreabilidade |

### Passo 3: Propor ao usuário

- Apresentar classificação e destino proposto
- Perguntar: "Confirma mover para `<destino>`? Ou prefere outro destino?"
- Se o conteúdo tiver **partes normativas E partes históricas**: propor:
  - Extrair a parte normativa para o documento de governança/referência apropriado
  - Mover o plano original para `executados/`

### Passo 4: Executar transição

1. **Mover** o arquivo para o destino confirmado
2. **Atualizar** metadata:

```markdown
**Status:** CONCLUÍDO
**Concluído em:** AAAA-MM-DD
**Destino final:** <path do destino>
```

3. **Atualizar referências** (mesmo processo do Passo 4 de INICIAR)
4. Se partes normativas foram extraídas: atualizar o documento de destino

### Passo 5: Confirmar

- Informar resultados ao usuário

## Fluxo: VERIFICAR (detectar inconsistências)

### Quando executar

- Ao encontrar documento em `exploracao/` com tarefas `in_progress` ou `completed`
- Ao encontrar documento em `execucao/` com todas as tarefas `completed` há mais de N dias
- Quando o usuário pedir auditoria de ciclo de vida

### Procedimento

1. Listar todos os `.md` e `.plan.md` em `docs/gestao-ideias/01-exploracao/` e `docs/gestao-ideias/02-execucao/planejamento/plans-local-templates/`
2. Para cada um, verificar:
   - Tem tarefas/todos? Qual o estado predominante?
   - A localização corresponde ao estado?
3. Produzir relatório:

```markdown
## Inconsistências de ciclo de vida

| Documento | Localização atual | Estado detectado | Localização esperada | Ação sugerida |
|-----------|-------------------|------------------|---------------------|---------------|
| proposta-x.md | exploracao/ | 3/5 tarefas completas | execucao/ | Mover (INICIAR) |
| plano-y.plan.md | execucao/ | Todas completas | executados/ | Mover (CONCLUIR) |
```

4. Perguntar ao usuário quais transições executar

## Checklist de saída

- [ ] Arquivo movido para o local correto
- [ ] Metadata (Status, Data, Origem/Destino) atualizada no documento
- [ ] Referências ao path antigo atualizadas (docs, rules, skills)
- [ ] Usuário informado do resultado
- [ ] INDEX.md da pasta de origem atualizado (se aplicável)

## Cobertura de stack e domínio

- Stacks suportadas: todas (skill é sobre documentação, não código)
- Domínios: transversal — aplica-se a qualquer projeto que use a estrutura `docs/` com as 5 camadas
