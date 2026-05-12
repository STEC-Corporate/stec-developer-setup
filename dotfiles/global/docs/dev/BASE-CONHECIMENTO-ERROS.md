# Base de Conhecimento - Erros Conhecidos e Soluções

## 📋 Índice

1. [TypeScript Strict Mode](#typescript-strict-mode)
2. [Next.js e React](#nextjs-e-react)
3. [Radix UI e Componentes](#radix-ui-e-componentes)
4. [Clean Architecture](#clean-architecture)
5. [ESLint (lint:strict)](#eslint-lintstrict)

---

## TypeScript Strict Mode

### ❌ Erro 1: `exactOptionalPropertyTypes` com propriedades undefined

**Sintoma:**
```
Argument of type '{ prop: Type | undefined }' is not assignable to parameter 
with 'exactOptionalPropertyTypes: true'. Consider adding 'undefined' to the 
types of the target's properties.
```

**Causa:**
Com `exactOptionalPropertyTypes: true`, TypeScript diferencia:
- `prop?: Type` - propriedade pode **não existir**
- `prop: Type | undefined` - propriedade **existe mas é undefined**

**Exemplo do Erro:**
```typescript
interface Props {
  initialConfig?: Partial<Config>
  onChange?: (config: Config) => void
}

function Component({ initialConfig, onChange }: Props) {
  // ❌ ERRO: passa propriedades explicitamente undefined
  useHook({ initialConfig, onChange })
}
```

**✅ Solução 1: Criar objeto apenas com valores definidos**
```typescript
function Component({ initialConfig, onChange }: Props) {
  const hookProps: HookProps = {}
  if (initialConfig !== undefined) hookProps.initialConfig = initialConfig
  if (onChange !== undefined) hookProps.onChange = onChange
  
  useHook(hookProps)
}
```

**✅ Solução 2: Usar object spread condicional**
```typescript
function Component({ initialConfig, onChange }: Props) {
  useHook({
    ...(initialConfig !== undefined && { initialConfig }),
    ...(onChange !== undefined && { onChange })
  })
}
```

**Data do Erro:** 2026-01-19  
**Arquivos Afetados:** `PriceSection.tsx`  
**Commit:** `a92a659`

---

### ❌ Erro 2: Array acesso com `undefined` em valores numéricos

**Sintoma:**
```
Argument of type 'number | undefined' is not assignable to parameter of type 'number'.
Type 'undefined' is not assignable to type 'number'.
```

**Causa:**
Acessar índice de array (`value[0]`) pode retornar `undefined` se o array estiver vazio.

**Exemplo do Erro:**
```typescript
<Slider
  value={[priceConfig.weekendRate]}
  onValueChange={(value) => updateField('weekendRate', value[0])}
  // ❌ ERRO: value[0] pode ser undefined
/>
```

**✅ Solução: Usar nullish coalescing operator**
```typescript
<Slider
  value={[priceConfig.weekendRate]}
  onValueChange={(value) => updateField('weekendRate', value[0] ?? 1)}
  // ✅ CORRETO: usa valor padrão se undefined
/>
```

**Valores padrão recomendados:**
- Taxas/multiplicadores: `?? 1`
- Descontos: `?? 0`
- Percentuais: `?? 0.5` (ou valor apropriado)

**Data do Erro:** 2026-01-19  
**Arquivos Afetados:** `PriceSection.tsx` (5 ocorrências)  
**Linhas:** 203, 221, 239, 277, 379

---

### ❌ Erro 3: `verbatimModuleSyntax` com imports de tipos

**Sintoma:**
```
'TypeName' is a type and must be imported using a type-only import when 
'verbatimModuleSyntax' is enabled.
```

**Causa:**
Com `verbatimModuleSyntax: true`, TypeScript exige separação explícita entre imports de valores e tipos.

**Exemplo do Erro:**
```typescript
// ❌ ERRO: mistura tipo e valor
import { PriceConfig, usePricing } from './hooks/usePricing'
import { useEventTypes, EventTypeOption } from './hooks/useEventTypes'
```

**✅ Solução: Separar imports de tipos**
```typescript
// ✅ CORRETO: imports de tipos separados
import type { PriceConfig, UsePricingProps } from './hooks/usePricing'
import { usePricing } from './hooks/usePricing'

import type { EventTypeOption } from './hooks/useEventTypes'
import { useEventTypes } from './hooks/useEventTypes'
```

**Data do Erro:** 2026-01-19  
**Arquivos Afetados:** `PriceSection.tsx`  
**Linhas:** 12-13

---

### ❌ Erro 4: Propriedade não existe no tipo

**Sintoma:**
```
Property 'propertyName' does not exist on type 'TypeName'.
```

**Causa:**
Tentativa de acessar propriedade que não está definida na interface TypeScript.

**Exemplo do Erro:**
```typescript
interface EventConfig {
  enabled: boolean
  basePrice: number
}

const eventConfig = priceConfig.eventSpecificPricing[eventType.value] || { 
  enabled: false, 
  priceMultiplier: 1.0  // ❌ ERRO: priceMultiplier não existe
}

// Tentando acessar propriedade inexistente
{Math.round((eventConfig.priceMultiplier - 1) * 100)}% adicional
```

**✅ Solução 1: Usar propriedades existentes**
```typescript
const eventConfig = priceConfig.eventSpecificPricing[eventType.value] || { 
  enabled: false, 
  basePrice: priceConfig.basePrice  // ✅ CORRETO: usa propriedade existente
}

// Exibir valor correto
R$ {eventConfig.basePrice.toFixed(2)}
```

**✅ Solução 2: Atualizar interface se necessário**
```typescript
interface EventConfig {
  enabled: boolean
  basePrice: number
  priceMultiplier?: number  // Adicionar propriedade se realmente necessária
}
```

**Data do Erro:** 2026-01-19  
**Arquivos Afetados:** `PriceSection.tsx`  
**Linhas:** 410, 432

---

### ❌ Erro 4b: Propriedade inexistente em tipo de objeto (ex.: includesFood)

**Sintoma:**
```
Property 'includesFood' does not exist on type 'SomeInterface'.
```

**Causa:**
Uso de propriedade que não está declarada na interface/type do objeto.

**✅ Solução:** Remover o uso da propriedade no código **ou** adicionar a propriedade ao tipo (interface/type) se for requisito legítimo do domínio.

**Data do Erro:** 2026-01-19  
**Variante de:** Erro 4

---

### ❌ Erro 5: Index signature / `noPropertyAccessFromIndexSignature`

**Sintoma:**
```
Property 'aleatoria' does not exist on type 'X'. Did you mean to access it with obj['aleatoria']?
```

**Causa:**
Com `noPropertyAccessFromIndexSignature: true`, TypeScript exige acesso a propriedades dinâmicas ou indexáveis via notação de colchetes.

**Exemplo do Erro:**
```typescript
const value = config.aleatoria  // ❌ ERRO
```

**✅ Solução: Usar notação de colchetes**
```typescript
const value = config['aleatoria']  // ✅ CORRETO
```

**Data do Erro:** 2026-01-19

---

### ❌ Erro 6: Hook React não importado (useCallback, useEffect, etc.)

**Sintoma:**
```
'useCallback' is not defined. (ou useEffect, useState, etc.)
```

**Causa:**
Uso do hook no código sem importar de `react`.

**Exemplo do Erro:**
```typescript
// ❌ ERRO: useCallback usado mas não importado
const memoized = useCallback(() => doSomething(), [])
```

**✅ Solução: Importar o hook de 'react'**
```typescript
import { useCallback } from 'react'
const memoized = useCallback(() => doSomething(), [])
```

**Data do Erro:** 2026-01-19  
**Arquivos típicos:** Componentes em `presentation/` (ex.: musician-profile-accessibility)

---

### ❌ Erro 7: Variável possibly undefined (ex.: pixInfo)

**Sintoma:**
```
Object is possibly 'undefined'.
```

**Causa:**
Variável ou propriedade pode ser `undefined` em tempo de execução; o tipo permite `T | undefined` e o código acessa sem verificação.

**Exemplo do Erro:**
```typescript
const value = pixInfo.someField  // ❌ ERRO: pixInfo pode ser undefined
```

**✅ Solução 1: Optional chaining**
```typescript
const value = pixInfo?.someField  // ✅ CORRETO
```

**✅ Solução 2: Guard clause**
```typescript
if (!pixInfo) return null
const value = pixInfo.someField
```

**Data do Erro:** 2026-01-19

---

### ❌ Erro 8: Tipo incompatível em componente (boolean vs string | number | null)

**Sintoma:**
```
Type 'boolean' is not assignable to type 'string | number | null'.
```

**Causa:**
Prop passada para um componente (ex.: Radix UI) espera `string | number | null` mas está recebendo `boolean`.

**Exemplo do Erro:**
```typescript
<Component value={someBoolean} />  // ❌ ERRO: value espera string | number | null
```

**✅ Solução:** Ajustar o valor para o tipo esperado (converter para string ou número, ou usar prop correta). Ex.: usar `value={someBoolean ? '1' : '0'}` ou trocar para a prop adequada (ex.: `checked` em vez de `value` para boolean).

**Data do Erro:** 2026-01-19  
**Arquivos típicos:** equipment-list, componentes que recebem `value` de controles

---

## Next.js e React

### ❌ Erro 9: Módulo de componente UI não encontrado

**Sintoma:**
```
Cannot find module '@/components/ui/switch' or its corresponding type declarations.
```

**Causa:**
Componente UI do Shadcn/ui não foi instalado no projeto.

**Exemplo do Erro:**
```typescript
import { Switch } from '@/components/ui/switch'  // ❌ ERRO: arquivo não existe
import { Slider } from '@/components/ui/slider'  // ❌ ERRO: arquivo não existe
```

**✅ Solução: Criar componente seguindo padrão Shadcn/ui**

**1. Criar arquivo do componente:**
```typescript
// src/components/ui/switch.tsx
"use client"

import * as React from "react"
import * as SwitchPrimitives from "@radix-ui/react-switch"
import { cn } from "@/lib/utils"

const Switch = React.forwardRef<
  React.ElementRef<typeof SwitchPrimitives.Root>,
  React.ComponentPropsWithoutRef<typeof SwitchPrimitives.Root>
>(({ className, ...props }, ref) => (
  <SwitchPrimitives.Root
    className={cn(
      "peer inline-flex h-6 w-11 shrink-0 cursor-pointer items-center rounded-full border-2 border-transparent transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 focus-visible:ring-offset-background disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=unchecked]:bg-input",
      className
    )}
    {...props}
    ref={ref}
  >
    <SwitchPrimitives.Thumb
      className={cn(
        "pointer-events-none block h-5 w-5 rounded-full bg-background shadow-lg ring-0 transition-transform data-[state=checked]:translate-x-5 data-[state=unchecked]:translate-x-0"
      )}
    />
  </SwitchPrimitives.Root>
))
Switch.displayName = SwitchPrimitives.Root.displayName

export { Switch }
```

**2. Adicionar dependência no package.json:**
```json
{
  "dependencies": {
    "@radix-ui/react-switch": "^1.1.2",
    "@radix-ui/react-slider": "^1.2.1"
  }
}
```

**3. Instalar dependências:**
```bash
npm install
```

**Componentes Shadcn/ui comuns:**
- Switch: `@radix-ui/react-switch`
- Slider: `@radix-ui/react-slider`
- Dialog: `@radix-ui/react-dialog`
- Dropdown Menu: `@radix-ui/react-dropdown-menu`
- Tooltip: `@radix-ui/react-tooltip`

**Data do Erro:** 2026-01-19  
**Arquivos Afetados:** `PriceSection.tsx`  
**Componentes Criados:** `switch.tsx`, `slider.tsx`

---

## Clean Architecture

### ❌ Erro 10: Nomenclatura incorreta - Repository vs API Service

**Sintoma:**
Confusão entre Repository Pattern (acesso a banco de dados) e API Service (comunicação HTTP).

**Causa:**
Uso de nomenclatura "Repository" em contexto de frontend que se comunica apenas com BFF via HTTP.

**Exemplo do Erro:**
```typescript
// ❌ CONFUSO: Repository implica acesso a banco de dados
interface IAuthRepository {
  login(credentials: LoginCredentials): Promise<Result<User>>
}

class AuthRepositoryImpl implements IAuthRepository {
  // Faz chamadas HTTP, não acessa BD
}
```

**✅ Solução: Usar nomenclatura API Service**
```typescript
// ✅ CLARO: API Service indica comunicação HTTP
interface AuthApiService {
  login(credentials: LoginCredentials): Promise<Result<User>>
}

class AuthApiServiceImpl implements AuthApiService {
  // Comunica com BFF via HTTP
}
```

**Padrão de nomenclatura adotado:**
```
domain/interfaces/[feature]-api.interface.ts    # Interface
infrastructure/api/[feature]-api.service.ts     # Implementação real
infrastructure/api/[feature]-api.service.fake.ts # Implementação fake
```

**Data da Decisão:** 2026-01-19  
**Documentação:** `docs/dev/ARQUITETURA-FRONTEND-BFF.md`  
**Commit:** `a92a659`

---

## ESLint (lint:strict)

Esta seção cobre erros comuns do ESLint em modo estrito (`npm run lint:strict`). Use para orientar o agent apply-fixes quando a falha for de tipo **lint:strict**.

### ❌ ESLint 1: `no-unused-vars` (variável ou parâmetro não usado)

**Sintoma:**
```
'variableName' is defined but never used.
```

**Causa:** Variável, parâmetro ou import declarado mas não utilizado.

**✅ Solução:** Prefixar com `_` se for parâmetro obrigatório (ex.: `_unusedParam`) ou **remover** a declaração. Imports não usados: **remover** ou usar `import type` quando for apenas tipo.

**Exemplo:**
```typescript
// ❌ ERRO
const [value, setValue] = useState(0)  // setValue nunca usado
function fn(x, y) { return x }         // y não usado

// ✅ CORRETO
const [value, setValue] = useState(0)  // usar setValue ou prefixar _setValue se intencional
function fn(x, _y) { return x }        // ou remover y se opcional
```

---

### ❌ ESLint 2: `no-console`

**Sintoma:**
```
Unexpected console statement.
```

**Causa:** Uso de `console.log`, `console.error`, `console.warn` em código que deve estar limpo para produção.

**✅ Solução:** **Remover** a chamada ou substituir por logger/ferramenta de monitoramento (ex.: Sentry, logger do projeto). Em desenvolvimento, remover antes do commit ou usar ferramenta que seja tree-shaken em prod.

---

### ❌ ESLint 3: `no-explicit-any`

**Sintoma:**
```
Unexpected any. Specify a different type.
```

**Causa:** Uso de tipo `any`, proibido pelo strict TypeScript/ESLint.

**✅ Solução:** Usar `unknown` e type guard quando o tipo for realmente desconhecido, ou definir tipo específico (interface/type). Evitar `any` em favor de tipos explícitos.

**Exemplo:**
```typescript
// ❌ ERRO
function parse(data: any) { return data as Config }

// ✅ CORRETO
function parse(data: unknown): Config {
  if (isConfig(data)) return data
  throw new Error('Invalid config')
}
```

---

### ❌ ESLint 4: `react-hooks/rules-of-hooks`

**Sintoma:**
```
React Hooks must be called in the exact same order in every component render. / Hooks cannot be called conditionally.
```

**Causa:** Hooks (`useState`, `useEffect`, `useCallback`, etc.) chamados condicionalmente, dentro de loops ou após early return.

**✅ Solução:** Mover **sempre** a chamada do hook para o **top level** do componente (não dentro de `if`, `for`, ou após `return`). Condicionar apenas o **conteúdo** passado ao hook ou o resultado do hook.

---

### ❌ ESLint 5: `react-hooks/exhaustive-deps`

**Sintoma:**
```
React Hook useEffect (or useCallback/useMemo) has a missing dependency. Either include it or remove the dependency array.
```

**Causa:** Array de dependências do `useEffect`/`useCallback`/`useMemo` incompleto; variável usada dentro do effect mas não listada.

**✅ Solução:** **Adicionar** a dependência faltante ao array. Se a omissão for intencional (ex.: executar só no mount), usar comentário justificado: `// eslint-disable-next-line react-hooks/exhaustive-deps` com explicação breve (ex.: "run once on mount").

---

### ❌ ESLint 6: `@typescript-eslint/no-empty-object-type`

**Sintoma:**
```
An interface declaring no members is equivalent to its supertype. Use a type alias instead.
```

**Causa:** Interface vazia que apenas estende outro tipo, sem adicionar membros.

**✅ Solução:** **Remover** a interface e usar type alias (ex.: `type X = SuperType`) ou **adicionar** pelo menos uma propriedade à interface se a intenção for extensão futura.

---

### ❌ ESLint 7: `react/no-unescaped-entities`

**Sintoma:**
```
Unescaped entity " (or ', >, etc.) in JSX.
```

**Causa:** Uso de aspas ou caracteres especiais literalmente no texto JSX.

**✅ Solução:** Usar entidade HTML (ex.: `&quot;` para `"`) ou expressão JS (ex.: `{'"'}` ou `{'»'}`). Ex.: `"Don't"` → `Don&apos;t` ou `{"Don't"}`.

**Exemplo:**
```tsx
// ❌ ERRO
<span>Don't use "quotes" here</span>

// ✅ CORRETO
<span>Don&apos;t use &quot;quotes&quot; here</span>
<span>{"Don't use \"quotes\" here"}</span>
```

---

## 🔧 Ferramentas de Diagnóstico

### Verificar Erros de Linter
```bash
# TypeScript
npx tsc --noEmit

# ESLint
npm run lint

# Verificar arquivo específico
npx tsc --noEmit src/path/to/file.tsx
```

### Limpar Cache (quando erros persistem)
```bash
# Limpar cache do Next.js
rm -rf .next

# Limpar cache do TypeScript
rm -rf tsconfig.tsbuildinfo

# Limpar node_modules e reinstalar
rm -rf node_modules package-lock.json
npm install
```

---

## 📚 Recursos Adicionais

### Documentação Oficial
- [TypeScript Handbook - exactOptionalPropertyTypes](https://www.typescriptlang.org/tsconfig#exactOptionalPropertyTypes)
- [TypeScript Handbook - verbatimModuleSyntax](https://www.typescriptlang.org/tsconfig#verbatimModuleSyntax)
- [Next.js 14 Documentation](https://nextjs.org/docs)
- [Radix UI Primitives](https://www.radix-ui.com/primitives)
- [Shadcn/ui Components](https://ui.shadcn.com/)

### Documentação do Projeto
- [Arquitetura Frontend + BFF](./ARQUITETURA-FRONTEND-BFF.md)
- [Estrutura Next.js](./nextjs-estrutura-projeto.md)
- [Relatório de Migração API Service](./RELATORIO-MIGRACAO-API-SERVICE.md)

---

## 🤝 Contribuindo

Ao encontrar um novo erro recorrente:

1. **Documente o erro:**
   - Mensagem completa
   - Causa raiz
   - Solução testada
   - Arquivos afetados
   - Data

2. **Adicione à base:**
   - Crie nova seção se necessário
   - Use formato consistente
   - Inclua exemplos de código
   - Referencie commits/PRs

3. **Atualize o índice**

4. **Notifique a equipe**

---

## 📊 Estatísticas

| Categoria | Erros Documentados | Última Atualização |
|-----------|-------------------|-------------------|
| TypeScript Strict Mode | 9 | 2026-01-19 |
| Next.js e React | 1 | 2026-01-19 |
| Clean Architecture | 1 | 2026-01-19 |
| ESLint (lint:strict) | 7 | 2026-01-19 |
| **Total** | **18** | **2026-01-19** |

---

**Versão:** 1.0.0  
**Última Atualização:** 2026-01-19  
**Mantenedores:** Equipe SoundLink Frontend
