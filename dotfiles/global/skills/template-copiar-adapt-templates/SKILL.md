---
name: template-copiar-adapt-templates
description: Copia _templates da origem para o destino e adapta placeholders. Origem permanece intacta. Use ao replicar fluxo de documentação.
---

# Copiar e Adaptar Templates

## Quando Usar

- Ao replicar template para o destino
- Quando template-copiador agent precisa duplicar docs/gestao-ideias/04-referencia-tecnica/_templates/
- Para feature-checklist, user-story, sprint-plan, componentizacao

## Princípio Invariável

**Origem intacta.** Esta skill apenas COPIA e adapta.

## Input do invocador

O invocador (template-copiador ou orquestrador) deve passar **projectName** para que a substituição de "SoundLink" seja aplicada ao copiar os templates para o destino.

## Processo

### 1. Identificar templates na origem

- docs/gestao-ideias/04-referencia-tecnica/_templates/ — feature-checklist.md, user-story-template.md, sprint-plan-template.md, north-star-template.md, metric-dictionary-template.md, metric-dictionary-single-entry.md, etc.

### 2. Para cada template

- Copiar conteúdo para destino
- Substituir placeholders (PROJECT, DOMAIN, ORGANIZATION)
- Substituir a string literal **SoundLink** por **projectName** (recebido do invocador — template-copiador ou orquestrador). O orquestrador passa `projectName` no contexto de replicação (Fluxo A = "Modelo"; Fluxo B = nome do projeto).

### 3. Criar pasta no destino

- docs/gestao-ideias/04-referencia-tecnica/_templates/ no path do destino

### 4. Retornar saída

```json
{
  "success": true,
  "outputPath": "/path/to/destino/docs/gestao-ideias/04-referencia-tecnica/_templates/",
  "nextAgent": "docs-inicializador"
}
```

## Exemplo

**Origem**: soundlink-template-frontend/docs/gestao-ideias/04-referencia-tecnica/_templates/  
**Destino**: Holding-STEC-Template/docs/gestao-ideias/04-referencia-tecnica/_templates/  
**Resultado**: 6+ templates copiados e adaptados. Origem intacta.

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

