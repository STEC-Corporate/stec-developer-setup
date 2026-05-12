---
name: Olinket — Compliance/SEO opcional (sitemap, âncoras, a11y políticas)
overview: Melhorias não bloqueantes pós-instituicional+funil — sitemap/robots, índice por âncoras em documentos longos, structured data só com aprovação; docs/planejamento/especificacao-suporte-termos-privacidade-funil.md § “Plano 3”.
todos:
  - id: p3-sitemap
    content: Avaliar src/app/sitemap.ts incluindo /suporte, /termos, /privacidade, /entrar e outras rotas públicas acordadas; lastmod/policy conforme prática do repo.
    status: completed
  - id: p3-robots
    content: Revisar ou criar robots.ts/robots.txt de acordo com política de indexação (sem expor ambientes não públicos).
    status: completed
  - id: p3-indice-ancoras
    content: Componente opcional de índice (nav + âncoras) para /termos e /privacidade se documento exceder limiar de leitura; ids únicos e nomes acessíveis.
    status: completed
  - id: p3-structured-data
    content: JSON-LD ou breadcrumb estruturado apenas se jurídico/marketing aprovar escopo para páginas legais.
    status: cancelled
  - id: p3-a11y-e2e
    content: Estender testes E2E ou ferramenta a11y existente — ordem de headings, landmark main/article, skip link se layout público já suportar.
    status: completed
  - id: p3-qualidade
    content: npm run test, lint, typecheck após alterações; não regressões nas rotas institucionais.
    status: completed
isProject: true
---

> **Status:** CONCLUÍDO (2026-04-28, exceto JSON-LD) | **Origem:** [docs/planejamento/especificacao-suporte-termos-privacidade-funil.md](../../docs/planejamento/especificacao-suporte-termos-privacidade-funil.md) | **Data:** 2026-04-28  
> **Pré-requisito:** planos institucional e funil concluídos ou estáveis.

# Build-ready (opcional) — Hardening compliance e SEO

## Objetivo

Fechar gaps de descoberta e leitura para páginas legais longas e crawlers, **sem** inventar requisitos legais: cada item depende de aprovação de produto/jurídico quando o spec assinala risco.

## Fora de escopo

- Cookie banner completo (tratar em iniciativa separada se `[A CONFIRMAR PELO PRODUTO]`).
- DPIA/RIPD detalhados.

## Critérios de aceite gerais

- Sitemap/robots não listam rotas autenticadas ou staging.
- Âncoras: fragmentos únicos; foco ao navegar por teclado.
- Structured data: só entra no código com registro de aprovação (comentário ou doc).

## Após executar

- Atualizar documentação técnica de SEO interno se o repo mantiver guia de metadata.
