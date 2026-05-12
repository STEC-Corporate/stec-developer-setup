# Examples — Use Case

```ts
export class CreateUserUseCase {
  constructor(private readonly repo: IUserRepository) {}

  async execute(input: CreateUserInputDto): Promise<Result<CreateUserOutputDto>> {
    const email = EmailVO.create(input.email);
    if (!email.ok) return { ok: false, error: email.error };

    const existing = await this.repo.findByEmail(email.value.toString());
    if (existing) return { ok: false, error: 'user_already_exists' };

    const user = UserEntity.create({ id: crypto.randomUUID(), email: email.value.toString() });
    if (!user.ok) return { ok: false, error: user.error };

    await this.repo.save(user.value);
    return { ok: true, value: { id: user.value.id, email: email.value.toString(), name: input.name } };
  }
}
```

