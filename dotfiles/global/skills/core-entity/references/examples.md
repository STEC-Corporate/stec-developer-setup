# Examples — Core Entity

## Exemplo (pseudocódigo TypeScript)

```ts
type Result<T> = { ok: true; value: T } | { ok: false; error: string };

export class UserEntity {
  private constructor(
    public readonly id: string,
    private email: string,
    private active: boolean,
  ) {}

  static create(input: { id: string; email: string }): Result<UserEntity> {
    if (!input.id) return { ok: false, error: 'id_required' };
    if (!input.email.includes('@')) return { ok: false, error: 'email_invalid' };
    return { ok: true, value: new UserEntity(input.id, input.email, true) };
  }

  changeEmail(email: string): Result<void> {
    if (!email.includes('@')) return { ok: false, error: 'email_invalid' };
    this.email = email;
    return { ok: true, value: undefined };
  }
}
```

