#!/usr/bin/env python3
"""Scaffold de plugin Cursor com defaults seguros."""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

NAME_RE = re.compile(r"^[a-z0-9](?:[a-z0-9.-]*[a-z0-9])?$")


def ensure_name(name: str) -> None:
    if not NAME_RE.match(name):
        raise SystemExit(
            "Nome invalido. Use lowercase kebab-case (letras, numeros, '-' e '.')."
        )


def write_json(path: Path, data: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2, ensure_ascii=True) + "\n", encoding="utf-8")


def write_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description="Cria scaffold de plugin Cursor.")
    parser.add_argument("--plugin-name", required=True)
    parser.add_argument("--plugin-purpose", required=True)
    parser.add_argument("--target-dir", required=True)
    parser.add_argument("--repository-style", choices=["single", "multi"], default="single")
    parser.add_argument("--author-name", default="TODO")
    parser.add_argument("--author-email", default="todo@example.com")
    parser.add_argument("--license", default="MIT")
    args = parser.parse_args()

    ensure_name(args.plugin_name)
    root = Path(args.target_dir).expanduser().resolve()
    plugin_root = root / args.plugin_name

    plugin_manifest = {
        "name": args.plugin_name,
        "displayName": args.plugin_name.replace("-", " ").title(),
        "description": args.plugin_purpose,
        "version": "0.1.0",
        "author": {"name": args.author_name, "email": args.author_email},
        "license": args.license,
        "keywords": ["cursor", "plugin"],
    }
    write_json(plugin_root / ".cursor-plugin" / "plugin.json", plugin_manifest)

    readme = f"""# {args.plugin_name}

Plugin Cursor para: {args.plugin_purpose}

## Instalacao

Adicione o plugin localmente no Cursor e valide o carregamento.

## Estrutura

- `.cursor-plugin/plugin.json`
- `skills/`
- `rules/`
- `agents/`

## Seguranca

Nao inclua segredos no repositorio. Use variaveis de ambiente para credenciais.
"""
    write_text(plugin_root / "README.md", readme)
    write_text(plugin_root / "LICENSE", f"{args.license}\n")
    write_text(plugin_root / "skills" / "example-skill" / "SKILL.md", "---\nname: example-skill\ndescription: Skill exemplo.\n---\n")
    write_text(plugin_root / "agents" / "example-agent.md", "---\nname: example-agent\ndescription: Agent exemplo.\n---\n")
    write_text(plugin_root / "rules" / "example-rule.mdc", "---\ndescription: Rule exemplo.\nalwaysApply: false\n---\n")

    if args.repository_style == "multi":
        marketplace_path = root / ".cursor-plugin" / "marketplace.json"
        marketplace = {"name": "cursor-plugins-local", "plugins": []}
        if marketplace_path.exists():
            marketplace = json.loads(marketplace_path.read_text(encoding="utf-8"))
        plugins = marketplace.setdefault("plugins", [])
        if not any(p.get("name") == args.plugin_name for p in plugins):
            plugins.append(
                {
                    "name": args.plugin_name,
                    "source": args.plugin_name,
                    "description": args.plugin_purpose,
                }
            )
        write_json(marketplace_path, marketplace)

    print(f"Scaffold criado em: {plugin_root}")


if __name__ == "__main__":
    main()
