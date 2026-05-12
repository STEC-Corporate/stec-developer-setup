---
name: code-java-desktop-ux
description: Aplica princípios de ergonomia e usabilidade ao design de telas desktop em JavaFX. Use ao desenhar ou revisar interfaces desktop Java.
---

# Design de telas desktop Java

Aplica ergonomia, usabilidade e padrão de tela única de acompanhamento para que o operador tenha tudo organizado na mesma janela, com feedback claro e baixo risco de erro.

## Quando usar

Acionar para: design de novas telas desktop, revisão de usabilidade, melhoria da tela de evento ao vivo, organização de uma tela de acompanhamento única, dúvidas sobre ergonomia ou padrões desktop.

## Princípios de design desktop

- **Clareza da tarefa**: cada tela comunica de imediato seu propósito e ações disponíveis; usar progressive disclosure para funções avançadas.
- **Feedback imediato**: 100–300 ms para ações; para operações longas (&gt; 2 s), indicador de progresso com verbo claro (ex.: "Gerando… 65%").
- **Consistência**: cores, fontes, espaçamento e padrão de botões alinhados ao restante do app (main.fxml, evento-ao-vivo.fxml).
- **Controle do usuário**: confirmação para ações críticas (encerrar rodada, excluir); desfazer quando fizer sentido.
- **Prevenção de erros**: validação em tempo real e orientação inline; affordances visíveis; tamanho mínimo de alvo **~44 px** para cliques confortáveis.

## Padrão "tela de acompanhamento" (evento ao vivo)

- **Tudo numa única tela**: contexto (evento, rodada, status), tabuleiro, último sorteado, lista de sorteados, controles da rodada, verificação de cartelas e vencedores.
- **Hierarquia visual**: informação mais crítica em destaque (ex.: último número, estado da rodada).
- **Áreas bem delimitadas**: agrupamento visual com fundos leves e padding para varredura rápida (modelo "radar").
- **Ações frequentes** (marcar número, verificar cartela) com um clique; **ações críticas** com confirmação.
- Referência da tela atual: `src/main/resources/fxml/evento-ao-vivo.fxml`.

## JavaFX em aplicações desktop

- **Layouts**: BorderPane para telas principais; HBox/VBox para blocos; GridPane para grades (ex.: tabuleiro); espaçamento uniforme (ex.: 10 px).
- **Estilo**: preferir CSS ou estilos inline consistentes; cores e fontes alinhadas ao app (cabeçalhos em negrito, áreas com -fx-background-color e -fx-background-radius).
- **Controles**: botões de ação primária com cor de destaque e texto legível; estados visuais distintos (ex.: número sorteado vs não sorteado).
- **Responsividade**: usar HBox.hgrow/VBox.vgrow e prefWidth quando necessário para boa adaptação ao redimensionar.

## Requisitos e referências

- Requisitos do evento ao vivo: `docs/requirements/07-requisitos-evento-ao-vivo.md` (RNF7.1–RNF7.3, feedback visual).
- Estrutura e utilitários de UI: skill [java-ui-javafx](../code-java-ui-javafx/SKILL.md).
- Main e navegação: `src/main/resources/fxml/main.fxml`, controller principal em `src/main/java/<base-package>/controller/MainController.java`.

## Checklist para novas telas / revisões

- Propósito da tela óbvio à primeira vista?
- Ações principais com um clique e alvos ≥ 44 px?
- Feedback imediato e confirmação para ações críticas?
- Consistência com main e evento-ao-vivo (cores, fontes, espaçamento)?
- Tela de acompanhamento: todas as informações necessárias na mesma janela, com hierarquia clara?

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
