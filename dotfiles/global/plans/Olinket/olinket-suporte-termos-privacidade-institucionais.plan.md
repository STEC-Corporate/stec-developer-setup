---
name: Olinket — Suporte, Termos e Privacidade (páginas institucionais)
overview: Conteúdo substancial e SEO para /suporte, /termos e /privacidade conforme docs/planejamento/especificacao-suporte-termos-privacidade-funil.md; placeholders operacionais; gate jurídico/DPO antes de retirar avisos de minuta.
todos:
  - id: p1-placeholders
    content: Definir fonte única de placeholders (env público documentada ou módulo config) — EMAIL_SUPORTE, HORARIO_ATENDIMENTO, MARCA_PRINCIPAL, DOMINIO_OFICIAL, RAZAO_SOCIAL, CNPJ, DPO, etc.; sem valores inventados fora de demo local.
    status: completed
  - id: p1-shell-compartilhado
    content: Extrair ou reutilizar layout de artigo institucional (main/article, max-width, tipografia) para as três rotas — evitar divergência visual; PT-BR em toda copy visível.
    status: completed
  - id: p1-suporte
    content: Implementar estrutura H2 do spec em src/app/suporte/page.tsx — Antes de contato, Canais, O que precisamos, Reportar problema, Prestadores; intro + links /termos e /privacidade; mailto/form placeholder; metadata title + description alinhados ao SEO do spec.
    status: completed
  - id: p1-termos
    content: src/app/termos/page.tsx — minuta por H2 do spec (marcadores [REVISÃO LEGAL] em texto); caixa destaque data/revisão; title Termos de uso | Olinket (ou MARCA); description conforme tabela SEO; links /privacidade e /suporte.
    status: completed
  - id: p1-privacidade
    content: src/app/privacidade/page.tsx — minuta LGPD em alto nível com [CONFIRMAR BASE LEGAL] / [A CONFIRMAR PELO PRODUTO]; caixa DPO; links /termos e /suporte; metadata Política de privacidade conforme spec.
    status: completed
  - id: p1-docs-sdd
    content: Se alterar copy/rota visível — atualizar camada correta em docs/produto/fluxo ou ui-canonical seg fluxo-documentacao-docs §8–9; ou registrar follow-up explícito no PR.
    status: completed
  - id: p1-qualidade
    content: npm run test, lint, typecheck; E2E smoke das três rotas (200, links internos); checagem manual h1 único, ordem de cabeçalhos, foco/teclado; skill check-file-sizes nos ficheiros novos/alterados.
    status: completed
isProject: true
---

> **Status:** CONCLUÍDO (2026-04-28) | **Origem:** [docs/planejamento/especificacao-suporte-termos-privacidade-funil.md](../../docs/planejamento/especificacao-suporte-termos-privacidade-funil.md) | **Data:** 2026-04-28  
> **Ordem sugerida no conjunto:** executar **antes** do plano de funil (`olinket-suporte-termos-funil-entrar-wizard.plan.md`) para que /entrar e wizard apontem para páginas com conteúdo substancial.

# Build-ready — Páginas institucionais (/suporte, /termos, /privacidade)

## Objetivo

Substituir placeholders atuais (“em construção”) por conteúdo mínimo viável alinhado ao spec: estrutura semântica, SEO, links cruzados, avisos de minuta jurídica onde aplicável, sem publicar cláusulas finais sem **revisão legal / DPO**.

## Estado atual (baseline)

- `src/app/suporte/page.tsx` — só H1 + parágrafo; falta `description` em metadata.
- `src/app/termos/page.tsx` — title “Termos \| Olinket”; spec sugere “Termos de uso”.
- `src/app/privacidade/page.tsx` — title “Privacidade \| Olinket”; spec sugere “Política de privacidade”; description genérica a afinar.

## Fora de escopo

- Chat, ticketing, KB pesquisável, vídeos.
- CMS — texto versionado no repositório (ou decisão explícita futura de CMS).
- PointLink como vertical dedicada; expansão GastroLink além de nota de reuso de componente.
- Remoção de avisos “minuta / revisão jurídica” **sem** parecer formal (cláusulas finais só após revisão).

## Fases e critérios de aceite

### Fase A — Placeholders e governança

- Documentar em comentário ou `README` de feature onde preencher `EMAIL_SUPORTE`, `EMAIL_DPO`, dados societários após parecer.
- **Aceite:** nenhum dado societário fictício apresentado como oficial; marcadores `[REVISÃO LEGAL]` / `[A CONFIRMAR PELO PRODUTO]` visíveis onde o spec exige.

### Fase B — /suporte

- H1 conforme produto (“Suporte” ou “Central de ajuda”).
- H2s e listas do spec; `mailto:` com assunto sugerido placeholder; formulário “em implementação” se URL não existir.
- Links internos válidos para `/termos`, `/privacidade`.
- **Aceite:** página não é vazia; CTAs de contato claros; mesma barra de qualidade que demais páginas públicas (responsivo 320px, contraste via design system).

### Fase C — /termos e /privacidade

- Envolver corpo longo em `<article>` (ou `main` com filho único) com `h1` único; âncoras opcionais (podem ficar para plano opcional de hardening).
- Caixas de destaque no topo (documento em atualização; DPO em privacidade).
- **Aceite:** metadata title/description da tabela SEO do spec; `lang` herdado de layout raiz `pt-BR` (validar em `layout.tsx`).

### Fase D — Qualidade e rastreabilidade

- Testes E2E mínimos: visitar `/suporte`, `/termos`, `/privacidade` e assertir strings-chave + ausência de links quebrados internos.
- **Aceite:** checklist pós-implementação do projeto (test, lint, typecheck).

## Riscos e dependências

- **Gate jurídico:** texto final substitui minuta apenas após advogado/DPO.
- **Coerência com app real:** privacidade não deve afirmar tratamentos inexistentes — alinhar com inventário `[A CONFIRMAR PELO PRODUTO]`.

## Após executar

- Sincronizar especificação ou gestão-tarefas se política do repo marcar “implementado no template”.
- Executar plano de funil em seguida (links em /entrar e wizard).
