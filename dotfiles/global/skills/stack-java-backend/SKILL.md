---
name: stack-java-backend
description: Workflow de backend Java — camadas, Spring Boot, testes e OpenAPI. Usar ao criar ou alterar serviços Java, controllers ou integrações no repositório.
---

# Stack — Backend Java

## Pré-requisitos

- Spec ou história ligada em `docs/produto/fluxo/` para mudanças de comportamento.

## Passos sugeridos

1. Confirmar módulos Maven/Gradle e versão de Java do repo.
2. Separar **domínio** de **adaptadores** (HTTP, JPA) se Clean Architecture for adotada.
3. **Controller:** validação de entrada, delegação a serviços/use cases, sem lógica de negócio pesada.
4. **Contrato:** OpenAPI/Swagger se o projeto já gerar ou exigir.
5. **Testes:** unitários no domínio; integração com `@SpringBootTest` ou equivalente onde já existir padrão.

## Anti-padrões a apontar

- Serviços “Deus” com centenas de linhas sem divisão.
- Entidades JPA expostas diretamente na API sem DTO.

## Extensão

- Python/FastAPI, C#, mobile: usar outros agentes/skills quando o código não for Java.
