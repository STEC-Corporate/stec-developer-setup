---
name: docs-gerar-modelo-readme
description: Gera README.md na raiz do destino (Modelo) a partir do template, preenchendo placeholders. Usado após Fluxo A para fornecer guia ao usuário.
---

# Gerar README do Modelo

## Quando Usar

- Após replicacao-orquestrador-template executar Fluxo A (destino = Modelo)
- Quando o Modelo foi atualizado e precisa de README atualizado
- Invocado pelo orquestrador ao final do Fluxo A

## Princípio

O README é o guia principal para quem utiliza o Modelo. Deve conter próximos passos, tecnologias, comandos e referência aos agents.

## Processo

### 1. Validar path do destino

- **Destino**: path do Modelo (ex.: `/home/jesus/Projetos/Holding-STEC-Template`)
- Garantir que destino existe e contém `docs/` e `.cursor/`

### 2. Ler template

- Arquivo: `[destino]/docs/gestao-ideias/04-referencia-tecnica/_templates/README-MODELO-TEMPLATE.md`
- Se não existir: usar fallback (conteúdo mínimo) ou reportar falha

### 3. Coletar dados para placeholders

- **TECH_STACK_TABLE**: Ler `[destino]/docs/gestao-ideias/04-referencia-tecnica/referencia/tech-stack-versions.md` e extrair a seção "## Resumo (para README do Modelo)" até o próximo `---` ou `##`. Se não existir, usar tabela resumida padrão.
- **AGENTS_COUNT**: Contar arquivos `*.md` em `[destino]/.cursor/agents/` (excluir README.md se aplicável)
- **SKILLS_COUNT**: Contar pastas em `[destino]/.cursor/skills/`
- **REPLICATION_DATE**: Data atual (formato: DD/MM/AAAA)
- **AGENTS_SUMMARY**: Texto estático: "O Modelo consolida agents dos 5 projetos da plataforma (Template, Frontend, BFF, APIs, Infrastructure): replicação, documentação, validação, desenvolvimento e infraestrutura. Use `/agent-name` no Cursor para invocar um agent específico."

### 4. Substituir placeholders

- `{{TECH_STACK_TABLE}}` → conteúdo extraído
- `{{AGENTS_COUNT}}` → número
- `{{SKILLS_COUNT}}` → número
- `{{REPLICATION_DATE}}` → data
- `{{AGENTS_SUMMARY}}` → texto descrito acima

### 5. Escrever README

- Arquivo: `[destino]/README.md`
- Sobrescrever se já existir

### 6. Retornar saída

```json
{
  "success": true,
  "outputPath": "[destino]/README.md",
  "nextAgent": null
}
```

## Placeholders do Template

| Placeholder | Fonte |
|-------------|-------|
| `{{TECH_STACK_TABLE}}` | docs/gestao-ideias/04-referencia-tecnica/referencia/tech-stack-versions.md (seção Resumo) |
| `{{AGENTS_COUNT}}` | Contagem de .cursor/agents/*.md |
| `{{SKILLS_COUNT}}` | Contagem de .cursor/skills/*/ |
| `{{REPLICATION_DATE}}` | Data atual |
| `{{AGENTS_SUMMARY}}` | Texto fixo descritivo |

## Fallback

Se `tech-stack-versions.md` não tiver seção Resumo, usar:

```markdown
| Camada | Tecnologia | Versão |
|--------|------------|--------|
| Frontend | Next.js, React, TypeScript | 16.x, 18.x, 5.x |
| BFF | NestJS | (consultar BFF) |
| API | NestJS | (consultar APIs) |
| Infra | Terraform, Docker, K8s | - |
```

## Exemplo

**Entrada**: destino = `/home/jesus/Projetos/Holding-STEC-Template`  
**Saída**: README.md gerado na raiz com 62 agents, 85 skills, data 12/02/2026

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

