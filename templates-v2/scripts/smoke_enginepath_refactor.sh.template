#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[enginepath-smoke] Running Engine pathway contract checks"
python3 scripts/refactor_smoke_contract.py scripts/refactor-contracts/enginepath-slice1.json

echo "[enginepath-smoke] Contract checks passed"
