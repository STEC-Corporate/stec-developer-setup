# AI-ProjectDeveloper como submodule (`.cursor/`) — Guia de uso e configuração

Este repositório (`AI-ProjectDeveloper`) é consumido nos projetos da holding STEC como **submodule Git** montado no caminho **`.cursor/`** do repositório pai.

## Como adicionar este repositório como submodule no projeto pai (primeira vez)

Na raiz do repositório pai:

```bash
# Adiciona o AI-ProjectDeveloper como submodule no caminho .cursor
git submodule add https://github.com/STEC-Corporate/AI-ProjectDeveloper .cursor
# Inicializa/baixa o conteúdo do submodule recém-adicionado
git submodule update --init --recursive
```

Resultado esperado no repo pai:

- Este repo (`AI-ProjectDeveloper`) aparece como diretório `.cursor/`
- As pastas internas viram:
  - `.cursor/agents/`
  - `.cursor/skills/`
  - `.cursor/rules/`
  - `.cursor/plans/`

## Conceito-chave (por que “não baixou no pull”?)

- O repositório pai não “copia” o conteúdo do submodule: ele guarda um **ponteiro (SHA de commit)** para o submodule.
- Por padrão, `git pull` atualiza **apenas** o repositório pai; o conteúdo do submodule **não é atualizado automaticamente**, a menos que você use recursão/configuração.

## Fluxo recomendado (onboarding)

### Clonar um repo pai já trazendo os submodules

Exemplo (repo pai real):

```bash
git clone --recurse-submodules https://github.com/STEC-Corporate/soundlink-template-frontend.git
```

Se você já clonou sem `--recurse-submodules`:

```bash
cd soundlink-template-frontend
git submodule update --init --recursive
```

## Configuração global recomendada (por dev, uma vez)

```bash
# Recomendado: atualizar submodules automaticamente no pull/fetch
git config --global submodule.recurse true
git config --global fetch.recurseSubmodules on-demand

# Opcional: melhorar visibilidade de mudanças em submodules
# Apesar de Opcional, sempre vamos configurar nos projetos STEC.
git config --global diff.submodule log
git config --global status.submoduleSummary true
```

## Fluxo diário (após `pull` no repo pai)

Se alguém fez `git pull` e o `.cursor/` ficou vazio/desatualizado:

```bash
git pull
git submodule sync --recursive
git submodule update --init --recursive
```

Alternativa em um comando (quando você *não* quer esquecer do recurse):

```bash
git pull --recurse-submodules
```

## Política / boas práticas (padrão STEC)

- **Não edite** conteúdo do submodule “por acidente” dentro do repo pai.
  - Se você precisa alterar `AI-ProjectDeveloper`, faça isso no próprio repositório dele (ou entrando no diretório `.cursor/` e tratando como repo Git separado), depois atualize o ponteiro no repo pai.
- O repo pai deve versionar **apenas o SHA** do submodule (o commit apontado), garantindo reprodutibilidade.

## Troubleshooting rápido

- **Submodule não inicializou (pasta existe, mas conteúdo não)**:

```bash
git submodule update --init --recursive
```

- **URLs/paths de submodules mudaram (após mudança no `.gitmodules`)**:

```bash
git submodule sync --recursive
git submodule update --init --recursive
```

---

## Conteúdo incorporado de AI-Develop-Resources

Guia homólogo do repositório **AI-Develop-Resources** (catálogo AcoustiCore). Mantém-se acima o fluxo **STEC / AI-ProjectDeveloper**; abaixo estão diferenças e comandos equivalentes para quem replica o catálogo-fonte.

> Importante: no repositório **AI-Develop-Resources**, a estrutura vive na **raiz** (`agents/`, `skills/`, `rules/`, etc.). Ao ser adicionado como submodule no projeto pai em `.cursor/`, esses mesmos caminhos passam a existir como `.cursor/agents/`, `.cursor/skills/`, `.cursor/rules/` e assim por diante.

### Submodule do catálogo-fonte (URL de referência)

Na raiz do repositório pai:

```bash
# Adiciona o AI-Develop-Resources como submodule no caminho .cursor
git submodule add https://github.com/jcjesus/AI-Develop-Resources.git .cursor
# Inicializa/baixa o conteúdo do submodule recém-adicionado
git submodule update --init --recursive
```

### Clonar repo pai (exemplo genérico, origem)

```bash
git clone --recurse-submodules <url-do-repo-pai>
```

Se você já clonou sem `--recurse-submodules`:

```bash
cd <repo-pai>
git submodule update --init --recursive
```

### Política homóloga (texto da origem)

- **Não edite** conteúdo do submodule "por acidente" dentro do repo pai.
  - Se você precisa alterar `AI-Develop-Resources`, faça isso no próprio repositório dele (ou entrando no diretório `.cursor/` e tratando como repo Git separado), depois atualize o ponteiro no repo pai.
- O repo pai deve versionar **apenas o SHA** do submodule (o commit apontado), garantindo reprodutibilidade.

