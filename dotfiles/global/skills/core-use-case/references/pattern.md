# Pattern — Use Case (Application Service)

## Regras
- Use case é **orquestrador**: valida fluxo, chama repos/queries/providers.
- Não contém lógica de persistência (isso é infra).
- Não contém regras de invariantes centrais (isso é domínio).
- Retorno consistente: `Result<Output>` (ou padrão do projeto alvo).

## Testes mínimos
- Caminho feliz
- Validação de input (cada regra)
- Dependência falha (repo/provider) e comportamento esperado

