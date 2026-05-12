---
name: plugin-cursor-scaffold
description: Cria scaffold de plugin Cursor com manifesto valido, estrutura minima e opcao de marketplace.
---

# Skill: plugin-cursor-scaffold

## Quando usar

- Criacao de plugin Cursor novo (single-plugin ou multi-plugin).
- Padronizacao inicial antes da etapa de seguranca e submissao.

## Entradas obrigatorias

- `plugin_name` (lowercase kebab-case)
- `plugin_purpose`
- `repository_style` (`single` ou `multi`)
- `target_dir` (raiz onde o plugin sera criado)

## Saidas

- Arvore de arquivos base do plugin.
- `.cursor-plugin/plugin.json` preenchido com campos essenciais.
- `README.md` com instalacao e uso inicial.
- Atualizacao de `.cursor-plugin/marketplace.json` quando `repository_style=multi`.

## Passos

1. Validar nome do plugin.
2. Criar diretoria base e arquivos minimos.
3. Gerar `plugin.json` com metadados obrigatorios.
4. Criar componentes solicitados (`skills`, `rules`, `agents`, `commands`, `hooks`, `mcpServers`).
5. Validar consistencia estrutural basica.

## Script de apoio

- `scripts/scaffold_plugin.py`
