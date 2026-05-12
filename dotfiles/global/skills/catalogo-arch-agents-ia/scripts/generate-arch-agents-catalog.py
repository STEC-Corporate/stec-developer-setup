#!/usr/bin/env python3
"""Gera agents arch-*, skills e rules (catálogo de arquitetura)."""
from pathlib import Path


def _repo_root() -> Path:
    """Raiz do repositório (contém `agents/`)."""
    here = Path(__file__).resolve()
    for parent in [here, *here.parents]:
        if (parent / "agents").is_dir():
            return parent
    raise RuntimeError("Não foi encontrada a raiz do repositório (agents/).")


ROOT = _repo_root()
AGENTS = ROOT / "agents"
SKILLS = ROOT / "skills"
RULES = ROOT / "rules"

# slug, title, description_one_line, wave, estado, focus_skill, ambito_bullets (lines)
ARCH = [
    (
        "monolito",
        "Monólito clássico",
        "Guia de arquitetura monolítica: simplicidade operacional, limites de escala e trade-offs. Usar quando o desenho macro for um único deployável.",
        1,
        "stable",
        "Trade-offs de monólito vs distribuído; deploy único; fronteiras internas antes de extrair serviços.",
        [
            "Implantação e operação simplificadas; transações e consistência locais mais simples.",
            "Riscos: acoplamento, escala vertical, blast radius se não houver modularização interna.",
            "Evolução: caminhos para modularização sem saltar logo para microserviços.",
        ],
    ),
    (
        "monolito-modular",
        "Monólito modular",
        "Guia de monólito modular: módulos com fronteiras claras e evolução para extrair serviços. Usar quando um único repo ou deploy existir mas com bounded contexts.",
        1,
        "stable",
        "Contratos entre módulos, anti-camadas cruzadas, preparação para eventual extração.",
        [
            "Fronteiras de módulo alinhadas a domínio; APIs internas explícitas.",
            "Evitar dependências cíclicas entre módulos; testes por módulo.",
            "Critérios para quando faz sentido extrair um serviço vs manter no monólito.",
        ],
    ),
    (
        "separacao-frontend-backend",
        "Separação frontend e backend",
        "Guia de separação SPA/mobile e API: contratos, versionamento e auth entre camadas. Usar quando existir cliente rico e backend distinto.",
        1,
        "stable",
        "Contratos (OpenAPI), versionamento de API, CORS, tokens e superfícies de ataque por camada.",
        [
            "Fronteira clara: o contrato HTTP é a fonte de verdade entre equipas.",
            "Versionamento e deprecação de API; compatibilidade de clientes.",
            "Autenticação/autorização em camadas sem duplicar regras de negócio no cliente.",
        ],
    ),
    (
        "clean-architecture",
        "Clean Architecture",
        "Guia Clean Architecture: camadas, regras de dependência e casos de uso. Usar quando o repo adotar ou discutir camadas entidade–casos de uso–adaptadores.",
        1,
        "stable",
        "Direção das dependências; entidades isoladas de frameworks; testes em torno do domínio.",
        [
            "Regra: dependências apontam para dentro; frameworks e detalhes são detalhes.",
            "Casos de uso como orquestração explícita; DTOs nas fronteiras.",
            "Evitar fuga de ORM/HTTP para o núcleo de domínio.",
        ],
    ),
    (
        "hexagonal",
        "Arquitetura hexagonal",
        "Guia hexagonal (portas e adaptadores): testabilidade e anti-vazamento de infra. Usar quando portas/adaptadores forem política do projeto.",
        1,
        "stable",
        "Portas primárias/secundárias; adaptadores substituíveis; testes com duplos.",
        [
            "Domínio sem imports de infraestrutura; interfaces (portas) estáveis.",
            "Adaptadores para HTTP, DB, filas, etc., plugáveis.",
            "Trade-offs de indireção vs complexidade em projetos pequenos.",
        ],
    ),
    (
        "mvc-e-padroes-ui",
        "MVC e padrões de UI",
        "Guia MVC, MVP e MVVM: fronteiras em UI e confusões comuns. Usar quando a discussão for organização de UI ou confusão entre camadas.",
        1,
        "stable",
        "Quem conhece quem; fluxo de dados; testabilidade de presenters/view models.",
        [
            "Separar entrada do utilizador, estado e renderização conforme o padrão escolhido.",
            "Evitar lógica de negócio pesada em views; localizar regra de domínio.",
            "Não confundir MVC de servidor com padrões de cliente modernos.",
        ],
    ),
    (
        "microservicos",
        "Microserviços",
        "Guia de microserviços: decomposição, bounded context e autonomia. Usar quando o desenho for multi-serviço ou estiver em discussão.",
        2,
        "stable",
        "Tamanho de serviço, dados por serviço, falhas parciais, contratos e governança.",
        [
            "Alinhar cortes a bounded contexts; evitar microserviços por tecnologia.",
            "Database per service e implicações de consistência.",
            "Observabilidade, deploy independente e custo operacional real.",
        ],
    ),
    (
        "sistemas-distribuidos",
        "Sistemas distribuídos",
        "Guia de fundamentos distribuídos: latência, falhas parciais, idempotência e observabilidade. Usar quando houver mais de um processo ou região em jogo.",
        2,
        "stable",
        "CAP a nível prático; timeouts/retries; circuit breakers; tracing.",
        [
            "Assumir falhas parciais e mensagens duplicadas; desenhar para idempotência.",
            "Latência de rede e limites de consistência; evitar conversas síncronas em cadeia longa.",
            "Correlação, métricas e logs como requisito, não opcional.",
        ],
    ),
    (
        "orientada-eventos",
        "Arquitetura orientada a eventos",
        "Guia EDA: publicação, consumo, tópicos e consistência eventual. Usar quando fluxos forem assíncronos ou baseados em eventos de domínio.",
        2,
        "stable",
        "Evento de domínio vs integração; esquemas; ordenação; consumidores múltiplos.",
        [
            "Modelar eventos estáveis e versionamento de payload.",
            "Efeitos colaterais e entrega pelo menos uma vez / exatamente uma vez (implicações).",
            "Evitar god topic; fronteiras claras por contexto.",
        ],
    ),
    (
        "cqrs",
        "CQRS",
        "Guia CQRS: separação comando/leitura, projeções e quando aplicar. Usar quando leituras e escritas tiverem perfis muito diferentes.",
        2,
        "stable",
        "Modelo de comando vs read model; consistência eventual das projeções; complexidade operacional.",
        [
            "Separar modelos só quando o ganho superar duplicação e operações.",
            "Projeções e rebuild; fonte de verdade para escrita.",
        ],
    ),
    (
        "sagas-orquestracao",
        "Sagas e orquestração",
        "Guia sagas: compensação, coreografia vs orquestração. Usar quando transações abrangerem múltiplos agregados ou serviços.",
        2,
        "stable",
        "Passos compensáveis; idempotência nos handlers; estado da saga visível.",
        [
            "Escolher orquestração explícita vs coreografia por acoplamento e visibilidade.",
            "Definir semântica de falha e reprocessamento.",
            "Evitar transações distribuídas clássicas como panaceia.",
        ],
    ),
    (
        "mensageria",
        "Mensageria",
        "Guia de mensageria: filas vs tópicos, entrega, DLQ e ordenação. Usar quando integrações forem assíncronas via broker.",
        3,
        "stable",
        "Semântica de fila; poison messages; particionamento; back-pressure.",
        [
            "Filas ponto a ponto vs pub/sub; quando usar cada um.",
            "Dead letter e reprocessamento seguro; ordenação e consumidores paralelos.",
            "Contratos de mensagem e evolução de schema.",
        ],
    ),
    (
        "cache",
        "Cache",
        "Guia de cache: camadas, invalidação, TTL e CDN. Usar quando performance ou custo de leitura forem tema.",
        3,
        "stable",
        "Cache-aside vs write-through; invalidação; consistência percebida; stampede.",
        [
            "Definir o que é cacheável e política de expiração.",
            "Invalidação explícita vs TTL; risco de dados obsoletos.",
            "CDN para estáticos; cache de aplicação para dinâmicos.",
        ],
    ),
    (
        "api-gateway",
        "API Gateway",
        "Guia API Gateway: borda, roteamento, agregação e políticas. Usar quando existir ponto único de entrada para APIs.",
        3,
        "stable",
        "Autenticação na borda, rate limit, roteamento por serviço; evitar agregação excessiva.",
        [
            "Separação entre gateway e lógica de domínio.",
            "Políticas transversais (throttle, IP allowlist) no gateway.",
            "Latência extra e ponto único de falha — mitigações.",
        ],
    ),
    (
        "bff",
        "Backend for Frontend (BFF)",
        "Guia BFF: acoplamento por cliente, agregação e performance. Usar quando cada canal (web, mobile) precisar de API sob medida.",
        3,
        "stable",
        "Um BFF por cliente vs compartilhado; o que pode e não pode morrer no BFF.",
        [
            "Adaptação de contratos ao cliente sem duplicar regras de negócio.",
            "Riscos de lógica de domínio no BFF.",
        ],
    ),
    (
        "dados-distribuidos",
        "Dados distribuídos",
        "Guia dados em sistemas distribuídos: database per service, réplicas, sharding e transações. Usar quando persistência atravessar serviços ou regiões.",
        3,
        "stable",
        "Consistência vs disponibilidade por caso de uso; padrões de leitura; sagas de dados.",
        [
            "Evitar base partilhada entre serviços como atalho.",
            "Réplicas de leitura e lag; sharding e chaves.",
        ],
    ),
    (
        "serverless",
        "Serverless / FaaS",
        "Guia serverless: funções, cold start, limites e eventos. Usar quando o desenho for FaaS ou fortemente gerido por cloud.",
        4,
        "experimental",
        "Granularidade de função; estado; limites de tempo; custo por invocação.",
        [
            "Cold start e requisitos de latência.",
            "Armazenamento de estado e idempotência em retries.",
            "Evitar nano-funções sem necessidade.",
        ],
    ),
    (
        "service-mesh",
        "Service mesh",
        "Guia service mesh: mTLS, tráfego L7 e observabilidade. Usar quando sidecar/proxy for política de plataforma.",
        4,
        "experimental",
        "O que fica no mesh vs aplicação; overhead operacional.",
        [
            "Políticas de tráfego, retries e circuit breaking na malha.",
            "mTLS entre serviços; identidade de workload.",
        ],
    ),
    (
        "padroes-migracao",
        "Padrões de migração",
        "Guia padrões de migração: Strangler Fig, branch by abstraction, feature flags. Usar quando sistemas legados forem substituídos incrementalmente.",
        4,
        "experimental",
        "Cortes incrementais; dual write; validação de paridade.",
        [
            "Strangler para substituir rotas ou capacidades aos poucos.",
            "Feature flags para desligar caminho antigo com segurança.",
        ],
    ),
    (
        "arquitetura-celulas",
        "Arquitetura em células",
        "Guia cell-based architecture: blast radius e isolamento por célula. Usar quando isolamento forte entre tenants ou regiões for requisito.",
        4,
        "experimental",
        "Particionamento; roteamento para célula; consistência global limitada.",
        [
            "Reduzir raio de explosão de falhas e atualizações.",
            "Trade-offs de complexidade operacional e dados.",
        ],
    ),
]


