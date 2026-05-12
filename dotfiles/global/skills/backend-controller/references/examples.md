# Examples — NestJS Controller (esqueleto)

```ts
@ApiTags('users')
@Controller('users')
export class UsersController {
  constructor(private readonly createUser: CreateUserUseCase) {}

  @Post()
  async create(@Body() body: CreateUserHttpDto) {
    const result = await this.createUser.execute({ email: body.email, name: body.name });
    if (!result.ok) throw new BadRequestException(result.error);
    return result.value;
  }
}
```

