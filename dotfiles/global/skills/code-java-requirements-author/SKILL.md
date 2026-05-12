---
name: code-java-requirements-author
description: Gera documentos de requisitos para aplicações Java a partir de uma descrição. Use quando o usuário pedir para criar requisitos, especificar uma feature, ou gerar documento de requisitos.
---

# Autor de requisitos Java

Gera documentos de requisitos no formato canônico do projeto e casos de teste alinhados, para uso posterior pelo agente Desenvolvedor de funcionalidades.

## Formato canônico

O documento deve ter exatamente **7 seções** na ordem abaixo. Usar como referência `docs/requirements/01-requisitos-eventos.md` e `docs/requirements/02-requisitos-cartelas.md`. Template vazio: `docs/requirements/_template-requisitos.md`.

1. **Introdução** — 1.1 Propósito, 1.2 Escopo
2. **Requisitos Funcionais** — 2.1 Tabela (ID, Descrição, Prioridade, Status), 2.2 User Stories (Como/Quero/Para + critérios de aceitação), 2.3 Especificações BDD (Gherkin em code block)
3. **Requisitos Não-Funcionais** — Tabela (ID, Categoria, Descrição, Prioridade, Status)
4. **Modelo de Domínio** — 4.1 Diagrama de classe (mermaid), 4.2 Restrições e validações (lista numerada)
5. **Interface do Usuário** — 5.1 Protótipo (lista de telas e componentes), 5.2 Fluxo de navegação (mermaid)
6. **Regras de Negócio** — Lista numerada RN01, RN02, …
7. **Testes** — 7.1 Unitários, 7.2 Integração, 7.3 Interface (bullets ou tabela resumida; insumo para o Desenvolvedor)

## Convenções de ID

- **RF01, RF02, …** — Requisitos funcionais; **RNF01, RNF02, …** — Requisitos não funcionais
- **US01, US02, …** — User Stories
- **RN01, RN02, …** — Regras de negócio
- **Status** para novos RF/RNF: usar **"A implementar"** até a implementação
- Casos de teste na rastreabilidade: **CT-&lt;sigla&gt;-NN** (ex.: CT-EV-01 para Eventos, CT-CA-01 para Cartelas, CT-EX-01 para Exportação)

## Workflow

1. **Ler a descrição** fornecida pelo usuário (feature ou módulo).
2. **Definir escopo** e listar RF e RNF em tabelas; atribuir Prioridade (Alta/Média/Baixa) e Status "A implementar".
3. **Escrever User Stories** (Como/Quero/Para + critérios de aceitação) e **cenários BDD** em Gherkin (Dado/Quando/Então) em code block.
4. **Esboçar modelo de domínio**: diagrama de classe mermaid e restrições/validações numeradas.
5. **Descrever interface**: protótipo (telas e componentes) e fluxo de navegação em mermaid.
6. **Listar regras de negócio** (RN01…).
7. **Preencher seção 7 (Testes)**: bullets ou tabela resumida para testes unitários, integração e interface; alinhar à rastreabilidade (CT-&lt;sigla&gt;-NN).
8. **Salvar** em `docs/requirements/NN-requisitos-<modulo>.md`. O próximo número NN é o maior existente em docs/requirements/*.md (excluindo 00 e 06) + 1. Ex.: 08-requisitos-exportacao-excel.md.
9. **Sugerir atualizações** em `docs/requirements/00-visao-geral.md` (adicionar link na seção 3) e em `docs/requirements/06-matriz-rastreabilidade.md` (novas linhas para o módulo e dependências).

## Plano de testes separado (opcional)

Se o usuário pedir ou for um módulo grande, gerar também um arquivo em `docs/test-plans/` no estilo de `docs/plano-testes-logs.md`: tabelas com ID (UT01, IT01, UI01…), Descrição, Pré-condições, Passos, Resultado Esperado.

## Rastreabilidade

- Na seção 7, referenciar códigos de caso de teste (CT-&lt;sigla&gt;-NN) quando houver plano de testes ou matriz atualizada.
- Ao atualizar a matriz (`docs/requirements/06-matriz-rastreabilidade.md`), adicionar tabela do novo módulo na seção 1 e dependências na seção 2.

## Fluxo com o Desenvolvedor

O documento gerado (e a seção 7 em particular) é insumo para o **Desenvolvedor de funcionalidades** (ver `AGENTS.md` no projeto consumidor): o usuário pode passar o caminho do requisito e pedir a implementação com base nele e nos testes descritos.

## Quando usar
- Use quando a tarefa estiver alinhada ao objetivo da skill.
- Use quando for necessario padrao tecnico e repetibilidade.

## Pre-condicoes
- Escopo e contexto da tarefa definidos.
- Arquivos-alvo identificados.
- Criterios de aceite minimos estabelecidos.

## Checklist de saida
- Resultado entregue e verificavel.
- Evidencias objetivas registradas.
- Riscos e proximos passos documentados.

## Cobertura de stack e dominio
- Stacks suportadas: Java, Kotlin, Python, TypeScript, React, React Native, NextJS, NestJS.
- Dominios: backend, frontend e mobile.
