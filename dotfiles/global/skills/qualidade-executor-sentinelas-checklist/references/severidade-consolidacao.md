# Severidade e Consolidação de Achados

## Escala de severidade

| Nível | Definição | Ação obrigatória |
|---|---|---|
| `bloqueante` | Impede deploy/merge; risco crítico de segurança ou quebra de contrato | Corrigir antes de qualquer aprovação |
| `alta` | Risco significativo; deve ser endereçado no mesmo ciclo | Corrigir no PR atual ou criar ticket de alta prioridade |
| `media` | Debt técnico relevante; impacta manutenibilidade ou performance | Registrar em backlog e endereçar na sprint |
| `baixa` | Melhoria desejável; sem impacto imediato | Registrar como sugestão; endereçar quando oportuno |

## Ordem de prioridade na consolidação

Quando múltiplos sentinelas reportam achados conflitantes ou sobrepostos:

1. **Segurança bloqueante** — sempre tem precedência absoluta
2. **Testes críticos** — falha de teste de contrato ou regressão bloqueante
3. **Arquitetura bloqueante** — violação de Clean Architecture ou SOLID estrutural
4. **Bugs de alto impacto** — dados corrompidos, inconsistência de estado
5. **Smells e melhorias** — code smell, debt técnico, performance não-crítica

## Regras de decisão final

```
SE existe achado bloqueante confirmado por qualquer sentinela
  ENTÃO decisao = "reprovado"
  
SE não há bloqueante E existe achado "alta" OU múltiplos "media"
  ENTÃO decisao = "aprovado_com_ressalvas"
  E DEVE gerar plano_de_acao com acoes_imediatas

SE apenas achados "baixa" ou nenhum achado
  ENTÃO decisao = "aprovado"
  E registrar achados como backlog_tecnico
```

## Consolidação de achados duplicados

Se dois sentinelas reportam o mesmo achado:
- Manter o de **maior severidade**.
- Combinar as evidências de ambos.
- Indicar os dois sentinelas em `executor_gate` dos metadados.

## Evidência insuficiente

Se um sentinela não consegue analisar (ex.: artefato não encontrado):
- Reportar `na` no checklist daquele item.
- Acionar nova rodada de análise com contexto adicional.
- Não assumir `pass` por ausência de evidência — preferir nova rodada.
