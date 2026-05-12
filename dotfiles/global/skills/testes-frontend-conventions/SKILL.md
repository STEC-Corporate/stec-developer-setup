---
name: testes-frontend-conventions
description: Convenções, exemplos e configurações de testes para o frontend SoundLink (Jest + React Testing Library + Playwright). Use ao escrever ou revisar testes unitários, de integração ou E2E no template.
---

# Convenções de Testes — Frontend SoundLink Template

## Quando Usar

- Ao escrever testes unitários para hooks, services ou componentes
- Ao escrever testes E2E com Playwright
- Ao revisar cobertura e qualidade de testes existentes
- Ao configurar Jest ou Playwright num novo contexto

## Organização de Testes

```
tests/
├── unit/
│   ├── domain/
│   │   ├── entities/user.entity.test.ts
│   │   └── services/auth.domain-service.test.ts
│   ├── application/
│   │   ├── use-cases/login.use-case.test.ts
│   │   └── hooks/use-auth.test.ts
│   └── infrastructure/
│       └── repositories/auth.repository.impl.test.ts
├── integration/
│   ├── features/authentication.integration.test.ts
│   └── api/auth.api.test.ts
└── e2e/
    ├── user-flows/login-flow.spec.ts
    └── critical-paths/booking-flow.spec.ts
```

## Nomenclatura (obrigatório)

```typescript
describe('UserRepository', () => {
  describe('when finding user by ID', () => {
    it('should return user when ID exists', async () => { ... })
    it('should return null when ID does not exist', async () => { ... })
    it('should throw error when ID is invalid format', async () => { ... })
  })
})
```

## Unit Tests — Jest + React Testing Library

### Custom Render com Providers

```typescript
function renderWithProviders(ui: React.ReactElement, options = {}) {
  function Wrapper({ children }: { children: React.ReactNode }) {
    return (
      <QueryProvider>
        <AuthProvider>{children}</AuthProvider>
      </QueryProvider>
    )
  }
  return render(ui, { wrapper: Wrapper, ...options })
}
```

### User Events (preferir sobre fireEvent)

```typescript
import userEvent from '@testing-library/user-event'

test('should handle form submission', async () => {
  const user = userEvent.setup()
  renderWithProviders(<LoginForm />)

  await user.type(screen.getByLabelText('Email'), 'test@example.com')
  await user.type(screen.getByLabelText('Senha'), 'password123')
  await user.click(screen.getByRole('button', { name: 'Entrar' }))

  expect(await screen.findByText('Login realizado')).toBeInTheDocument()
})
```

### Testing Hooks

```typescript
import { renderHook, waitFor } from '@testing-library/react'

test('useAuth hook should handle login', async () => {
  const { result } = renderHook(() => useAuth(), { wrapper: AuthProvider })

  act(() => { result.current.login('user@test.com', 'password') })

  await waitFor(() => {
    expect(result.current.isAuthenticated).toBe(true)
  })
})
```

### API Service Test

```typescript
describe('UserApiService', () => {
  let userService: UserApiService
  let mockHttpClient: jest.Mocked<HttpClient>

  beforeEach(() => {
    mockHttpClient = { get: jest.fn(), post: jest.fn(), put: jest.fn(), delete: jest.fn() }
    userService = new UserApiServiceImpl(mockHttpClient)
  })

  it('should return user when API responds successfully', async () => {
    const mockUser = { id: '1', email: 'test@example.com', name: 'Test User' }
    mockHttpClient.get.mockResolvedValue({ success: true, data: mockUser })

    const result = await userService.getById('1')

    expect(result.success).toBe(true)
    if (result.success) expect(result.data).toEqual(mockUser)
    expect(mockHttpClient.get).toHaveBeenCalledWith('/users/1')
  })

  it('should return error when user ID is empty', async () => {
    const result = await userService.getById('')

    expect(result.success).toBe(false)
    expect(mockHttpClient.get).not.toHaveBeenCalled()
  })
})
```

### Factory Pattern para Test Data

```typescript
class UserFactory {
  static create(overrides: Partial<User> = {}): User {
    return {
      id: 'test-user-id',
      email: 'test@example.com',
      name: 'Test User',
      createdAt: new Date(),
      ...overrides,
    }
  }

  static createMany(count: number, overrides: Partial<User> = {}): User[] {
    return Array.from({ length: count }, (_, i) =>
      this.create({ id: `test-user-${i}`, email: `user${i}@example.com`, ...overrides })
    )
  }
}
```

## E2E Tests — Playwright

### Locators (obrigatório — role-based)

