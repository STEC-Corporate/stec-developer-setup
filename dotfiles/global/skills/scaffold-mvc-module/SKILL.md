---
name: scaffold-mvc-module
description: Scaffold inicial para módulo MVC (Model, View, Controller) com separação de responsabilidades e checklist de validação.
---

# Scaffold MVC: module

## Quando usar

- O módulo está com `styles` incluindo `mvc` (ou `mvp`/`mvvm` com adaptação).
- Precisas iniciar um fluxo de UI/entrada com separação clara de responsabilidades.

## Pré-condições

1. Confirmar `architecture-profile`:
   - `styles` contém `mvc` (ou padrão equivalente).
   - `artifacts_enabled` contém `model`, `view`, `controller` (ou equivalentes permitidos).
2. Escolher stack para detalhe da implementação (web, desktop, mobile).

## Estrutura mínima sugerida

```text
<module>/<feature>/
  model/
    <feature>.model.ts
  view/
    <feature>.view.tsx
  controller/
    <feature>.controller.ts
```

## Regras obrigatórias

- `view` não contém regra de negócio central.
- `controller` orquestra fluxo, valida entrada e chama serviços/use cases.
- `model` representa estado/dados da feature, sem acoplamento indevido à UI.

## Checklist de qualidade

- [ ] Eventos de UI encaminham para controller.
- [ ] Mensagens de erro/validação estão centralizadas no controller ou camada adequada.
- [ ] Dependência de API externa fica fora da view.
- [ ] Cobrir fluxo principal com teste unitário (controller) quando aplicável.

## Skills relacionadas

- `arch-mvc-e-padroes-ui`
- `stack-typescript-frontend`
- `framework-react`
- `framework-nextjs`
