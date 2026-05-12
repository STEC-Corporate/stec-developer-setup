---
name: mcp-workspace-rag-ops
description: Checklist operacional e troubleshooting para o MCP workspace-rag (Ollama, ChromaDB, RAG_WORKSPACE_ROOT, RAG_EXTRA_ROOTS, reindex). Use ao configurar ambiente, diagnosticar falhas de embedding ou índice vazio.
---

# MCP workspace RAG — operações e troubleshooting

Use esta skill no repositório **RAG-Orchestrator** ou ao operar o servidor MCP `workspace-rag` no Cursor/Codex.

## Quando usar

- Configurar ou validar `mcp.json` / variáveis de ambiente do RAG.
- Índice vazio, `rag_query` sem trechos, ou erros de embedding.
- Ollama ou Chroma indisponíveis após atualização de SO ou rede.
- Dúvida sobre quando rodar `rag_reindex` (force).

## Pré-condições

- `RAG_WORKSPACE_ROOT` apontando para a **raiz absoluta** do repositório de trabalho (recomendado).
- Ollama em execução e modelo de embedding instalado (`nomic-embed-text` por padrão).

## Checklist operacional

1. **`rag_status`** (ferramenta MCP) — confirmar workspace resolvido, flags `RAG_INCLUDE_*`, `RAG_EXTRA_ROOTS`, North Star no disco, contagem de chunks, Ollama disponível.
2. **Ollama** — `OLLAMA_HOST` (padrão `http://localhost:11434`); `curl -s "$OLLAMA_HOST/api/tags"` ou `ollama list`.
3. **Reindex** — após mudanças grandes em `docs/`, `.cursor/rules/`, `.cursor/skills/` ou paths em `RAG_EXTRA_ROOTS`: usar `rag_reindex` com `force=true` se necessário substituir o índice.
4. **Persistência Chroma** — diretório em `rag_status`; opcional `RAG_CHROMA_PATH` para caminho fixo; caso contrário `.rag-data/<hash>` sob o diretório do servidor.
5. **Fleet** — não confundir com Code/Product/Project Inspectors; ordem sugerida em `docs/mcp-fleet-contract.md` do repo RAG-Orchestrator.

## Troubleshooting (sintomas comuns)

| Sintoma | Verificar |
|---------|-----------|
| "Ollama não está disponível" | Serviço `ollama` ativo; firewall; `OLLAMA_HOST` correto em WSL/Docker. |
| "Nenhum documento indexado" | `rag_reindex`; pastas `docs/` ou flags `RAG_INCLUDE_*`; workspace root errado. |
| Embedding falha | `ollama pull nomic-embed-text`; timeout/rede; versão do cliente `ollama` Python. |
| Trechos irrelevantes ou vazios | Reindex forçado; conferir se North Star e docs estão nos paths indexados. |
| Conteúdo de outro MCP não aparece | Definir `RAG_EXTRA_ROOTS` com paths absolutos separados por vírgula; reindex. |

## Comandos úteis (terminal, diagnóstico manual)

```bash
# Modelo de embedding
ollama pull nomic-embed-text

# Testes do projeto servidor
cd /caminho/RAG-Orchestrator && .venv/bin/pytest
```

## Checklist de saída

- Causa provável identificada ou `rag_status` anexado ao relatório.
- Próximo passo: reindex, ajuste de env, ou correção de rede/Ollama.
- Se bug recorrente: considerar `docs-registrar-bug-na-kb`.

## Cobertura

- Stack: Python, MCP (FastMCP), Ollama, ChromaDB.
- Repositório: RAG-Orchestrator; integração com fleet documentada no próprio repo (`docs/mcp-fleet-contract.md`).
