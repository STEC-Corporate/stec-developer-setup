---
name: code-aplicar-ui-ux-patterns
description: Aplica padrão universal de UI/UX automaticamente. Use ao criar componentes de criação/visualização, ao refatorar componentes existentes, ou ao validar se componentes seguem padrões obrigatórios.
---

# Aplicar Padrão Universal de UI/UX

## Quando Usar

- Ao criar componentes de criação/visualização
- Ao refatorar componentes existentes para seguir padrões
- Ao validar se componentes seguem padrões obrigatórios
- Ao corrigir inconsistências de UI/UX

## Padrões Obrigatórios

### 1. Botão Criar → Modal

**Padrão**: Botão "Criar" sempre abre modal com formulário completo.

**Implementação**:
```typescript
import { useProfileButtonColor } from '@/hooks/use-profile-button-color'

function MyComponent() {
  const { buttonClasses } = useProfileButtonColor()
  const [showCreateModal, setShowCreateModal] = useState(false)
  
  return (
    <>
      <Button 
        onClick={() => setShowCreateModal(true)}
        className={buttonClasses}
        title="Criar nova entidade"
        data-tooltip="Abre modal para criar uma nova entidade"
      >
        Criar [Entidade]
      </Button>
      
      <FormModal
        open={showCreateModal}
        onClose={() => setShowCreateModal(false)}
        title="Nova [Entidade]"
        onSubmit={handleCreate}
      >
        {/* Formulário completo */}
      </FormModal>
    </>
  )
}
```

**Cores**: Usar cor do perfil (hook `useProfileButtonColor()`)

### 2. Card Clicável → Modal Detalhes

**Padrão**: Cards clicáveis abrem modal de detalhes com CRUD completo.

**Implementação**:
```typescript
<Card 
  onClick={() => setShowDetailsModal(item)}
  className="cursor-pointer hover:shadow-md transition-shadow"
>
  {/* Informações RESUMIDAS apenas */}
  <div className="font-medium">{item.title}</div>
  <div className="text-sm text-muted-foreground">{item.subtitle}</div>
</Card>

<DetailsModal
  open={!!showDetailsModal}
  onClose={() => setShowDetailsModal(null)}
  title="Detalhes da [Entidade]"
  onEdit={() => handleEdit(showDetailsModal)}
  onDelete={() => handleDelete(showDetailsModal)}
>
  {/* TODAS as informações DETALHADAS */}
</DetailsModal>
```

### 3. Tooltips em Todos os Campos e Botões

**Padrão**: Todos os campos e botões devem ter tooltips explicativos.

**Implementação**:
```typescript
<Input
  placeholder="Digite o valor"
  title="Campo de valor"
  data-tooltip="Digite o valor numérico sem símbolos de moeda"
/>

<Button
  title="Salvar alterações"
  data-tooltip="Salva as alterações feitas no formulário"
>
  Salvar
</Button>
```

**Regra**: Títulos e descrições NÃO têm tooltips (são autoexplicativos).

### 4. TabHelpButton em Todas as Abas

**Padrão**: Todas as abas principais e sub-abas devem ter TabHelpButton.

**Implementação**:
```typescript
<div className="flex items-center gap-2">
  <h3 className="text-lg font-semibold">[Nome da Aba]</h3>
  <TabHelpButton 
    helpText="Descrição da funcionalidade"
    helpLink="/help/[feature]/[page]"
  />
</div>
```

### 5. Cores de Botões

**Padrão**:
- **Botões que abrem modais**: Cor do perfil (usar `useProfileButtonColor()`)
- **Botões que navegam**: CINZA (`variant="outline"` com `bg-gray-100`)

**Cores por Perfil**:
- Músico: Verde `#2D7A4F` / hover `#1A4A2F`
- Contratante: Azul `#3B82F6` / hover `#2563EB`
- Profissionais: Roxo `#A855F7` / hover `#9333EA`
- Admin: Vermelho `#EF4444` / hover `#DC2626`

