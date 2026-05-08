# Operating System File Map

Status: draft sandbox

See also `SAFEGUARD_GAP_REPORT.md` for the focused remaining-gap pass against the current orchestrator template.

This file maps the current `templates-v2` and `orchestrator-template` files into the reduced operating-system architecture.

The goal is not to preserve every current filename.
The goal is to preserve the current safeguards and behaviors while reducing duplication.

## Mapping Rules

Each current file should end up in one of these buckets:

1. keep as its own operating-system artifact,
2. merge into a stronger shared artifact,
3. stay project-local only,
4. remain optional/add-on, or
5. retire after compatibility period.

## Target Operating-System Surface

### Core startup and state

1. `AI_AGENT.md.template`
2. `SESSION_BRIEF.md.template`
3. `CONTEXT_ROUTING.md.template`
4. `PROJECT_STATE.md.template`
5. `MASTER_TRACEABILITY_TABLE.md.template`
6. `TEMPLATE_INDEX.yaml.template`

### Runbooks and lifecycle

1. `ENGINEERING_RUNBOOK.md.template`
2. `OPERATIONS_RUNBOOK.md.template`
3. `TEMPLATE_LIFECYCLE.md.template`

### Role contracts

1. `AUDITOR_CONTRACT.md.template`
2. `ORCHESTRATOR_CONTRACT.md.template`
3. `WORKER_CONTRACT.md.template`
4. `REVIEWER_CONTRACT.md.template`

### Operator, closeout, and readiness

1. `OPERATOR_DASHBOARD.md.template`
2. `CLOSING_CHECKLIST.md.template`
3. `INVESTIGATOR_PROTOCOL.md.template`
4. `LOCAL_WORKER_HEALTH.md.template`

### Packets and state

1. `WORKER_TASK_PACKET.md.template`
2. `WORKER_RESULT_PACKET.md.template`
3. `STATE_LEDGER_PROTOCOL.md.template`
4. `TEMPLATE_AUDIT_MANIFEST.yaml.template`

### Runtime and sync

1. `RUNTIME_MIRROR_POLICY.md.template`
2. `RUNTIME_MIRROR_MANIFEST.json.template`
3. `scripts/sync_runtime_mirror.sh.template` or equivalent
4. `scripts/check_runtime_mirror.sh.template` or equivalent

## Current To Target Map

### Startup contract family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/AI_AGENT.md.template` | `AI_AGENT.md.template` | merge base | Keep one canonical startup contract family. |
| `templates-v2/profiles/lean/AI_AGENT.md.template` | `AI_AGENT.md.template` profile variant | keep as profile | Lean startup remains valuable. |
| `templates-v2/orchestrator-template/AI_AGENT.md.template` | `AI_AGENT.md.template` orchestrator profile | keep as profile | Orchestrator-specific rails belong here, not in app code. |
| `templates-v2/profiles/lean/SESSION_BRIEF.md.template` | `SESSION_BRIEF.md.template` | keep | Still needed as live current-state brief. |
| `templates-v2/orchestrator-template/SESSION_BRIEF.md.template` | `SESSION_BRIEF.md.template` orchestrator variant | merge variant | Same artifact family, role-specific details. |
| `templates-v2/profiles/lean/CONTEXT_ROUTING.md.template` | `CONTEXT_ROUTING.md.template` | keep | Startup routing should remain explicit. |
| `templates-v2/orchestrator-template/CONTEXT_ROUTING.md.template` | `CONTEXT_ROUTING.md.template` orchestrator variant | merge variant | Same artifact family. |

### Project state family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/PROJECT_CANVAS.md.template` | `PROJECT_STATE.md.template` | merge | Strategic scope and architecture snapshot. |
| `templates-v2/orchestrator-template/PROJECT_CANVAS.md.template` | `PROJECT_STATE.md.template` | merge | Orchestrator flavor of the same job. |
| `templates-v2/addons/GAME_PLAN.md.template` | `PROJECT_STATE.md.template` | merge | Live plan/checklist state should not be a separate concept. |
| `templates-v2/orchestrator-template/GAME_PLAN.md.template` | `PROJECT_STATE.md.template` | merge | One current-state artifact is enough. |
| `templates-v2/AI_MEMORY.md.template` | keep separate or appendix in `PROJECT_STATE.md.template` | likely keep separate | Memory and live planning are related but not identical. |
| `templates-v2/CHANGELOG.md.template` | project-local | keep project-local | History belongs in the target project, not in OS mirror logic. |

