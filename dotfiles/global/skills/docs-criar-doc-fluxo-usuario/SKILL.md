---
name: docs-criar-doc-fluxo-usuario
description: Cria documentação de User Flow. Use ao documentar fluxo de usuário de uma feature, ao analisar fluxos existentes, ou ao criar especificações de UX.
---

# Criar Documentação de User Flow

## Quando Usar

- Ao documentar fluxo de usuário de uma feature
- Ao criar especificações de UX
- Ao analisar se fluxos existentes estão documentados
- Ao refatorar documentação de fluxos

## Padrão de Nomenclatura

**Arquivo**: `fe-[perfil]-[feature]-user-flow.md`

**Localização**: `docs/gestao-tarefas/03-especificacao-produto/user-flows/[perfil]/[feature]/fe-[perfil]-[feature]-user-flow.md`

**Exemplo**: `docs/gestao-tarefas/03-especificacao-produto/user-flows/musician/profile/fe-musician-profile-user-flow.md`

## Estrutura Obrigatória

### 1. Descrição do Fluxo

```markdown
# fe-[perfil]-[feature]-user-flow.md

## 📝 Descrição do Fluxo

Breve descrição do fluxo de usuário para esta feature.
```

### 2. Fluxo Principal

```markdown
## 🎯 Fluxo Principal

### Passo 1: [Ação do usuário]
**Ação**: [O que o usuário faz]
**Sistema**: [O que o sistema responde]
**Resultado**: [Estado resultante]

### Passo 2: [Ação do usuário]
...

### Passo N: [Ação final]
**Ação**: [Ação final]
**Sistema**: [Resposta final]
**Resultado**: [Estado final - sucesso]
```

### 3. Fluxos Alternativos

```markdown
## 🔀 Fluxos Alternativos

### Alternativa 1: [Nome do fluxo alternativo]
**Quando**: [Condição que dispara este fluxo]
**Passos**: [Lista de passos diferentes]

### Alternativa 2: [Nome do fluxo alternativo]
...
```

### 4. Casos de Erro

```markdown
## ❌ Casos de Erro

### Erro 1: [Nome do erro]
**Quando**: [Condição que causa o erro]
**Ação do Sistema**: [Como o sistema responde]
**Mensagem**: [Mensagem exibida ao usuário]
**Ação do Usuário**: [O que o usuário pode fazer]

### Erro 2: [Nome do erro]
...
```

### 5. Diagramas (Opcional)

```markdown
## 📊 Diagrama do Fluxo

[Diagrama em formato texto, Mermaid, ou referência a imagem]
```

## Formato de Passos

Cada passo deve incluir:
- **Ação do usuário**: O que o usuário faz
- **Sistema**: Como o sistema responde
- **Resultado**: Estado resultante

## Validações Obrigatórias

- [ ] Arquivo segue padrão de nomenclatura
- [ ] Fluxo principal documentado completamente
- [ ] Fluxos alternativos identificados e documentados
- [ ] Casos de erro documentados
- [ ] Diagramas criados (se necessário)

## Referências

- **Modelo de estrutura**: `docs/gestao-tarefas/03-especificacao-produto/user-flows/_model/modelo-user-flow.md`
- **User Flows README**: `docs/gestao-tarefas/03-especificacao-produto/user-flows/README.md`
- **User Flows Manual**: `docs/gestao-tarefas/03-especificacao-produto/user-flows/_meta/fe-user-flows-manual.md`
- **Business Rules**: `docs/gestao-tarefas/03-especificacao-produto/business-rules/[perfil]/[feature]/fe-[feature].md`
- **Feature Checklist**: `docs/gestao-ideias/04-referencia-tecnica/_templates/feature-checklist.md` (Fase 1)

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

