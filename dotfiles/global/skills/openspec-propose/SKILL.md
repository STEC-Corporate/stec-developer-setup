---
name: openspec-propose
description: Cria uma proposta formal de mudança (change proposal) antes de implementar. Use quando o usuário quiser propor uma feature, refatoração ou mudança arquitetural, ou quando disser "criar proposta", "propor mudança", "especificar", "desenhar solução". Sempre executar após openspec-explore.
disable-model-invocation: false
---

# openspec-propose

Cria uma proposta estruturada de mudança para ser revisada antes de qualquer implementação.

**IMPORTANTE:** Não implemente código neste modo. A proposta é um documento de decisão — deve ser aprovada antes de avançar para `/openspec-apply`.

---

## Estrutura da proposta

Gere um documento em `openspec/changes/` com o seguinte formato:

```markdown
# Proposta: {titulo}

**Status:** draft | aprovado | rejeitado
**Data:** {YYYY-MM-DD}
**Autor:** {nome/agente}

## Contexto

{O que motivou esta mudança? Qual problema resolve?}

## Solução proposta

{Descrição da abordagem. O que será feito e como.}

## Impacto

### Arquivos afetados
- `path/ao/arquivo.ts` — {o que muda}

### Dependências
- {serviços, pacotes, configurações afetadas}

### Riscos
- {riscos identificados e mitigações}

## Alternativas consideradas

{Outras abordagens e por que foram descartadas}

## Critérios de aceite

- [ ] {critério mensurável 1}
- [ ] {critério mensurável 2}

## Próximo passo

Após aprovação: `/openspec-apply` — referenciando este documento.
```

## Fluxo

1. Ler exploração prévia (se houver artefatos de `/openspec-explore`).
2. Gerar proposta em `openspec/changes/{YYYY-MM-DD}-{slug}.md`.
3. Apresentar ao usuário para revisão.
4. Aguardar aprovação antes de prosseguir.

## Ciclo OpenSpec

```
explore → [propose] → apply → archive
```

Após aprovação da proposta, use `/openspec-apply` para implementar.
