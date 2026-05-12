---
name: workflow-cursor-agent-entrega
description: Playbook Cursor — implementação → testes → lint/typecheck → corrigir até verde → resumo para commit; alinha a hooks e CI. Usar com workflow-cursor-entrega-guia.
---

# Skill: entrega local no Cursor

## Quando usar

- Pedido explícito para **entregar** alteração com validação local.
- Após editar código num projeto com scripts de teste/lint definidos.

## Fluxo sugerido

1. **Identificar** comandos no repo:
   - Node: `package.json` → `npm run test`, `npm run lint`, `npm run typecheck` (se existirem).
   - Java/Maven: `mvn test`, `mvn verify`.
   - Java/Gradle: `./gradlew test`.
   - Python: `pytest`, `ruff check`, conforme `pyproject.toml` / `Makefile`.
   - .NET: `dotnet test`, `dotnet build`.
2. **Executar** testes (unitários primeiro; E2E só se em escopo e servidor disponível, ver docs do projeto).
3. Se falhar: analisar output, **corrigir**, repetir até verde ou declarar bloqueio.
4. **Lint / typecheck** quando existirem scripts dedicados.
5. **Resumo** para o usuário: arquivos tocados, comandos corridos, estado final.
6. **Commit:** sugerir mensagem; **não** fazer push sem confirmação explícita do usuário se a política do projeto o exigir.

## Hooks (opcional)

- Configuração: [`hooks/README.md`](../../hooks/README.md).
- Variável `CURSOR_HOOK_TEST_CMD` pode espelhar o mesmo comando de teste rápido (redundância com o Agent é aceitável como rede de segurança).

## CI

- Lembrar que **pipeline remoto** é a verificação final; alinhar com o que o repositório pai define em `.github/workflows/` ou equivalente.

## Relação com outros artefatos

- Spec / histórias: **sdd-orquestrador**, `docs/produto/fluxo/`.
- Fluxo completo Agent + hooks + Notion: [fluxo-workflow-agent-hooks-ci.md](../../../docs/governanca/fluxo-workflow-agent-hooks-ci.md).
- Multi-ferramenta (Codex/Claude): [workflow-ferramentas-ia](../workflow-ferramentas-ia/SKILL.md).

## Agente

- **[workflow-cursor-entrega-guia](../../agents/workflow-cursor-entrega-guia.md)**
