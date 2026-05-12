---
name: code-java-conventions
description: Convenções Java/Spring/JavaFX para aplicações Java. Use ao editar código Java, controllers ou config.
---

# Convenções Java

## Pacotes e estrutura

- Defina um pacote base consistente para o projeto, por exemplo `com.app`.
- Subpacotes: `controller`, `service`, `repository`, `model`, `config`, `util`
- Configurações em `<base-package>.config`; propriedades em classes `*Properties`.

## Estilo de código

- **Lombok**: use `@Data`, `@RequiredArgsConstructor`, `@Slf4j` onde fizer sentido; evite boilerplate de getters/setters.
- **Injeção de dependência**: preferir construtor com `@RequiredArgsConstructor` e `private final`; para casos excepcionais (ex.: ciclo) usar `@Autowired` em campo.
- **Services**: anotar com `@Service`; lógica de negócio nos services, não nos controllers.
- **Controllers**: anotar com `@Controller`; delegar para services; usar `AlertUtils` para diálogos.

## Configuração

- Propriedades da aplicação em classes `@ConfigurationProperties(prefix = "…")`:
  - `src/main/java/<base-package>/config/AppProperties.java` — `<app>.app.*`
  - `src/main/java/<base-package>/config/ModuleProperties.java` — `<app>.module.*`
- Registrar em `@EnableConfigurationProperties` na aplicação principal.

## Referência

- Regras Cursor para Java: use as rules de Java do projeto quando existirem.

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
