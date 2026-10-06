#!/usr/bin/env python3
import json
import re
import sys
from pathlib import Path

FUNC_RE = re.compile(r"\bfunction\s+([A-Za-z0-9_]+)\s*\(")
CODE_EXTS = {".gs", ".js", ".html"}


def normalize_name(name: str) -> str:
    return name.strip("_").lower()


def collect_functions(paths, root):
    by_file = {}
    global_index = {}
    normalized_index = {}

    for base in paths:
        if not base.exists():
            continue
        for path in base.rglob("*"):
            if path.suffix.lower() not in CODE_EXTS:
                continue
            text = path.read_text(encoding="utf-8", errors="ignore")
            funcs = sorted(set(FUNC_RE.findall(text)))
            rel = str(path.relative_to(root))
            by_file[rel] = funcs
            for name in funcs:
                global_index.setdefault(name, set()).add(rel)
                normalized_index.setdefault(normalize_name(name), set()).add((name, rel))

    return by_file, global_index, normalized_index


def resolve_latest_snapshot(root: Path) -> Path:
    snap_root = root / "snapshots"
    candidates = [p for p in snap_root.glob("deployed-*") if p.is_dir()]
    if not candidates:
        return Path("")
    return sorted(candidates)[-1]


def load_retired_allowlist(path: Path):
    if not path.exists():
        return set()
    data = json.loads(path.read_text(encoding="utf-8"))
    retired = data.get("retired", [])
    keys = set()
    for item in retired:
        keys.add((item.get("baseline", ""), item.get("file", ""), item.get("function", "")))
    return keys


def baseline_file_groups(root: Path):
    snapshot = resolve_latest_snapshot(root)
    groups = []

    pre_paths = [
        root / "legacy/Pre refactor/Version 3.0/Engine_Library",
        root / "legacy/Pre refactor/Version 3.0/Hub/Master_Script",
        root / "legacy/Pre refactor/Version 3.0/Hub",
        root / "legacy/Pre refactor/Version 3.0/Deployer_Bot",
    ]
    groups.append(("pre_refactor", [p for p in pre_paths if p.exists()]))

    if snapshot and snapshot.exists():
        snap_paths = [
            snapshot / "Engine_Library",
            snapshot / "Hub_Master_Script",
            snapshot / "Deployer_Bot",
        ]
        groups.append(("snapshot_latest", [p for p in snap_paths if p.exists()]))

    return groups


def main():
    repo = Path(__file__).resolve().parents[1]

    current_roots = [
        repo / "Version 3.0/Engine_Library",
        repo / "Version 3.0/Hub/Master_Script",
        repo / "Version 3.0/Deployer_Bot",
    ]
    current_by_file, current_global, current_norm = collect_functions(current_roots, repo)

    retired_path = repo / "scripts/parity-retired-pathways.json"
    retired = load_retired_allowlist(retired_path)

    baseline_groups = baseline_file_groups(repo)
    if not baseline_groups:
        print("[parity][WARN] No baseline groups found.")
        return 0

    unresolved = []
    moved = []
    matched = 0
    retired_count = 0

    for label, paths in baseline_groups:
        if not paths:
            print(f"[parity][WARN] Baseline '{label}' has no existing paths; skipping.")
            continue

        baseline_by_file, _, _ = collect_functions(paths, repo)

        for rel, funcs in baseline_by_file.items():
            cur_rel = rel.replace(".js", ".gs") if rel.endswith(".js") else rel
            cur_funcs = set(current_by_file.get(cur_rel, []))

            for fn in funcs:
                key = (label, rel, fn)
                if key in retired:
                    retired_count += 1
                    continue

                if fn in cur_funcs:
                    matched += 1
                    continue

                if fn in current_global:
                    moved.append((label, rel, fn, sorted(current_global[fn])))
                    continue

                norm = normalize_name(fn)
                norm_hits = current_norm.get(norm, set())
                if norm_hits:
                    moved.append((label, rel, fn, sorted(f"{name} @ {path}" for name, path in norm_hits)))
                    continue

                unresolved.append((label, rel, fn))

    print("[parity] Pathway baseline report")
    print(f"[parity] Matched in-place: {matched}")
    print(f"[parity] Moved/renamed and found: {len(moved)}")
    print(f"[parity] Retired by allowlist: {retired_count}")
    print(f"[parity] Unresolved: {len(unresolved)}")

    if moved:
        print("[parity] Sample moved/renamed functions:")
        for row in moved[:12]:
            label, rel, fn, hits = row
            print(f" - [{label}] {rel} :: {fn} -> {hits[0]}")

    if unresolved:
        print("[parity][FAIL] Unresolved baseline functions:")
        for label, rel, fn in unresolved:
            print(f" - [{label}] {rel} :: {fn}")
        print("[parity] If removals are intentional, add them to scripts/parity-retired-pathways.json")
        return 1

    print("[parity] OK: No unresolved baseline function pathways")
    return 0


if __name__ == "__main__":
    sys.exit(main())