def agent_md(
    slug: str, title: str, desc: str, ambito: list[str]
) -> str:
    bullets = "\n".join(f"- {b}" for b in ambito)
    return f"""---
name: arch-{slug}-guia
description: {desc}
role_type: operacional
blocking_authority: false
quality_domain: arquitetura
report_format: operacional-v1
---

És o guia de **{title}** no AcoustiCore. Focas **forma do sistema, fronteiras e trade-offs**. Não escolhes tecnologia concreta quando o tema for puramente estrutural; para stacks e frameworks usa os agents `stack-*` e `framework-*`.

## Âmbito

{bullets}

## Alinhamento SDD

- Mudanças de jornada, contrato público ou regra de produto: alinhar com `docs/produto/fluxo/` e [00-sdd-governance.mdc](../rules/00-sdd-governance.mdc).

## Saída

- Trade-offs e riscos explícitos.
- Checklist curto ou critérios de decisão quando aplicável.
- Referências a ADRs ou documentação de arquitetura do repo quando existirem.
"""


def skill_readme(slug: str, title: str) -> str:
    return f"""# Skill: arch-{slug}

Skill para o agent **arch-{slug}-guia** ({title}).

Ver `SKILL.md` e `agents/arch-{slug}-guia.md`.
"""


def skill_md(slug: str, title: str, focus: str) -> str:
    return f"""---
name: arch-{slug}
description: Especialização em {title} — trade-offs e padrões. Usar com arch-{slug}-guia.
---

# Arquitetura: {title}

## Quando usar

- Decisões ou revisões de desenho alinhadas a este tema.
- Avaliação de PRs que alteram fronteiras entre módulos, serviços ou camadas.

## Foco

{focus}

## Relação com outros agents

- Implementação concreta: agents `stack-*` e `framework-*`.
- Documentação de produto: `docs/produto/fluxo/` e regras SDD.

## Agent

- **[arch-{slug}-guia](../../agents/arch-{slug}-guia.md)**
"""


