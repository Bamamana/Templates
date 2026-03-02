#!/usr/bin/env bash
set -euo pipefail

# Enforce docs/changelog updates when implementation files change.
#
# Usage:
#   bash scripts/enforce_doc_updates.sh [--against <ref>]
#
# Examples:
#   bash scripts/enforce_doc_updates.sh
#   bash scripts/enforce_doc_updates.sh --against origin/main

AGAINST_REF="HEAD~1"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --against)
      AGAINST_REF="$2"
      shift 2
      ;;
    -h|--help)
      echo "Usage: bash scripts/enforce_doc_updates.sh [--against <ref>]"
      exit 0
      ;;
    *)
      echo "[doc-guard][FAIL] Unknown argument: $1"
      exit 1
      ;;
  esac
done

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "[doc-guard][PASS] Not a git repo; skipping doc update enforcement"
  exit 0
fi

if ! git rev-parse "$AGAINST_REF" >/dev/null 2>&1; then
  echo "[doc-guard][WARN] Reference '$AGAINST_REF' not found; skipping"
  exit 0
fi

changed_files="$(git diff --name-only "$AGAINST_REF"...HEAD || true)"

if [[ -z "$changed_files" ]]; then
  echo "[doc-guard][PASS] No changed files detected"
  exit 0
fi

code_changed=0
docs_changed=0
changelog_changed=0

while IFS= read -r file; do
  [[ -z "$file" ]] && continue

  if [[ "$file" == CHANGELOG.md ]]; then
    changelog_changed=1
  fi

  if [[ "$file" == docs/* || "$file" == README.md || "$file" == AI_AGENT.md || "$file" == AI_CONTEXT.md || "$file" == CHANGELOG.md ]]; then
    docs_changed=1
  fi

  if [[ "$file" == src/* || "$file" == functions/* || "$file" == scripts/* || "$file" == Version\ 3.0/* ]]; then
    code_changed=1
    continue
  fi

  if [[ "$file" == *.py || "$file" == *.js || "$file" == *.ts || "$file" == *.gs || "$file" == *.tsx || "$file" == *.jsx ]]; then
    code_changed=1
  fi
done <<< "$changed_files"

if [[ "$code_changed" == "1" && "$docs_changed" == "0" ]]; then
  echo "[doc-guard][FAIL] Code/implementation changes detected without docs updates"
  echo "[doc-guard][HINT] Update docs and changelog in the same change"
  exit 1
fi

if [[ "$code_changed" == "1" && "$changelog_changed" == "0" ]]; then
  echo "[doc-guard][FAIL] Code/implementation changes detected without CHANGELOG.md update"
  exit 1
fi

echo "[doc-guard][PASS] Documentation update enforcement passed"
