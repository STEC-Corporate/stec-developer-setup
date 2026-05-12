# Examples — Value Object

```ts
type Result<T> = { ok: true; value: T } | { ok: false; error: string };

export class EmailVO {
  private constructor(private readonly value: string) {}

  static create(input: string): Result<EmailVO> {
    const v = (input ?? '').trim().toLowerCase();
    if (!v.includes('@')) return { ok: false, error: 'email_invalid' };
    return { ok: true, value: new EmailVO(v) };
  }

  toString() {
    return this.value;
  }

  equals(other: EmailVO) {
    return this.value === other.value;
  }
}
```

