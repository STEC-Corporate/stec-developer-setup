---
name: 10 olinket c9 prestador guia
status: completed
overview: Corte 9 (último) — `/prestador` como ponto de entrada mínimo com deep links para os Workspaces (SoundLink, Visualink, …), perfil resumido reaproveitando as 3 abas do Corte 3 e remoção de qualquer back-office do profissional que tenha sobrado.
todos:
  - id: f1
    content: Fase 1 — Auditoria/limpeza de rastos de back-office do prestador + prestador-olinket-escopo.md
    status: completed
  - id: f2
    content: Fase 2 — /prestador com WorkspaceCards e URLs via NEXT_PUBLIC_WORKSPACE_*
    status: completed
  - id: f3
    content: Fase 3 — /prestador/[slug] reaproveitando ProfessionalDetailsTabs (Atendimento só deep link)
    status: completed
  - id: f4
    content: Fase 4 — Fluxo header + link cruzado /descobrir/[slug] → /prestador/[slug]
    status: completed
  - id: f5
    content: Fase 5 — Testes unit + E2E cobrindo deep links e perfil + gates verdes
    status: completed
isProject: false
---


# 10 — Corte 9: Prestador guia + deep links para Workspace

> **Posição na sequência:** 10 de 10. Depende do Corte 1 (`ProfissionalHeader`) e do Corte 3 (`ProfessionalDetailsTabs`).
> **Plano mestre:** [.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md](.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md)
> **Docs P0 obrigatórios:** [docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md](docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md) (§7, §10), [docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md](docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md) (§5, §7), [docs/planejamento/areas-contratante-workspaces-auth.md](docs/planejamento/areas-contratante-workspaces-auth.md)

## Objetivo

Garantir que o **prestador** só encontra na Olinket o mínimo necessário para (a) entender o seu papel, (b) ir para o **Workspace correto** (SoundLink, Visualink, …) e (c) ter um **perfil resumido público** alinhado ao padrão de 3 abas do Corte 3. Todo back-office (Projetos, Calendário, CRM, Linket) permanece **fora da Olinket**.

## Não fazer

- Implementar back-office do profissional na Olinket (visão §5).
- Criar rotas novas além de `/prestador` e o perfil público.
- Alterar a rota `/olinket/kernel` (demo histórica — manter ou deprecar em plano à parte).

## Fases

### Fase 1 — Auditoria e limpeza

- Listar componentes/rotas restantes que simulem gestão do profissional em Olinket (ex.: partes de [src/features/olinket](src/features/olinket/) destinadas ao "núcleo profissional" completo).
- Decidir, caso a caso: (a) mover para o Workspace externo (documentar link), (b) manter como demo isolada (`/olinket/kernel`), (c) deprecar.
- Documento curto `docs/planejamento/prestador-olinket-escopo.md` com o resultado.

### Fase 2 — `/prestador` como guia

- Refactor de [src/app/prestador/page.tsx](src/app/prestador/page.tsx):
  - Cabeçalho curto: "A gestão do seu trabalho acontece no seu Workspace".
  - Grade de **WorkspaceCards** (SoundLink, Visualink, etc.):
    - Cada card tem logo, 1 linha descritiva, badge de vertical, botão "Entrar no Workspace".
  - URLs configuráveis via env: `NEXT_PUBLIC_WORKSPACE_SOUNDLINK_URL`, `NEXT_PUBLIC_WORKSPACE_VISUALINK_URL`, etc., com fallback para `#` + placeholder.
  - Seção "O que fica na Olinket" (curta): ver convites, perfil público, descobrir oportunidades.
- Componente `WorkspaceCard` em `packages/olinket-ui/src/blocks/`.

### Fase 3 — Perfil público resumido

- Rota `src/app/prestador/[slug]/page.tsx` reutilizando `ProfessionalDetailsTabs` do Corte 3 (`@stec/olinket-ui`):
  - **Pessoal:** nome, localização, mini-bio.
  - **Profissional:** formações artísticas, projetos (novo sentido), amostras, link para Workspace.
  - **Atendimento:** estado "Configurado no Workspace" + deep link — **não** reimplementar aqui.
- Fonte: `@stec/olinket-shared-mocks`.

### Fase 4 — Header e fluxo

- Garantir que `ProfissionalHeader` (Corte 1) só aparece em `/prestador*`.
- Botão "Ver como prestador" (simulação demo) na home para facilitar testes — opcional.
- Link cruzado no Corte 3 (`/descobrir/[slug]`) → "Ver perfil público" → `/prestador/[slug]` quando aplicável.

### Fase 5 — Testes e gates

- Testes unit:
  - `WorkspaceCard` render + href via env.
  - `/prestador` renderiza N cards conforme config.
  - Perfil resumido não expõe abas/informações que violem a regra §5 (sem "Gerir projetos", "CRM", etc.).
- **E2E** em [tests/e2e/smoke-routes.spec.ts](tests/e2e/smoke-routes.spec.ts):
  - `/prestador` → clicar em WorkspaceCard SoundLink → navega para URL configurada (verificar `target` e `href`).
  - `/prestador/[slug]` → 3 abas visíveis; aba Atendimento mostra deep link para Workspace.
- Gates: `npm run typecheck && npm run lint && npm run test && npm run test:e2e` verdes.

## Hooks para cortes futuros

- URLs em `NEXT_PUBLIC_WORKSPACE_*` são ponto de extensão para quando existir deep-link real com contexto (UTM, token, etc.) — esta fase só passa a URL raiz.
- Quando existir BFF/Auth federada, `/prestador` pode exibir um resumo dinâmico ("tem 3 convites"); ficaria noutro plano.

## Definição de pronto (DoD)

- `/prestador` lista Workspaces e direciona corretamente.
- `/prestador/[slug]` mostra perfil público resumido nas 3 abas.
- Sem back-office do profissional remanescente dentro do template Olinket (ou explicitamente isolado em `/olinket/kernel` como demo).
- Gates verdes; frontmatter `status: completed`.

---

## Encerramento da série

Com este corte, os 10 planos ficam concluídos. Passos pós-série:

1. Marcar [.cursor/plans/Olinket/olinket_workspaces_contratante_build-ready_908b9e64.plan.md](.cursor/plans/Olinket/olinket_workspaces_contratante_build-ready_908b9e64.plan.md) como **substituído**.
2. Reabrir a checklist §11 de [docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md](docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md) para confirmar que todos os docs ficaram atualizados.
3. Considerar próximo ciclo focado em **integração BFF/API** (fora do âmbito desta série de templates).
