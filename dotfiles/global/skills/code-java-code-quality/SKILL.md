---
name: code-java-code-quality
description: Aplicar análise estática e qualidade de código Java em aplicações Java. Use ao rodar lint, checkstyle, spotbugs, pmd ou revisar regras de qualidade.
---

# Qualidade de código Java

## Quando usar esta skill

- Rodar ferramentas de análise estática (Checkstyle, SpotBugs, PMD).
- Validar estilo e convenções antes de commit ou PR.
- Revisar relatórios de bugs potenciais ou code smells.

## Ferramentas (requerem plugins no pom.xml)

- **Checkstyle** — padrão de estilo (ex.: Google Java Style ou variante).
- **SpotBugs** — detecção de bugs comuns (nullness, concorrência).
- **PMD** — code smells e problemas de manutenibilidade.
- **ArchUnit** — testes de arquitetura (ver skill java-architecture-review).

Quando os plugins Maven estiverem configurados no projeto, use os scripts desta skill. Caso contrário, os comandos falharão até a configuração ser adicionada.

## Scripts desta skill

| Script | Uso |
|--------|-----|
| **checkstyle.sh** | Roda Checkstyle: `mvn checkstyle:check`. |
| **spotbugs.sh** | Roda SpotBugs: `mvn com.github.spotbugs:spotbugs-maven-plugin:spotbugs`. |
| **pmd.sh** | Roda PMD: `mvn pmd:check`. |

### Como invocar

Na raiz do projeto:

```bash
.cursor/skills/code-java-code-quality/scripts/checkstyle.sh
.cursor/skills/code-java-code-quality/scripts/spotbugs.sh
.cursor/skills/code-java-code-quality/scripts/pmd.sh
```

## Severidade

- Falhas de Checkstyle/SpotBugs/PMD configuradas como **error** devem bloquear merge até correção.
- Avisos podem ser tratados gradualmente; documentar exceções quando necessário.

## Referências

- [java-conventions](../code-java-conventions/SKILL.md) — convenções do projeto.
- [java-architecture-review](../arquitetura-java-architecture-review/SKILL.md) — testes ArchUnit.

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
