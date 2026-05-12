# Padrões de Arquitetura Hexagonal

## Estrutura de pastas esperada

```
src/
├── domain/                    # Núcleo — portas e modelos
│   ├── model/                 # Entidades e Value Objects
│   ├── ports/
│   │   ├── inbound/           # Portas de entrada (casos de uso)
│   │   └── outbound/          # Portas de saída (repositórios, serviços externos)
│   └── service/               # Serviços de domínio
├── application/               # Adaptadores de entrada
│   └── {usecase}/
│       ├── {UseCase}Handler.ts
│       └── {UseCase}Command.ts
└── infrastructure/            # Adaptadores de saída
    ├── persistence/           # Implementações de repositório
    ├── http/                  # Controllers / rotas
    └── messaging/             # Eventos, filas
```

## Regras de dependência

```
infrastructure (adaptadores) → domain (portas)
application (adaptadores) → domain (portas)
domain → nada externo
```

## Glossário

| Termo | Definição |
|---|---|
| Porta de entrada (inbound) | Interface que define o caso de uso; implementada na camada de domínio |
| Porta de saída (outbound) | Interface que define contrato externo; implementada na infraestrutura |
| Adaptador primário | Implementa porta de entrada; ex.: controller HTTP, consumer de fila |
| Adaptador secundário | Implementa porta de saída; ex.: repositório Prisma, cliente HTTP externo |

## Checklist de migração

- [ ] Identificar todos os pontos de acoplamento externo (banco, API, mensageria)
- [ ] Criar interfaces (portas outbound) para cada dependência externa
- [ ] Mover lógica de negócio para `domain/service/`
- [ ] Criar adaptadores secundários implementando as portas outbound
- [ ] Criar adaptadores primários chamando as portas inbound
- [ ] Remover imports diretos de infraestrutura em domínio/aplicação
- [ ] Executar testes de contrato para cada porta
- [ ] Validar com `gate-arquitetura` antes do merge

## Armadilhas frequentes

- **Anemia do domínio:** lógica de negócio vazando para adaptadores — mover para `domain/service/`.
- **Porta de saída em camada errada:** interfaces de repositório definidas em `infrastructure/` em vez de `domain/ports/outbound/`.
- **Adaptador conhecendo domínio demais:** adaptador primário (controller) aplicando regras de negócio — delegar ao use case.
