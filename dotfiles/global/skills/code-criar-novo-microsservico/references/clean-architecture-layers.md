# Clean Architecture — Camadas do Microsserviço

## Estrutura de pastas

```
apps/{nome-do-servico}/src/
├── domain/                    # Núcleo — sem dependências externas
│   ├── entities/              # Entidades com identidade
│   ├── value-objects/         # Objetos de valor imutáveis
│   ├── interfaces/            # Contratos (IRepository, IProvider)
│   └── errors/                # Erros de domínio
├── application/               # Casos de uso — depende apenas de domain/
│   ├── use-cases/             # Orquestração de fluxos de negócio
│   ├── dtos/                  # DTOs de entrada/saída dos use cases
│   └── interfaces/            # Contratos de aplicação
├── infrastructure/            # Implementações concretas — depende de domain/
│   ├── repositories/          # Implementa IRepository
│   ├── database/              # Schemas, migrations, ORM config
│   └── guards/                # Guards de autenticação/autorização
└── presentation/              # Entrada HTTP — depende de application/
    ├── controllers/           # Controllers NestJS
    └── dtos/                  # DTOs de request/response HTTP
```

## Regras de dependência (obrigatórias)

```
presentation → application → domain
infrastructure → domain (implementa interfaces)
```

- `domain/` **nunca** importa das outras camadas.
- `application/` **nunca** importa de `infrastructure/` ou `presentation/`.
- `infrastructure/` implementa interfaces definidas em `domain/interfaces/`.
- `presentation/` chama use-cases de `application/`, nunca acessa repositórios diretamente.

## Checklist de conformidade

- [ ] Entidades possuem identidade (`id`) e invariantes encapsuladas
- [ ] Value Objects são imutáveis e validam na criação
- [ ] Use Cases retornam `Result<T>` (sucesso ou falha tipada)
- [ ] Repositórios são interfaces em `domain/`; implementações em `infrastructure/`
- [ ] Controllers não contêm lógica de negócio
- [ ] Nenhum import de `infrastructure/` em `application/` ou `domain/`

## Padrão de nomenclatura

| Tipo | Sufixo | Exemplo |
|---|---|---|
| Entidade | `Entity` | `UserEntity` |
| Value Object | `VO` | `EmailVO` |
| Use Case | `UseCase` | `CreateUserUseCase` |
| DTO (use case) | `Dto` | `CreateUserDto` |
| Repository interface | `Repository` | `IUserRepository` |
| Repository impl | `Repository` | `PrismaUserRepository` |
| Controller | `Controller` | `UserController` |
| Guard | `Guard` | `JwtAuthGuard` |
