#!/usr/bin/env python3
"""Hook beforeSubmitPrompt: por padrão pausa pedidos que parecem novo plano,
brainstorm explícito ou ajuda para criar/refinar prompt.

Por padrão o gate está ligado (sem precisar de local.env). Para desligar o gate:
PLAN_BRIEF_GATE=0 em `.cursor/hooks/local.env`. Para um envio pontual sem pausa:
primeira linha SKIP_PLAN_BRIEF

Limitação da API Cursor (documentação oficial): antes do envio só existe
continue + user_message; não há injeção de contexto como em sessionStart/postToolUse.
"""

from __future__ import annotations

import json
import os
import re
import sys


def allow() -> None:
    print(json.dumps({"continue": True}), flush=True)


def deny(msg: str) -> None:
    print(
        json.dumps({"continue": False, "user_message": msg}, ensure_ascii=False),
        flush=True,
    )


def looks_like_plan_request(prompt: str) -> bool:
    """Heurística PT-BR/EN para pedidos de novo plano (não é exaustiva)."""
    p = prompt.strip()
    if len(p) < 8:
        return False

    patterns = (
        # explícito curto (evita falhas quando o modelo não casa com o bloco longo abaixo)
        r"(?is)\b(?:eu\s+)?quero\s+um\s+plano\b",
        r"(?is)\bpreciso\s+d(?:e\s+)?(?:um\s+)?plano\b",
        r"(?is)\b(?:me\s+)?(?:dê|da|de)\s+um\s+plano\b",
        # criação / pedido explícito
        r"(?is)\b(?:crie|criar|montar|elabore|elabore\s+um|faça\s+um|fazer\s+um|escreva\s+um|escrever\s+um|preciso\s+de\s+um|quero\s+um|novo\s+|\bsolicito\s+um)\s+[\s\S]{0,120}?\bplano\b",
        r"(?is)\bplano\s+(?:novo|de trabalho|\.\s*plan)\b",
        # caminhos e tooling do repo
        r"(?i)\.plan\.md",
        r"(?i)plans-local-templates/",
        r"(?i)[/\\]\.cursor[/\\]plans[/\\]",
        r"(?is)\b(?:planejamento-criador|plan-creator|plan\s*creator)\b",
    )
    return any(re.search(pat, prompt) for pat in patterns)


def looks_like_brainstorm_request(prompt: str) -> bool:
    """Pedido explícito de brainstorm no fluxo workflow-prompt-profissional (PT-BR/EN)."""
    p = prompt.strip()
    if len(p) < 8:
        return False
    patterns = (
        r"(?is)\bbrainstorm(?:ing)?\b",
        r"(?is)\bbrain\s*storm\b",
        r"(?is)\bchuva\s+de\s+ideias\b",
        r"(?is)\bsess[aã]o\s+de\s+(?:brainstorm|brain\s*storm)\b",
        r"(?is)\b(?:fazer|fa[cç]a|quero|preciso\s+de|vamos\s+(?:fazer\s+)?(?:um\s+)?)(?:um\s+)?brainstorm\b",
        r"(?is)\bbrainstorm(?:ear|[eê]ar)\b",
        r"(?is)\binici(?:ar|e)\s+(?:o\s+)?(?:brainstorm|brain\s*storm|workflow\s+de\s+brainstorm)\b",
        r"(?is)\bfase\s+(?:de\s+)?brainstorm\b",
        r"(?is)\bdescoberta\s+guiada\b",
        r"(?is)\bfase\s+de\s+descoberta\b",
        r"(?is)\bworkflow\s+brainstorm\b",
        r"(?is)\bbrainstorm\s+before\s+(?:brief|the\s+brief)\b",
        r"(?is)\brun\s+a\s+brainstorm\b",
        r"(?is)\bideation\s+session\b",
    )
    return any(re.search(pat, prompt) for pat in patterns)


def looks_like_prompt_coaching_request(prompt: str) -> bool:
    """Pedido de ajuda para criar/refinar prompt (workflow-prompt-profissional)."""
    p = prompt.strip()
    if len(p) < 10:
        return False
    patterns = (
        r"(?is)\b(?:crie|criar|montar|elabore|elabore\s+um|faça\s+um|fazer\s+um|escreva\s+um|escrever\s+um|preciso\s+de\s+um|quero\s+um|ajuda\s+(?:para\s+)?(?:a\s+)?)\s*[\s\S]{0,60}?\bprompt\b",
        r"(?is)\b(?:refinar|melhorar|construir|desenvolver)\s+[\s\S]{0,40}?\bprompt\b",
        r"(?is)\bprompt\s+mestre\b",
        r"(?is)\bworkflow[- ]prompt[- ]profissional\b",
        r"(?is)\bskill\s+[^\n]{0,40}prompt",
        r"(?is)\bajuda\s+[^\n]{0,80}?\b(?:para\s+)?(?:criar|escrever|refinar)\s+(?:um\s+)?prompt\b",
    )
    return any(re.search(pat, prompt) for pat in patterns)


