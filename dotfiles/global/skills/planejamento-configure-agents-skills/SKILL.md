---
name: planejamento-configure-agents-skills
description: Fluxo A: Copia agents e skills dos 5 projetos para o Modelo. Fluxo B: Copia do Modelo para projeto template. Origens intactas. Modelo = /home/jesus/Projetos/Holding-STEC-Template.
---

# Configurar Agents e Skills no Destino

## Quando Usar

- **Fluxo A** (destino = Modelo): Atualizar o Modelo com agents/skills dos 5 projetos. Usado apenas para o Modelo.
- **Fluxo B** (destino = projeto template): Copiar do Modelo para o projeto template
- Usado por planejamento-config-ia

**Modelo** (path canônico): `/home/jesus/Projetos/Holding-STEC-Template`. Ao mencionar "o modelo", usar este path.

## Princípio Invariável

**Projetos fonte são somente leitura.** Esta skill COPIA. Nunca modifica origem.

## Processo

### 1. Determinar fluxo

- Se destino = Modelo (`/home/jesus/Projetos/Holding-STEC-Template`) → **Fluxo A**
- Se destino = projeto template (outro path) → **Fluxo B**

### 2. Fluxo A: Copiar dos 5 projetos para o Modelo

- Obter paths dos 5 projetos em [projetos-plataforma-paths-jesus.md](../../../docs/gestao-ideias/04-referencia-tecnica/referencia/migracao/projetos-plataforma-paths-jesus.md)
- De cada projeto: `.cursor/agents/*.md` → destino `.cursor/agents/`
- De cada projeto: `.cursor/skills/*/SKILL.md` → destino `.cursor/skills/[nome]/SKILL.md`
- Incluir os novos de replicação (orquestrador, cicd-repo-github, replicacao-atualizacoes-modelo, etc.)
- Resolver conflitos de nome: manter versão mais completa ou do Template

### 3. Fluxo B: Copiar do Modelo para projeto template

- Origem: Modelo (`/home/jesus/Projetos/Holding-STEC-Template`)
- Destino: projeto template
- Copiar agents e skills do Modelo (não dos 5 projetos)
- Incluir replicacao-atualizacoes-modelo para o projeto template

### 4. Atualizar docs/gestao-ideias/00-governanca/ia/

- subagents.md, skills-recomendadas.md adaptados ao destino
- Remover links que não façam sentido
- Manter referência ao fluxo de replicação

### 5. Validar

- .cursor/agents/ populado
- .cursor/skills/ populado
- docs/gestao-ideias/00-governanca/ia/ atualizado

### 6. Retornar saída

```json
{
  "success": true,
  "outputPath": "/path/to/destino/.cursor/",
  "agentsCopied": 25,
  "skillsCopied": 30,
  "nextAgent": "planejamento-estrutura"
}
```

## Exemplos

**Fluxo A – Destino**: Modelo (Holding-STEC-Template)  
**Fontes**: Template, Frontend, BFF, APIs, Infra  
**Resultado**: .cursor/agents/ e .cursor/skills/ do Modelo populados com conteúdo dos 5 projetos.

**Fluxo B – Destino**: projeto template  
**Fonte**: Modelo  
**Resultado**: .cursor/agents/ e .cursor/skills/ do projeto template populados com conteúdo do Modelo.

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