### Engineering and command family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/ENGINEERING_PLAYBOOK.md.template` | `ENGINEERING_RUNBOOK.md.template` | merge | Core coding, tests, verify, file-size rules. |
| `templates-v2/orchestrator-template/ENGINEERING_PLAYBOOK.md.template` | `ENGINEERING_RUNBOOK.md.template` | merge | Keep orchestrator-specific coding rails here if still needed. |
| `templates-v2/COMMANDS.md.template` | `ENGINEERING_RUNBOOK.md.template` or project-local command appendix | merge | Commands should not drift from workflow rules. |
| `templates-v2/orchestrator-template/COMMANDS.md.template` | compatibility-only export | keep temporarily | OS-native command guidance lives in `ENGINEERING_RUNBOOK.md.template`; standalone commands file stays only while legacy consumers need it. |
| `templates-v2/TECH_STACK.md.template` | `PROJECT_STATE.md.template` or `ENGINEERING_RUNBOOK.md.template` appendix | merge | Can be a dedicated section, not a full separate doc unless complexity requires it. |

### Ops and release family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/OPS_SECURITY_RELEASE.md.template` | `OPERATIONS_RUNBOOK.md.template` | merge | Keep deploy, secrets, rollback, scans, release rules. |
| `templates-v2/orchestrator-template/LOCAL_WORKER_HEALTH.md.template` | `LOCAL_WORKER_HEALTH.md.template` | keep | Worker-lane readiness is specific enough to stay standalone. |
| `templates-v2/addons/MULTI_APP_SERVER_BLUEPRINT.md.template` | optional add-on | keep optional | Not core operating-system surface. |
| `SERVER_CONTEXT.md` | optional shared baseline | keep optional | Useful baseline, not OS core. |

### Traceability and test evidence family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/MASTER_TRACEABILITY_TABLE.md.template` | `MASTER_TRACEABILITY_TABLE.md.template` | keep | Core safeguard. |
| `templates-v2/orchestrator-template/MASTER_TRACEABILITY_TABLE.md.template` | `MASTER_TRACEABILITY_TABLE.md.template` | merge | One canonical table structure. |
| `templates-v2/orchestrator-template/SMOKE_TEST_CATALOG.md.template` | `ENGINEERING_RUNBOOK.md.template` appendix or optional companion | merge or optional | Useful, but may not need a standalone file. |
| `templates-v2/orchestrator-template/WORKFLOW_TEST_MATRIX.md.template` | `ENGINEERING_RUNBOOK.md.template` appendix or optional companion | merge or optional | Same rationale. |
| `templates-v2/orchestrator-template/TEST_BLOAT_SWEEP.md.template` | `REVIEWER_CONTRACT.md.template` appendix | merge | It is really a review rule. |

### Lifecycle and adoption family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/TEMPLATE_ADOPTION_WALKTHROUGH.md.template` | `TEMPLATE_LIFECYCLE.md.template` | merge | High-value capability checklist. |
| `templates-v2/TEMPLATE_PROFILE_MIGRATION.md.template` | `TEMPLATE_LIFECYCLE.md.template` | merge | Profile selection should be part of lifecycle. |
| `templates-v2/APPLY_CHECKLIST.md.template` | `TEMPLATE_LIFECYCLE.md.template` | merge | This is one stage of the same lifecycle. |
| `templates-v2/TEMPLATE_VALIDATION_CHECKLIST.md.template` | `TEMPLATE_LIFECYCLE.md.template` | merge | Same lifecycle. |
| `templates-v2/QUICKSTART_5_MIN.md.template` | `TEMPLATE_LIFECYCLE.md.template` quickstart section | merge | Keep, but as a section. |
| `templates-v2/PLACEHOLDER_REFERENCE.md.template` | `TEMPLATE_LIFECYCLE.md.template` placeholder section | merge | Keep the function, not the file. |
| `templates-v2/UPGRADE_GUIDE.md.template` | `TEMPLATE_LIFECYCLE.md.template` upgrade section | merge | Same lifecycle family. |
| `templates-v2/orchestrator-template/ORCHESTRATOR_CARRYOVER_EXAMPLE.md.template` | `TEMPLATE_LIFECYCLE.md.template` orchestrator carryover example | merge | Example belongs inside lifecycle. |
| `templates-v2/PROJECT_STANDARDIZATION_KIT.md` | compatibility guide only | retire after migration | Once OS structure is real, this should become a pointer. |

