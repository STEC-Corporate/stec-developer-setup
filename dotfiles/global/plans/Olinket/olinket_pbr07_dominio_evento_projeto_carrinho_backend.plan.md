---
name: Olinket PBR-07 — Domínio evento vs projeto vs carrinho (spec + permissões)
overview: Fechar regras de produto e matriz de permissões backend relativas a evento/projeto/carrinho (pendência plano-mãe §12) — documento + alinhamento API; backend pode ser outro sprint/repo.
todos:
  - id: inventario-legado
    content: Mapper estados template SoundLink vs Olinket (Project vs Event no glossário).
    status: completed
  - id: documento-regras
    content: Markdown em docs/planejamento ou 03-especificacao-produto com tabelas papel×ação.
    status: completed
  - id: matrix-permissions
    content: Quadro roles (Individual, Empresarial, profissional Workspace) × endpoints alvo.
    status: completed
  - id: followup-bff
    content: Issues ou epics BFF se o front ficar bloqueado por contrato.
    status: completed
isProject: true
---

# Build-ready — PBR-07: Evento / projeto / carrinho + permissões

## Objetivo

Resolver explicitamente a **pendência §12** do [plano-mãe](./olinket_fecho_paridade_ux_e_descoberta.plan.md) antes de escalar integrações multi-serviço.

## Tipo de plano

Prioritário **especificação** — implementação backend pode ficar fora deste repo.

## Aceite

Documento de regras aprovado pelo produto/arquiteto; PR ou issue liga ao ADR-001 §3.6 e §3.8.

**Entregue (2026-04-28):** [`docs/planejamento/pbr07-especificacao-dominio-permissoes.md`](../../docs/planejamento/pbr07-especificacao-dominio-permissoes.md); fragmento rápido: [`docs/planejamento/fragmento-pbr07-especificacao-dominio.md`](../../docs/planejamento/fragmento-pbr07-especificacao-dominio.md).

---

Implementação backend/BFF fora deste repo; §12 plano-mãe coberto **em especificação** — validação jurídica de contratos/payloads quando existir BFF.
