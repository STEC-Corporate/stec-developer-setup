---
name: cloud-finops
description: FinOps — etiquetas, estimativas, reservas vs on-demand, Infracost e calculadoras oficiais. Usar com o agent cloud-finops-guia.
---

# Skill: FinOps cloud

## Quando usar

- Alteração de IaC que afeta custo recorrente.
- Pedido de estimativa mensal/anual por ambiente ou serviço.
- Definição de política de tags obrigatórias.

## Estimativa vs validação

- **Estimativa documental:** calculadoras web (AWS Pricing Calculator, Google Cloud Pricing Calculator, Azure Pricing Calculator), documentação de preços — citar data de referência.
- **Validado por ferramenta:** [Infracost](https://www.infracost.io/) (`infracost breakdown --path .`), export JSON/HTML da calculadora, ou chamadas a Pricing APIs com projeto e região explícitos.

O agente **não** invoca APIs sem ferramenta configurada no ambiente do usuário.

## Etiquetagem mínima sugerida

- `Environment`, `Project` ou `CostCenter`, `Owner`, `ManagedBy` (quando política do org o exigir).

## Automação (Infracost / Pricing API) — fase opcional

1. **Infracost:** instalar CLI; em CI, falhar ou avisar se delta de custo exceder limiar (configurar no pipeline).
2. **AWS:** Price List API / Cost Explorer API — requer credenciais IAM e uso típico em scripts/CI, não no agente em modo chat puro.
3. **GCP:** Cloud Billing API — requer conta de faturação ligada.
4. **Azure:** Retail Prices API ou Cost Management — requer permissões adequadas.

Documentar no repositório do produto **onde** rodam estes passos (não no submodule genérico).

## Agente

- **[cloud-finops-guia](../../agents/cloud-finops-guia.md)**
