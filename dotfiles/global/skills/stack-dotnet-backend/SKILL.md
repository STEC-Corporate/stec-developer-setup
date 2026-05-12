---
name: stack-dotnet-backend
description: Workflow de backend C# / .NET (geral) — arquitetura, camadas, testes e configuração. Usar ao criar ou alterar projetos .csproj e serviços C# fora do detalhe HTTP específico de ASP.NET Core.
---

# Stack — Backend .NET (geral)

## Pré-requisitos

- Mudanças de comportamento devem referenciar `docs/produto/fluxo/`.

## Passos

1. Confirmar target framework, nullable reference types e pacote de dependências no `.csproj`.
2. Validar fronteiras entre aplicação, domínio e infra.
3. Definir estratégia de configuração por ambiente e gestão de secrets.
4. Revisar estratégia de testes (unitário, integração) conforme padrão existente.

## Uso conjunto

- Para endpoints ASP.NET Core, middleware e Minimal APIs, usar em conjunto com `stack-dotnet-core-backend`.

## Anti-padrões

- Misturar lógica de domínio com infraestrutura sem contrato claro.
- Ignorar warnings de nullability com supressores em massa (`!`).
