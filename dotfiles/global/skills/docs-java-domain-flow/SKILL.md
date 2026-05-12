---
name: docs-java-domain-flow
description: Documenta fluxo de domínio em aplicações Java. Use ao implementar regras de negócio ou novos fluxos operacionais.
---

# Fluxo de domínio em Java

## Sequência principal

1. **Cadastro** — entidade principal criada e configurada.
2. **Processamento** — dados derivados ou itens operacionais são gerados.
3. **Execução** — fluxo principal do domínio é executado e rastreado.
4. **Consolidação** — resultados, status e saídas são persistidos e disponibilizados.

## Services principais

- `src/main/java/<base-package>/service/DomainService.java` — orquestra regras centrais do domínio.
- `src/main/java/<base-package>/service/PrimaryEntityService.java` — CRUD e regras da entidade principal.
- `src/main/java/<base-package>/service/SecondaryEntityService.java` — geração e gestão de dados derivados.
- `src/main/java/<base-package>/service/ProcessService.java` — execução do fluxo operacional.
- `src/main/java/<base-package>/service/ReportingService.java` — consolidação de resultados e saídas.

## Enums de estado

- `StatusProcesso`: CRIADO, AGUARDANDO, EM_ANDAMENTO, FINALIZADO.
- `StatusItem`, `StatusResultado`, `StatusEtapa`: usar nos models e na lógica para transições de estado consistentes.

Ao alterar regras de negócio, manter a consistência entre esses services e os enums; cobrir mudanças com testes unitários e de integração.

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
