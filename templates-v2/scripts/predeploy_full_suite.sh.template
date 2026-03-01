#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[predeploy] Running all targeted refactor smoke lanes"
count=0
for script in scripts/smoke_*_refactor.sh; do
  [[ -f "$script" ]] || continue
  echo "[predeploy] -> $script"
  bash "$script"
  count=$((count + 1))
done

echo "[predeploy] Running baseline verify gate"
bash scripts/verify.sh

echo "[predeploy] Full suite passed"
echo "[predeploy] Smoke lanes run: $count"
