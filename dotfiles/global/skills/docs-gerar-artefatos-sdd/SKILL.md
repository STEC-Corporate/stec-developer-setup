---
name: docs-gerar-artefatos-sdd
description: Gera ou atualiza artefatos SDD (regras de negócio, fluxos de usuário, critérios de aceite) a partir de uma feature ou épicos. Usar no arranque de uma feature ou na documentação de jornada.
---

# Docs — Gerar artefatos SDD

## Quando usar

- Nova feature sem `fe-*.md` nem user flow.
- Refinar histórias de usuário com critérios de aceite testáveis.
- Preparar entrada para OpenSpec ou plano de implementação.

## Estrutura alvo (AcoustiCore)

- `docs/produto/fluxo/business-rules/<perfil|produto>/fe-<feature>.md`
- `docs/produto/fluxo/user-flows/<perfil|produto>/fe-<feature>-user-flow.md`
- `docs/produto/fluxo/user-stories/` ou arquivo por épico

## Checklist mínimo por feature

1. **User story:** formato Como / Quero / Para + critérios de aceite numerados.
2. **Regras de negócio:** IDs estáveis (ex. BR-01) e validações mensuráveis.
3. **Fluxo:** passos principais, pré-condições, exceções.
4. **UI/navegação:** se aplicável, rotas ou estados de tela e regras de apresentação.
5. **Disclaimer / limitações:** quando o domínio for regulado ou didático.

## Saída

- Arquivos em Markdown com cabeçalho de estado (ex.: PLANEJADO / IMPLEMENTADO) conforme política do repo.
