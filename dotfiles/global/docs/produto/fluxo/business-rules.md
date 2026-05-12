# Regras de Negocio - Plugins Cursor (Criacao e Publicacao)

## Contexto

Estas regras definem o minimo necessario para considerar um plugin Cursor apto para submissao ao repositrio oficial e publicacao no marketplace.

## Regras obrigatorias

1. **Naming do plugin**  
   O campo `name` em `.cursor-plugin/plugin.json` deve ser lowercase kebab-case e unico no escopo do marketplace.

2. **Manifesto e metadados minimos**  
   Cada plugin deve conter `.cursor-plugin/plugin.json` com, no minimo, `name`, `description`, `version`, `author` e `license`.

3. **Seguranca de paths**  
   Caminhos absolutos e path traversal (`..`) sao proibidos em manifests e configuracoes de componentes.

4. **Integridade de componentes**  
   Referencias de `skills`, `rules`, `agents`, `commands`, `hooks` e `mcpServers` devem apontar para arquivos existentes no plugin.

5. **Frontmatter obrigatorio**  
   Skills, rules, agents e commands devem conter frontmatter com campos minimos de identificacao e descricao.

6. **Documentacao minima**  
   `README.md` deve cobrir finalidade, instalacao, uso e consideracoes de seguranca.

7. **Gate de seguranca bloqueante**  
   Falhas criticas/altas em auditoria de seguranca bloqueiam abertura de PR de submissao.

8. **Aprovacao humana para acao remota final**  
   O pipeline pode preparar e validar tudo, mas a aprovacao final para envio remoto deve ser confirmada por humano.

## Politica de rastreabilidade

- Toda submissao deve gerar relatorios versionados de review e seguranca.
- O corpo do PR deve incluir checklist de submissao e evidencias de validacao.
