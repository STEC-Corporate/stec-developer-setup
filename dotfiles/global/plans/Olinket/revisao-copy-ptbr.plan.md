# Plano: Revisão completa de copy PT-BR (UI)

> **Status:** EM PLANEJAMENTO | **Idioma alvo:** PT-BR  
> **Glossário:** `docs/gestao-tarefas/03-especificacao-produto/business-rules/_shared/glossario-olinket.md`  
> **Terminologia (P0):** “Profissional” (não “Prestador”) em copy pública; “contratação” em vez de “pedido” onde aplicável.

## 1. Escopo e restrições

**Revisar (strings para humanos)**

- Labels, placeholders, títulos, `aria-label`, descrições de cards, toasts e mensagens de formulário expostas na UI.

**Revisar com critério (comentários orientados a produto/leitor)**

- Comentários JSDoc que citam comportamento ou decisão para equipe — alinhar a PT-BR quando forem texto legível.

**Não alterar**

- Nomes de arquivos, pastas, exports.
- Chaves de objetos, enums internos (`contractorKind`, etc.).
- Slugs de rota mantidos como legado (ex.: `/prestador` se existir).
- `data-testid`, `role` machine-readable, IDs de analytics se houver.

**Erro na matriz PT-PT → PT-BR (referência oficial)**

No material de exemplo, “canónica/canônica → canônico/canônica” (não repetir grafia errada como “troca”). Usar `.cursor/rules/pt-br-linguagem.mdc` como lista canônica de trocações.

---

## 2. Arquivos e pastas a revisar (globs)

| Área | Padrões |
|------|---------|
| Componentes UI | `src/**/presentation/components/**/*.tsx` |
| Views / páginas com texto | `src/**/presentation/**/*.tsx` (excluir só arquivos de teste quando identificável) |
| App Router / páginas | `src/app/**/*.tsx` |
| Hooks de mensagens | `src/**/*messages*.ts`, `src/**/hooks/**/*.ts` (texto visível apenas) |
| Schemas validação UI | `src/**/*.schema.ts`, `**/zod*`, formulários que injetem `message`/`errorMap` na UI |
| Layout / shared UI | `src/components/**/*.tsx` |
| Seeds / demo com copy | `src/**/__seeds__/**/*.ts`, `src/**/infrastructure/**/*seed*.ts`, `packages/olinket-shared-mocks/**/*.ts`, `packages/**/demo/**/*.ts` |
| E2E (apenas texto de asserções visíveis / copy em fixture) | `tests/e2e/**/*.ts` |

**Opcional — documentação não bloqueante para UI mas alinhamento global**

- `docs/**/*.md`, `README.md`: conforme ciclo do repo; pode ser **fase 5** se o escopo for “site + docs”.

---

## 3. Estratégia: automática vs manual

| Tipo | Quando usar |
|------|-------------|
| **Automática (busca + replace assistido)** | Termos mecânicos PT-PT → PT-BR com contexto seguro: `ficheiro`→`arquivo`, `ecrã`→`tela`, `utilizador`→`usuário`, `actual`→`atual`, `partilhar`→`compartilhar`, `registado/registada/registados`→`registrado/...`, `aceites`→`aceitos` (quando substantivo plural masculino), `Devolve` (em comentário “retorna”), `formatos aceites`→`formatos aceitos`. Sempre revisar diff por arquivo (risco de falso positivo). |
| **Manual (review)** | Frases de produto, tom, termos do glossário (“Profissional”, “contratação”), placeholders longos, strings que aparecem em testes pareados com texto exato na UI (alterar só a string visível ou o expect). |
| **Híbrida** | Grep primeiro → lista de hits → classify → replace guiado arquivo a arquivo nos diretórios da tabela §2 |

**Sinal no código atual (amostragem):**

- Indícios já vistos: `registada`, `registado`, `aceites`, comentários `Devolve`; validar outros termos por grep §4.

---

## 4. Detecção de termos PT-PT / arquivo legado europeu — comandos de grep

**PowerShell** (workspace Windows — caminho exemplo):

