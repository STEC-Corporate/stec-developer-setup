---
name: code-java-mongodb
description: Modelo de dados e uso de repositórios MongoDB em aplicações Java. Use ao alterar entidades ou repositórios.
---

# MongoDB em Java

## Models (entidades)

- Anotar com `@Document(collection = "nome_da_colecao")`.
- Campos com nome diferente em snake_case no MongoDB: `@Field("nome_campo")`.
- ID: `@Id private String id`.
- Referências a outros documentos: armazenar como objeto embutido ou por ID conforme o uso (ex.: `Evento` em `Cartela`).

Exemplos de referência:

- `src/main/java/<base-package>/model/PrimaryEntity.java`
- `src/main/java/<base-package>/model/SecondaryEntity.java`

## Repositórios

- Pacote: `<base-package>.repository`.
- Estender `MongoRepository<Entidade, String>` (ou o tipo do ID).
- Queries por método ou `@Query` quando necessário; seguir convenção de nomes do Spring Data.

## Testes

- Usar profile `test` (`@ActiveProfiles("test")`); configuração em `application-test.properties` / MongoDB em memória ou instância de teste.
- Não depender de dados de produção; criar dados no `@BeforeEach` ou no próprio teste.

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
