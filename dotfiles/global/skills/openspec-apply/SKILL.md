---
name: openspec-apply
description: Implementa uma mudança baseada em proposta OpenSpec aprovada. Use quando o usuário disser "aplicar proposta", "implementar a mudança aprovada", "executar o openspec", ou referenciar um documento em openspec/changes/. Requer proposta com status aprovado antes de executar.
disable-model-invocation: false
---

# openspec-apply

Implementa a mudança descrita em uma proposta OpenSpec aprovada.

**PRÉ-REQUISITO OBRIGATÓRIO:** Deve existir uma proposta em `openspec/changes/` com `Status: aprovado`. Se não houver, oriente o usuário a usar `/openspec-propose` primeiro.

---

## Fluxo

1. **Ler a proposta** — Abrir o arquivo em `openspec/changes/` referenciado pelo usuário.
2. **Verificar status** — Confirmar `Status: aprovado`. Se `draft`, perguntar ao usuário antes de prosseguir.
3. **Mapear impacto** — Revisar a seção "Arquivos afetados" e "Dependências" da proposta.
4. **Implementar** — Executar as mudanças descritas na proposta, arquivo por arquivo.
5. **Validar critérios de aceite** — Checar cada item da seção "Critérios de aceite".
6. **Reportar** — Listar o que foi feito, o que passou nos critérios e o que ficou pendente.
7. **Orientar para archive** — Ao concluir, orientar o usuário a usar `/openspec-archive`.

## Regras

- Implementar **apenas** o que está na proposta. Não expandir escopo.
- Se encontrar ambiguidade, perguntar antes de decidir.
- Se um critério de aceite falhar, reportar e não avançar até resolução.
- Ao final, atualizar o status da proposta para `implementado`.

## Ciclo OpenSpec

```
explore → propose → [apply] → archive
```

Após implementação, use `/openspec-archive` para registrar o histórico da mudança.
