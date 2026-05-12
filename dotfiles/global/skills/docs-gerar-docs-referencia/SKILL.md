---
name: docs-gerar-docs-referencia
description: Gera docs/gestao-ideias/04-referencia-tecnica/referencia/ a partir de templates em docs/gestao-ideias/04-referencia-tecnica/_templates/referencia/. Substitui placeholders. Usado após template-copiador no fluxo de replicação.
---

# Gerar Documentação de Referência

## Quando Usar

- Após template-copiador copiar docs/gestao-ideias/04-referencia-tecnica/_templates/ no fluxo de replicação
- Quando o destino precisa de docs/gestao-ideias/04-referencia-tecnica/referencia/ gerada a partir de templates
- Invocado pelo template-copiador agent

## Princípio

docs/gestao-ideias/04-referencia-tecnica/referencia/ é gerada a partir de docs/gestao-ideias/04-referencia-tecnica/_templates/referencia/, exceto tech-stack-versions.md e cursor-agent-cli-guide.md que são copiados pelo clone-template-structure e **não** são produzidos por esta skill.

## Processo

### 1. Validar paths

- **Destino**: path do projeto (ex: /home/user/Projetos/Holding-STEC-Template)
- Garantir que [destino]/docs/gestao-ideias/04-referencia-tecnica/_templates/referencia/ existe

### 2. Coletar config de placeholders

Ler de guardrails, template-replication-config.json ou do contexto de replicação (orquestrador passa **projectName**). Usar defaults quando não em contexto de replicação:

| Placeholder | Default | Nota |
|-------------|---------|------|
| PROJECT | "Projeto" | |
| PROJECT_NAME | projectName do orquestrador | Usado para substituir "SoundLink" nos arquivos gerados. Fluxo A = "Modelo"; Fluxo B = nome do projeto. Se ausente, usar "Projeto". |
| DOMAIN | "domínio" | |
| ORGANIZATION | "Organização" | |
| MODEL_PATH | "/path/to/Modelo" |
| ENTITY_PATH | "user-management" |
| ENTITY_NAME | "UserProfile" |
| ENTITY_NAME_LOWER | "user-profile" |
| EMPRESA_NOME | "Empresa" |
| HOLDING_NOME | "Holding" |
| PROFILE_TYPES_SECTION | "(Seção a preencher conforme domínio)" |
| PROFILE_FEATURE | "user-profile" |
| EVALUABLE_ENTITY | "item" |
| EVENT_ENTITY | "evento" |
| FEATURE_NAME | "Feature" |
| DATE | data atual |
| MODEL_PROJECT_NAME | "Holding-STEC-Template" |
| TEMPLATE_REPO | "template-frontend" |
| FRONTEND_REPO | "frontend" |
| BFF_REPO | "bff" |
| API_REPO | "api" |
| INFRA_REPO | "infrastructure" |
| TEMPLATE_PATH | "/path/to/template" |
| FRONTEND_PATH | "/path/to/frontend" |
| BFF_PATH | "/path/to/bff" |
| API_PATH | "/path/to/api" |
| INFRA_PATH | "/path/to/infra" |

### 3. Processar recursivamente _templates/referencia/

Para cada arquivo em [destino]/docs/gestao-ideias/04-referencia-tecnica/_templates/referencia/:

**Arquivos *-TEMPLATE.\***
- Ler conteúdo
- Substituir {{PLACEHOLDER}} pelos valores da config (incluindo PROJECT_NAME para substituir "SoundLink" quando o template contiver essa string)
- Substituir também as strings literais "SoundLink" e "soundlink" por PROJECT_NAME e PROJECT_NAME em minúsculas, respectivamente, quando aplicável
- Escrever em docs/gestao-ideias/04-referencia-tecnica/referencia/[path-relativo]/[nome-sem-TEMPLATE].[ext]
- Ex: multi-profile-types-structure-TEMPLATE.md -> docs/gestao-ideias/04-referencia-tecnica/referencia/architecture/multi-profile-types-structure.md

**Arquivos sem -TEMPLATE no nome**
- Copiar para docs/gestao-ideias/04-referencia-tecnica/referencia/[path-relativo]/ sem substituição
- Ex: template-replication-config.schema.json

**Exceções (não processar — já existem, copiados pelo clone-template-structure)**
- tech-stack-versions.md
- cursor-agent-cli-guide.md

### 4. Criar pastas vazias

- known-issues/resolved/
- Outras pastas necessárias para a estrutura

### 5. Retornar saída

```json
{
  "success": true,
  "outputPath": "[destino]/docs/gestao-ideias/04-referencia-tecnica/referencia/",
  "nextAgent": "docs-inicializador"
}
```

## Convenção de nomes

- [nome]-TEMPLATE.[ext] gera [nome].[ext]
- README-TEMPLATE.md gera README.md
- config-*-TEMPLATE.json gera config-*.json

## Exceções (copiados pelo clone, não gerados)

- **tech-stack-versions.md**: copiado pelo clone-template-structure; esta skill **não** sobrescreve.
- **cursor-agent-cli-guide.md** (docs/gestao-ideias/04-referencia-tecnica/referencia/cursor/tutoriais/): copiado pelo clone-template-structure; esta skill **não** sobrescreve.

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