def rule_mdc(slug: str, title: str) -> str:
    return f"""---
description: Orientação de arquitetura ({title}) quando documentação em docs está em foco.
globs: docs/**/*.md
alwaysApply: false
---

# {title}

- Este ficheiro reforça decisões arquiteturais alinhadas a **SDD**; ver [00-sdd-governance.mdc](00-sdd-governance.mdc).
- Para detalhe operacional do tema, preferir o agent **[arch-{slug}-guia](../agents/arch-{slug}-guia.md)**.
- Não substituir revisão humana de arquitetura ou aprovação de produto.
"""


def main():
    AGENTS.mkdir(parents=True, exist_ok=True)
    SKILLS.mkdir(parents=True, exist_ok=True)
    RULES.mkdir(parents=True, exist_ok=True)

    for row in ARCH:
        slug, title, desc, _wave, _estado, _focus, ambito = row
        (AGENTS / f"arch-{slug}-guia.md").write_text(
            agent_md(slug, title, desc, ambito), encoding="utf-8"
        )
        d = SKILLS / f"arch-{slug}"
        d.mkdir(parents=True, exist_ok=True)
        (d / "SKILL.md").write_text(skill_md(slug, title, _focus), encoding="utf-8")
        (d / "README.md").write_text(skill_readme(slug, title), encoding="utf-8")
        (RULES / f"arch-{slug}.mdc").write_text(rule_mdc(slug, title), encoding="utf-8")

    print(f"Gerados {len(ARCH)} agents arch-* em {AGENTS}")


if __name__ == "__main__":
    main()
