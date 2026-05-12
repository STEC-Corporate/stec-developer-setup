---
name: Olinket PBR-04 — Home, Descobrir, SEO e login por camada
overview: Home = recorte 1–8 cards conforme últimos cadastros completos evoluindo p/ avaliações; Descobrir = lista rich; filtros local; público até ficha — login na profundidade ficha §11.4 §11.6 §11.7.
todos:
  - id: home-recorte
    content: Implementar/query home destaques (seed rules até dados reais) max 8 cards §11.
    status: completed
  - id: descobrir-lista
    content: Lista completa com filtros; persistência filtro home→descobrir quando aplicável §11.
    status: completed
  - id: seo-metadata
    content: Metadata listagens públicas snippets §11.7.
    status: completed
  - id: login-gating
    content: Proteção ficha profissional profunda — alinhar a middleware ou client gate §11.7.
    status: completed
  - id: sem-colocacao-paga
    content: Garantir código/copy sem “premium listing” — apenas ranking orgânico.
    status: completed
isProject: true
---

# Build-ready — PBR-04: Home + Descobrir + SEO + camadas de login

## Objetivo

Entregar comportamento público/anônimo vs autenticado segundo **§11.4, §11.6, §11.7** do plano-mãe, com **critérios de ranking** documentados aqui mesmo (recência cadastro completo → avaliações → relevância local/IA roadmap).

## Escopo OUT

Motor IA verdadeiro (só hook/filters estáticos iniciales).

## Aceite

- Home não espelha listagem inteira Descobrir.
- Descobrir cresce; sem monetização resultado.
- Lighthouse mínimo acordado (opcional projeto) só se CI existir meta.