```typescript
// ✅ SEMPRE usar role-based
await page.getByRole('button', { name: 'Salvar' })
await page.getByLabel('Email')
await page.getByTestId('user-profile')

// ❌ EVITAR complex selectors
await page.locator('.complex > .selector[data-state="active"]')
```

### Web-first Assertions (obrigatório)

```typescript
await expect(page.getByRole('alert')).toBeVisible()
await expect(page.getByText('Sucesso')).toHaveText('Operação realizada com sucesso')
await expect(page).toHaveURL('/dashboard')
```

### Page Object Model (para fluxos complexos)

```typescript
class LoginPage {
  constructor(private page: Page) {}

  async navigate() { await this.page.goto('/login') }

  async fillCredentials(email: string, password: string) {
    await this.page.getByLabel('Email').fill(email)
    await this.page.getByLabel('Senha').fill(password)
  }

  async submit() {
    await this.page.getByRole('button', { name: 'Entrar' }).click()
  }

  async expectSuccessfulLogin() {
    await expect(this.page).toHaveURL('/dashboard')
    await expect(this.page.getByTestId('user-menu')).toBeVisible()
  }
}
```

### Estrutura de Teste E2E

```typescript
test.describe('Authentication Flow', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/login')
  })

  test('should login successfully with valid credentials', async ({ page }) => {
    const loginPage = new LoginPage(page)
    await loginPage.fillCredentials('user@example.com', 'validpassword')
    await loginPage.submit()
    await loginPage.expectSuccessfulLogin()
  })
})
```

### Atenção: E2E requer servidor rodando

```bash
# Terminal 1
npm run dev

# Terminal 2
npm run test:e2e
```

## Test Doubles Strategy

- **Mock API services** para isolar lógica de apresentação.
- **Stub HTTP clients** para testar comunicação com APIs.
- **Fake implementations** para testes rápidos.
- **Spy functions** para verificar chamadas a microsserviços.

## Coverage — Quality Gates

| Camada | Branches | Functions | Lines |
|--------|----------|-----------|-------|
| API Services/Application | 85% | 90% | 80% |
| Infrastructure/HTTP Clients | 70% | 80% | 70% |
| Custom Hooks | 85% | 90% | 85% |
| Overall | 80% | 85% | 75% |

## Configuração Jest (referência)

```typescript
module.exports = {
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/jest.setup.ts'],
  moduleNameMapper: { '^@/(.*)$': '<rootDir>/src/$1' },
  collectCoverageFrom: [
    'src/**/*.{ts,tsx}',
    '!src/**/*.d.ts',
    '!src/**/*.stories.{ts,tsx}',
  ],
  coverageThreshold: {
    global: { branches: 80, functions: 85, lines: 75, statements: 75 },
    './src/services/': { branches: 85, functions: 90, lines: 80, statements: 80 },
  },
}
```

## Configuração Playwright (referência)

```typescript
export default defineConfig({
  testDir: './tests/e2e',
  timeout: 30 * 1000,
  expect: { timeout: 5000 },
  fullyParallel: true,
  retries: process.env.CI ? 2 : 0,
  use: { baseURL: 'http://localhost:3000', trace: 'on-first-retry' },
  projects: [
    { name: 'chromium', use: { ...devices['Desktop Chrome'] } },
    { name: 'firefox', use: { ...devices['Desktop Firefox'] } },
    { name: 'webkit', use: { ...devices['Desktop Safari'] } },
    { name: 'mobile', use: { ...devices['iPhone 13'] } },
  ],
})
```

## Regras Críticas

15. OBRIGATÓRIO nomenclatura descritiva e comportamental (`should ... when ...`).
16. SEMPRE usar role-based locators no Playwright (`getByRole`, `getByLabel`).
17. PREFERIR `getByTestId` quando `data-testid` estiver disponível.
18. ESSENCIAL usar web-first assertions (`toBeVisible`, `toHaveText`).
19. EVITAR hardcoded timeouts — usar `waitFor` com condições específicas.
20. IMPLEMENTAR setup/teardown com `beforeEach`/`afterEach`.
21. EXTRAIR lógica reutilizável em helper functions com JSDoc.
22. GARANTIR testes paralelos sem conflitos de estado.

## Checklist de Saída

- [ ] Nomenclatura descritiva e comportamental.
- [ ] Unit tests cobrem serviços, hooks e transformers.
- [ ] Mocks via Factory Pattern ou `jest.fn()`.
- [ ] E2E usa role-based locators e web-first assertions.
- [ ] Coverage dentro dos gates definidos.
- [ ] Setup/teardown limpos (`beforeEach`/`afterEach`).
