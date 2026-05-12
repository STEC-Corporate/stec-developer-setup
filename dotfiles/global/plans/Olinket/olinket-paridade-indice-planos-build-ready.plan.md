---
name: Olinket — Índice planos paridade UX (build-ready)
overview: Mapa dos planos filhos gerados a partir do fecho de paridade `olinket_fecho_paridade_ux_e_descoberta`; cada filho é executável com critérios de aceite e `isProject: true`.
todos:
  - id: validar-durante-sprints
    content: Revisar índice ao fechar cada plano filho (checklist e links).
    status: pending
isProject: false
---

# Índice — planos build-ready (paridade Olinket ↔ SoundLink)

**Plano-mãe (estratégia + decisões):** [olinket_fecho_paridade_ux_e_descoberta.plan.md](./olinket_fecho_paridade_ux_e_descoberta.plan.md)

**Estado do mãe:** decisões de produto **fechadas** nas §8–11; ciclo **SDD documentação ↔ código** para **PBR-01** e **PBR-04** em **§16** do plano-mãe (2026-04-28). **PBR-05**, **PBR-02**, **PBR-03** e **PBR-06** (`/conta/agenda`; fragmento [`fragmento-pbr06-agenda-calendario-tarefas.md`](../../docs/planejamento/fragmento-pbr06-agenda-calendario-tarefas.md)) **implementados** no template (2026-04-28). **PBR-07** — especificação de domínio/permissões entregue em [`pbr07-especificacao-dominio-permissoes.md`](../../docs/planejamento/pbr07-especificacao-dominio-permissoes.md) (implementação **BFF** fora deste repo; §12 do mãe coberto ao nível de spec).

| Cat. (#) | Plano filho | Faixa §3 mãe | Âmbito principal |
|---|-------------|----------------|------------------|
| 1 | [olinket_pbr01_contratantes_hub_cadastro_header.plan.md](./olinket_pbr01_contratantes_hub_cadastro_header.plan.md) | **D** | Individual + Empresarial; PF/PJ; header; sem terceiro tipo; ADR §3.7 |
| 2 | [olinket_pbr02_agregadores_global_evento.plan.md](./olinket_pbr02_agregadores_global_evento.plan.md) | **A** | Mensagens, contratos e pagamentos: visão global + contexto evento §8.1, §11.3 |
| 3 | [olinket_pbr03_notificacoes_centro.plan.md](./olinket_pbr03_notificacoes_centro.plan.md) | **E** | Sino → página → abas por origem → marcar lido §11.1, §11.6 |
| 4 | [olinket_pbr04_home_descobrir_seo_login.plan.md](./olinket_pbr04_home_descobrir_seo_login.plan.md) | **B** + §11.7 | Recorte vs lista cheia; ranking; filtros local; SEO; login na ficha profunda |
| 5 | [olinket_pbr05_evento_formulario_slc.plan.md](./olinket_pbr05_evento_formulario_slc.plan.md) | **C** | Formulário evento completo (SLC): campos, validação, inspirar PublicAvailability |
| 6 | [olinket_pbr06_calendario_tarefas_contratante.plan.md](./olinket_pbr06_calendario_tarefas_contratante.plan.md) | **F** | Calendário de eventos + agenda de tarefas lado contratante §11.1 |
| 7 | [olinket_pbr07_dominio_evento_projeto_carrinho_backend.plan.md](./olinket_pbr07_dominio_evento_projeto_carrinho_backend.plan.md) | §12 pendências → **spec OK** (2026-04-28) | Spec produto + matriz permissões ([`pbr07-especificacao-dominio-permissoes.md`](../../docs/planejamento/pbr07-especificacao-dominio-permissoes.md)); BFF fora do repo |

**Ordem de execução (única fonte — não seguir a coluna “Cat.” como sequência 1→2→3…):** **PBR-01** → **PBR-04** ↔ **PBR-05** (paralelo possível após glossário/ADR) → **PBR-02** → **PBR-03** → **PBR-06** → **PBR-07** (**especificação** entregue em 2026-04-28; **implementação BFF/backend** fora deste ciclo/repo).

A coluna **Cat.** é só inventário/etiqueta do documento; o **roteiro** do programa é o parágrafo anterior.

**Referência técnica legada já entregue:** [olinket_workspaces_contratante_build-ready_908b9e64.plan.md](./olinket_workspaces_contratante_build-ready_908b9e64.plan.md) (fases 0–6 concluídas no histórico; novos temas são extensões pós-paridade).

**SDD (2026-04-28):** sincronização documentação ↔ código para **PBR-01** e **PBR-04** — ver plano-mãe [§16](./olinket_fecho_paridade_ux_e_descoberta.plan.md).

---

*Índice criado em 2026-04-24; nota SDD em 2026-04-28.*
