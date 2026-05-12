# 💬 Playbook: Diretrizes de Comunicação

> **Script de decisão para comunicação com usuários (notificações, emails, mensagens, help text)**

---

## 🎯 Quando Usar Este Playbook

Use este playbook ao criar:
- ✅ Notificações push/in-app
- ✅ Emails transacionais ou marketing
- ✅ Mensagens de erro
- ✅ Tooltips e help text
- ✅ Modais de confirmação
- ✅ Mensagens do sistema

---

## 🛡️ Princípios de Comunicação (Guardrails)

### ✅ SEMPRE

- ✅ Tom profissional mas amigável ("você" em vez de "o usuário")
- ✅ Transparência total (nunca esconder informações)
- ✅ Linguagem clara e sem jargão técnico
- ✅ Explicar O QUÊ + POR QUÊ + COMO RESOLVER
- ✅ Incluir próximo passo claro (CTA)

### ❌ NUNCA

- ❌ Tom condescendente ou infantil
- ❌ Culpar o usuário por erros
- ❌ Prometer o que não pode cumprir
- ❌ Usar jargão técnico sem explicar
- ❌ Deixar usuário sem saber o que fazer

---

## 📧 1. Emails

### Email Transacional (Confirmação, Reset de Senha, etc.)

```markdown
**Estrutura**:
1. Assunto claro (40-50 caracteres)
2. Cumprimento personalizado
3. Corpo objetivo
4. CTA claro
5. Informações adicionais (opcional)
6. Assinatura

**Template**:

Assunto: [Ação] realizado(a) com sucesso

Olá [Nome],

[Explicar o que aconteceu de forma clara]

[CTA - Botão ou link]

[Informação adicional se necessário]

Atenciosamente,
Equipe Modelo

---
Dúvidas? Responda este email ou acesse nossa Central de Ajuda.
```

**Exemplo Bom** ✅:
```
Assunto: Sua proposta foi aceita!

Olá João,

Ótima notícia! O contratante Maria Silva aceitou sua proposta para o evento "Casamento - São Paulo" no dia 15/02/2026.

[Ver Detalhes do Evento]

Próximos passos:
1. Confirme sua disponibilidade até 23/01/2026
2. Revise os detalhes do evento
3. Prepare seu equipamento

Qualquer dúvida, estamos à disposição!

Atenciosamente,
Equipe Modelo
```

**Exemplo Ruim** ❌:
```
Assunto: Notificação

Olá,

Uma ação foi realizada na sua conta.

Clique aqui.

Modelo
```

---

### Email de Marketing/Engajamento

```markdown
**Estrutura**:
1. Assunto chamativo mas honesto
2. Preview text complementar
3. Cabeçalho visual (se houver)
4. Problema/Oportunidade
5. Solução/Benefício
6. CTA principal
7. Benefícios secundários
8. CTA secundário
9. Rodapé com descadastro

**Princípios**:
- Valor ANTES de pedir ação
- Personalização baseada em dados reais
- Segmentação por perfil (músico vs contratante)
```

**Exemplo para Músico** ✅:
```
Assunto: 3 novas oportunidades na sua região 🎵

Preview: Eventos de jazz em São Paulo esperando sua proposta

---

Olá João!

Há 3 novos eventos de jazz em São Paulo que combinam perfeitamente com seu perfil:

🎸 Casamento - R$ 800-1.200 - 15/02
🎹 Evento Corporativo - R$ 1.500-2.000 - 22/02
🎤 Bar/Restaurante - R$ 500-800 - Todo sábado

[Ver Oportunidades]

Por que você?
✓ Você toca jazz
✓ Localização compatível (até 20km)
✓ Seu calendário está livre nessas datas

[Enviar Proposta Agora]

Dica: Músicos que respondem em até 4h têm 3x mais chance de serem contratados.

Boa sorte!
Equipe Modelo

---
Não quer receber essas notificações? [Ajustar preferências]
```

---

## 🔔 2. Notificações Push/In-App

### Princípios

```
SE notificação:
  - Máximo 50 caracteres (título)
  - Máximo 100 caracteres (corpo)
  - Acionável (não só informativa)
  - Timing relevante (não 3am)
```

### Tipos e Templates

#### Notificação de Ação Necessária (Alta Prioridade)

```
✅ Título: "Proposta expira em 4h"
   Corpo: "Responda a proposta de Maria para Casamento em 15/02"
   CTA: [Responder Agora]

❌ Título: "Alerta"
   Corpo: "Você tem uma notificação pendente"
```

#### Notificação Informativa (Média Prioridade)

```
✅ Título: "Proposta aceita! 🎉"
   Corpo: "Maria aceitou sua proposta. Confirme até 23/01"
   CTA: [Ver Detalhes]

❌ Título: "Atualização"
   Corpo: "Algo mudou no sistema"
```

#### Notificação de Engajamento (Baixa Prioridade)

