# Limites de linhas para contexto LLM

> **Estado:** ATIVO | **Data:** 2026-04-09  
> **Política:** balanced

Este documento define limites de tamanho para `rules`, `skills`, `agents` e docs operacionais, com objetivo de manter o contexto mais leve e previsível para qualquer LLM usada no fluxo.

## Base oficial do Cursor

- Rules: o Cursor recomenda manter regras abaixo de 500 linhas em [Rules Reference](https://cursor.com/docs/rules.md) e [Help: Rules](https://cursor.com/help/customization/rules.md).
- Skills: não há limite rígido oficial; a orientação é manter foco e carregar recursos progressivamente em [Skills Reference](https://cursor.com/docs/skills.md).
- Agent/AGENTS: não há limite rígido oficial; instruções devem ser claras e bem escopadas em [Agent Overview](https://cursor.com/docs/agent/overview.md) e [Rules](https://cursor.com/docs/rules.md).

## Limites aprovados no projeto (balanced)

- Rules em `rules/` (`.md`/`.mdc`): **máx. 500 linhas**.
- Skills (`SKILL.md` em `skills/**`): **máx. 700 linhas**.
- Agents (`agents/*.md`): **máx. 400 linhas**.
- Docs operacionais de IA (`*.md` da raiz e `docs/governanca/**/*.md` sobre agent/rules/hooks/skills): **máx. 500 linhas**.

## Estratégia de memória para LLMs

Para recuperação consistente por diferentes modelos:

1. Regra operacional em [`rules/llm-context-file-size-limits.mdc`](../../rules/llm-context-file-size-limits.mdc).
2. Este documento de governança como referência canônica.
3. Referência cruzada no fluxo principal de automação: [fluxo-workflow-agent-hooks-ci.md](./fluxo-workflow-agent-hooks-ci.md).
4. Referência em `AGENTS.md` quando o arquivo existir no repositório.

## Checklist de manutenção

- [ ] Antes de salvar rule/skill/agent/doc, verificar se está dentro do limite da categoria.
- [ ] Se exceder, dividir por domínio/tema e manter links curtos entre arquivos.
- [ ] Evitar copiar blocos longos entre docs; referenciar arquivo canônico.
- [ ] Revisar limites semestralmente com base na experiência de uso.

## Plano do verificador opcional

Verificador leve recomendado (fase opcional):

- Script: `scripts/check-llm-doc-sizes.sh` (ou skill dedicada).
- Entrada: paths das categorias (`rules`, `skills`, `agents`, `docs/governanca`).
- Saída:
  - lista de arquivos fora do limite por categoria,
  - quantidade de linhas,
  - recomendação de split.
- Uso sugerido:
  - execução manual antes de PR,
  - execução em hook `stop` somente como aviso (sem bloquear),
  - execução em CI como relatório.