def _gate_disabled() -> bool:
    raw = os.environ.get("PLAN_BRIEF_GATE", "1").strip().lower()
    return raw in ("0", "false", "off", "no")


def main() -> None:
    if _gate_disabled():
        allow()
        return

    raw = sys.stdin.read()
    try:
        payload = json.loads(raw) if raw.strip() else {}
    except json.JSONDecodeError:
        allow()
        return

    prompt = str(payload.get("prompt") or "")
    stripped = prompt.lstrip()

    if stripped.upper().startswith("SKIP_PLAN_BRIEF"):
        allow()
        return

    plan_hit = looks_like_plan_request(prompt)
    prompt_hit = looks_like_prompt_coaching_request(prompt)
    brainstorm_hit = looks_like_brainstorm_request(prompt)

    if not plan_hit and not prompt_hit and not brainstorm_hit:
        allow()
        return

    if plan_hit and prompt_hit:
        msg = (
            "Este pedido parece envolver **plano de trabalho** e **ajuda com prompt**.\n\n"
            "**Plano (.plan.md):** consolidar objetivos no fluxo workflow-prompt-profissional quando o brief ainda estiver vago; "
            "depois usar planejamento-criador / plano build-ready em `.cursor/plans/`.\n\n"
            "**Prompt:** agente @workflow-prompt-profissional-guia — skill `.cursor/skills/workflow-prompt-profissional/SKILL.md` "
            "(Brainstorm com código/docs → Brief → «Entendi assim» → prompt mestre opcional).\n\n"
            "Para enviar mesmo assim este prompt, primeira linha: SKIP_PLAN_BRIEF\n\n"
            "Gate permanente desligado: `PLAN_BRIEF_GATE=0` em `.cursor/hooks/local.env`."
        )
        deny(msg)
        return

    if plan_hit and brainstorm_hit:
        msg = (
            "Este pedido parece unir **plano novo** e **brainstorm**.\n\n"
            "**Brainstorm primeiro:** use **workflow-prompt-profissional** (ler código/docs → «Brainstorm — síntese» → Brief → prompt mestre). "
            "Assim o `.plan.md` fica alinhado ao que o repo realmente tem.\n\n"
            "**Depois:** `planejamento-criador` / plano build-ready em `.cursor/plans/`.\n\n"
            "- Agente: @workflow-prompt-profissional-guia\n"
            "- Skill: .cursor/skills/workflow-prompt-profissional/SKILL.md\n\n"
            "Para enviar mesmo assim este prompt, primeira linha: SKIP_PLAN_BRIEF\n\n"
            "`PLAN_BRIEF_GATE=0` em `.cursor/hooks/local.env` desliga o gate."
        )
        deny(msg)
        return

    if plan_hit:
        msg = (
            "Este pedido parece pedir um **plano novo**. Antes do planejamento-criador, vale consolidar "
            "o objetivo no fluxo **workflow-prompt-profissional** (Brainstorm opcional com repo → Brief → secao Entendi assim → opcionalmente prompt mestre).\n\n"
            "- Agente: @workflow-prompt-profissional-guia\n"
            "- Skill: .cursor/skills/workflow-prompt-profissional/SKILL.md\n\n"
            "Para enviar mesmo assim este prompt, acrescente na primeira linha apenas: SKIP_PLAN_BRIEF\n\n"
            "Para desligar este gate de forma permanente: `export PLAN_BRIEF_GATE=0` em `.cursor/hooks/local.env`."
        )
        deny(msg)
        return

    if brainstorm_hit and not prompt_hit:
        msg = (
            "Este pedido parece pedir **brainstorm** no fluxo **workflow-prompt-profissional**: "
            "ler código e documentos relevantes, sintetizar factos e lacunas, fazer perguntas (**«Brainstorm — síntese»** na skill); "
            "só depois **Brief** («Entendi assim») e opcionalmente **prompt mestre**.\n\n"
            "- Agente: @workflow-prompt-profissional-guia\n"
            "- Skill: .cursor/skills/workflow-prompt-profissional/SKILL.md\n\n"
            "Para enviar sem esta pausa (sessão informal ou já alinhado), primeira linha: SKIP_PLAN_BRIEF\n\n"
            "`PLAN_BRIEF_GATE=0` em `.cursor/hooks/local.env` desliga o lembrete permanente."
        )
        deny(msg)
        return

    msg = (
        "Este pedido parece pedir **ajuda para criar ou refinar um prompt**. Use o fluxo **workflow-prompt-profissional** "
        "(Brainstorm com leitura de codigo/docs quando faltar contexto → Brief com checklist → «Entendi assim» → bloco prompt mestre copiavel).\n\n"
        "- Agente: @workflow-prompt-profissional-guia\n"
        "- Skill: .cursor/skills/workflow-prompt-profissional/SKILL.md\n\n"
        "Para enviar sem esta pausa (brief ja feito ou urgencia), primeira linha: SKIP_PLAN_BRIEF\n\n"
        "`PLAN_BRIEF_GATE=0` em `.cursor/hooks/local.env` desliga o lembrete permanente."
    )
    deny(msg)


if __name__ == "__main__":
    main()
