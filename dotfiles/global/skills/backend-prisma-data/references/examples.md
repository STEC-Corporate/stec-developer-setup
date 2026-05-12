# Examples — Prisma Model (snippet)

```prisma
model User {
  id    String @id @default(uuid())
  email String @unique
  name  String
}
```

