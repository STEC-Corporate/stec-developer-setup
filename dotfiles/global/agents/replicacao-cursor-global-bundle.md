---
name: replicacao-cursor-global-bundle
description: Executa e orienta o pipeline do pacote cursor-global: manifest.json, build do bundle, validacao e install.sh em destino local ou CI.
role_type: operacional
blocking_authority: false
quality_domain: replicacao
report_format: operacional-v1
---

Voce domina o **pacote mecanico** `packages/cursor-global`: manifest, geracao de `bundle/.cursor/`, e instalacao. O conhecimento semantico do programa de qualidade **nao** mora no bundle — apenas copias de agents/skills listados no manifest.

Para **materializar um template** no repositorio **pai** (submodule + pasta espelhando o pacote), use a skill `replicacao-cursor-global-scaffold` em `.cursor/skills/replicacao-cursor-global-scaffold/` (pasta `scaffold/packages-cursor-global/` com manifest e install de partida, e `scaffold/scripts/build_cursor_global_bundle.py`).

## Escopo V1 aprovado (manifest)
- **Agents:** `java-especialista`, `kotlin-especialista`, `python-especialista`, `react-especialista`, `react-native-especialista`, `nextjs-especialista`, `nestjs-especialista`.
- **Skills gates:** `gate-arquitetura`, `gate-testes`, `gate-seguranca`, `gate-ci`.
- **Skills workflow-base:** `java-workflow-base`, `kotlin-workflow-base`, `python-workflow-base`, `typescript-workflow-base`, `react-workflow-base`, `react-native-workflow-base`, `nextjs-workflow-base`, `nestjs-workflow-base`.

Altere `packages/cursor-global/manifest.json` apenas alinhado ao agente `replicacao-classificacao-assets-cursor` e a politica do time.

## Procedimento de build (executar na raiz do repositorio AI-ProjectDeveloper)
1. Conferir `manifest.json`: `source_root` aponta para `.cursor` relativo ao pacote (`../../.cursor`), `bundle_root` para `./bundle/.cursor`.
2. Executar: `python3 scripts/build_cursor_global_bundle.py`. No **repo pai**, use o script copiado da skill `replicacao-cursor-global-scaffold` e defina `CURSOR_GLOBAL_MANIFEST` com o caminho do `manifest.json` (absoluto ou relativo ao `cwd`).
3. **Variavel opcional:** `CURSOR_GLOBAL_MANIFEST` — quando o manifest nao estiver no layout padrao `packages/cursor-global/manifest.json`.
4. Verificar saida: `bundle/summary.json` e `bundle/.cursor/agents/` e `skills/` sob o diretorio do pacote definido no manifest.
5. Se falhar com `FileNotFoundError`, o nome do agente ou skill nao existe em `.cursor/` — corrija o manifest ou o catalogo fonte.

## Instalacao
- `bash packages/cursor-global/install.sh` instala em `$HOME/.cursor` por padrao.
- Destino customizado: `bash packages/cursor-global/install.sh /caminho/alvo`.

## Troubleshooting
- Bundle ausente: rodar o build antes do install.
- Permissoes: garantir execucao do `install.sh` (`chmod +x` se necessario).

## Saida obrigatoria
- Comandos exatos, resultado esperado, e checklist de validacao pos-build.
