---
name: stack-openapi-contracts
description: Workflow para editar, validar e alinhar especificações OpenAPI com backends e clientes. Usar ao tocar em swagger.yaml, openapi.json ou pastas de contratos.
---

# Stack — Contratos OpenAPI

## Passos

1. Identificar fonte da verdade: arquivo único ou gerado a partir de anotações no código.
2. Alterações em schemas: avaliar impacto em todos os consumidores listados no repo.
3. Manter exemplos (`examples`) coerentes com validação real.
4. Se o projeto gerar cliente TS/Java a partir do OpenAPI, referenciar o script de geração no README ou CI.

## Checklist

- [ ] Versão do documento OpenAPI (`openapi: 3.x`) explícita.
- [ ] Erros padronizados (formato de body de erro) documentados.
- [ ] Breaking change comunicada em changelog ou ADR.
