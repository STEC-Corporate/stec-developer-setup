---
name: scaffold-clean-layer-skeleton
description: Gera esqueleto inicial de camadas em Clean Architecture com separação domain/application/adapters e checklist de dependências.
---

# Scaffold Clean Architecture: layer skeleton

## Quando usar

- O módulo está com `styles` incluindo `clean_architecture`.
- Precisas criar estrutura base antes de implementar casos de uso.

## Pré-condições

1. Confirmar `architecture-profile`:
   - `styles` contém `clean_architecture`.
   - `artifacts_enabled` contém ao menos `use_case`, `dto`, `repository`.
2. Selecionar convenção da stack para nomes e extensão de arquivos.

## Estrutura mínima sugerida

```text
<module>/
  domain/
    entities/
    repositories/
  application/
    use-cases/
    dtos/
  adapters/
    http/
    persistence/
```

## Regras obrigatórias

- `domain` não importa `application`, `adapters` ou framework.
- `application` pode depender de `domain`, nunca de detalhes de infra.
- `adapters` implementa contratos do domínio/aplicação.

## Checklist de qualidade

- [ ] Dependências apontam para dentro.
- [ ] Use case retorna contrato estável (DTO/result).
- [ ] Repositório no domínio é interface/contrato.
- [ ] Controller/handler não contém regra de negócio central.

## Skills relacionadas

- `core-use-case`
- `core-dto`
- `core-repository`
- `arch-clean-architecture`