```
✅ Título: "Complete seu perfil (80%)"
   Corpo: "Adicione portfólio e aumente suas chances em 40%"
   CTA: [Completar Agora]

❌ Título: "Olá!"
   Corpo: "Temos novidades para você"
```

---

## ⚠️ 3. Mensagens de Erro

### Anatomia do Erro Perfeito

```
1. O QUE aconteceu (claro e direto)
2. POR QUÊ aconteceu (se relevante)
3. COMO resolver (ação concreta)
4. Alternativa (se houver)
```

### Tipos de Erro

#### Erro de Validação (Usuário)

```
✅ BOM:
"Telefone inválido
O número deve ter 11 dígitos com DDD.
Exemplo: (11) 98765-4321"

❌ RUIM:
"Erro de validação no campo telefone"
```

#### Erro de Sistema (Servidor)

```
✅ BOM:
"Não foi possível salvar suas alterações
Nosso servidor está temporariamente indisponível.

O que fazer:
1. Suas alterações foram salvas localmente
2. Tente novamente em 1 minuto
3. Se persistir, entre em contato"

❌ RUIM:
"Error 500: Internal Server Error"
```

#### Erro de Permissão

```
✅ BOM:
"Você não tem permissão para editar este projeto
Apenas o criador do projeto pode editá-lo.

Alternativas:
- Solicitar permissão ao criador
- Criar seu próprio projeto"

❌ RUIM:
"Acesso negado"
```

#### Erro de Rede

```
✅ BOM:
"Sem conexão com internet
Verifique sua conexão e tente novamente.

Dica: Suas alterações serão sincronizadas automaticamente quando voltar online."

❌ RUIM:
"Network error"
```

---

## 💬 4. Tooltips

### Regras

```
- Máximo 1-2 frases
- Explicar PARA QUÊ serve (não O QUE é)
- Evitar óbvio
- Foco no benefício
```

### Exemplos

#### Campo de Formulário

```
✅ BOM:
title="Seu nome artístico aparecerá nas buscas e propostas"
data-tooltip="Use o nome pelo qual você é conhecido profissionalmente"

❌ RUIM:
title="Digite seu nome artístico"
```

#### Botão

```
✅ BOM:
title="Enviar proposta"
data-tooltip="Contratante será notificado e terá 7 dias para responder"

❌ RUIM:
title="Clique aqui"
```

#### Campo Opcional

```
✅ BOM:
title="Adicionar links de vídeos"
data-tooltip="Perfis com vídeos recebem 3x mais propostas"

❌ RUIM:
title="Campo opcional"
```

---

## 📋 5. Help Text (Textos de Ajuda)

### Quando Usar

```
SE campo/feature é:
  - Complexo (precisa de explicação maior)
  - Tem benefício não-óbvio
  - Usuários perguntam frequentemente

ENTÃO criar help text detalhado
```

### Estrutura

```markdown
## [Nome da Feature]

**O que faz**:
[Explicação clara em 1 frase]

**Como usar**:
1. [Passo 1]
2. [Passo 2]
3. [Passo 3]

**Dicas**:
- [Dica 1]
- [Dica 2]

**Exemplo**:
[Caso de uso concreto]
```

**Exemplo** ✅:
```markdown
## Sistema de Propostas

**O que faz**:
Permite que músicos enviem propostas para eventos e contratantes avaliem.

**Como usar**:
1. Veja eventos compatíveis com seu perfil
2. Clique em "Enviar Proposta"
3. Defina seu cachê e condições
4. Aguarde resposta em até 7 dias

**Dicas**:
- Propostas respondidas em <4h têm 3x mais chance de aceite
- Inclua link de vídeo para aumentar credibilidade
- Seja claro sobre equipamento que você leva

**Exemplo**:
Maria viu um casamento em SP para 15/02. Ela enviou proposta com cachê de R$ 1.200, incluiu vídeo de casamento anterior e foi aceita em 2h.
```

---

## ✅ 6. Modais de Confirmação

### Estrutura

```markdown
**Título**: [Ação que será tomada]
**Corpo**: [Explicação + Consequência]
**Botões**: 
- Primário (confirma ação)
- Secundário (cancela)
```

### Ações Destrutivas (Deletar, Cancelar)

```
✅ BOM:
Título: "Cancelar proposta?"
Corpo: "Você está prestes a cancelar sua proposta para o evento 'Casamento - SP'.

Consequências:
- O contratante será notificado
- Você não poderá enviar nova proposta para este evento
- Esta ação não pode ser desfeita

Tem certeza?"

[Sim, Cancelar] [Não, Manter]

❌ RUIM:
"Confirmar ação?"
[OK] [Cancelar]
```

### Ações Importantes (Aceitar Proposta, Confirmar Evento)

