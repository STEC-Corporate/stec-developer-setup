# Examples — CQRS Query

```ts
export type ListUsersQueryInput = { search?: string; limit: number; offset: number };
export type ListUsersQueryOutput = { items: Array<{ id: string; email: string }>; total: number };
```

