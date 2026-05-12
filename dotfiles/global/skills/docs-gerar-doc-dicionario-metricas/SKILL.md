---
name: docs-gerar-doc-dicionario-metricas
description: Gera docs/gestao-ideias/02-execucao/planejamento/metrics/metric-dictionary.md no projeto destino a partir do template (cabeçalho + bloco de uma métrica) e da lista de métricas por categoria fornecida pelo orquestrador.
---

# Gerar Dicionário de Métricas (metric-dictionary.md)

## Quando Usar

- Após o orquestracao-metricas-north-star coletar as respostas do bloco Dicionário (categorias e métricas)
- Quando é necessário gerar ou regerar o dicionário a partir de uma lista estruturada de métricas
- Invocado pelo orquestrador após o usuário responder às perguntas de categorias e de cada métrica

## Princípio

O documento metric-dictionary.md é a referência única de definições de métricas do projeto. É gerado a partir de:
- `docs/gestao-ideias/04-referencia-tecnica/_templates/metric-dictionary-template.md` (cabeçalho, índice, rodapé)
- `docs/gestao-ideias/04-referencia-tecnica/_templates/metric-dictionary-single-entry.md` (bloco repetido para cada métrica)

A skill monta o índice a partir das categorias e preenche as seções repetindo o bloco de uma entrada para cada métrica.

## Inputs (contrato)

- **destinationPath** (string, obrigatório): Raiz do projeto destino em **path absoluto**. Quando o destino for o Modelo, usar o path canônico definido em [docs/gestao-ideias/00-governanca/ia/template-replication-flow.md](../../docs/gestao-ideias/00-governanca/ia/template-replication-flow.md).
- **projectName** (string): Nome do projeto/negócio
- **categories** (array): Lista de categorias. Cada item:
  - **name** (string): Nome da categoria (ex.: "North Star", "Métricas de Conversão")
  - **metrics** (array): Lista de métricas. Cada métrica:
    - **name** (string): Nome da métrica (ex.: "North Star Score", "Taxa de Conversão")
    - **definition** (string): Definição em uma frase
    - **formula** (string): Fórmula em texto ou bloco de código
    - **includes** (string): Itens que entram no cálculo (markdown, com ✅)
    - **excludes** (string): Itens que não entram (markdown, com ❌)
    - **period** (string): Período de cálculo (ex.: "Mensal", "Últimos 30 dias")
    - **responsible** (string): Quem calcula/exibe (ex.: "Backend calcula, frontend exibe")
    - **implementation** (string, opcional): Código SQL/TypeScript ou "A definir"
    - **metaOrBenchmark** (string, opcional): Meta ou benchmark (ex.: "≥80%", "Excelente: <2h")
    - **anchor** (string, opcional): Slug para link no índice (ex.: "north-star-score"). Se omitido, gerar a partir do name: minúsculas, espaços → hífen, remover acentos
- **createdDate** (string, opcional): Data de criação (DD/MM/AAAA). Padrão: data atual
- **responsible** (string, opcional): Responsável do documento. Padrão: "Equipe de Produto"

## Processo

### 1. Validar destinationPath

- Garantir que o path existe e é **path absoluto**. Se receber path relativo ou valor ambíguo, reportar que o orquestrador deve resolver para path absoluto antes de invocar.
- Criar `docs/gestao-ideias/02-execucao/planejamento/metrics/` se não existir

### 2. Ler templates

- **Template principal**: `[destinationPath]/docs/gestao-ideias/04-referencia-tecnica/_templates/metric-dictionary-template.md` ou fallback em `[workspace]/docs/gestao-ideias/04-referencia-tecnica/_templates/metric-dictionary-template.md`
- **Bloco de uma métrica**: `[destinationPath]/docs/gestao-ideias/04-referencia-tecnica/_templates/metric-dictionary-single-entry.md` ou fallback em `[workspace]/docs/gestao-ideias/04-referencia-tecnica/_templates/metric-dictionary-single-entry.md`
- Se algum não existir: reportar falha e retornar `{ success: false, error: "Template não encontrado" }`

### 3. Gerar índice (CATEGORIES_INDEX)

Para cada categoria, gerar um bloco:

```markdown
### Nome da Categoria
1. [Nome da Métrica 1](#anchor-1)
2. [Nome da Métrica 2](#anchor-2)
```

A numeração é global (1, 2, 3...) ou por categoria conforme preferência do projeto. Recomendação: numeração global para compatibilidade com o formato do dicionário de referência.

**Âncora**: usar `anchor` da métrica se fornecido; senão, gerar slug: nome em minúsculas, espaços → hífen, remover caracteres especiais (parênteses, setas etc. podem virar hífen ou ser omitidos). Ex.: "Taxa de Conversão (Proposta → Aceite)" → `#taxa-de-conversao-proposta-aceite`