```
✅ BOM:
Título: "Aceitar proposta de R$ 1.200?"
Corpo: "Você está aceitando a proposta de João Silva para tocar no seu casamento em 15/02/2026.

Próximos passos:
1. Contrato será gerado automaticamente
2. Pagamento entrará em garantia
3. Você poderá conversar com João

Detalhes:
- Cachê: R$ 1.200 (pago após evento)
- Local: Salão Eventos - São Paulo
- Horário: 19h às 23h"

[Aceitar Proposta] [Revisar Detalhes]
```

---

## 📊 Tom de Voz por Situação

### Situação Positiva (Sucesso, Conquista)

```
Tom: Celebrativo mas profissional

✅ "Parabéns! Sua proposta foi aceita"
✅ "Sucesso! Perfil atualizado"
✅ "Ótima notícia! Você recebeu nova proposta"

❌ "Proposta aceita"
❌ "Operação concluída"
```

### Situação Neutra (Informação)

```
Tom: Claro e direto

✅ "Sua disponibilidade foi atualizada"
✅ "Proposta enviada. Aguarde resposta em até 7 dias"

❌ "Ação realizada com sucesso no sistema"
```

### Situação Negativa (Erro, Problema)

```
Tom: Empático e solucionador

✅ "Não foi possível enviar sua proposta. Verifique sua conexão e tente novamente"
✅ "Proposta não foi aceita. Veja outras oportunidades disponíveis"

❌ "Erro ao processar"
❌ "Falha na operação"
```

### Situação de Alerta (Atenção Necessária)

```
Tom: Urgente mas não alarmista

✅ "Sua proposta expira em 4 horas. Responda agora"
✅ "Pagamento pendente. Complete até 23/01 para garantir vaga"

❌ "ATENÇÃO!"
❌ "URGENTE!!!"
```

---

## 🌍 Linguagem Inclusiva

### Evitar Viés de Gênero

```
✅ "Músico(a)"
✅ "Contratante"
✅ "Profissional"

❌ "O músico" (assume masculino)
❌ "A secretária" (assume feminino)
```

### Acessibilidade

```
✅ Texto alternativo em imagens
✅ Contraste adequado (WCAG AA)
✅ Linguagem simples (6º ano de escolaridade)

❌ Só ícones sem texto
❌ Texto cinza claro em fundo branco
❌ Jargão técnico complexo
```

---

## 📏 Limites de Caracteres

| Tipo | Limite | Motivo |
|------|--------|--------|
| Push Notification (título) | 50 | Mobile trunca |
| Push Notification (corpo) | 100 | Mobile trunca |
| Email subject | 50-60 | Inbox trunca |
| Email preview | 90-100 | Inbox trunca |
| Tooltip | 120 | UX |
| Button label | 20-25 | Mobile layout |
| Toast message | 80 | Auto-dismiss timing |

---

## ✅ Checklist de Qualidade

Antes de aprovar qualquer texto:

### Clareza
- [ ] Uma pessoa de fora entenderia?
- [ ] Sem jargão técnico desnecessário?
- [ ] Próximo passo está claro?

### Tom
- [ ] Profissional mas amigável?
- [ ] Não culpa o usuário?
- [ ] Empático se for erro?

### Ação
- [ ] CTA claro e visível?
- [ ] Usuário sabe O QUÊ fazer?
- [ ] Usuário sabe POR QUÊ fazer?

### Transparência
- [ ] Explica o que aconteceu?
- [ ] Explica consequências?
- [ ] Não esconde informação?

### Técnico
- [ ] Dentro do limite de caracteres?
- [ ] Sem erros de português?
- [ ] Acessível (contraste, alt text)?

---

## 📚 Recursos Relacionados

- [Guardrails](../guardrails.md) - Princípio de transparência
- [Brand Voice Guide](../../referencia/) - Tom de voz da marca (se existir)

---

**Criado em**: 20/01/2026  
**Versão**: 1.0  
**Revisão**: Semestral

---

## 💡 Exemplos Rápidos

### Email de Boas-Vindas

```
Assunto: Bem-vindo(a) à Modelo, João! 🎵

Olá João!

Seja bem-vindo à Modelo, a plataforma que conecta músicos a oportunidades reais.

Próximos passos para começar:
1. Complete seu perfil (5 min)
2. Adicione vídeos do seu trabalho
3. Defina sua disponibilidade

[Completar Perfil Agora]

Dica: Perfis completos recebem 5x mais propostas!

Qualquer dúvida, estamos aqui para ajudar.

Boas-vindas,
Equipe Modelo
```

### Notificação de Nova Mensagem

```
Título: "Nova mensagem de Maria"
Corpo: "Sobre evento 'Casamento - 15/02'"
CTA: [Responder]
```

### Erro de Upload

```
"Não foi possível enviar o vídeo

O arquivo excede o limite de 50MB.

Como resolver:
1. Comprima o vídeo usando [ferramenta X]
2. Ou faça upload no YouTube e cole o link

Precisa de ajuda? [Central de Ajuda]"
```
