---
name: arquitetura-java-architecture-review
description: Revisar arquitetura e regras de design de aplicações Java. Use ao validar camadas, pacotes ou ao rodar testes ArchUnit.
---

# Arquitetura e design em Java

## Quando usar esta skill

- Fazer code review focado em arquitetura (camadas, dependências).
- Validar que controllers não acessam repositórios diretamente e que services não dependem de UI JavaFX.
- Rodar testes de arquitetura (ArchUnit), quando configurados.

## Regras conceituais

- **Camadas:** `controller` → `service` → `repository` → `model`. Config em `config`; utilitários em `util`.
- **Pacotes:** `<base-package>.controller`, `<base-package>.service`, `<base-package>.repository`, `<base-package>.model`, `<base-package>.config`.
- **Domínio:** modelos não conhecem infraestrutura (Mongo, UI, HTTP). Pontos de extensão (novos tipos de sorteio, relatórios) devem ser adicionados sem quebrar camadas.
- **ArchUnit (futuro):** testes que garantem que controllers só dependem de services; services não importam javafx.*; sem ciclos entre pacotes.

## Scripts desta skill

| Script | Uso |
|--------|-----|
| **arch-tests.sh** | Roda testes de arquitetura. Se o projeto tiver testes nomeados `*ArchTest` ou com grupo `arch`, use este script. Caso contrário, o build pode não encontrar testes e falhar até ArchUnit ser adicionado. |

### Como invocar

Na raiz do projeto:

```bash
.cursor/skills/arquitetura-java-architecture-review/scripts/arch-tests.sh
```

## Referências

- [java-spring-dev](../code-java-spring-dev/SKILL.md) — convenções de camadas.
- [java-code-quality](../code-java-code-quality/SKILL.md) — ferramentas estáticas.

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
