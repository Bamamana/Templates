# Template Lifecycle (V3 Audit)

Read when: installing, adopting, migrating profiles, resolving placeholders,
validating, upgrading, or version-bumping the template.
Skip when: routine feature work after adoption is fully green and the profile is current.

This one file replaces the old separate quickstart, apply checklist, adoption
walkthrough, profile migration, placeholder reference, validation checklist, and
upgrade guide. The capability content is preserved; it just lives in one place.

---

## 1) Quickstart (5 Minutes)

### Pick a tier
- Tier A: static/lightweight (single page, no backend state)
- Tier B: standard app/API
- Tier C: production-critical/regulatory/high-availability

### Run the bootstrap (one command, biggest upgrade)
Tier A:
```bash
bash templates-v3/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/project --project-name "V3 Audit" \
  --tier TIER_A_STATIC --tier-profile auto --profile 2 --ci 1 --strict
```
Tier B:
```bash
bash templates-v3/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/project --project-name "V3 Audit" \
  --tier TIER_B_STANDARD --tier-profile auto --profile 2 --ci 2 --strict
```
Tier C:
```bash
bash templates-v3/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/project --project-name "V3 Audit" \
  --tier TIER_C_PRODUCTION_CRITICAL --tier-profile auto --profile 2 --ci 4 --strict
```

What one run does: applies core files (+ selected profile/CI options), auto-fills
common placeholders, runs `scripts/validate_templates.sh`, stamps
`docs/TEMPLATE_VERSION.md`, and writes `docs/TEMPLATE_READINESS_REPORT.md` plus
`docs/TEMPLATE_UNRESOLVED_PLACEHOLDERS.txt`. Omit `--target` for interactive mode.
`--strict` exits non-zero when unresolved placeholders remain after allowlist filtering.

Then confirm in `docs/TEMPLATE_READINESS_REPORT.md`: `Validation status: pass` and
`Unresolved placeholder lines: 0`, run the drift check, and run `bash scripts/verify.sh`.

---

## 2) Profiles

| Option | Profile | Use when | Bootstrap flags |
|---|---|---|---|
| 1 | Default | Full standard template; startup token cost is not a concern | none |
| 2 | Lean | Keep all docs/scripts but start sessions from `AI_AGENT.md`, `docs/SESSION_BRIEF.md`, `docs/CONTEXT_ROUTING.md` | `--lean` |
| 3 | Orchestrator | Cloud orchestrator + local worker + investigator packets and review gates | `--orchestrator` |

Profiles are overlays of this one pack, never forks. Every improvement to the core
benefits every profile. Lean and Orchestrator reuse the canonical docs; they only
add startup/role files.

### Required first question
When asked to run carryover/switch profile and the target is not explicit, ask
exactly one multiple-choice question: Default / Lean / Orchestrator. Detection
(`docs/SESSION_BRIEF.md` exists → Lean; `docs/ORCHESTRATION_MAP.md` exists →
Orchestrator) is context for the question, not permission to choose silently.

### Migration pathways
- Any → Default: bootstrap without `--lean`/`--orchestrator`. Keep real project docs; mark unused profile docs retired only after operator confirmation.
- Default → Lean: bootstrap with `--lean`; fill the plan doc; run `bash scripts/sync_session_brief.sh` and `bash scripts/validate_context_budget.sh`.
- Lean/Default → Orchestrator: bootstrap with `--orchestrator`; then run `python3 scripts/orchestrator_state.py init`, resolve `docs/ORCHESTRATION_MAP.md`, `docs/LOCAL_WORKER_HEALTH.md`, and budget ceilings, and dry-run one doc-only packet end to end before implementation packets.
- Orchestrator → Lean/Default: bootstrap with `--lean` (or default). Do not auto-delete orchestrator docs; set `docs/state/session_budget.json` execution mode to `HALTED`, note the change in the changelog, and keep ledgers for audit.

### Completion criteria
- [ ] Target profile selected by operator or explicit directive
- [ ] Bootstrap command for the selected profile ran successfully
- [ ] Applicable adoption sections (§4) complete
- [ ] Profile-specific validator passed (context budget for lean; orchestrator state for orchestrator)
- [ ] Verify gate passed or blocker recorded
- [ ] `CHANGELOG.md` records current profile and migration evidence

---

## 3) Apply Order

