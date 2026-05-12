---
name: replicacao-validar-template-completeness
description: Executa checklist de completude e reporta gaps. Use ao validar que replicação do template está completa.
---

# Validar Completude do Template Replicado

## Quando Usar

- Ao final do fluxo de replicação
- Usado por replicacao-verificador-template
- Para garantir que todos os artefatos foram criados corretamente

## Processo

### 1. Executar checklist (template-replication-flow.md seção 5)

**Estrutura:**
- [ ] Path do destino existe e acessível
- [ ] docs/gestao-tarefas/03-especificacao-produto/business-rules/[perfil]/ existe
- [ ] docs/gestao-tarefas/03-especificacao-produto/user-flows/[perfil]/ existe
- [ ] docs/gestao-tarefas/03-especificacao-produto/api-specifications/[perfil]/ existe
- [ ] docs/gestao-ideias/00-governanca/ia/guardrails.md existe e adaptado
- [ ] docs/gestao-ideias/04-referencia-tecnica/_templates/ com 6+ templates
- [ ] .cursor/agents/ com agents dos 5 projetos + novos de replicação
- [ ] .cursor/skills/ com skills completas
- [ ] docs/gestao-ideias/02-execucao/planejamento/ existe
- [ ] docs/gestao-ideias/00-governanca/decisoes/ existe
- [ ] docs/gestao-ideias/04-referencia-tecnica/referencia/ existe (tech-stack-versions.md, architecture/, migracao/, etc.)
- [ ] README.md na raiz (quando destino = Modelo — Fluxo A)
- [ ] .cursor/plans/ existe (pasta vazia; conteúdo não replicado)

**Conteúdo mínimo:**
- [ ] Pelo menos 1 fe-*.md em business-rules
- [ ] Pelo menos 1 fe-*-user-flow.md em user-flows
- [ ] Pelo menos 1 pasta em api-specifications com endpoints.md

### 2. Verificar cada item

- Checar existência de pastas/arquivos
- Checar que arquivos não estão vazios
- Checar formato básico (Markdown válido, etc.)

### 3. Gerar relatório

```markdown
## Relatório de Completude

### Conformidade
- Estrutura: X/Y itens OK
- Conteúdo: X/Y itens OK

### Gaps
- [ ] Item faltante 1: sugestão de correção
- [ ] Item faltante 2: sugestão de correção

### Status
- SUCCESS: Todos os itens OK
- PARTIAL: Alguns gaps (listados acima)
- FAIL: Muitos itens faltando
```

### 4. Retornar saída estruturada

```json
{
  "success": true,
  "reportPath": "/path/to/destino/verification-report.md",
  "conformity": { "structure": "10/11", "content": "3/3" },
  "gaps": [],
  "status": "SUCCESS"
}
```

## Exemplo

**Destino**: Holding-STEC-Template  
**Resultado**: Relatório indicando SUCCESS ou lista de gaps com sugestões. Orquestrador usa para decidir se reexecutar algum agent.

## Quando usar
- Use quando a tarefa estiver alinhada ao objetivo da skill.
- Use quando for necessario padrao tecnico e repetibilidade.

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

