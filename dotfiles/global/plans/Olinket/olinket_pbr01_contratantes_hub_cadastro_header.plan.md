---
name: Olinket PBR-01 — Contratantes no hub (cadastro + header)
overview: "Implementar no template só **Contratante Individual** e **Contratante Empresarial** na Olinket: onboarding com PF/PJ onde aplicável, empresarial só PJ; header e rotas alinhados a ADR-001 §3.5–§3.7 e plano-mãe §8.2, §11.8. Sem terceiro tipo; sem troca de perfil."
todos:
  - id: ux-copy-onboarding
    content: Fluxo cadastro perguntar Individual vs Empresarial; PF/PJ para Individual; só PJ Empresarial (copy + validação Zod).
    status: completed
  - id: header-variantes
    content: Header contratante diferencia Individual vs Empresarial (nav/labels conforme mirror SoundLink sem corporate-hirer no hub).
    status: completed
  - id: remover-terceiro-hub
    content: Garantir ausência de rota/feature “corporate-hirer” como conta Olinket; documentar deeplinks só para Workspace.
    status: completed
  - id: docs-spec-tipo
    content: Atualizar specs em docs (user-flow onboarding) se comportamento divergir de fe-*.md existentes.
    status: pending
  - id: testes-build
    content: "npm run test + lint + typecheck nas rotas/telas tocadas."
    status: completed
isProject: true
---

# Build-ready — PBR-01: Contratantes no hub (cadastro + header)

## Objetivo

Materializar na **UI e rotas** do `olinket-template-frontend` apenas **dois** tipos contratantes, conforme **[ADR-001 §3.5–§3.7](../docs/gestao-ideias/00-governanca/decisoes/adr-001-olinket-template-frontend-prestador-contratante.md)**.

## Escopo IN

- Página/rota(s) de **cadastro** (`/conta/cadastro` ou equivalente) com escolha **Individual | Empresarial**.
- Conditional: Individual → **PF ou PJ** (campos mínimos alinhados a produto); Empresarial → **só PJ**.
- **Header** área logada: variante Individual vs Empresarial (referência navegação: `contractor-individual` / `business` SoundLink apenas como **referência UX**, não copiar terceiro perfil para hub).
- Garantias: **sem** entrada de produto para `CORPORATE_HIRER` como conta Olinket-only.

## Escopo OUT

- Migração de código SoundLink `/corporate-hirer` (repo **soundlink-template-frontend**).
- SSO entre Olinket e Workspace (só placeholders se já existirem).

## Critérios de aceite

1. Fluxo novo ou estendido grava tipo contratante e **persiste sessão**/demo compatível com seeds existentes.
2. Lint + typecheck + testes unitários onde houver formulário/hooks novos.
3. Nenhum link “terceiro contratante” na navegação Olinket pública OU logada para este recorte.

## Referências cruzadas

- Plano-mãe: [olinket_fecho_paridade_ux_e_descoberta.plan.md](./olinket_fecho_paridade_ux_e_descoberta.plan.md) §11.9 itens cadastro §4.