### 4. Gerar seções de métricas (METRICS_SECTIONS)

Para cada métrica, em ordem (por categoria):

1. Ler o conteúdo de `metric-dictionary-single-entry.md`
2. Substituir placeholders:
   - `{{METRIC_NAME}}` → metric.name
   - `{{METRIC_ANCHOR}}` → usado apenas se o template tiver âncora explícita; senão o link do índice já usa #anchor
   - `{{DEFINITION}}` → metric.definition
   - `{{FORMULA}}` → metric.formula
   - `{{INCLUDES}}` → metric.includes (formatar com quebras de linha; se for lista, manter - ✅)
   - `{{EXCLUDES}}` → metric.excludes
   - `{{PERIOD}}` → metric.period
   - `{{RESPONSIBLE}}` → metric.responsible
   - `{{IMPLEMENTATION}}` → se metric.implementation presente: "**Implementação**:\n```\n...\n```"; senão: "" (ou uma linha "**Implementação**: A definir")
   - `{{META_OR_BENCHMARK}}` → metric.metaOrBenchmark ou "A definir"
   - `{{LINK_NORTH_STAR}}` → para a primeira métrica da categoria "North Star" (se existir): "**Ver mais**: `north-star.md`"; para as demais: ""

3. Concatenar todos os blocos na ordem (categoria 1 métricas 1..n, categoria 2 métricas 1..n, ...)

### 5. Montar documento final

No template principal, substituir:
- `{{PROJECT_NAME}}` → projectName
- `{{CATEGORIES_INDEX}}` → índice gerado no passo 3
- `{{METRICS_SECTIONS}}` → seções concatenadas no passo 4
- `{{CREATED_DATE}}` → createdDate ou data atual (DD/MM/AAAA)
- `{{UPDATED_DATE}}` → data atual
- `{{RESPONSIBLE}}` → responsible (do documento)

### 6. Escrever arquivo

- Caminho: `[destinationPath]/docs/gestao-ideias/02-execucao/planejamento/metrics/metric-dictionary.md`
- Sobrescrever se já existir

### 7. Retornar saída

```json
{
  "success": true,
  "outputPath": "[destinationPath]/docs/gestao-ideias/02-execucao/planejamento/metrics/metric-dictionary.md"
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

## Regras para campos opcionais de métrica

- **implementation**: Se vazio ou omitido, usar linha "**Implementação**: A definir" ou omitir o bloco de implementação no single-entry (conforme o template tiver uma linha só para isso).
- **metaOrBenchmark**: Se vazio, usar "A definir".
- **anchor**: Se omitido, gerar slug a partir do name (minúsculas, espaços → hífen, sem acentos).

## Geração de âncora (slug)

Exemplos:
- "North Star Score" → `north-star-score`
- "Taxa de Conversão (Proposta → Aceite)" → `taxa-de-conversao-proposta-aceite` (remover ou substituir → e parênteses)
- "Usuários Ativos (DAU/MAU)" → `usuarios-ativos-dau-mau`

Regra sugerida: `name.toLowerCase().replace(/\s+/g, '-').replace(/[()→\/]/g, '-').replace(/-+/g, '-').replace(/^-|-$/g, '')`

## Exemplo de estrutura de categories

```json
[
  {
    "name": "North Star",
    "metrics": [
      {
        "name": "North Star Score",
        "definition": "Percentual de X que resultam em Y com avaliação ≥4.",
        "formula": "North Star Score = (A) / (B) × 100",
        "includes": "- ✅ Item 1\n- ✅ Item 2",
        "excludes": "- ❌ Item 1\n- ❌ Item 2",
        "period": "Mensal",
        "responsible": "Backend calcula, frontend exibe",
        "implementation": "SELECT ...",
        "metaOrBenchmark": "≥80%",
        "anchor": "north-star-score"
      }
    ]
  }
]
```

## Referência dos placeholders do single-entry

| Placeholder | Fonte |
|-------------|-------|
| `{{METRIC_NAME}}` | metric.name |
| `{{DEFINITION}}` | metric.definition |
| `{{FORMULA}}` | metric.formula |
| `{{INCLUDES}}` | metric.includes |
| `{{EXCLUDES}}` | metric.excludes |
| `{{PERIOD}}` | metric.period |
| `{{RESPONSIBLE}}` | metric.responsible |
| `{{IMPLEMENTATION}}` | Bloco "**Implementação**:\n```\n...\n```" ou "A definir" |
| `{{META_OR_BENCHMARK}}` | metric.metaOrBenchmark |
| `{{LINK_NORTH_STAR}}` | Link para north-star.md apenas na primeira métrica da categoria North Star |

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
