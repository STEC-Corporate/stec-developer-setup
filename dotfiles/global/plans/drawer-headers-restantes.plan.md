# Plano: Drawer nos headers Público e Profissional

> **Status:** RASCUNHO | **Origem:** `prompts-para-planos.md` — Prompt 4  
> **Referência implementada:** `src/components/headers/contratante-header-drawer.tsx` + uso em `contratante-header.tsx`

## 1. Escopo e contexto

- **Já existe:** `ContratanteHeaderDrawer` — hambúrguer `md:hidden`, overlay, painel `fixed right-0`, `w-72`, transição `translate-x`, bloco auth (Entrar/Cadastro vs nome/email + Sair).
- **Pendente:** mesmo padrão UX em `PublicHeader` e `ProfissionalHeader`.
- **Dados atuais:**
  - Links institucionais públicos: `PUBLIC_HEADER_NAV_LINKS` em `public-header-nav.tsx` (Blog, Casos de sucesso, Sobre nós, Contato, Suporte) — já alinhados ao enunciado.
  - Profissional: `/descobrir`, `O meu Workspace` (externo via `getWorkspaceEntryUrls()`), Entrar ou Sair.

### Paridade desktop ↔ mobile

- Desktop (`md:` e acima): manter layout atual (nav horizontal visível; sem drawer).
- Mobile: esconder a faixa de nav + bloco de auth “completo” que hoje aparece na grade/flex, expondo apenas logo + **hambúrguer à extrema direita** (como no contratante após avatar/sino).

### Detalhe — `PublicHeader` logado

No desktop, usuário logado vê **Área contratante** no meio da navegação. No drawer, incluir esse link **antes do separador** de auth (apenas quando `ready && user`), para não perder jornada em mobile.

### Detalhe — `ProfissionalHeader` / link externo

“O meu Workspace” deve permanecer `<a href={...} target="_blank" rel="noopener noreferrer">` no drawer; ao clicar, fechar o drawer (`onClick` → `setOpen(false)`).

---

## 2. Componentes a criar ou modificar

| Ação | Arquivo / componente |
|------|----------------------|
| **Criar (preferível)** | Peças compartilhadas do drawer (ver seção 3) |
| **Criar** | `PublicHeaderDrawer` |
| **Criar** | `ProfissionalHeaderDrawer` |
| **Alterar** | `public-header.tsx` — `md:hidden` na nav institucional + área auth “inline”; inserir drawer no canto direito |
| **Alterar** | `profissional-header.tsx` — `md:hidden` na `<nav>` inteira; inserir drawer |
| **Alterar (opcional refino)** | `ContratanteHeaderDrawer` — migrar para usar os mesmos primitives compartilhados (reduz duplicação; pode ser fase 1b) |
| **Alterar** | `public-header.test.tsx` / `profissional-header.test.tsx` — cenários drawer |
| **Alterar ou novo** | spec E2E Playwright — viewport mobile, abrir drawer em `/` e `/prestador` |
| **Alterar** | `index.ts` — exportar drawers apenas se outro módulo precisar (geralmente desnecessário) |

---

## 3. Estrutura de arquivos sugerida

```
src/components/headers/
  drawer/
    header-drawer-overlay.tsx      # overlay fixo, z-50, bg-black/50, md:hidden
    header-drawer-panel.tsx        # aside w-72, transição translate-x, data-testid base
    header-drawer-toolbar.tsx      # título "Menu" + botão fechar
    header-drawer-hamburger.tsx    # Button ghost + ícone SVG (opcional: unificar com contratante)
    header-drawer-nav-link.tsx     # item Link com active por pathname + onNavigate
    header-drawer-auth-section.tsx # ready, user, onSignOut, links Entrar/Cadastro (igual contratante)
  public-header-drawer.tsx
  profissional-header-drawer.tsx
  public-header.tsx                # integra
  profissional-header.tsx          # integra
```

**Alternativa mínima (sem pasta `drawer/`):** copiar blocos de `ContratanteHeaderDrawer` para os dois novos arquivos e refatorar extração num segundo commit — aceitável se quiser entregar mais rápido, com mais duplicação temporária.

---

## 4. Props / interfaces necessárias

### Compartilhadas

- **Overlay:** `open: boolean`, `onClose: () => void`, `testId?: string` (ex.: sufixo `public` / `profissional`).
- **Painel:** `open: boolean`, `children: ReactNode`, `testId: string`, `ariaLabelNav?: string` (default: "Navegação mobile").
- **Toolbar:** `title: string` (default `"Menu"`), `onClose: () => void`, `closeTestId: string`.
- **Hambúrguer:** `onOpen: () => void`, `toggleTestId: string`, `ariaLabel?: string` (default "Abrir menu").
- **Nav link (interno):** `href`, `label`, `active`, `onClick` (fecha drawer), `title?`.
- **Auth section (reuso do contratante):**  
  `user: { displayName: string; email: string } | null`, `ready: boolean`, `onSignOut: () => void`, `onAfterSignOut?: () => void` (fechar drawer), mesmas rotas `/entrar` e `/conta/cadastro`.

### `PublicHeaderDrawerProps`

