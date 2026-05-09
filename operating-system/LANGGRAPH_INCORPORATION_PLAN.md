# LangGraph Incorporation Plan

Status: draft implementation bridge

Purpose: define how `LangGraph-Orchestrator-Runner` should adopt this operating-system sandbox without reintroducing drift, hidden prompt behavior, or non-coder workflow burden.

This plan does not authorize broad LangGraph edits by itself.
Use it to issue bounded implementation packets after the operating-system shape is accepted.

## Operating Principles

1. Templates is the editable operating system.
2. LangGraph is the runtime, adapter, UI, state executor, and model router.
3. LangGraph must consume one validated runtime mirror of the operating system.
4. Target projects change only through audit, reviewed plan, bounded packet, worker result, and reviewer decision.
5. The operator remains non-coder: plain-language status and choices first, technical details available behind the workflow.
6. Expensive cloud models do planning, review, investigation, and operator explanation.
7. Local workers do bounded implementation from packet-approved files, commands, and evidence requirements.
8. Written artifacts outrank chat memory, hidden JSON, and model assumptions.

## Target Runtime Shape

LangGraph should eventually contain one packaged mirror:

```text
vendor/operating-system/
```

The mirror should be built from:

```text
/root/repos/Bamamana/Templates/operating-system
```

The mirror must include the files listed in `RUNTIME_MIRROR_MANIFEST.json.template` for the selected phase.
Runtime reads should use only the validated mirror, not a mixture of live Templates and vendored legacy files.

## Phase 0: Freeze OS Baseline

Goal: make sure the operating-system sandbox is coherent before LangGraph code changes.

Required checks:

1. `RUNTIME_MIRROR_MANIFEST.json.template` parses as JSON.
2. `TEMPLATE_INDEX.yaml.template` and profile indexes parse as YAML.
3. `TEMPLATE_AUDIT_MANIFEST.yaml.template` parses as YAML.
4. all OS script templates parse or compile.
5. runtime mirror sync/check succeeds into a temporary mirror.
6. temporary orchestrator-profile state initialization validates.

Exit criteria:

1. no known OS-side required artifact is missing,
2. mirror manifest sources all resolve,
3. `SAFEGUARD_GAP_REPORT.md` does not claim coverage that the index/manifest/validator cannot enforce.

Stop conditions:

1. any manifest entry points to a missing source,
2. any applied-project validator requirement is not represented in the index or profile index,
3. runtime mirror sync/check cannot pass in a temporary directory.

## Phase 1: Mirror-Only LangGraph Adoption

Goal: teach LangGraph to sync, package, validate, and report the OS mirror without changing role behavior yet.

LangGraph changes should be bounded to mirror plumbing and status reporting.

Implementation targets:

| Current LangGraph concept | New OS target | Notes |
|---|---|---|
| `vendor/templates-v2` | `vendor/operating-system` | New mirror path; keep legacy mirror during compatibility period if needed. |
| `npm run templates:sync` | OS mirror sync command | May wrap `scripts/sync_runtime_mirror.sh.template` behavior in package scripts. |
| `npm run templates:check` | OS mirror check command | Must fail on missing files, drift, missing manifest copy, or missing status file. |
| extension/runtime template status | `runtime-status.json` | Operator-facing status should say refreshed/current/fallback/invalid. |
| template snapshot packaging | OS runtime mirror manifest | Packaging should include the validated OS mirror. |

Required behavior:

1. resolve master Templates source when available,
2. sync `Templates/operating-system` into `vendor/operating-system`,
3. copy `RUNTIME_MIRROR_MANIFEST.json.template` into the mirror,
4. write `runtime-status.json`,
5. validate mirror before audit/orchestration/verify/package,
6. use packaged fallback only when source is unavailable and fallback validates,
7. surface mirror status in plain language.

Validation:

1. unit test: mirror sync writes all required phase files,
2. unit test: mirror check fails on missing required file,
3. unit test: mirror check fails on hash drift when source is available,
4. smoke: package includes `vendor/operating-system`,
5. smoke: startup reports current/refreshed/fallback/invalid status accurately.

Stop conditions:

1. LangGraph reads live Templates and mirror files in the same runtime pass,
2. mirror invalid but audit/orchestration continues,
3. packaged fallback lacks manifest or status file,
4. operator cannot tell whether fallback is in use.

## Phase 2: Audit Lane From OS Mirror

