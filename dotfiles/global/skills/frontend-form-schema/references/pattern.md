# Pattern — Form + Schema (Frontend)

## UX obrigatório
- Mensagens de erro específicas por campo
- Estado de submit: desabilitar botão, mostrar progresso
- Foco no primeiro erro após submit
- Feedback de sucesso (toast/alert) sem perder dados

## Acessibilidade
- `label` associado ao input
- `aria-invalid` quando inválido
- Texto de erro com `aria-describedby`

## Contrato API
- Mapear erros do backend (códigos estáveis) para mensagens do usuário
- Evitar acoplamento do texto do backend no frontend

