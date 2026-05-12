# Examples — Repository

```ts
export interface IUserRepository {
  getById(id: string): Promise<UserEntity | null>;
  findByEmail(email: string): Promise<UserEntity | null>;
  save(user: UserEntity): Promise<void>;
}
```

