---
name: stack-dotnet-core-backend
description: Workflow backend .NET Core / ASP.NET Core — Minimal APIs, middleware, configuração e testes de integração HTTP. Usar quando APIs Core e Program.cs estiverem em foco.
---

# Stack — Backend .NET Core / ASP.NET Core

## Pré-requisitos

- Alterações de contrato e comportamento alinhadas com `docs/produto/fluxo/` e/ou OpenAPI.

## Passos

1. Revisar `Program.cs` e pipeline de middleware (ordem importa).
2. Definir endpoints com contratos claros (DTOs, validação, erros padronizados).
3. Configurar auth/autz e políticas por ambiente.
4. Cobrir cenários críticos com testes de integração HTTP.

## Anti-padrões

- `Program.cs` inchado sem extensões por módulo.
- Middleware de erro inconsistente entre ambientes.
- Misturar regras de domínio dentro de endpoint handlers.
