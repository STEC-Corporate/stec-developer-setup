---
name: openspec-archive
description: Arquiva uma mudança OpenSpec implementada, registrando decisões, aprendizados e contexto histórico. Use quando o usuário disser "arquivar mudança", "fechar o openspec", "registrar decisão", ou após a conclusão de um openspec-apply. Mantém rastreabilidade de todas as mudanças significativas do projeto.
disable-model-invocation: false
---

# openspec-archive

Registra o histórico de uma mudança implementada para rastreabilidade e aprendizado futuro.

---

## Fluxo

1. **Ler a proposta implementada** — Abrir o arquivo em `openspec/changes/`.
2. **Coletar contexto da implementação:**
   - O que foi feito exatamente (vs. o que estava proposto)?
   - Houve desvios? Por quê?
   - Quais decisões foram tomadas durante a implementação?
   - O que foi aprendido?
3. **Atualizar o documento da proposta:**
   - Alterar `Status: implementado` para `Status: arquivado`.
   - Adicionar seção `## Registro de implementação` com as informações coletadas.
4. **Mover para arquivo histórico** — Renomear ou mover para `openspec/archive/` se o projeto usar essa separação.
5. **Confirmar ao usuário** — Apresentar resumo do que foi arquivado.

## Estrutura do registro de implementação

```markdown
## Registro de implementação

**Implementado em:** {YYYY-MM-DD}
**Status final:** arquivado

### O que foi feito

{Resumo do que foi implementado, incluindo desvios da proposta original.}

### Decisões tomadas

- {Decisão 1}: {justificativa}
- {Decisão 2}: {justificativa}

### Aprendizados

- {O que funcionou bem}
- {O que seria diferente da próxima vez}

### Artefatos gerados

- `{path/arquivo.ts}` — {o que foi criado/alterado}
```

## Por que arquivar?

O histórico de mudanças permite:
- Entender **por que** o código está como está
- Evitar repetir as mesmas discussões e erros
- Onboarding mais rápido de novos membros
- Auditoria de decisões arquiteturais

## Ciclo OpenSpec

```
explore → propose → apply → [archive]
```

O archive encerra o ciclo. A mudança está completa e documentada.
