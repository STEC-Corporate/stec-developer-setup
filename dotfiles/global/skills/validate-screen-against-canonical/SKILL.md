---
name: validate-screen-against-canonical
description: Compara a tela canônica (músico) ao código e ao inventário em docs/gestao-tarefas/03-especificacao-produto/ui-canonical. Use antes de replicar uma tela para outro perfil, ou para auditar/atualizar o inventário canônico
---

# Validar tela contra inventário canônico

## Quando usar

- Antes de replicar uma tela do músico para outro perfil, para garantir que a replicação parte do estado atual (código + docs)
- Ao atualizar a UI do músico, para detectar drift entre código e documentação e decidir o que atualizar
- Quando houver divergência reportada após replicação (botões/cores/posições), para comparar músico (código+doc) vs perfil destino

## Entrada

- screen: `profile` | `dashboard` | `meus-projetos-list` | `meus-projetos-detail`

## Documentos

- Inventário canônico: `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/`
- Replicação músico: `docs/gestao-ideias/00-governanca/ia/replication-musician-as-template.md`
- Cores por perfil: `docs/gestao-ideias/04-referencia-tecnica/referencia/dev/components/testes-exemplo/cores-por-perfil.md`
- Estrutura canônica detalhe projeto: `docs/gestao-ideias/04-referencia-tecnica/referencia/architecture/estrutura-canônica-pagina-detalhes-projeto.md`

## Passos

### 1) Ler o inventário canônico (se existir)

Mapeamento por tela:

- profile → `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/profile-musician.md`
- dashboard → `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/dashboard-musician.md`
- meus-projetos-list → `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/meus-projetos-list-musician.md`
- meus-projetos-detail → `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/meus-projetos-detail-musician.md`

Se o arquivo não existir, informar e seguir apenas com o inventário extraído do código (passo 2).

### 2) Extrair inventário do código (músico)

Extrair do código os elementos relevantes, listando:

- Blocos/seções (ordem e título)
- Botões (label, variante/classe quando aplicável, destino href/onClick)
- Abas (id/value, label, rota/subrota quando aplicável)
- Campos/listas principais

Referências de paths (músico) por tela:

- profile: `src/app/musician/profile/page.tsx`, `src/components/musician-profile/musician-profile-content.tsx`, `personal-info-section.tsx`, `ProfilePricesTabContent.tsx`, `professional-settings.tsx` (em `src/features/musician-profile/`)
- dashboard: `src/app/musician/dashboard/page.tsx`, `src/app/musician/dashboard/_components/dashboard-sections.config.tsx`, `DashboardSection.tsx`, `DashboardCard.tsx`
- meus-projetos-list: `src/app/musician/projects/page.tsx`, `src/features/musician-projects/presentation/MusicianProjectsView.tsx`, componentes de card/lista em `musician-projects`
- meus-projetos-detail: `src/app/musician/projects/[projectId]/page.tsx`, `src/features/musician-projects/presentation/views/private-project-details.view.tsx`, `ProjectHeader.tsx`, `ProjectNavigation.tsx`, `ProjectPreparationSection.tsx`

### 3) Checklist doc ↔ código

Para cada item do inventário canônico (doc):

- Presente no código? Sim / Não / Parcial (descrever diferença)
- Se Não ou Parcial: registrar o gap

Para cada elemento relevante encontrado no código:

- Presente no doc? Sim / Não
- Se Não: sinalizar possível doc desatualizado ou elemento obsoleto

### 4) Possíveis obsoletos e decisão

Listar itens que estão no código mas não estão no doc (ou vice-versa), com:

- arquivo do código
- impacto (ex.: botão crítico, aba de navegação)
- sugestão (atualizar doc vs ajustar código)

Não aplicar alterações automaticamente; pedir confirmação para qualquer correção.

## Saída

1. Inventário extraído do código (blocos, botões, abas, com arquivo)
2. Checklist doc ↔ código
3. Possíveis obsoletos e recomendação de ação (atualizar doc ou ajustar código)

## Regras

- Não alterar código nem doc sem confirmação explícita do usuário
- Se o usuário pedir para aplicar correções: (1) listar mudanças propostas e obter aprovação, (2) aplicar apenas o aprovado
- Validar padrão de cores por perfil (botões para modais vs navegação) conforme docs do projeto

## Pré-condições

- Tela alvo definida (valor de `screen`)
- Acesso ao código do músico e, se existir, ao inventário canônico da tela

## Checklist de saída

- [ ] Inventário do código gerado
- [ ] Diferenças doc ↔ código apontadas com clareza
- [ ] Itens possivelmente obsoletos listados
- [ ] Recomendação final (doc alinhado vs atualizar doc vs ajustar código)

## Cobertura de stack e domínio

- Domínio: frontend (UI), consistência de documentação vs código
- Stack: Next.js/React (principal), agnóstico para outros consumidores
