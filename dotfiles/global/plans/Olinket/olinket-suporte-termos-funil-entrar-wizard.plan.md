---
name: Olinket — Funil entrar + wizard eventos (coerência legal e microcopy)
overview: Links Termos/Privacidade em /entrar, microcopy demo vs produção, estados linketHint no wizard — alinhado a docs/planejamento/especificacao-suporte-termos-privacidade-funil.md; sem promessas legais não aprovadas.
todos:
  - id: p2-entrar-links
    content: src/app/entrar/page.tsx — rodapé ou bloco auxiliar com links acessíveis para /termos e /privacidade (rótulos descritivos); não sobrecarregar formulário.
    status: completed
  - id: p2-entrar-copy
    content: Revisar InnerHero/descrição modo demonstração vs produção — placeholders [A CONFIRMAR PELO PRODUTO]; corrigir PT-PT residual (ex. palavra-passe → senha) onde aparecer na página.
    status: completed
  - id: p2-redirect-erro
    content: Manter isSafeInternalRedirectPath + fallback /conta; se copy de erro for exposta ao utilizador por redirect inválido, mensagem curta e neutra (sem detalhes de segurança).
    status: completed
  - id: p2-wizard-hint
    content: event-form-wizard-container.tsx e/ou event-form-wizard.tsx — microcopy quando linketHint reconhecido vs inválido/ausente; sem prometer prestador específico; texto final [A CONFIRMAR PELO PRODUTO].
    status: completed
  - id: p2-wizard-privacidade
    content: Lembrete curto + link /privacidade em rodapé do wizard ou passo adequado se produto exigir (dados de evento/terceiros); sinalizar [REVISÃO LEGAL] leve em copy sensível.
    status: completed
  - id: p2-demo-isolamento
    content: Garantir que afirmações tipo \"apenas neste aparelho\" / demo ficam claramente delimitadas da narrativa de produção.
    status: completed
  - id: p2-docs
    content: Atualizar documentação SDD / user-flow se jornada ou mensagens visíveis mudarem; senão follow-up no PR.
    status: completed
  - id: p2-qualidade
    content: npm run test, lint, typecheck; E2E smoke /entrar (links legais), /eventos/novo com e sem linketHint se já houver specs; auditar strings por promessas não aprovadas.
    status: completed
isProject: true
---

> **Status:** CONCLUÍDO (2026-04-28) | **Origem:** [docs/planejamento/especificacao-suporte-termos-privacidade-funil.md](../../docs/planejamento/especificacao-suporte-termos-privacidade-funil.md) | **Data:** 2026-04-28  
> **Pré-requisito:** plano institucional (`olinket-suporte-termos-privacidade-institucionais.plan.md`) concluído ou com conteúdo mínimo publicado, para links não apontarem só para placeholder eterno.

# Build-ready — Funil `/entrar` e `/eventos/novo` (transparência)

## Objetivo

Coerência entre login do contratante e políticas institucionais; microcopy do assistente de novo evento alinhada a privacidade e ao uso de `linketHint`, sem contradição com minutas de `/termos` e `/privacidade`.

## Estado atual (baseline)

- `src/app/entrar/page.tsx` — sem links explícitos para termos/privacidade no excerto atual; hero cita modo demonstração e contém “palavra-passe” (PT-PT).
- `src/lib/safe-redirect-path.ts` — redirect seguro já usado com query (incl. `linketHint`).
- `src/features/eventos/presentation/components/event-form-wizard-container.tsx` — aplica `linketHintToWizardOverrides`; microcopy de confiança/privacidade pode precisar de reforço.

## Fora de escopo

- Redesign de auth, SSO, MFA.
- Lógica de negócio do wizard, validação de campos, integração API de eventos além de copy/UX.
- Nova política de cookies (apenas link textual se páginas já existirem).

## Fases e critérios de aceite

### Fase A — `/entrar`

- Links “Termos de uso” e “Política de privacidade” com `href` corretos e acessíveis (nome do link descritivo).
- **Aceite:** após plano institucional, links abrem conteúdo substancial; ordem de tabulação lógica no bloco onde forem colocados.

### Fase B — Redirect e mensagens

- Preservar `redirect` + query em caminhos seguros (comportamento existente).
- **Aceite:** nenhuma mensagem ao utilizador expõe regras internas de validação de URL.

### Fase C — Wizard novo evento

- Estados: hint reconhecido / hint inválido / sem hint — mensagens neutras conforme apêndice do spec.
- **Aceite:** ausência de frases tipo “garantimos o prestador X”; alinhamento com decisão produto sobre dados de terceiros + link `/privacidade` quando aplicável.

### Fase D — Qualidade

- **Aceite:** testes e lint verdes; revisão manual de copy por terminologia PT-BR e guardrails do projeto.

## Riscos

- Copy de produção antecipada sem backend real — usar qualificadores “quando disponível” ou manter marcadores até produto fechar.

## Após executar

- Avaliar plano opcional de sitemap/a11y hardening se marketing/compliance pedir.