- [ ] `AI_AGENT.md.template` → `AI_AGENT.md`
- [ ] `OPERATOR_PROFILE.md.template` → `docs/OPERATOR_PROFILE.md`
- [ ] `AI_MEMORY.md.template` → `docs/AI_MEMORY.md`
- [ ] `PROJECT_CANVAS.md.template` → `docs/PROJECT_CANVAS.md`
- [ ] `TECH_STACK.md.template` → `docs/TECH_STACK.md`
- [ ] `ENGINEERING_PLAYBOOK.md.template` → `docs/ENGINEERING_PLAYBOOK.md`
- [ ] `OPS_SECURITY_RELEASE.md.template` → `docs/OPS_SECURITY_RELEASE.md`
- [ ] `MASTER_TRACEABILITY_TABLE.md.template` → `docs/MASTER_TRACEABILITY_TABLE.md` (Tier B/C required; Tier A may mark N/A)
- [ ] `CHANGELOG.md.template` → `CHANGELOG.md`
- [ ] `TEMPLATE_LIFECYCLE.md.template` → `docs/TEMPLATE_LIFECYCLE.md`
- [ ] `TEMPLATE_INDEX.yaml.template` → `docs/TEMPLATE_INDEX.yaml`
- [ ] `.github/workflows/ci.yml.template` → `.github/workflows/ci.yml`
- [ ] `scripts/check_template_drift.sh.template` → `scripts/check_template_drift.sh`
- [ ] `scripts/placeholder_allowlist.txt.template` → `scripts/placeholder_allowlist.txt` (optional but recommended)
- [ ] Optional add-ons copied only if needed (see `addons/`)
- [ ] Legacy alias only if required: `AI_OPERATING_CONTRACT.md` must be an exact copy of `AI_AGENT.md`, never a separate rule file

The bootstrap performs this order automatically. Use it instead of copying by hand.

---

## 4) Adoption Capability Walkthrough

The known failure mode: an AI partially adopts the template (copies docs, skips
scripts and CI) and later sessions silently ignore capabilities that exist but
were never wired up. Adoption is not done until each capability is present and the
AI has been told how to discover it. For routed profiles, register the listed
trigger in `docs/CONTEXT_ROUTING.md` under `## Event Triggers`.

### 0) Pre-flight
- [ ] Target profile selected (Default / Lean / Orchestrator)
- [ ] Tier selected and recorded in `AI_AGENT.md`
- [ ] `V3 Audit` resolved everywhere outside the placeholder tables
- [ ] Existing project? Working tree clean and baseline commit SHA recorded

### 1) Core docs
- [ ] `AI_AGENT.md`, `docs/OPERATOR_PROFILE.md`, `docs/AI_MEMORY.md`
- [ ] `docs/PROJECT_CANVAS.md`, `docs/TECH_STACK.md`, `docs/ENGINEERING_PLAYBOOK.md`
- [ ] `docs/OPS_SECURITY_RELEASE.md`, `docs/MASTER_TRACEABILITY_TABLE.md` (Tier B/C or N/A)
- [ ] `docs/TEMPLATE_LIFECYCLE.md`, `docs/TEMPLATE_INDEX.yaml`, `CHANGELOG.md` with `Unreleased`
- Prove: `ls AI_AGENT.md docs/AI_MEMORY.md docs/PROJECT_CANVAS.md docs/ENGINEERING_PLAYBOOK.md CHANGELOG.md`

### 2) Scripts (most often skipped in retrofits)
- `scripts/verify.sh` — canonical verify gate (project-specific; create if missing)
- `scripts/check_template_drift.sh`, `scripts/validate_templates.sh`, `scripts/enforce_doc_updates.sh`
- `scripts/predeploy_full_suite.sh`, `scripts/validate_context_budget.sh`, `scripts/sync_session_brief.sh` (routed profiles)
- Triggers: "About to merge to main" → predeploy; "Behavior change without doc update suspected" → enforce_doc_updates; "Template version bump" → drift check + §7
- [ ] Applicable scripts present, executable, triggers registered, or N/A
- Lean audit: `scripts/verify.sh` must be close enough to CI that local green means something. For Tier B/C it should run or delegate to template validation, context budget, drift check, doc enforcement, security checks named in ops docs, and smoke/targeted tests for every active service.
- [ ] Local verify parity checked against CI; CI-only checks have a rationale
- Validation gate inventory: list every active app/service gate and whether it is required before handoff. Multi-service repos often have more than one meaningful gate; do not stop after the smallest green command.
- [ ] Every active app/service has a named validation gate or an explicit N/A rationale

### 3) CI/CD
- [ ] `.github/workflows/ci.yml` runs lint, typecheck, smoke, and the verify gate
- [ ] Runs `scripts/check_template_drift.sh` (recommended)
- [ ] Runs `scripts/enforce_doc_updates.sh` (recommended)
- Triggers: "About to add or change a CI job" → ci.yml + playbook; "CI red after worker DONE" → `docs/POST_CODING_CHECKS.md`
- Prove: `gh workflow list` (or Actions tab); push a no-op commit and confirm CI runs

