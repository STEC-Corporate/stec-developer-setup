---
name: template-clone-template-structure
description: Copia estrutura de pastas e arquivos da origem para o destino. Lê da origem, escreve no destino; não modifica origem. Use ao replicar template para novo projeto.
---

# Copiar Estrutura do Template

## Quando Usar

- Ao replicar template para o destino (Holding-STEC-Template ou novo projeto)
- Quando template-estrutura agent precisa criar estrutura base
- Sempre que for duplicar docs/ e .cursor/ da origem

## Princípio Invariável

**Projetos fonte são somente leitura.** Esta skill LÊ da origem e ESCREVE no destino. Nunca modifica, remove ou deleta arquivos da origem.

## Processo

### 1. Validar paths

- **Origem**: path do SoundLink Template
- **Destino**: path do projeto destino

### 2. Criar destino se não existir

- **Criar pasta raiz do destino** com `mkdir -p [path-destino]` se não existir
- Garante que o destino esteja acessível antes da cópia

### 3. Definir estrutura a copiar

**docs/** — Cópia seletiva (apenas modelo, sem conteúdo SoundLink específico). Estrutura em **cinco camadas** na origem:

- **Pastas _model** em: `gestao-tarefas/03-especificacao-produto/business-rules`, `gestao-tarefas/03-especificacao-produto/user-flows`, `gestao-tarefas/03-especificacao-produto/api-specifications`, `02-execucao/planejamento`, `00-governanca/decisoes`, `04-referencia-tecnica/verificacao` (IA do template: `.cursor/docs/ia/`, copiado à parte conforme seção abaixo)
- **docs/gestao-ideias/04-referencia-tecnica/_templates** — templates de feature, user-story, north-star, metric-dictionary, etc. Inclui `_templates/referencia/` para geração posterior
- **docs/gestao-ideias/04-referencia-tecnica/referencia** — copiar APENAS `dev/tech-stack-versions.md` e `cursor/tutoriais/cursor-agent-cli-guide.md` (não são templates). Demais pastas são geradas por generate-referencia-docs a partir de `_templates/referencia/`
- **docs/gestao-ideias/00-governanca/ia** — 6 arquivos: subagents.md, subagents-exemplos-praticos.md, skills-recomendadas.md, template-replication-flow.md, prompts.md, README.md + guardrails.md + playbooks/
- **docs/gestao-ideias/02-execucao/planejamento/metrics** — apenas north-star.md
- **.cursorrules** — na raiz do destino

**NÃO copiar**: `docs/gestao-ideias/04-referencia-tecnica/arquivo/`, perfis SoundLink (admin, musician, etc.), `.cursor/plans` (conteúdo)

**.cursor/** — agents, skills. **Plans**: criar pasta vazia `.cursor/plans/`, **NÃO copiar** conteúdo (planos são gerados por projeto)

**NÃO copiar src/** — estrutura criada pelo framework

### 4. Copiar recursivamente

- **docs**: copiar _model em cada seção + `referencia-tecnica/_templates` + `referencia-tecnica/referencia` (apenas tech-stack-versions.md e cursor-agent-cli-guide.md) + `governanca/ia` + dependências
- **.cursor**: agents, skills. Para plans: `mkdir -p [destino]/.cursor/plans` sem copiar arquivos
- **.cursorrules**: copiar para raiz do destino
- Não copiar: node_modules, .git, .next, dist, docs/arquivo, .cursor/plans/*

### 5. Retornar saída

```json
{
  "success": true,
  "outputPath": "/path/to/destino",
  "nextAgent": "seguranca-adaptador-guardrails"
}
```

## Implementação (ordem de cópia)

```bash
ORIG="[path-template]" DEST="[path-destino]"

# docs: _model em cada seção (caminhos da estrutura em camadas)
for path in gestao-tarefas/03-especificacao-produto/business-rules gestao-tarefas/03-especificacao-produto/user-flows gestao-tarefas/03-especificacao-produto/api-specifications 02-execucao/planejamento 00-governanca/decisoes 04-referencia-tecnica/verificacao; do
  mkdir -p "$DEST/docs/$path"
  cp -r "$ORIG/docs/$path/_model" "$DEST/docs/$path/" 2>/dev/null || true
done
# _templates (inclui _templates/referencia/)
cp -r "$ORIG/docs/gestao-ideias/04-referencia-tecnica/_templates" "$DEST/docs/gestao-ideias/04-referencia-tecnica/"
# referencia: apenas tech-stack e cursor-agent-cli-guide (não são templates); demais gerados por generate-referencia-docs
mkdir -p "$DEST/docs/gestao-ideias/04-referencia-tecnica/referencia/dev"
mkdir -p "$DEST/docs/gestao-ideias/04-referencia-tecnica/referencia/cursor/tutoriais"
cp "$ORIG/docs/gestao-ideias/04-referencia-tecnica/referencia/dev/tech-stack-versions.md" "$DEST/docs/gestao-ideias/04-referencia-tecnica/referencia/dev/"
cp "$ORIG/docs/gestao-ideias/04-referencia-tecnica/referencia/cursor/tutoriais/cursor-agent-cli-guide.md" "$DEST/docs/gestao-ideias/04-referencia-tecnica/referencia/cursor/tutoriais/"
# governanca/ia: 6 arquivos + guardrails + playbooks
mkdir -p "$DEST/docs/gestao-ideias/00-governanca/ia"
for f in subagents.md subagents-exemplos-praticos.md skills-recomendadas.md template-replication-flow.md prompts.md README.md; do
  cp "$ORIG/docs/gestao-ideias/00-governanca/ia/$f" "$DEST/docs/gestao-ideias/00-governanca/ia/" 2>/dev/null || true
done
cp "$ORIG/docs/gestao-ideias/00-governanca/ia/guardrails.md" "$DEST/docs/gestao-ideias/00-governanca/ia/"
cp -r "$ORIG/docs/gestao-ideias/00-governanca/ia/playbooks" "$DEST/docs/gestao-ideias/00-governanca/ia/"
mkdir -p "$DEST/docs/gestao-ideias/02-execucao/planejamento/metrics"
cp "$ORIG/docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md" "$DEST/docs/gestao-ideias/02-execucao/planejamento/metrics/" 2>/dev/null || true
# Apenas north-star.md é copiado — métricas são específicas de cada projeto
cp "$ORIG/.cursorrules" "$DEST/" 2>/dev/null || true
# .cursor
cp -r "$ORIG/.cursor/agents" "$DEST/.cursor/"
cp -r "$ORIG/.cursor/skills" "$DEST/.cursor/"
mkdir -p "$DEST/.cursor/plans"
# NÃO copiar .cursor/plans/*
```

## Exemplo

**Origem**: soundlink-template-frontend  
**Destino**: Holding-STEC-Template  
**Resultado**: Estrutura criada no destino. Origem intacta.

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