**Implementação**:
```typescript
// Modal (cor do perfil)
const { buttonClasses } = useProfileButtonColor()
<Button className={buttonClasses}>Criar</Button>

// Navegação (cinza)
<Button 
  variant="outline" 
  className="bg-gray-100 hover:bg-gray-200 text-gray-700 border-gray-300"
  asChild
>
  <Link href="/outra-pagina">Acessar</Link>
</Button>
```

### 6. Margens Padrão

**Padrão**: `w-full px-4 py-6 sm:px-6 lg:px-6`

**Implementação**:
```typescript
<div className="w-full px-4 py-6 sm:px-6 lg:px-6 space-y-6">
  {/* Conteúdo */}
</div>
```

**Regra**: NÃO usar `container mx-auto` - sempre usar `w-full`.

### 7. Títulos e Descrições

**Padrão**:
- Títulos: `text-2xl font-bold`
- Descrições: `text-sm text-muted-foreground`
- Título sempre seguido de descrição

**Implementação**:
```typescript
<div className="space-y-2">
  <h2 className="text-2xl font-bold">Título da Seção</h2>
  <p className="text-sm text-muted-foreground">
    Descrição explicativa do que a seção faz ou exibe
  </p>
</div>
```

### 8. Barra de Busca Padrão

**Padrão**: Container com `flex flex-wrap gap-4 p-4 border rounded-lg bg-card`

**Implementação**:
```typescript
<div className="flex flex-wrap gap-4 p-4 border rounded-lg bg-card items-center mb-6">
  <div className="relative flex-grow min-w-[200px] sm:min-w-[250px]">
    <Search className="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground" />
    <Input
      type="search"
      placeholder="Buscar por nome, função..."
      className="w-full rounded-lg bg-background pl-8"
    />
  </div>
  <div className="min-w-[180px] flex-grow sm:flex-grow-0">
    <Select>
      {/* Filtros */}
    </Select>
  </div>
</div>
```

### 9. Botões de Ação Sempre Visíveis

**Padrão**: Botões de ação devem estar sempre visíveis, mesmo quando aba está vazia.

**Implementação**:
```typescript
{items.length === 0 ? (
  <div className="text-center py-8">
    <p className="text-muted-foreground mb-4">Nenhum item encontrado</p>
    <Button 
      className={buttonClasses}
      onClick={() => setShowCreateModal(true)}
    >
      Criar Primeiro Item
    </Button>
  </div>
) : (
  // Lista de cards...
)}
```

## Checklist de Validação

- [ ] Botão "Criar" abre modal (cor do perfil)
- [ ] Cards clicáveis abrem modal de detalhes
- [ ] Modal de detalhes tem CRUD completo
- [ ] Todos os campos têm tooltips
- [ ] Todos os botões têm tooltips
- [ ] Todas as abas têm TabHelpButton
- [ ] Cores corretas (perfil vs navegação)
- [ ] Margens padrão aplicadas
- [ ] Títulos e descrições no formato correto
- [ ] Barra de busca segue padrão (quando aplicável)
- [ ] Botões de ação sempre visíveis

## Referências

- **Regras resumidas (Tailwind/UI)**: `.cursor/rules/frontend-tailwind-ui.mdc`
- **Cores Referência**: `docs/gestao-ideias/04-referencia-tecnica/referencia/dev/components/cores-referencia-hexadecimal.md`
- **Feature Checklist**: `docs/gestao-ideias/04-referencia-tecnica/_templates/feature-checklist.md` (Fase 4)

## Quando usar
- Use quando a tarefa estiver alinhada ao objetivo da skill.
- Use quando for necessario padrao tecnico e repetibilidade.

## Pre-condicoes
- Escopo e contexto da tarefa definidos.
- Arquivos-alvo identificados.
- Criterios de aceite minimos estabelecidos.

## Checklist de saida
- Resultado entregue e verificavel.
- Evidencias objetivas registradas.
- Riscos e proximos passos documentados.

## Cobertura de stack e dominio
- Stacks suportadas: Java, Kotlin, Python, TypeScript, React, React Native, NextJS, NestJS.
- Dominios: backend, frontend e mobile.

