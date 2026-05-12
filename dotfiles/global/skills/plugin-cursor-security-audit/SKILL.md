---
name: plugin-cursor-security-audit
description: Executa auditoria de seguranca em plugins Cursor (paths, referencias, escopo e riscos de submissao).
---

# Skill: plugin-cursor-security-audit

## Quando usar

- Antes do PR de submissao.
- Sempre que houver mudancas em manifesto, mcp ou hooks.

## Controles

- Bloquear path traversal e caminhos absolutos.
- Detectar referencias quebradas em componentes.
- Sinalizar possiveis exposicoes de segredo em arquivos sensiveis.
- Revisar acoplamento excessivo e escopo amplo de plugin.

## Saida

- Relatorio com `critical`, `high`, `medium`, `low`.
- Recomendacao de bloqueio ou aprovacao.

## Script de apoio

- `scripts/security_audit.py`