Goal: make the template auditor use the OS mirror, audit manifest, lifecycle rules, and template index instead of hardcoded legacy prompt behavior.

OS artifacts consumed:

1. `AUDITOR_CONTRACT.md.template`
2. `TEMPLATE_AUDIT_MANIFEST.yaml.template`
3. `TEMPLATE_INDEX.yaml.template`
4. profile-specific `TEMPLATE_INDEX.yaml.template`
5. `TEMPLATE_LIFECYCLE.md.template`
6. `RUNTIME_MIRROR_POLICY.md.template`

Runtime responsibilities:

1. pass mirror version/source/status into the auditor,
2. give auditor read-only access to target project and mirror,
3. allow auditor to write only `docs/TEMPLATE_AUDIT_REPORT.md`,
4. merge deterministic file/script/CI checks into the report,
5. route the written report to review,
6. repair the same report artifact on `REPAIR`.

Validation:

1. audit run writes `docs/TEMPLATE_AUDIT_REPORT.md`,
2. audit includes required manifest sections,
3. audit flags missing OS files/scripts/state/CI from deterministic evidence,
4. audit cannot edit target project source files,
5. audit review judges the markdown artifact, not hidden JSON.

Stop conditions:

1. target profile or tier materially changes requirements and is unknown,
2. runtime mirror is invalid,
3. audit report is missing required sections,
4. auditor tries to issue implementation packets.

## Phase 3: Rolling Plan Artifact

Goal: make `docs/ORCHESTRATOR_PLAN.md` the reviewed approval bridge between audit and worker packets.

OS artifacts consumed:

1. `ORCHESTRATOR_CONTRACT.md.template`
2. `ORCHESTRATOR_PLAN.md.template`
3. `REVIEWER_CONTRACT.md.template`
4. `REVIEW_CHECKLIST.md.template`
5. `OPERATOR_DASHBOARD.md.template`

Runtime responsibilities:

1. write or update `docs/ORCHESTRATOR_PLAN.md` from accepted audit facts or operator request,
2. present a plain-language summary to the operator,
3. send the written plan artifact to reviewer before packet issuance,
4. update the same plan artifact during repair,
5. keep auto-continue disabled by default,
6. issue packets only from accepted plan/current directive.

Validation:

1. plan contains all required sections from `ORCHESTRATOR_PLAN.md.template`,
2. plan review returns only `ACCEPT`, `REPAIR`, `REJECT`, or `ESCALATE`,
3. `REPAIR` updates the same plan artifact,
4. packet approval is blocked until plan review accepts when plan review is required,
5. operator sees simple approve/revise/stop/view-details choices.

Stop conditions:

1. more than one competing plan artifact exists,
2. packet is drafted from hidden state instead of accepted plan/current directive,
3. auto-continue is enabled without explicit operator approval,
4. plan contains unresolved stop conditions.

## Phase 4: Worker Packet And Local Execution

Goal: dispatch bounded work to local workers while keeping cloud token use focused on planning, review, and decisions.

OS artifacts consumed:

1. `WORKER_CONTRACT.md.template`
2. `WORKER_TASK_PACKET.md.template`
3. `WORKER_RESULT_PACKET.md.template`
4. `LOCAL_WORKER_HEALTH.md.template`
5. `STATE_LEDGER_PROTOCOL.md.template`
6. `ENGINEERING_RUNBOOK.md.template`
7. `ORCHESTRATOR_PLAN.md.template`

Runtime responsibilities:

1. validate local worker health before meaningful implementation packets,
2. generate one packet at a time,
3. enforce allowed files and allowed commands outside model judgment,
4. pass only packet-approved context to local workers,
5. record packet issuance in `docs/state/packet_ledger.json`,
6. collect result packet and command evidence,
7. stop or repair on malformed, timed-out, or out-of-scope worker output.

Validation:

1. worker cannot edit outside allowed files,
2. worker cannot run commands outside allowed commands,
3. malformed worker result does not become accepted work,
4. packet ledger has no more than one active packet by default,
5. local-worker outage routes to worker-health/degraded mode, not investigator.

Stop conditions:

1. worker health is `OFFLINE` or `UNKNOWN` for meaningful implementation,
2. packet requires secrets or deploy authority without explicit approval,
3. worker needs files or commands outside the packet,
4. result packet lacks command/evidence summary.

## Phase 5: Reviewer Gate And Operator Handoff

Goal: accept work only after written result artifacts and evidence pass review, then return a plain-language status to the operator.

OS artifacts consumed:

1. `REVIEWER_CONTRACT.md.template`
2. `REVIEW_CHECKLIST.md.template`
3. `CLOSING_CHECKLIST.md.template`
4. `OPERATOR_DASHBOARD.md.template`
5. `MASTER_TRACEABILITY_TABLE.md.template`
6. `STATE_LEDGER_PROTOCOL.md.template`

Runtime responsibilities:

1. send worker result packet and deterministic evidence to reviewer,
2. enforce reviewer decision enum,
3. update packet ledger after review,
4. update operator dashboard when approval, rollback, tie-breaker, or stop decision is needed,
5. complete closeout before done claim,
6. report plain-language status first, details second.

Validation:

1. reviewer cannot accept missing written result artifact,
2. reviewer cannot accept out-of-scope file/command changes,
3. accepted result has command evidence or explicit blocked rationale,
4. closeout reports `PASS`, `FAIL`, or `N/A` for required items,
5. operator dashboard reflects accepted/repair/rejected/escalated state.

Stop conditions:

1. review returns `REPAIR`, `REJECT`, or `ESCALATE`,
2. closeout has required `FAIL`,
3. traceability is required but stale,
4. operator decision is required.

## Phase 6: Role-Drift Backstops

Goal: make it hard for roles to drift back into hidden prompt behavior or stale assumptions.

Recommended runtime backstops:

1. every role call receives mirror id, mirror status, profile, target project, and active artifact paths,
2. every role output declares which artifact it updated or reviewed,
3. runtime rejects role output that names an artifact inconsistent with the active state,
4. runtime stores role decision, evidence path, and mirror version in state,
5. CI checks that OS manifest/index references still resolve,
6. prompts hardcoded in LangGraph become thin wrappers that load OS contracts.

Validation:

1. stale mirror prevents role execution,
2. missing role contract prevents role execution,
3. changing an OS contract and re-syncing changes the loaded role context,
4. hidden JSON alone cannot approve audit, plan, or implementation work.

Stop conditions:

1. a critical role instruction exists only in LangGraph code,
2. role behavior changes without OS artifact update,
3. project artifact and runtime state disagree about active packet/review/plan.

## Legacy Name Mapping

| Current LangGraph / templates-v2 name | OS replacement |
|---|---|
| `vendor/templates-v2` | `vendor/operating-system` |
| `docs/GAME_PLAN.md` / `docs/PROJECT_CANVAS.md` | `docs/PROJECT_STATE.md` for project state; `docs/ORCHESTRATOR_PLAN.md` for reviewed execution plan |
| `docs/POST_CODING_CHECKS.md` | `docs/REVIEWER_CONTRACT.md` + `docs/REVIEW_CHECKLIST.md` |
| `docs/ORCHESTRATION_MAP.md` | `docs/ORCHESTRATOR_CONTRACT.md` |
| `docs/SCENARIO_PLAYBOOK.md` | `docs/ORCHESTRATOR_CONTRACT.md` + `docs/TEMPLATE_LIFECYCLE.md` |
| `docs/TEMPLATE_PROFILE_MIGRATION.md` | `docs/TEMPLATE_LIFECYCLE.md` |
| `docs/TEMPLATE_ADOPTION_WALKTHROUGH.md` | `docs/TEMPLATE_LIFECYCLE.md` |
| `docs/COMMANDS.md` | `docs/ENGINEERING_RUNBOOK.md` command table and command checklist |
| `docs/VISION.md` | OS `README.md`, role contracts, and this incorporation plan for migration details |

## First Implementation Packet Recommendation

First LangGraph packet should be mirror-only.

Packet goal:

1. add `vendor/operating-system` mirror support,
2. add sync/check commands or wrappers,
3. write mirror status,
4. make verify/package use the validated mirror,
5. keep current role behavior unchanged.

Allowed surface should be limited to LangGraph template-loading, package scripts, mirror tests, and docs needed to describe the new mirror path.

Acceptance criteria:

1. sync copies the OS mirror into LangGraph,
2. check passes on fresh mirror,
3. check fails on missing required mirrored file,
4. package includes the mirror,
5. UI or CLI reports mirror status plainly.

## Ready-To-Start Criteria

Begin LangGraph implementation only after:

1. OS baseline validation passes,
2. this plan is accepted as the migration bridge,
3. first packet is bounded to mirror-only work,
4. rollback point is clear,
5. operator understands that LangGraph behavior migration will happen in later phases.