```powershell
Set-Location "d:\Olinket\olinket-template-frontend"

# Termos de alto sinal (ajustar lista conforme pt-br-linguagem.mdc)
$terms = @(
  'ficheiro', 'ficheiros', 'ecrã', 'ecrãs', 'utilizador', 'utilizadores',
  'actual', 'actualizar', 'canónica', 'canónico', 'secção', 'secções',
  'partilhar', 'partilhado', 'registam', 'regista\b', 'registado', 'registada',
  'aceites\b', 'objecto', 'objectivo', 'contacto\b', 'activo\b', 'activa\b',
  'equipa', 'projecto', 'óptimo', 'óptima', 'afectar', 'grelha'
)

foreach ($t in $terms) {
  Write-Host "`n=== $t ===" -ForegroundColor Cyan
  rg -n --glob "*.tsx" --glob "*.ts" --glob "*.jsx" --glob "*.js" $t src tests packages 2>$null
}
```

**Bash / ripgrep** (CI ou WSL):

```bash
cd /path/to/olinket-template-frontend
for t in ficheiro utilizador actualizar canónica partilhar registado aceites; do
  echo "=== $t ==="
  rg -n --glob "*.tsx" --glob "*.ts" "$t" src tests packages || true
done
```

**Somente UI (heurística):** após listar hits, priorizar arquivos sob `presentation/`, `components/`, `app/`.

---

## 5. Fases de execução

| Fase | Conteúdo | Saída esperada |
|------|----------|----------------|
| **1 — Componentes** | `src/**/presentation/components/**`, `src/components/**` | Diff PT-BR; zero ocorrências intencionais de termos §4 em strings de UI |
| **2 — Páginas / App Router** | `src/app/**`, templates de página com headings | Mesmo critério; rotas/`href` só copy visível |
| **3 — Seeds e mocks** | `__seeds__`, `packages/olinket-shared-mocks`, textos demo | Nomes e descrições em PT-BR; não alterar IDs técnicos |
| **4 — Testes E2E / unitários de snapshot de texto** | `tests/e2e/**`, testes RTL que asserts em texto | Ajustar expectativas apenas se mudou copy visível correspondente |

---

## 6. Critério de Pronto (DoD)

1. **`src/`**: 0 ocorrências de pelo menos estas raízes em **strings destinadas ao usuário** ou comentários públicos revisados como escopo:
   - `ficheiro`, `ecrã`, `utilizador` (forma PT-PT), `canónico`/`canónica`, `actual` (forma adjetiva PT-PT isolada), `partilh` (prefixo), `registad` (registado/registada), `aceites` quando deva ser “aceitos”.
2. Alinhamento explícito ao **glossário Olinket** para termos de produto (Profissional, contratação, etc.).
3. **`npm run lint`** e **`npm run typecheck`** verdes após alterações em TS/TSX.
4. **`npm run test`** (unit) verde.
5. **E2E**: após mudanças em copy, rodar suite relevante (ex.: `npm run test:e2e` com app em `http://localhost:3000` conforme projeto). Confirmar que **nenhum `data-testid` foi renomeado** (regra do escopo §1).
6. **Checklist opcional**: varrer `rg` dos termos §4 em `src/` e anexar saída vazia ou lista de falsos positivos documentados em comentário no PR/commit.

---

## 7. Riscos e notas

- **Falsos positivos:** “opcional”, “contexto”, “contrato”, etc. podem parecer europeus mas são válidos em PT-BR — não mudar só por estar numa lista genérica de PT-PT.
- **Commits pequenos:** por fase (1→4) facilita review e rollback de E2E.
- **Script do repo:** `scripts/normalize-pt-br.mjs` pode ser referência para normalização em **docs**; para `src/`, preferir revisão humana + grep para não quebrar contratos de string.

---

## 8. Próximo passo para execução

Aguardar ordem explícita do tipo: “executar o plano de revisão copy PT-BR” ou “implementar em Agent mode”, conforme `.cursor/rules/plan-mode-vs-execution.mdc`.
