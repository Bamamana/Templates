# Master Traceability Table (V3 Audit)

Read when: mapping pathways, planning refactors, and validating parity/smoke coverage.
Skip when: never for Tier B/C; Tier A may mark N/A with rationale.

Purpose: canonical living map of entrypoints, function chains, side effects, expected outcomes, and smoke/contract coverage.

## Path ID Format
- `API-CORE-01` such as `UI-DASH-02`, `API-AUTH-01`, `JOB-SYNC-01`
- Types: `UI`, `API-CS`, `API-HT`, `CRON`, `EDIT`, `WEB`, `JOB`, `CLI`, `DB`, `WORKER`

## Traceability Rules
- Every active entrypoint/pathway must have a Path ID row.
- Every Path ID must have smoke/contract coverage status:
  - `Automated` (scripted command exists), or
  - `Manual` (explicit runbook steps), or
  - `N/A` (with rationale).
- `Coverage pending` is not a valid final state for Tier B/C. Use `Manual` with a concrete runbook, add an automated check, or mark `N/A` with rationale.
- `Manual` rows must point to a named runbook section or include concrete steps; "manual smoke" with no location is not enough.
- `N/A` rows must explain why automation and manual smoke do not apply.
- Refactor slices are blocked until touched Path IDs have passing coverage.
- If pathways/entrypoints/wiring changes, update this file in the same change.
- UI-visible Path IDs need automated browser coverage or a manual click path with expected visible result.
- Data-mutating Path IDs need snapshot/rollback evidence or an explicit `N/A` rationale; code rollback is not data rollback.

## Entry Points Inventory

| Path ID | Entry Point | Trigger/Method | Function Chain |
|---|---|---|---|
| UI-XX-01 | `entryFunction` | `[MENU/OPEN/...]` | `moduleA -> moduleB -> ...` |

## Master Traceability Table

| Path ID | Entry Point | Function Chain | Critical Side Effects | Expected Outcome | Smoke Coverage | Smoke Command / Runbook |
|---|---|---|---|---|---|---|
| UI-XX-01 | `entryFunction` | `moduleA -> moduleB` | `[WRITE/API/CACHE/TRIGGER/NONE]` | `Expected output/state asserted` | `Automated` | `bash scripts/test_smoke.sh` |
| API-HT-01 | `entryFunction` | `moduleA -> moduleB` | `[WRITE/API/CACHE/TRIGGER]` | `Expected output/state asserted` | `Manual` | `docs/ENGINEERING_PLAYBOOK.md#manual-smoke-runbook` |
| CRON-01 | `entryFunction` | `moduleA -> moduleB` | `[WRITE/DELETE/QUEUE]` | `Expected output/state asserted` | `N/A` | `Not automatable in baseline; covered by manual runbook` |

## State Mutation Index

Rules:
- Locations must be real repo paths after adoption; stale planned/example paths are not allowed.
- Every mutating service, route, job, script, or UI action should appear here or be covered by a Path ID row above.
- If a mutation is intentionally indirect, list the real entrypoint and name the downstream side effect.

| Location | Function | Mutation Type | Affected Data |
|---|---|---|---|
| N/A | No mutating paths mapped yet | N/A | Replace this row when the first real mutation path is added |

## Coverage Completion Checklist
- [ ] Every active Path ID is present.
- [ ] Every Path ID has smoke coverage status + command/runbook.
- [ ] No Path ID says `Coverage pending`.
- [ ] Touched Path IDs in this change have passing smoke evidence.
- [ ] Manual rows point to a concrete runbook or steps.
- [ ] `N/A` rows include rationale.
- [ ] State Mutation Index paths exist in the repo.
- [ ] Retired pathways are marked with reason/date in changelog or parity allowlist.