- `user`, `ready`, `onSignOut` (espelho contratante).
- Opcional: `showAreaContratante?: boolean` — quando true, renderizar link `/conta` “Área contratante” antes dos links institucionais ou após eles (recomendado: **antes** do bloco institucional ou **logo após** logo — decidir visualmente; canônico: junto à navegação, após itens institucionais e antes do separador).

### `ProfissionalHeaderDrawerProps`

- `user`, `ready`, `onSignOut`.
- `workspaceUrl: string` — de `getWorkspaceEntryUrls().soundlink` (ou prop já resolvida no pai).

### Tipo de item de navegação

- Público: reutilizar entradas de `PUBLIC_HEADER_NAV_LINKS` (`readonly { href, label }[]`).
- Profissional: lista pequena fixa no componente ou constante `PROFISSIONAL_HEADER_DRAWER_LINKS` com um item `kind: "internal" | "external"`.

---

## 5. Ajustes de layout nos headers (resumo)

### `PublicHeader`

- Nav central (`PublicHeaderNav` + condicional Área contratante): classe **`hidden md:flex`** (ou equivalente à grade atual `sm:` — alinhar breakpoint ao **`md`** do contratante para consistência).
- Bloco direito (Entrar/Cadastro ou Olá + Sair): **`hidden md:flex`**.
- Incluir `PublicHeaderDrawer` num wrapper `flex` à direita, **visível só mobile** (`flex md:hidden` ou só o drawer com `md:hidden` no botão como hoje no contratante).

### `ProfissionalHeader`

- `<nav aria-label="Navegação profissional">`: **`hidden md:flex`**.
- Adicionar `ProfissionalHeaderDrawer` no flex do header, à direita do logo, extremo direito.

### `data-testid` (padrão)

- `public-drawer-toggle`, `public-drawer-overlay`, `public-drawer`, `public-drawer-close`
- `profissional-drawer-toggle`, … (mesmo padrão)

---

## 6. Fases de execução

1. **Extrair compartilhado (opcional mas recomendado)**  
   Criar primitives em `drawer/`; opcionalmente refatorar `ContratanteHeaderDrawer` para usá-los (uma PR ou commit atômico para não quebrar testes).

2. **`PublicHeader` + `PublicHeaderDrawer`**  
   Itens: institucionais (+ Área contratante se logado) → separador → auth.

3. **`ProfissionalHeader` + `ProfissionalHeaderDrawer`**  
   Itens: Descobrir → Workspace (externo) → separador → Entrar ou bloco usuário + Sair.

4. **Testes**  
   - **Unit (Jest + RTL):** abrir com `fireEvent.click` no toggle; assert overlay + painel visíveis; fechar via overlay e botão fechar; link interno fecha drawer (opcional spy). Mock `usePathname` como nos testes existentes.  
   - **E2E (Playwright):** `page.setViewportSize({ width: 375, height: 667 })` (ou projeto `mobile` se existir), visitar `/` e `/prestador`, `getByTestId('...-drawer-toggle').click()`, assert drawer visível. Requer `npm run dev` em paralelo (regra do repo).

5. **Qualidade**  
   `npm run test`, `npm run lint`, `npm run typecheck`; skill `check-file-sizes` nos novos `.tsx` (limite 200 linhas em componentes de apresentação).

---

## 7. Critérios de pronto (DoD)

- [ ] Em viewports abaixo de `md`, só logo + hambúrguer à direita nos headers público e profissional (nav “full” oculta).
- [ ] Hambúrguer, overlay, painel e fechamento comportam-se como `ContratanteHeaderDrawer`.
- [ ] Conteúdo do drawer confere com a lista do enunciado (PT-BR).
- [ ] Link externo “O meu Workspace” abre em nova aba e fecha o drawer.
- [ ] Testes unitários cobrem abrir/fechar e presença dos links principais.
- [ ] Pelo menos um fluxo E2E smoke em mobile para `/` e `/prestador` com drawer aberto.
- [ ] Sem regressão nos testes existentes de `PublicHeader` / `ProfissionalHeader` (ajustar expectativas se links duplicados desktop+mobile — preferir `getAllByRole` ou queries dentro do drawer via `within`).

---

## 8. Riscos e notas

- **Duplicação de links no DOM:** em mobile, links existirão só no drawer; em desktop, só na barra — evita duplicata. RTL deve usar escopo correto.
- **`ContratanteHeaderDrawer`:** hoje não tem testes dedicados de toggle no `contratante-header.test.tsx`; este plano **adiciona** cobertura explícita nos dois novos headers — desejável adicionar teste mínimo ao contratante depois para simetria.
- **Documentação:** se `ui-canonical` descrever headers, atualizar inventário de **mobile** (follow-up §3.5 do checklist pós-implementação).

---

## 9. Ordem sugerida de implementação (técnica)

1. Pasta `drawer/` + testes de snapshot mínimos dos primitives (opcional).  
2. `PublicHeaderDrawer` + integração + testes.  
3. `ProfissionalHeaderDrawer` + integração + testes.  
4. E2E.  
5. Refator `ContratanteHeaderDrawer` para primitives (opcional).
