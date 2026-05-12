# Fluxo de Governanca - Plugins Cursor (Criacao e Submissao)

> Estado: ATIVO  
> Relacao: complementa `fluxo-ia-sdd.md` e `fluxo-workflow-agent-hooks-ci.md`

## Visao geral

Este fluxo padroniza a esteira de automacao para plugins Cursor, com gates explicitos de qualidade e seguranca antes de qualquer submissao remota.

## Etapas e gates

1. **G1 - Arquitetura e escopo**
   - Definir objetivo do plugin.
   - Selecionar mix minimo de componentes.
2. **G2 - Scaffold e metadados**
   - Gerar estrutura e manifesto.
   - Validar naming e campos obrigatorios.
3. **G3 - Review de submissao**
   - Validar discoverability e frontmatter.
   - Verificar documentacao minima.
4. **G4 - Seguranca**
   - Bloquear paths inseguros.
   - Bloquear referencias quebradas e potenciais exposicoes de segredo.
5. **G5 - Submissao**
   - Gerar PR com checklist e evidencias.
   - Acompanhar checks e revisoes ate recomendacao final.

## Politica de autenticacao e MCP

- Operacoes remotas devem ocorrer via MCP com tokens em variaveis de ambiente.
- Antes da acao remota final, exigir confirmacao humana.
- Se MCP indisponivel, executar fallback manual assistido.

## Evidencias obrigatorias

- Relatorio de review de submissao.
- Relatorio de auditoria de seguranca.
- Corpo de PR com checklist oficial preenchido.
- Snapshot de status dos checks/review.

## Anti-padroes

- Pular gate de seguranca por urgencia.
- Abrir PR sem checklist/evidencias.
- Comitar credenciais no repositorio.
