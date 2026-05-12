---
name: replicacao-atualizar-model-from-platform
description: Atualiza o Modelo com agents/skills/docs dos 5 projetos. Usada apenas para o Modelo (Fluxo A). Delega para configure-agents-skills.
---

# Atualizar Modelo a partir da Plataforma

## Quando Usar

- Fluxo A: atualizar o Modelo com conteúdo dos 5 projetos da plataforma
- Usado por replicacao-orquestrador-template (quando destino = Modelo) ou planejamento-config-ia

**Modelo** (path canônico): `/home/jesus/Projetos/Holding-STEC-Template`.

## Princípio Invariável

**Projetos fonte (5 projetos) são somente leitura.** Esta skill COPIA para o Modelo. Nunca modifica origens.

## Processo

### 1. Validar destino

- Destino deve ser o Modelo (`/home/jesus/Projetos/Holding-STEC-Template`)
- Se destino ≠ Modelo, não usar esta skill

### 2. Delegar para configure-agents-skills

- Usar skill **configure-agents-skills** com destino = Modelo
- Fluxo A: copiar agents e skills dos 5 projetos para o Modelo

### 3. Fontes (5 projetos)

- Template, Frontend Oficial, BFF, APIs, Infrastructure
- Ver [projetos-plataforma-paths-jesus.md](../../../docs/gestao-ideias/04-referencia-tecnica/referencia/migracao/projetos-plataforma-paths-jesus.md)

### 4. Retornar saída

```json
{
  "success": true,
  "outputPath": "/home/jesus/Projetos/Holding-STEC-Template/.cursor/",
  "agentsCopied": 25,
  "skillsCopied": 30
}
```

## Exemplo

**Destino**: Modelo (Holding-STEC-Template)  
**Fontes**: 5 projetos  
**Resultado**: .cursor/agents/ e .cursor/skills/ do Modelo atualizados com conteúdo dos 5 projetos.

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