### 4) Testing
- [ ] Test suite location + runner command; smoke and workflow matrix populated in `docs/ENGINEERING_PLAYBOOK.md` §3–§4
- Triggers: "New entrypoint/workflow" → traceability + workflow matrix; "New smoke test" → smoke catalog; "BUGFIX packet" → regression accretion; "Test modified" → test-honesty spot-check
- Pre-beta human workflow audit (automated tests do not prove usability):
  - [ ] Auth/login callback paths have scripted or manual smoke evidence
  - [ ] Mutating pages have frontend tests or manual role-based smoke evidence
  - [ ] Realtime/WebSocket paths have a repeatable script or current manual smoke
  - [ ] Cron/scheduler paths have a runnable wrapper or documented manual runbook
  - [ ] UI-visible changes require browser-smoke or a manual click path with expected visible result
  - [ ] Each real user role has a short manual smoke path before beta
  - [ ] AI-added tests prove behavior/user/data outcome, not only existence

### 5) Worker / Orchestrator pattern (only if adopted)
- [ ] `docs/ORCHESTRATION_MAP.md` (role split + 9-step worker loop + token policy)
- [ ] `docs/SCENARIO_PLAYBOOK.md`, `docs/WORKER_TASK_PACKET.md`, `docs/WORKER_RESULT_PACKET.md`
- [ ] `docs/POST_CODING_CHECKS.md`, `docs/INVESTIGATOR_PROTOCOL.md`, `docs/STATE_LEDGER_PROTOCOL.md`
- [ ] `docs/LOCAL_WORKER_HEALTH.md`, `docs/OPERATOR_DASHBOARD.md`, `docs/CLOSING_CHECKLIST.md`, `docs/TEST_BLOAT_SWEEP.md`
- [ ] `AI_AGENT.md` orchestrator rails populated; `docs/state/` ledgers initialized
- Triggers: "Choosing workflow mode" → scenario playbook; "Issuing a packet" → task packet; "Worker returned DONE" → post-coding checks; "BLOCKED twice on same Path ID" → investigator; "Before final handoff" → closing checklist
- Prove: dry-run one doc-only packet end to end (issue → result → review → ledger → closing checklist)
- [ ] All docs present, rails populated, triggers registered, dry run green, or N/A

### 6) Version management
- [ ] A canonical version source and a bump script that updates every version-bearing artifact in one call
- [ ] `docs/TEMPLATE_VERSION.md` stamp matches the applied pack version
- Trigger (most important): "Versions look out of sync" / "About to release" / "About to bump version" → run the bump script; never hand-edit individual version strings
- Prove: `bash scripts/bump_version.sh --dry-run` (or equivalent) reports every artifact it would touch

### 7) Final adoption gate
Run in order; all must pass:
1. `bash scripts/verify.sh` (or project verify gate) — exit 0
2. `bash scripts/check_template_drift.sh . path/to/templates-v3` — exit 0
3. `bash scripts/validate_context_budget.sh` — exit 0 for routed startup profiles
4. `bash scripts/validate_templates.sh .` (if present) — exit 0
5. Required security scans pass locally or are confirmed green in CI
6. Orchestrator repos confirm vague-prompt pushback, anti-tautology review, UI smoke evidence, data snapshot/restore, and tie-breaker halt are wired in
7. Complete §6 Validation Checklist — every box checked
8. Push a no-op commit; confirm CI green
9. Update `CHANGELOG.md` `Unreleased`: "Adopted templates-v3 vv3.0; sections completed: ..."

- [ ] All pass. Until then, treat the project as partially adopted and surface unchecked sections at session start.

### Lean project audit (before importing more template pieces)
Before adding orchestrator/advanced files to an existing project: read the startup
docs, confirm `SESSION_BRIEF` fields are real (not `(not set)`), run the verify gate,
scan `MASTER_TRACEABILITY_TABLE` for `Coverage pending` / manual rows without a
runbook / `N/A` without rationale / stale State Mutation Index paths, compare ops
docs to CI and `verify.sh` for promised-but-unrun scans, inventory every service
gate, search for missing frontend tests on mutating pages, spot-check recent tests
for tautologies, and check the changelog smoke evidence is current. Import only the
pieces that close a real gap found above.

---

## 5) Placeholder Reference

- `scripts/bootstrap_agent_ready.sh` auto-fills many placeholders.
- Remaining placeholders are listed in `docs/TEMPLATE_UNRESOLVED_PLACEHOLDERS.txt`.
- Allowlist intentional unresolved placeholders in `scripts/placeholder_allowlist.txt` with rationale.

