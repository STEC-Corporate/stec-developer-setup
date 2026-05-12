---
name: core-domain-service
description: Criar ou revisar servicos de dominio para regras que nao pertencem a uma unica entidade/VO, mantendo o dominio rico e sem vazamento de infraestrutura. Use quando houver regra complexa envolvendo multiplas entidades, calculos, politicas ou validacoes cruzadas
---

# core-domain-service

## Quando usar
- Regra de negócio que envolve múltiplas entidades/VOs.
- Política/estratégia de domínio (ex.: cálculo de preço, elegibilidade).

## Passos
1. Definir inputs/outputs como tipos do domínio (VOs/Entities) ou DTOs internos.
2. Implementar regra como função pura ou classe sem dependências infra.
3. Escrever testes focados na regra e nos edge cases.

## Saida
- Serviço de domínio testado, com invariantes preservadas.

## References
- `references/pattern.md`
- `references/examples.md`

