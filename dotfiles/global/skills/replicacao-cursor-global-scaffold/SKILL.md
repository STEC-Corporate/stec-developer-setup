---
name: replicacao-cursor-global-scaffold
description: Fornece scaffold template do pacote cursor-global (manifest, install) para o repositorio pai integrar o submodule AI-ProjectDeveloper; orienta placeholders e build.
---

## Quando usar

- Ao adicionar o repositório **AI-ProjectDeveloper** como **git submodule** no projeto pai e precisar de uma pasta local (ex.: `packages/cursor-global` ou `tools/cursor-global`) com o mesmo **contrato** do pacote (manifest + install), sem duplicar o catálogo `.cursor` inteiro.
- Ao documentar no repo pai como apontar `source_root` do manifest para `<submodule>/.cursor`.

## Pre-condicoes

- Path do submodule definido no repo pai (ex.: `vendor/AI-ProjectDeveloper`).
- Decisão do destino da pasta template no pai (ex.: raiz `packages/cursor-global/`).

## Passos

1. Copiar o conteúdo de `scaffold/packages-cursor-global/` desta skill para o diretório escolhido no **repo pai**.
2. Editar `manifest.json`: ajustar `source_root` para o caminho **relativo** da pasta do pacote no pai até `AI-ProjectDeveloper/.cursor` (ex.: `../../vendor/AI-ProjectDeveloper/.cursor`). Manter `bundle_root` como `./bundle/.cursor` se o build rodar com o mesmo layout.
3. Ajustar listas `agents` e `skills` apenas conforme política do agente `replicacao-classificacao-assets-cursor` (lista V1).
4. Copiar `scaffold/scripts/build_cursor_global_bundle.py` para o local desejado no **repo pai** (ou usar o script na raiz do submodule — ver abaixo).
5. Gerar o bundle:
   - **Submodule (AI-ProjectDeveloper):** na raiz do submodule, `python3 scripts/build_cursor_global_bundle.py`. Usa por padrão `packages/cursor-global/manifest.json`.
   - **Repo pai:** defina `CURSOR_GLOBAL_MANIFEST` com o caminho do `manifest.json` do pacote (absoluto ou relativo ao diretório atual), depois execute o script copiado do scaffold ou o do submodule, por exemplo: `export CURSOR_GLOBAL_MANIFEST=packages/cursor-global/manifest.json` e `python3 build_cursor_global_bundle.py` a partir da pasta onde o script está.
6. Conferir `install.sh`: permissão de execução (`chmod +x`). Instalar com `bash install.sh` ou `bash install.sh /caminho/customizado`.
7. Detalhes e exemplos: `scaffold/scripts/build_bundle_snippet.md`.

## Checklist de saida

- [ ] `manifest.json` válido (JSON) e `source_root` resolvendo para o `.cursor` do submodule.
- [ ] Build produziu `bundle/.cursor/` e `summary.json` (ou equivalente) onde o script espera.
- [ ] `install.sh` testado contra o diretório do bundle gerado.
- [ ] Lista do manifest alinhada à classificação global (agente `replicacao-classificacao-assets-cursor`).

## Cobertura de stack e dominio

- **Domínio:** replicacao, pacote cursor-global, integração submodule.

## Relacao com outros assets

- **Agente** `replicacao-cursor-global-bundle`: executa o pipeline e troubleshooting; use a skill para **materializar** o template no repo pai.
- **Agente** `replicacao-classificacao-assets-cursor`: valida o que pode entrar no manifest.
