# Engineering Playbook (V3 Audit)

Read when: implementing, testing, validating, or troubleshooting.
Skip when: never.

Single source for commands, testing policy, smoke catalog, workflow matrix,
feature execution, review, and repository structure. If another doc needs one of
these rules, it should point here instead of restating it.

## 1) Command Index

The one authoritative place for routine repo commands so future sessions do not
rediscover them from multiple docs. Keep it updated when verify, test, run,
package, deploy, or maintenance commands change.

| Goal | Command | Notes |
|---|---|---|
| Canonical verify gate | `bash scripts/verify.sh` | Required before handoff |
| Regenerate AI/system context | `python3 scripts/update_ai_map.py` | If this project uses `AI_CONTEXT.md` |
| Template drift check | `bash scripts/check_template_drift.sh . /path/to/templates-v3` | Update the source-pack path for this repo |
| Template validation | `bash scripts/validate_templates.sh .` | If this project ships the validator |
| Same-change doc enforcement | `bash scripts/enforce_doc_updates.sh` | If this project ships the guardrail |
| Predeploy/release gate | `bash scripts/predeploy_full_suite.sh` | Use `N/A` if the repo has no predeploy gate |

### Repo-Specific Commands
Replace the placeholders with the exact commands that exist in the project.
Delete rows that do not apply.

| Goal | Command | Notes |
|---|---|---|
| Install/setup | `echo 'Set setup commands'` | Example: `npm install` |
| Build/run | `echo 'Set build/run command'` | |
| Local-only run | `echo 'Set local-only run command'` | |
| Logs/troubleshooting | `echo 'Set logs command'` | |
| Lint | `echo 'Set lint command'` | |
| Format check | `echo 'Set format check command'` | |
| Typecheck | `echo 'Set typecheck command'` | |
| Fast smoke | `bash scripts/test_smoke.sh` | Smallest useful confidence check |
| Focused regression | `bash scripts/test_targeted.sh` | Narrow test for the touched behavior |
| Coverage | `echo 'Set coverage command'` | |
| Package/build artifact | `echo 'Set package command'` | Example: extension/app/package build |

Suggested use order: verify gate for handoff → smallest focused check for one
behavior → exact install/run/package command for setup → this playbook §5 for why.

## 2) Test Policy
- Every behavior change maps to at least one targeted test.
- Smoke tests remain fast and run in seconds.
- The verify gate is mandatory before handoff.
- Tests must assert real behavior or user/data outcome, not merely that a
  function, mock, or variable exists.

## 3) Workflow-to-Test Matrix

Map workflows to the commands that prove them. Every row references Path IDs from
`docs/MASTER_TRACEABILITY_TABLE.md`. Update when a workflow is added, changed, or retired.

| Workflow ID | Workflow | Path IDs | Required Command | Type | Required by Tier |
|---|---|---|---|---|---|
| WF-VERIFY-01 | Project verify gate | `CLI-VERIFY-01` | `bash scripts/verify.sh` | gate | A/B/C |
| WF-SYNTAX-01 | Syntax/build integrity | `CLI-VERIFY-01` | `bash scripts/test_smoke.sh` | static/smoke | A/B/C |
| WF-START-01 | Startup/load integrity | `CLI-VERIFY-01` | `bash scripts/test_smoke.sh` | smoke | A/B/C |
| WF-CORE-01 | Core workflow behavior | `CLI-VERIFY-01` | `bash scripts/test_targeted.sh` | targeted | A/B/C |
| WF-COV-01 | Coverage confidence | `CLI-VERIFY-01` | `echo 'Set coverage command'` | regression | B/C |
| WF-PARITY-01 | Pathway contract parity | `CLI-VERIFY-01` | `bash scripts/predeploy_full_suite.sh` | contract/smoke | B/C |

## 4) Smoke Test Catalog