### Auditor contract family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/orchestrator-template/TEMPLATE_AUDIT_MANIFEST.yaml.template` | `TEMPLATE_AUDIT_MANIFEST.yaml.template` | keep | Machine-readable audit checklist should remain first-class. |
| LangGraph project `docs/TEMPLATE_AUDITOR.md` | `AUDITOR_CONTRACT.md.template` | move into OS | This should not live only in LangGraph. |
| `templates-v2/TEMPLATE_INDEX.yaml.template` | `TEMPLATE_INDEX.yaml.template` | keep | Inventory remains central to auditing. |
| `templates-v2/orchestrator-template/TEMPLATE_INDEX.yaml.template` | `TEMPLATE_INDEX.yaml.template` profile variant | merge variant | Same inventory family. |

### Orchestrator contract family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/orchestrator-template/ORCHESTRATION_MAP.md.template` | `ORCHESTRATOR_CONTRACT.md.template` | merge | Stable role split and routing rules. |
| `templates-v2/orchestrator-template/SCENARIO_PLAYBOOK.md.template` | `ORCHESTRATOR_CONTRACT.md.template` | merge | Workflow-level routing belongs in orchestrator contract. |
| `templates-v2/orchestrator-template/OPERATOR_DASHBOARD.md.template` | `OPERATOR_DASHBOARD.md.template` | keep | Non-coder operator approval and rollback is a distinct safeguard surface. |
| `templates-v2/orchestrator-template/VISION.md.template` | compatibility-only export | keep temporarily | OS mission and workflow intent now live in `README.md` plus role contracts; standalone vision file is no longer core OS surface. |

### Worker contract family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/orchestrator-template/WORKER_TASK_PACKET.md.template` | `WORKER_TASK_PACKET.md.template` | keep | Core packet artifact. |
| `templates-v2/orchestrator-template/APPLY_CHECKLIST.md.template` | `WORKER_CONTRACT.md.template` | merge | Worker pre-return ritual belongs in worker contract. |
| `templates-v2/orchestrator-template/FEATURE_SPEC_TEMPLATE.md.template` | optional worker/orchestrator planning artifact | optional | Useful for non-trivial work, may stay separate. |

### Reviewer contract family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/orchestrator-template/WORKER_RESULT_PACKET.md.template` | `WORKER_RESULT_PACKET.md.template` | keep | Core packet artifact. |
| `templates-v2/orchestrator-template/POST_CODING_CHECKS.md.template` | `REVIEWER_CONTRACT.md.template` | merge | Main reviewer logic. |
| `templates-v2/orchestrator-template/CLOSING_CHECKLIST.md.template` | `CLOSING_CHECKLIST.md.template` | keep | Final closeout gate should stay explicit and auditable. |
| `templates-v2/orchestrator-template/INVESTIGATOR_PROTOCOL.md.template` | `INVESTIGATOR_PROTOCOL.md.template` | keep | Escalation workflow needs its own packet and cycle rules. |

### State and mirror family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/orchestrator-template/STATE_LEDGER_PROTOCOL.md.template` | `STATE_LEDGER_PROTOCOL.md.template` | keep | Core runtime state contract. |
| `templates-v2/orchestrator-template/packet_ledger.json.template` | state seed | keep | Runtime state seed, not narrative doc. |
| `templates-v2/orchestrator-template/session_budget.json.template` | state seed | keep | Runtime state seed. |
| `templates-v2/scripts/orchestrator_state.py.template` | runtime script | keep | Needed by LangGraph and orchestrator pattern. |
| `templates-v2/scripts/sync_session_brief.sh.template` | runtime script | keep | Needed for lean startup state. |

