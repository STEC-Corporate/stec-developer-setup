---
name: mcp-fleet-routing
description: Roteamento da fleet MCP (workspace-rag, quality-ollama, product-inspector, project-inspector). Use quando o projeto tiver vários MCPs configurados e for preciso escolher ordem, gatilhos e anti-padrões alinhados ao contrato.
---

# MCP Fleet Routing (Codex)

## Fonte da verdade

Leia o contrato no repositório **RAG-Orchestrator**: `docs/mcp-fleet-contract.md` (ou cópia no projeto). Não invente nomes de servidor além dos documentados.

## Nomes estáveis (`mcp.json`)

| Chave | Papel |
|-------|--------|
| `workspace-rag` | RAG sobre docs, rules, skills, North Star |
| `quality-ollama` | Qualidade de código / diff (MCP-Code-Inspector) |
| `product-inspector` | Produto, North Star, regras de negócio |
| `project-inspector` | Layout, CI, dependências |

## Ordem sugerida

1. `rag_query` — contexto documental do workspace.
2. Ferramentas do Code-Inspector — após mudanças de código.
3. Product-Inspector — escopo de produto ou negócio.
4. Project-Inspector — estrutura de repo ou CI.

## Atalhos

- Só documentação: apenas RAG.
- Só código: Code-Inspector, se políticas já estiverem claras na conversa.

## Anti-padrões

- Não usar só Code-Inspector quando guardrails ou North Star no repo forem relevantes e o índice RAG estiver disponível.
- Não invocar os quatro MCPs em sequência em toda mensagem.

## Suporte MCP no Codex

Depende da versão do Codex/CLI. Sem MCP nativo, este protocolo orienta **decisão e rastreabilidade**; configure MCP no Cursor quando precisar das ferramentas de fato.

## Instalação

No clone do RAG-Orchestrator:

```bash
./scripts/install_codex_cursor_bridge.sh
```

Copia skills de `.cursor/codex-skills/` para `~/.codex/skills/`.
