# Pattern — Repository (DDD)

## Regras
- Interface pertence ao **domínio**.
- Implementação pertence à **infraestrutura**.
- Use cases dependem da interface, nunca do ORM.

## Métodos típicos
- `getById(id)` (retorna entity ou null)
- `save(entity)` (upsert)
- `deleteById(id)`
- `findBy{Field}(value)`

## Mapeamento
Criar funções puras:
- `toDomain(record) -> Entity`
- `toRecord(entity) -> PrismaCreateInput` (ou equivalente)