### Validation and mirror-control scripts

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/scripts/bootstrap_agent_ready.sh.template` | separate compatibility tool | keep temporarily | Useful while old pack remains active. |
| `templates-v2/scripts/validate_templates.sh.template` | `scripts/validate_operating_system.sh.template` plus `scripts/check_runtime_mirror.sh.template` | split | Separate applied-project validation from runtime mirror validation. |
| `templates-v2/scripts/check_template_drift.sh.template` | `scripts/check_runtime_mirror.sh.template` | merge | Drift check belongs in mirror validation. |
| `templates-v2/scripts/validate_context_budget.sh.template` | keep | Still needed for startup discipline. |
| `templates-v2/scripts/report_context_size.sh.template` | keep optional | Diagnostic helper. |
| `templates-v2/scripts/enforce_doc_updates.sh.template` | keep | Strong safeguard; should remain. |
| `templates-v2/scripts/predeploy_full_suite.sh.template` | keep | Strong safeguard; should remain. |
| `templates-v2/scripts/placeholder_allowlist.txt.template` | keep optional | Implementation detail, still useful. |

### CI/CD and delivery family

| Current file | Target artifact | Action | Notes |
|---|---|---|---|
| `templates-v2/.github/workflows/ci.yml.template` | `CI_BASELINE.yml.template` | keep | CI is part of the operating system, not an afterthought. |
| `templates-v2/addons/.github/workflows/ci.predeploy.yml.template` | `CI_PREDEPLOY.yml.template` | keep | Predeploy-gated CI remains useful as a stronger profile. |
| project `scripts/verify.sh` conventions | `VERIFY_GATE.sh.template` guidance | formalize | Verify needs an explicit OS-level contract. |

### Optional or compatibility-only files

| Current file | Recommendation |
|---|---|
| `templates-v2/addons/AI_OPERATING_CONTRACT.md.template` | compatibility only; retire later |
| `templates-v2/addons/README.md.template` | optional |
| `templates-v2/addons/CONTRIBUTING.md.template` | optional |
| `templates-v2/addons/LICENSE.template` | optional |
| `templates-v2/addons/.gitignore.template` | optional |
| `templates-v2/addons/FIRST_SESSION_PROMPT.txt.template` | optional |
| `templates-v2/addons/ADR_TEMPLATE.md.template` | optional |
| `templates-v2/addons/ADVANCED_VERIFICATION_PLAYBOOK.md.template` | merge useful rules into runbooks, then retire file |

## Phase 1 Mirror Subset For LangGraph

If we want LangGraph to behave consistently first, these are the highest-priority operating-system artifacts for the runtime mirror:

1. `AI_AGENT.md.template`
2. `SESSION_BRIEF.md.template`
3. `CONTEXT_ROUTING.md.template`
4. `TEMPLATE_INDEX.yaml.template`
5. `TEMPLATE_AUDIT_MANIFEST.yaml.template`
6. `AUDITOR_CONTRACT.md.template`
7. `ORCHESTRATOR_CONTRACT.md.template`
8. `WORKER_CONTRACT.md.template`
9. `REVIEWER_CONTRACT.md.template`
10. `WORKER_TASK_PACKET.md.template`
11. `WORKER_RESULT_PACKET.md.template`
12. `STATE_LEDGER_PROTOCOL.md.template`
13. `ENGINEERING_RUNBOOK.md.template`
14. `MASTER_TRACEABILITY_TABLE.md.template`
15. `TEMPLATE_LIFECYCLE.md.template`
16. `RUNTIME_MIRROR_POLICY.md.template`
17. `RUNTIME_MIRROR_MANIFEST.json.template`
18. `scripts/sync_runtime_mirror.sh.template`
19. `scripts/check_runtime_mirror.sh.template`
20. `OPERATOR_DASHBOARD.md.template`
21. `CLOSING_CHECKLIST.md.template`
22. `INVESTIGATOR_PROTOCOL.md.template`
23. `LOCAL_WORKER_HEALTH.md.template`

This subset is what should drive LangGraph role behavior and template-audit behavior first.

## Compatibility Strategy

We should not delete old files first.

Safer rollout:

1. Build new operating-system artifacts in this sandbox.
2. Map old files to new artifacts.
3. Keep compatibility shims or alias docs while LangGraph is updated.
4. Update the runtime mirror loader.
5. Update LangGraph role behavior to load the new contracts.
6. Only then retire the old duplicated docs.

## Recommendation

The remaining structural mapping decisions are closed for this sandbox.

Current compatibility decision:

1. `COMMANDS.md.template` remains compatibility-only while legacy consumers still expect it.
2. `VISION.md.template` remains compatibility-only while legacy consumers still expect it.
3. Neither is a required reduced operating-system artifact.