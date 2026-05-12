---
name: north-star-product-alignment
description: Alinhamento à North Star Metric do SoundLink — definição, metas, perguntas-guia e paths canônicos (north-star.md, guardrails, MAPA). Use ao priorizar features, validar propostas ou explicar a métrica principal. Complementa docs-calcular-north-star-impact sem substituir o Markdown fonte.
---

# North Star — alinhamento de produto

## Fonte canônica

Detalhes completos: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`

## Declaração

**North Star:** Contratações bem-sucedidas com avaliação positiva (≥4 estrelas)

## Definição (condições)

1. Evento aconteceu (músico compareceu)
2. Pagamento foi realizado
3. Ambas as partes avaliaram mutuamente
4. Avaliação média ≥4 estrelas (de 5)

## Fórmula (resumo)

North Star Score = (Contratações com avaliação ≥4) / (Todas as propostas aceitas) × 100

## Metas por fase (referência)

| Fase | Meta |
|------|------|
| Baseline (pré-beta) | 0% — ainda não lançado |
| Beta (3 meses) | ≥ 60% |
| 6 meses | ≥ 70% |
| 1 ano | ≥ 80% |
| Longo prazo (2+ anos) | ≥ 85% |

## O que a North Star **não** é

- Vanity metrics sem ligação com contratação concluída e satisfeita
- Só “cadastros” ou “mensagens” sem desfecho de evento e avaliação

## Perguntas para alinhar feature, plano ou decisão

1. Esta mudança aumenta a taxa de contratações que terminam com evento realizado, pago e bem avaliado?
2. Reduz fricção em proposta → aceite → confirmação → comparecimento → pagamento → avaliação?
3. Evita incentivar “volume sem qualidade” (gaming da métrica)?
4. Está mensurável com os KPIs que já temos ou que o dicionário de métricas prevê?
5. Respeita a fronteira de produto e os guardrails (dados, pagamentos, identidade)?
6. Se der errado, qual etapa do funil sofre — e como detectamos cedo?

## Paths relacionados (repo)

| Documento | Path |
|-----------|------|
| North Star (completo) | `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md` |
| Dicionário de métricas | `docs/gestao-ideias/02-execucao/planejamento/metrics/metric-dictionary.md` |
| README métricas | `docs/gestao-ideias/02-execucao/planejamento/metrics/README.md` |
| Guardrails | `.cursor/docs/ia/guardrails.md` |
| Priorização de features | `.cursor/docs/ia/playbooks/feature-prioritization.md` |
| MAPA de documentos | `docs/gestao-ideias/00-governanca/MAPA-DOCUMENTOS.md` |
| Fronteira de arte / produto | `docs/gestao-ideias/00-governanca/decisoes/FRONTEIRA-ARTE.md` |

## Skills relacionadas

- `docs-calcular-north-star-impact` — classificar impacto esperado de features na North Star
- `docs-map-repository` — mapa geral do repositório
- `planejamento-validar-feature-strategy` — validação estratégica de features
- `seguranca-validar-guardrails` — guardrails antes de implementar

## Checklist

1. Ler ou atualizar `north-star.md` se a mudança alterar definição de sucesso.
2. Cruzar com `metric-dictionary.md` para KPIs.
3. Validar contra guardrails para riscos de produto/compliance.