| Placeholder | Meaning | Usually set by | Required |
|---|---|---|---|
| `V3 Audit` | Human-readable project name | Bootstrap | Yes |
| `TIER_B_STANDARD` | Project tier | Bootstrap | Yes |
| `bash scripts/verify.sh` | Main verification gate | Bootstrap/defaults | Yes |
| `python3 scripts/update_ai_map.py` | Regenerate AI/system context map | Bootstrap/defaults | Yes |
| `bash scripts/test_smoke.sh` | Fast smoke test command | Bootstrap/defaults | Yes |
| `bash scripts/test_targeted.sh` | Focused regression test command | Bootstrap/defaults | Yes |
| `bash scripts/predeploy_full_suite.sh` | Pathway smoke command | Bootstrap/defaults | Tier B/C |
| `Set during bootstrap; refine with project rationale.` | Reason the tier matches project risk | Manual | Yes |
| `Populate project-specific docs and commands` | Concrete next checklist item | Manual | Yes |
| `bash scripts/verify.sh` | Immediate next action command | Bootstrap/manual | Yes |
| `v3.0` | Applied template pack version | Bootstrap | Yes |

Rule of thumb: resolve any placeholder that appears in active docs/workflows; if
intentionally deferred, allowlist it with rationale.

---

## 6) Validation Checklist

### Presence
- [ ] `docs/TEMPLATE_LIFECYCLE.md` exists and each adopted section is checked or N/A with rationale
- [ ] Routed startup profiles have `docs/SESSION_BRIEF.md` and `docs/CONTEXT_ROUTING.md` with `## Event Triggers`
- [ ] `AI_AGENT.md` is the mandatory startup file; `docs/AI_MEMORY.md`, `docs/PROJECT_CANVAS.md`, `docs/TECH_STACK.md`, `docs/ENGINEERING_PLAYBOOK.md`, `docs/OPS_SECURITY_RELEASE.md` exist
- [ ] `docs/MASTER_TRACEABILITY_TABLE.md` exists for Tier B/C (or Tier A has N/A rationale)
- [ ] `CHANGELOG.md` has `Unreleased`; `.github/workflows/ci.yml` exists
- [ ] `docs/TEMPLATE_INDEX.yaml` matches applied files; `docs/TEMPLATE_VERSION.md` has the current stamp
- [ ] If `AI_OPERATING_CONTRACT.md` exists, it mirrors `AI_AGENT.md` (no separate rules)

### Placeholder integrity
- [ ] No unresolved placeholders (`V3 Audit`, `bash scripts/verify.sh`, …)
- [ ] Resolution follows §5, or unresolved placeholders are explicitly allowlisted
- [ ] All commands execute in the target environment; tier has a rationale

### Quality gates
- [ ] Verify gate passes; smoke command runs
- [ ] `scripts/check_template_drift.sh` passes against the selected template root
- [ ] At least one targeted workflow test exists; workflow matrix and smoke catalog are populated
- [ ] Tier B/C: every active Path ID has coverage status; touched Path IDs have command/runbook evidence in the same change

### Tier compliance
- [ ] Tier A advanced controls implemented or `N/A` with rationale
- [ ] Tier B advanced controls implemented where applicable
- [ ] Tier C all advanced controls implemented

### Optional add-ons
- [ ] README, .gitignore, CONTRIBUTING, LICENSE, PR/issue templates present when applicable
- [ ] CI variant, multi-app blueprint, local compose, ADR template used only when needed

---

## 7) Upgrade Guide

Goal: upgrade template governance safely while preserving project behavior.

1. Preflight: clean working tree; record current version:
   ```bash
   grep '^version:' docs/TEMPLATE_INDEX.yaml
   grep '^template_version:' docs/TEMPLATE_VERSION.md || true
   bash scripts/validate_templates.sh .
   ```
2. Apply the new pack (keep project edits by default):
   ```bash
   bash /path/to/templates-v3/scripts/bootstrap_agent_ready.sh.template \
     --target . --template-root /path/to/templates-v3 \
     --tier-profile auto --profile 2 --overwrite skip --strict
   ```
   Re-run with `--overwrite overwrite` only to intentionally refresh files to latest defaults.
3. Resolve deltas: review `docs/TEMPLATE_UNRESOLVED_PLACEHOLDERS.txt`; allowlist intentional deferrals; confirm commands in `AI_AGENT.md` and the playbook still match reality.
4. Validate: run `validate_templates.sh` and the drift check; confirm the readiness report shows pass and 0 unresolved.
5. Commit the upgrade separately from feature changes; include old → new version in the message/changelog.
6. Rollback: if validation fails and cannot be fixed quickly, revert the upgrade commit and retry in a smaller pass.

---

## 8) Version Management

Every version-bearing artifact (package manifest, pyproject, manifest.json,
compose tags, version stamp, changelog header) must advance together. Drift here is
a known failure mode: a script exists, the AI does not know to use it, versions
diverge silently.

- Keep one canonical version source.
- Keep one bump script that updates every version-bearing artifact in a single call.
- Register the trigger (see §4.6) so sessions discover it without reading this whole doc.
- `docs/TEMPLATE_VERSION.md` must match the applied pack version from `docs/TEMPLATE_INDEX.yaml`.
