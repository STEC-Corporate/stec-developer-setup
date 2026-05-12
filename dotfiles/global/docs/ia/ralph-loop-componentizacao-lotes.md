# Ralph Loop — prompt por iteração (componentização em lotes)

Documento de **fluxo de trabalho com IA** (prompts por ciclo). O plano executável continua em `docs/planejamento/plans-local-templates/Features/`.

Use **uma conversa nova ou um turno explícito** por ciclo. O estado vive no repositório: plano marcado, commits, auditoria.

## Plano fonte da verdade

`docs/planejamento/plans-local-templates/Features/template-componentizacao-lotes-prioritarios.plan.md`

## Documentos de apoio (RAG)

- Tamanhos (lista completa): [stec-docs-arquivados — components-size-violations.md](https://github.com/STEC-Corporate/stec-docs-arquivados/blob/main/arquivado/docs/gestao-ideias/05-audits/components-size-violations.md); stub no template: `docs/gestao-ideias/05-audits/components-size-violations.md`
- `docs/gestao-ideias/05-audits/componentization-quality-by-profile.md`
- `docs/gestao-ideias/05-audits/profile-reuse-migration-checklist.md`

## Ordem de lotes (não pular sem motivo)

1. `shared` (fundação reutilizável)
2. `musician` (canônico)
3. `admin`
4. Demais perfis

---

## Prompt mestre (cole no início de cada iteração)

```text
Você está no modo Ralph Loop: uma única fatia de trabalho por iteração.

1) Leia e siga o plano:
   docs/planejamento/plans-local-templates/Features/template-componentizacao-lotes-prioritarios.plan.md

2) Identifique o PRIMEIRO item ainda com [ ] (checkbox vazio) ou o próximo arquivo explícito na fila do lote em andamento. Não implemente mais de um alvo principal nesta iteração (um service, um componente, ou um subconjunto mínimo coerente definido no próprio plano).

3) Respeite as metas de tamanho do projeto:
   - Componentes em src/**/presentation/components/**/*.tsx e componentes compartilhados pesados: máx. 200 linhas por arquivo .tsx
   - Hooks em src/**/application/hooks/**/*.ts: máx. 150 linhas
   - Services em src/**/application/services/**/*.ts: máx. 300 linhas

4) Preserve contratos públicos existentes (exports, assinaturas usadas por consumidores) salvo se o plano explicitar mudança.

5) Ao terminar a fatia:
   - Rode: npm run test:unit -- --passWithNoTests
   - Rode: npm run lint (ou o equivalente do projeto nos arquivos tocados)
   - Rode: npm run audit:file-sizes (ou scripts/audit-file-sizes conforme package.json)
   - Corrija falhas antes de encerrar a iteração.

6) Atualize o plano: marque com [x] o que foi concluído e, se aplicável, uma linha curta em "Status" do lote. Se algo ficou bloqueado, deixe [ ] e anote o motivo em uma linha sob o lote.

7) Faça commit com mensagem clara (ex.: "refactor(team-member): extrai validações do backend validation service").

8) Encerre listando: o que foi feito, comandos executados e resultado (pass/fail), e qual é o próximo [ ] do plano para a próxima iteração.
```

---

## Prompt curto (continuação, mesma sessão só se o contexto ainda estiver enxuto)

```text
Continue o Ralph Loop no mesmo plano de componentização. Próximo único item [ ] conforme template-componentizacao-lotes-prioritarios.plan.md. Mesmos limites de linhas, test:unit, lint, audit:file-sizes, atualizar checkboxes e commit.
```

---

## Checklist rápido antes de considerar a iteração fechada

- [ ] Apenas um alvo principal (ou fatia mínima coerente do plano)
- [ ] Testes unitários passando
- [ ] Lint sem erros novos nos arquivos alterados
- [ ] Auditoria de tamanhos sem violação nos arquivos tocados (ou justificativa registrada no plano)
- [ ] Plano atualizado (`[x]` / nota de bloqueio)
- [ ] Commit criado

---

## Observação

E2E Playwright exige app em `http://localhost:3000`; use quando o plano ou a área alterada exigir, não necessariamente a cada micro-refatoração de tamanho.
