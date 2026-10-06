# AI Agent Contract (V3 Audit)

Read when: always. This is the canonical AI startup contract.
Skip when: never.

Single entrypoint the human points the AI to:

> "Read `AI_AGENT.md` and follow it strictly."

This file is intentionally thin. It states the contract and points to the one
place each rule lives. Do not restate rules that live elsewhere.

## Startup Reads (in order)
1. `AI_AGENT.md` (this file)
2. `docs/OPERATOR_PROFILE.md` — who the operator is; read every session, follow strictly
3. `docs/PROJECT_CANVAS.md` — current phase, status, next action
4. `docs/SESSION_BRIEF.md` + `docs/CONTEXT_ROUTING.md` (only if this project uses a routed startup profile)
5. Load deeper docs only when `docs/CONTEXT_ROUTING.md` (if present) or the task says so

If `docs/TEMPLATE_LIFECYCLE.md` shows unchecked adoption boxes, treat the project
as partially adopted: finish adoption before starting feature work.

## Where Each Rule Lives (single source of truth)
- Commands, test policy, workflow matrix, smoke catalog, DoD checklist, file-size and refactor rules: `docs/ENGINEERING_PLAYBOOK.md`
- Pathway/smoke coverage ledger: `docs/MASTER_TRACEABILITY_TABLE.md` (Tier B/C)
- Ops, security, release, observability, risk: `docs/OPS_SECURITY_RELEASE.md`
- Architecture and durable stack decisions: `docs/TECH_STACK.md`
- Durable user preferences and lessons: `docs/AI_MEMORY.md`
- Adoption, profiles, placeholders, upgrade, validation: `docs/TEMPLATE_LIFECYCLE.md`

## Working Rules
- Read `docs/OPERATOR_PROFILE.md` every session. Append a short dated entry to its
  "Observed patterns" log when you notice a new pattern that helps keep the operator on track.
- If confidence is below 90%, ask 1-3 precise clarifying questions before acting.
- Make the smallest correct change first; no unrequested scope.
- Behavior change requires a targeted test. Run the verify gate before handoff: `bash scripts/verify.sh`.
- Regenerate the AI context map when used: `python3 scripts/update_ai_map.py`.
- Docs update in the same change when behavior, commands, paths, or structure change.
- Tier B/C: update touched Path IDs in `docs/MASTER_TRACEABILITY_TABLE.md` with
  `Automated`, `Manual`, or `N/A` (with rationale) coverage in the same change.

## Tier Selection
- Selected tier: TIER_B_STANDARD
- Rationale: Set during bootstrap; refine with project rationale.

## Definition of Done (Per Change)
The authoritative checklist lives in `docs/ENGINEERING_PLAYBOOK.md` § After-Coding
Checklist. At minimum: scope complete, tests updated/passing, verify gate passed,
docs + changelog updated, risks noted.

## Required Handoff Format
- Files changed
- Commands/tests run with results
- Open risks or follow-up refactors
