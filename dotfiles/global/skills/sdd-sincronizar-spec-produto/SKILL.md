---
name: sdd-sincronizar-spec-produto
description: Alinha alterações de código ou de requisitos com a documentação em docs/produto/fluxo (business-rules, user-flows, specs de motor/API). Usar após implementar feature, antes de PR, ou quando o código divergiu do doc.
---

# SDD — Sincronizar spec e produto

## Quando usar

- Fechaste código mas o doc em `docs/produto/fluxo/` não reflete o comportamento.
- Vais alterar regras de negócio e precisas dos arquivos `fe-*.md` / fluxos corretos.
- Queres lista de **gaps** entre spec e repositório.

## Passos

1. Identificar **âmbito** (módulo, pasta, feature).
2. Ler **business-rules**, **user-flows** e **api-specifications** (ou `engine/`) aplicáveis.
3. Comparar com código ou com o último plano aprovado; listar divergências com severidade (bloqueante / follow-up).
4. Propor edits concretos em Markdown (caminhos e seções) ou registro de follow-up no PR.

## Saída esperada

- Tabela ou lista: `Doc | Estado | Ação`.
- Nenhuma alteração de código sem aceitação explícita do arquiteto quando a divergência for de produto.

## Referências internas

- `docs/produto/fluxo/README.md`
- `openspec/changes/` (se existir proposta ativa)
