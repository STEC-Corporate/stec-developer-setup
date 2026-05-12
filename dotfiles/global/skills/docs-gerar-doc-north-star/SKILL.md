---
name: docs-gerar-doc-north-star
description: Gera docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md no projeto destino a partir do template e das respostas coletadas pelo orquestracao-metricas-north-star.
---

# Gerar North Star (north-star.md)

## Quando Usar

- Após o orquestracao-metricas-north-star coletar as respostas do bloco North Star
- Quando é necessário gerar ou regerar o documento North Star a partir de um objeto de respostas estruturado
- Invocado pelo orquestrador após o usuário responder às perguntas da North Star

## Princípio

O documento north-star.md é a referência única da métrica principal do projeto. É gerado a partir do template `docs/gestao-ideias/04-referencia-tecnica/_templates/north-star-template.md` e do objeto `answers` fornecido pelo orquestrador.

## Inputs (contrato)

- **destinationPath** (string, obrigatório): Raiz do projeto destino em **path absoluto** (ex.: `/home/jesus/Projetos/Holding-STEC-Template`). Quando o destino for o Modelo, usar o path canônico definido em [docs/gestao-ideias/00-governanca/ia/template-replication-flow.md](../../docs/gestao-ideias/00-governanca/ia/template-replication-flow.md).
- **answers** (objeto): Respostas coletadas. Chaves:
  - **projectName** (obrigatório): Nome do projeto/negócio
  - **northStarPhrase** (obrigatório): Frase da North Star em uma linha
  - **definitionIntroduction** (opcional): Texto introdutório da definição (ex.: "Contratação que resulta em:")
  - **definitionCriteria** (obrigatório): Lista numerada de critérios (texto em markdown)
  - **whyThisMetric** (obrigatório): Justificativas por que esta métrica é a North Star (texto em markdown)
  - **formula** (obrigatório): Fórmula de cálculo (texto ou bloco de código)
  - **formulaExample** (opcional): Exemplo numérico da fórmula
  - **breakdownType** (opcional): Breakdown por etapa ou texto explicativo
  - **goals** (obrigatório): Metas (baseline, beta, 6m, 1 ano, longo prazo) em markdown
  - **featureConnections** (opcional): Como as features se conectam à North Star. O texto deve seguir o **padrão de blocos** para que o documento gerado tenha a mesma estrutura do north-star.md copiado nos Fluxos A/B: para cada feature, usar **Nome da Feature** (título `###`), **Conexão**: (uma linha), **Impacto na North Star**: (lista ou parágrafo), **KPI de validação**: (métrica). Ver a seção "Como Todas as Features se Conectam" em docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md (após adaptação pela skill adapt-north-star-features-section) como referência do formato.
  - **whatNotNorthStar** (obrigatório): O que NÃO é North Star (itens com breve explicação)
  - **howToImprove** (opcional): Como melhorar se a métrica estiver baixa/média
  - **references** (opcional): Lista de referências em markdown (links para guardrails, metric-dictionary, ADRs)

## Processo

### 1. Validar destinationPath

- Garantir que o path existe e é **path absoluto**. Se for passado path relativo ou "workspace", reportar que é necessário path absoluto; o orquestrador deve resolver antes de invocar esta skill.
- Criar `docs/gestao-ideias/02-execucao/planejamento/metrics/` se não existir

### 2. Ler template

- Tentar: `[destinationPath]/docs/gestao-ideias/04-referencia-tecnica/_templates/north-star-template.md`
- Se não existir no destino: usar `[workspace]/docs/gestao-ideias/04-referencia-tecnica/_templates/north-star-template.md` (Template como fallback)
- Se nenhum existir: reportar falha e retornar `{ success: false, error: "Template não encontrado" }`

### 3. Mapear answers para placeholders

Usar a tabela abaixo. Para campos opcionais omitidos em `answers`, usar valor padrão:
- Texto livre opcional: usar "A definir" ou omitir a linha (deixar placeholder vazio conforme a tabela)
- **CREATED_DATE** e **UPDATED_DATE**: se não fornecidos, usar data atual no formato DD/MM/AAAA
- **RESPONSIBLE**: se não fornecido, usar "Equipe de Produto"

### 4. Substituir placeholders no template

Aplicar todas as substituições. Placeholders não mapeados devem ser substituídos por string vazia ou pelo valor padrão da tabela.

### 5. Escrever arquivo

- Caminho: `[destinationPath]/docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`
- Sobrescrever se já existir

### 6. Retornar saída

```json
{
  "success": true,
  "outputPath": "[destinationPath]/docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md",
  "nextAgent": null
}
```

Em caso de erro:

```json
{
  "success": false,
  "error": "Descrição do erro",
  "outputPath": null
}
```

## Mapeamento answers → placeholders

| Placeholder | Fonte em answers | Padrão se omitido |
|-------------|------------------|-------------------|
| `{{PROJECT_NAME}}` | answers.projectName | — (obrigatório) |
| `{{NORTH_STAR_PHRASE}}` | answers.northStarPhrase | — (obrigatório) |
| `{{DEFINITION_INTRODUCTION}}` | answers.definitionIntroduction | "Sucesso ocorre quando:" |
| `{{DEFINITION_CRITERIA}}` | answers.definitionCriteria | — (obrigatório) |
| `{{WHY_THIS_METRIC}}` | answers.whyThisMetric | — (obrigatório) |
| `{{FORMULA}}` | answers.formula | — (obrigatório) |
| `{{FORMULA_EXAMPLE}}` | answers.formulaExample | "" |
| `{{BREAKDOWN_TYPE}}` | answers.breakdownType | "A definir conforme o funil do negócio." |
| `{{GOALS}}` | answers.goals | — (obrigatório) |
| `{{FEATURE_CONNECTIONS}}` | answers.featureConnections | "Preencher conforme as features do produto se conectam à North Star." Deve seguir o padrão de blocos: Nome da Feature, **Conexão**, **Impacto na North Star**, **KPI de validação** (por feature). |
| `{{WHAT_NOT_NORTH_STAR}}` | answers.whatNotNorthStar | — (obrigatório) |
| `{{HOW_TO_IMPROVE}}` | answers.howToImprove | "Investigar onde no funil há perda; identificar segmentos com desempenho melhor e replicar." |
| `{{REFERENCES}}` | answers.references | "- [Metric Dictionary](./metric-dictionary.md)\n- [Guardrails](../../../.cursor/docs/ia/guardrails.md)" |
| `{{CREATED_DATE}}` | answers.createdDate ou data atual | Data atual (DD/MM/AAAA) |
| `{{UPDATED_DATE}}` | answers.updatedDate ou data atual | Data atual (DD/MM/AAAA) |
| `{{RESPONSIBLE}}` | answers.responsible | "Equipe de Produto" |

## Regras para campos opcionais

- Se **formulaExample** for vazio ou omitido: substituir `{{FORMULA_EXAMPLE}}` por string vazia (ou remover linha em branco duplicada).
- Se **breakdownType**, **featureConnections**, **howToImprove** ou **references** forem omitidos: usar os valores padrão da tabela para que o documento fique completo e editável depois.

## Exemplo de uso

**Entrada**:
- destinationPath: `/home/jesus/Projetos/meu-app`
- answers: { projectName: "MeuApp", northStarPhrase: "Transações concluídas com avaliação ≥4 estrelas", definitionCriteria: "1. ✅ Pagamento confirmado\n2. ✅ Avaliação ≥4", ... }

**Saída**: `north-star.md` gerado em `meu-app/docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`

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

