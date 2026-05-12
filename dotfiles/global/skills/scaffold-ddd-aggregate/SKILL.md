---
name: scaffold-ddd-aggregate
description: Scaffold inicial para agregado DDD (raiz de agregado, entidades internas e value objects), com estrutura e checklist de invariantes/testes.
---

# Scaffold DDD: aggregate

## Quando usar

- O módulo está com `styles` incluindo `ddd` no `architecture-profile`.
- Precisas iniciar um agregado novo mantendo invariantes no núcleo de domínio.

## Pré-condições

1. Ler `architecture-profile` e confirmar:
   - `styles` contém `ddd`.
   - `artifacts_enabled` contém `aggregate`, `entity` e `value_object`.
2. Confirmar stack alvo (Nest/Spring/etc.) para posicionar pastas e testes.

## Estrutura mínima sugerida

```text
<module>/domain/<aggregate-name>/
  <aggregate-name>.aggregate.ts
  entities/
    <child-entity>.entity.ts
  value-objects/
    <vo-name>.vo.ts
  errors/
    <aggregate-name>.errors.ts
```

## Regras obrigatórias

- Raiz do agregado protege invariantes de consistência.
- Entidade interna não é modificada diretamente por adaptadores externos.
- Value object é imutável e valida no construtor/factory.
- Sem imports de infraestrutura no domínio.

## Checklist de qualidade

- [ ] Há teste unitário para pelo menos 1 invariante crítica.
- [ ] Métodos públicos da raiz refletem linguagem de domínio.
- [ ] Erros de domínio explícitos para regras violadas.
- [ ] Mapeamento para DTO fica fora do domínio (camada de aplicação/adaptador).

## Skills relacionadas

- `core-entity`
- `core-value-object`
- `core-domain-service`
- `core-use-case`
