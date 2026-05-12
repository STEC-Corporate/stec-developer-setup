---
name: frontend-form-schema
description: Criar formularios e schemas de validacao no frontend com padrao consistente (UX, estados, erros, acessibilidade) e alinhamento ao contrato de API. Use quando o pedido envolver \"form\", \"schema\", \"validação\", \"zod/yup\", \"react-hook-form\" ou criacao de tela de cadastro/edicao
---

# frontend-form-schema

## Quando usar
- Criar formulário de criação/edição.
- Padronizar validação e mensagens de erro.

## Passos
1. Definir modelo de dados (campos) e regras de validação.
2. Escolher biblioteca de schema (Zod/Yup) conforme stack do projeto pai.
3. Implementar formulário com estados: loading, error, success.
4. Garantir acessibilidade (labels, aria, foco no primeiro erro).
5. Integrar com API: mapear erros de contrato para mensagens amigáveis.

## References
- `references/pattern.md`
- `references/examples.md`