Registry of smoke tests by ID so Path IDs and packets reference stable names
instead of duplicating commands. Every core workflow needs at least one smoke or
a documented `N/A` rationale. New smokes are added in the same change that
introduces the workflow.

Naming: `SMOKE-<SCOPE>-<NN>` (for example `SMOKE-AUTH-01`, `SMOKE-CLI-01`).

| Smoke ID | Test File / Step | Purpose | Trigger Command |
|---|---|---|---|
| SMOKE-VERIFY-01 | verify gate | Project invariants | `bash scripts/verify.sh` |

## 5) Traceability and Pathway Smoke Coverage (Tier B/C)
- Maintain `docs/MASTER_TRACEABILITY_TABLE.md` as the canonical pathway map.
- Every active Path ID maps to smoke/contract coverage: `Automated`, `Manual`, or `N/A` (with rationale).
- Refactor completion requires passing smoke evidence for all touched Path IDs.
- Pathway/entrypoint/wiring changes update traceability rows in the same change.
- UI-visible changes need browser-smoke evidence or a manual click path with expected visible result.
- Data-mutating changes need a snapshot/rollback note or explicit `N/A` rationale.

## 6) Branching, PR, and Review
- Branching model: TRUNK_BASED
- Branch naming: `[feature|fix|chore]/[short-description]`
- PR size target: SMALL
- Merge rule: SQUASH
- Required checks before merge: verify gate + CI + required reviewers
- Review for correctness, security impact, test coverage, and rollback safety.
- Reject undocumented behavior changes.
- Require one approver for Tier A and two for Tier B/C (or document a solo-owner exception).

## 7) Manual Smoke Runbook (Concise)
1. Start app/runtime.
2. Initialize data store if needed.
3. Create bootstrap/admin user if needed.
4. Validate auth, core workflow, and logout manually.
5. Run `bash scripts/test_smoke.sh`, `bash scripts/test_targeted.sh`, and `bash scripts/verify.sh`.

Manual rows in the traceability table must point to this runbook or a named file.
Vague "manual smoke steps" is not sufficient.

## 8) Feature Execution Template
- Feature:
- Problem solved:
- In scope:
- Non-goals:
- Acceptance criteria:
- Security/data implications:
- Feature-flag strategy: NONE
- Rollback note:

## 9) Repository Structure Map
- `AI_AGENT.md` (AI operating contract)
- `CHANGELOG.md`
- `AI_CONTEXT.md` (generated)
- `docs/OPERATOR_PROFILE.md`
- `docs/AI_MEMORY.md`
- `docs/PROJECT_CANVAS.md`
- `docs/TECH_STACK.md`
- `docs/ENGINEERING_PLAYBOOK.md`
- `docs/OPS_SECURITY_RELEASE.md`
- `docs/MASTER_TRACEABILITY_TABLE.md` (Tier B/C)
- `docs/TEMPLATE_LIFECYCLE.md`
- `src/...`
- `tests/...`
- `.github/workflows/ci.yml`

## 10) After-Coding Checklist
- [ ] `CHANGELOG.md` updated
- [ ] Structure map section updated (if changed)
- [ ] Command index updated (if changed)
- [ ] Workflow matrix row(s) updated for new/changed workflows
- [ ] New smoke tests registered in §4 Smoke Test Catalog
- [ ] Traceability rows + per-path smoke coverage updated (Tier B/C)
- [ ] State Mutation Index paths verified against real files (Tier B/C)
- [ ] Manual smoke evidence current for UI/realtime/cron/auth paths not automated
- [ ] Security scans promised in `docs/OPS_SECURITY_RELEASE.md` run locally or confirmed green in CI
- [ ] AI context regenerated (`python3 scripts/update_ai_map.py`)
- [ ] Verify gate passed

## 11) File Size and Refactor Rules
- Soft target: keep new files <= 400 lines.
- Hard trigger: refactor when any source file > 500 lines.
- Extract cohesive modules without changing behavior.
- Re-run smoke + targeted tests + verify gate after a refactor.
