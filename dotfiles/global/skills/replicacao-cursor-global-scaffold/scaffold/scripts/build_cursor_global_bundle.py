# Espelho do script canônico: AI-ProjectDeveloper/scripts/build_cursor_global_bundle.py
# Ao alterar a lógica de build, atualize ambos os arquivos para evitar drift.
#
# Uso típico no repo pai: copie este arquivo para o destino desejado e defina
# CURSOR_GLOBAL_MANIFEST apontando para o manifest.json do pacote (caminho absoluto
# ou relativo ao diretório de trabalho atual).

from __future__ import annotations

import json
import os
import shutil
from pathlib import Path


def copy_agent(source_root: Path, bundle_root: Path, agent_name: str) -> None:
    source = source_root / "agents" / f"{agent_name}.md"
    target = bundle_root / "agents" / f"{agent_name}.md"
    if not source.exists():
        raise FileNotFoundError(f"Agent not found: {source}")
    target.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source, target)


def copy_skill(source_root: Path, bundle_root: Path, skill_name: str) -> None:
    source = source_root / "skills" / skill_name
    target = bundle_root / "skills" / skill_name
    if not source.exists():
        raise FileNotFoundError(f"Skill not found: {source}")
    shutil.copytree(source, target)


def resolve_manifest_path() -> Path:
    """Default: repo_root/packages/cursor-global/manifest.json next to scripts/.

    If env CURSOR_GLOBAL_MANIFEST is set, use that path (absolute or relative to cwd).
    """
    env = os.environ.get("CURSOR_GLOBAL_MANIFEST")
    if env:
        raw = Path(env)
        resolved = raw if raw.is_absolute() else (Path.cwd() / raw).resolve()
        return resolved
    repo_root = Path(__file__).resolve().parents[1]
    return repo_root / "packages" / "cursor-global" / "manifest.json"


def main() -> None:
    manifest_path = resolve_manifest_path()
    package_root = manifest_path.parent

    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    source_root = (package_root / manifest["source_root"]).resolve()
    bundle_root = (package_root / manifest["bundle_root"]).resolve()
    bundle_dir = bundle_root.parent

    if bundle_root.exists():
        shutil.rmtree(bundle_root)

    (bundle_root / "agents").mkdir(parents=True, exist_ok=True)
    (bundle_root / "skills").mkdir(parents=True, exist_ok=True)

    for agent_name in manifest["agents"]:
        copy_agent(source_root, bundle_root, agent_name)

    for skill_name in manifest["skills"]:
        copy_skill(source_root, bundle_root, skill_name)

    summary = {
        "version": manifest["version"],
        "agents": manifest["agents"],
        "skills": manifest["skills"],
        "generated_bundle": str(bundle_root),
    }
    (bundle_dir / "summary.json").write_text(
        json.dumps(summary, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )

    print(
        f"Bundle generated with {len(manifest['agents'])} agents and "
        f"{len(manifest['skills'])} skills at {bundle_root}"
    )


if __name__ == "__main__":
    main()
