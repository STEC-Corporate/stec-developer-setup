---
name: orquestracao-mapear-endpoint-bff-api
description: Padronizar o mapeamento de um endpoint do BFF para o serviço correspondente no monorepo soundlink-api.
---

## Objetivo

Mapear de forma padronizada um endpoint ou fluxo do BFF para a API correta no monorepo.

## Passos

1. Identificar o domínio do fluxo (ex.: auth, musician, user, project, payment).
2. **Consultar o Template (fluxo do módulo)**: buscar, comparar e descobrir como o fluxo do módulo foi desenhado e planejado no projeto template em `/home/jesus/Projetos/soundlink-template-frontend`. **Mapa completo**: `docs/mapa-documentos-template.md`.
   - **User flows e mapeamentos**: `docs/documentacao/user-flows/[perfil]/[feature]/` — `fe-*-user-flow.md`, `fe-*-mapping.md` (ex.: `musician/profile/fe-musician-profile-user-flow.md`, `fe-musician-profile-mapping.md`).
   - **API specs**: `docs/documentacao/api-specifications/` — `_shared/` (auth, notifications, search, musical-data) e `[perfil]/[feature]/` (endpoints, types, examples).
   - **Regras de negócio**: `docs/documentacao/business-rules/[perfil]/[feature]/`.
   - **Planos de implementação**: `.cursor/plans/` — planos por módulo (ex.: ratings, musical-project, event-forms) com "onde aparece", dependências e fluxos.
   - **Código das telas**: `src/` (pages, features) quando necessário para entender o fluxo real (chamadas, formulários, navegação).
   - **Guardrails e decisões**: consultar `docs/gestao-ideias/00-governanca/ia/guardrails.md` e `docs/gestao-ideias/00-governanca/decisoes/` quando o fluxo envolver ranking, monetização, fluxos de contratação ou mudança de fronteira da plataforma.
   - **Ações**: (1) Identificar perfil e feature no Template que correspondem ao domínio do passo 1. (2) Ler user flows e mappings; anotar passos, ações do sistema e resultados. (3) Conferir api-specifications e business-rules. (4) Verificar planos em `.cursor/plans/` se houver. (5) Comparar com o que já existe no BFF e na API e registrar gaps.
3. Localizar o app no monorepo: `/home/jesus/Projetos/soundlink-api/apps/<dominio>-service/` (ex.: auth-service, musician-service).
4. Consultar `apps/<dominio>-service/src/` para contratos (controllers, DTOs, rotas).
5. Definir no BFF: rota, método HTTP, payload e resposta alinhados ao contrato da API; não expor detalhes internos da API.
6. Documentar mapeamento em doc existente se necessário (entrada curta: endpoint BFF → API, método, path).

## Contexto

- **Template**: `/home/jesus/Projetos/soundlink-template-frontend` — fonte de fluxos, telas e especificações por módulo. Índice de paths: `docs/mapa-documentos-template.md`.
- **Premissa**: O Template direciona o BFF; o BFF direciona as APIs. Nova implementação no BFF implica nova na API; se a API já tiver, verificar conformidade com a versão atual do Template. Detalhes em `docs/agents-and-skills.md`.
- Monorepo de API: `/home/jesus/Projetos/soundlink-api`; leitura de `apps/*/src` permitida.
- BFF mantém contrato estável para o frontend; agregar/transformar respostas quando fizer sentido.

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

