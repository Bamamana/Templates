# Operating System Plan

Status: draft sandbox

This folder is a clean planning area for the next-generation Templates operating system.

It does not replace `templates-v2` yet.
It exists so we can design the operating system, reduce template bloat, and define the LangGraph integration path without breaking anything that currently works.

## Working Docs In This Sandbox

1. `README.md` - mission, architecture, roles, guardrails, and phased build sequence
2. `FILE_MAP.md` - exact current-to-target mapping from `templates-v2` into the reduced operating-system structure
3. `RUNTIME_MIRROR.md` - sync, packaging, fallback, and runtime-loading rules for LangGraph
4. `LANGGRAPH_ADOPTION_NOTES.md` - how to move LangGraph onto the operating system later without changing it yet
5. `AUDITOR_CONTRACT.md.template` - audit lane role contract
6. `ORCHESTRATOR_CONTRACT.md.template` - premium planner and decision-maker contract
7. `WORKER_CONTRACT.md.template` - bounded local coder contract
8. `REVIEWER_CONTRACT.md.template` - artifact and result review contract
9. `PROJECT_STATE.md.template` - merged current-state, plan, and architecture artifact
10. `ENGINEERING_RUNBOOK.md.template` - merged commands, testing, modularity, scripts, and CI/CD artifact
11. `TEMPLATE_LIFECYCLE.md.template` - merged adoption, migration, validation, placeholders, quickstart, and upgrade artifact
12. `OPERATIONS_RUNBOOK.md.template` - secrets, deploy, rollback, incident, release, and risk artifact
13. `WORKER_TASK_PACKET.md.template` - bounded work packet artifact
14. `WORKER_RESULT_PACKET.md.template` - bounded result artifact
15. `REVIEW_CHECKLIST.md.template` - review gate checklist artifact
16. `RUNTIME_MIRROR_POLICY.md.template` - concrete runtime mirror source-order and validation policy
17. `RUNTIME_MIRROR_MANIFEST.json.template` - machine-readable mirrored file manifest
18. `scripts/sync_runtime_mirror.sh.template` - runtime mirror refresh script template
19. `scripts/check_runtime_mirror.sh.template` - runtime mirror validation script template
20. `AI_AGENT.md.template` - reduced canonical startup contract
21. `SESSION_BRIEF.md.template` - compact current-session startup snapshot
22. `CONTEXT_ROUTING.md.template` - reduced deeper-doc trigger map
23. `TEMPLATE_INDEX.yaml.template` - machine-readable inventory for the reduced operating system
24. `MASTER_TRACEABILITY_TABLE.md.template` - runtime pathway and smoke evidence table
25. `STATE_LEDGER_PROTOCOL.md.template` - packet and session-state protocol
26. `TEMPLATE_AUDIT_MANIFEST.yaml.template` - machine-readable audit checklist for the reduced operating system
27. `scripts/validate_operating_system.sh.template` - applied-project operating-system validator
28. `scripts/verify.sh.template` - local verify gate template
29. `scripts/enforce_doc_updates.sh.template` - same-change docs enforcement template
30. `scripts/predeploy_full_suite.sh.template` - stronger release-readiness gate template
31. `scripts/orchestrator_state.py.template` - packet ledger and session-budget state manager
32. `scripts/sync_session_brief.sh.template` - routed-startup brief sync helper
33. `scripts/validate_context_budget.sh.template` - always-on startup context budget check
34. `packet_ledger.json.template` - orchestrator packet ledger seed
35. `session_budget.json.template` - orchestrator session-budget seed
36. `ORCHESTRATOR_PLAN.md.template` - rolling reviewed plan artifact for orchestrated work
37. `.github/workflows/CI_BASELINE.yml.template` - baseline CI template
38. `.github/workflows/CI_PREDEPLOY.yml.template` - stronger predeploy CI template
39. `SAFEGUARD_GAP_REPORT.md` - current orchestrator-template safeguard coverage versus the reduced operating system
40. `OPERATOR_DASHBOARD.md.template` - plain-English operator decision and rollback surface
41. `CLOSING_CHECKLIST.md.template` - explicit final closeout gate
42. `INVESTIGATOR_PROTOCOL.md.template` - escalation workflow and tie-breaker protocol
43. `LOCAL_WORKER_HEALTH.md.template` - local worker readiness and degraded-mode artifact
44. `profiles/lean/AI_AGENT.md.template` - lean-profile startup contract variant
45. `profiles/lean/TEMPLATE_INDEX.yaml.template` - lean-profile inventory variant
46. `profiles/orchestrator/AI_AGENT.md.template` - orchestrator-profile startup contract variant
47. `profiles/orchestrator/TEMPLATE_INDEX.yaml.template` - orchestrator-profile inventory variant

## Mission

Templates should become the workflow operating system.

LangGraph should become the runtime and adapter layer that:

1. loads the operating system,
2. audits a selected project against it,
3. plans the next bounded fix,
4. routes work to the local coder,
5. sends the result to the reviewer, and
6. returns to the premium orchestrator for the next safe decision.

The operator should not need to know how to code, write packets by hand, or manually manage the workflow.

## Why This Exists

Current state:

1. `templates-v2` contains the strongest rules and safeguards, but too much of the behavior is spread across many docs.
2. LangGraph reads some template files live, keeps a vendored snapshot of some files, and still hardcodes some role behavior in the app.
3. Updating reusable workflow rules can require touching both Templates and LangGraph.
4. That creates drift, duplication, and too many places where the workflow can get loose.

Desired state:

1. Templates is the only editable source for reusable workflow behavior.
2. LangGraph runs from one synced runtime mirror of that source.
3. Projects are audited first, then updated through reviewed bounded packets.
4. Auditor, orchestrator, worker, and reviewer all follow the same operating-system contracts.

## Core Architecture

### 1. Master Source

The master Templates repo is the only place where reusable workflow rules are edited.

That includes:

1. startup contracts,
2. role contracts,
3. packet formats,
4. review rules,
5. traceability rules,
6. lifecycle and sync rules,
7. required scripts and automation rules,
8. CI/CD and verification gates, and
9. machine-readable template inventory.

### 2. Runtime Mirror

LangGraph should keep one runtime mirror of the operating system inside its own repo.

That mirror exists so:

1. the program still works on another computer without the private Templates repo,
2. the runtime uses one validated template state instead of mixed sources, and
3. updates from Templates can be pulled into LangGraph in a controlled way.

Target behavior:

1. On the main development machine, LangGraph should try to refresh the runtime mirror from Templates before startup, verify, packaging, or template-driven orchestration work.
2. If the Templates source is unavailable, LangGraph should use the last validated mirror and clearly report that it is using fallback state.
3. On other machines, LangGraph should run from the mirrored copy without requiring the original Templates folder.

### 3. Project State

Each target project still keeps its own project-local state and evidence.

That includes:

1. instantiated startup docs,
2. current phase and game plan,
3. commands for that repo,
4. traceability rows and smoke evidence,
5. changelog history, and
6. project-specific risk and release notes.

Templates defines the structure.
Projects hold the actual current state.

## Role Model

The operating system should define one explicit contract per role.

### Auditor

The auditor:

1. reads the selected project,
2. reads the synced operating-system mirror,
3. compares the project against the operating-system inventory and lifecycle rules,
4. writes a durable audit artifact, and
5. returns a bounded prioritized gap list.

The auditor does not edit the target project and does not issue broad implementation work.

### Orchestrator

The orchestrator is the premium decision-maker.

Its job is to:

1. read the selected project's startup docs,
2. read the operating-system role and packet contracts,
3. decide the safest next bounded slice,
4. issue one packet at a time,
5. interpret reviewer outcomes, and
6. communicate plainly with the operator.

The orchestrator should be a premium model class, for example GPT-5.4-class, and should never act like the coder.

### Worker

The worker is the bounded local coder.

Its job is to:

1. act only inside allowed files and commands,
2. follow the worker contract from the operating system,
3. return structured evidence and changed files,
4. stop on ambiguity, and
5. never broaden scope.

### Reviewer

The reviewer checks the written artifact or packet result against the operating-system review contract.

Its job is to:

1. verify the written output, not hidden reasoning,
2. reject weak or dishonest evidence,
3. enforce traceability and safety expectations, and
4. return `ACCEPT`, `REPAIR`, `REJECT`, or `ESCALATE`.

## Workflow

The target workflow is:

1. Sync operating system into LangGraph runtime mirror.
2. Validate mirror.
3. Select project.
4. Read project startup docs.
5. Run audit.
6. Write audit artifact.
7. Review audit artifact.
8. Orchestrator turns accepted facts into one bounded packet.
9. Worker executes the packet.
10. Reviewer checks the result.
11. Orchestrator decides accept, repair, reject, or escalate.
12. Operator gets a plain-English status and next step.

## Guardrails To Keep

We want fewer files, not fewer safeguards.

These protections should remain first-class:

1. One canonical startup contract.
2. One machine-readable inventory of required operating-system artifacts.
3. Traceability tied to real smoke or manual evidence.
4. Audit before broad template carryover.
5. One bounded packet at a time.
6. Reviewer approval before work is treated as done.
7. Same-change docs discipline for behavior, path, command, or structure changes.
8. Strong verify gate before handoff.
9. No hidden role drift between auditor, orchestrator, worker, and reviewer.
10. No blind auto-copy into target projects before the missing state is measured.

## Initial Modularity Rule

The operating system needs one clear file-size policy so modularity stays real.

Initial recommendation:

1. soft review trigger at 500 lines,
2. hard refactor trigger at 800 lines,
3. exceptions only with explicit rationale.

This can be tuned later if we find a better threshold.
The important part is that the rule is explicit and enforced.

## Reduced Operating-System Surface

The current template system can likely be reduced while keeping almost all of its function.

Proposed core operating-system surface:

1. `AI_AGENT.md.template`
2. `SESSION_BRIEF.md.template`
3. `CONTEXT_ROUTING.md.template`
4. `PROJECT_STATE.md.template`
5. `ENGINEERING_RUNBOOK.md.template`
6. `OPERATIONS_RUNBOOK.md.template`
7. `MASTER_TRACEABILITY_TABLE.md.template`
8. `TEMPLATE_LIFECYCLE.md.template`
9. `TEMPLATE_INDEX.yaml.template`

Proposed role-contract surface:

1. `AUDITOR_CONTRACT.md.template`
2. `ORCHESTRATOR_CONTRACT.md.template`
3. `WORKER_CONTRACT.md.template`
4. `REVIEWER_CONTRACT.md.template`

Proposed packet and review surface:

1. `WORKER_TASK_PACKET.md.template`
2. `WORKER_RESULT_PACKET.md.template`
3. `REVIEW_CHECKLIST.md.template`
4. `STATE_LEDGER_PROTOCOL.md.template`
5. `CLOSING_CHECKLIST.md.template`
6. `INVESTIGATOR_PROTOCOL.md.template`
7. `ORCHESTRATOR_PLAN.md.template`

Proposed operator and worker-readiness surface:

1. `OPERATOR_DASHBOARD.md.template`
2. `LOCAL_WORKER_HEALTH.md.template`

Proposed automation surface:

1. `scripts/validate_operating_system.sh.template`
2. `scripts/verify.sh.template`
3. `scripts/sync_runtime_mirror.sh.template`
4. `scripts/check_runtime_mirror.sh.template`
5. `scripts/enforce_doc_updates.sh.template`
6. `scripts/predeploy_full_suite.sh.template`
7. `scripts/validate_context_budget.sh.template`
8. `scripts/sync_session_brief.sh.template`
9. `scripts/orchestrator_state.py.template`
10. `.github/workflows/CI_BASELINE.yml.template`
11. `.github/workflows/CI_PREDEPLOY.yml.template`

Proposed state-seed surface:

1. `packet_ledger.json.template`
2. `session_budget.json.template`

The point is not to freeze these exact names yet.
The point is to reduce the operating system to a smaller set of stronger artifacts.

## What Stays Project-Local

These should remain per-project instantiated artifacts, not one shared global file:

1. `AI_AGENT.md`
2. `docs/SESSION_BRIEF.md`
3. `docs/CONTEXT_ROUTING.md`
4. `docs/PROJECT_STATE.md`
5. `docs/MASTER_TRACEABILITY_TABLE.md`
6. `docs/COMMANDS.md`
7. `CHANGELOG.md`
8. project verify, smoke, and targeted-test scripts

Templates owns the structure and default rules.
The project owns the filled-in state.

## What LangGraph Must Stop Hardcoding

LangGraph should eventually load these behaviors from the operating system instead of hardcoding them in prompt strings or scattered runtime logic:

1. auditor contract,
2. orchestrator role contract,
3. worker boundary contract,
4. reviewer acceptance logic,
5. packet structure expectations,
6. startup-read policy,
7. audit artifact requirements, and
8. lifecycle routing rules.

LangGraph should remain responsible for:

1. UI,
2. provider routing,
3. packet lifecycle state,
4. file and command enforcement,
5. sync and mirror validation, and
6. artifact persistence.

## Scripts And CI/CD Are In Scope

The operating system is not just markdown.

It must include:

1. the verify gate,
2. sync and drift scripts,
3. context-budget validation,
4. doc-update enforcement,
5. predeploy gates, and
6. CI/CD templates that run those checks consistently.

If the docs say a safeguard exists but there is no script or CI job that enforces it, the operating system is incomplete.

## First Files To Pull Into This Sandbox

These are the first source files we should copy or map into this operating-system area as references while keeping `templates-v2` untouched:

1. `templates-v2/AI_AGENT.md.template`
2. `templates-v2/profiles/lean/SESSION_BRIEF.md.template`
3. `templates-v2/profiles/lean/CONTEXT_ROUTING.md.template`
4. `templates-v2/MASTER_TRACEABILITY_TABLE.md.template`
5. `templates-v2/COMMANDS.md.template`
6. `templates-v2/ENGINEERING_PLAYBOOK.md.template`
7. `templates-v2/OPS_SECURITY_RELEASE.md.template`
8. `templates-v2/TEMPLATE_ADOPTION_WALKTHROUGH.md.template`
9. `templates-v2/TEMPLATE_PROFILE_MIGRATION.md.template`
10. `templates-v2/TEMPLATE_INDEX.yaml.template`
11. `templates-v2/orchestrator-template/ORCHESTRATION_MAP.md.template`
12. `templates-v2/orchestrator-template/WORKER_TASK_PACKET.md.template`
13. `templates-v2/orchestrator-template/WORKER_RESULT_PACKET.md.template`
14. `templates-v2/orchestrator-template/POST_CODING_CHECKS.md.template`
15. `templates-v2/orchestrator-template/INVESTIGATOR_PROTOCOL.md.template`
16. `templates-v2/orchestrator-template/OPERATOR_DASHBOARD.md.template`
17. `templates-v2/orchestrator-template/STATE_LEDGER_PROTOCOL.md.template`
18. `templates-v2/orchestrator-template/TEMPLATE_AUDIT_MANIFEST.yaml.template`

## Immediate Build Sequence

Phase 1: define the operating system

1. reduce the doc architecture,
2. define contract split,
3. define runtime mirror rules,
4. define role contracts, and
5. define what LangGraph must load from the operating system.

Phase 2: build the mirror model

1. expand sync to the full operating-system subset,
2. validate the mirror before template-driven work,
3. package the mirror for other machines, and
4. make fallback behavior explicit and safe.

Phase 3: hook LangGraph to the operating system

1. move role instructions out of hardcoded app prompts,
2. make auditor/orchestrator/worker/reviewer consume operating-system contracts,
3. keep selected-project startup docs as project-local evidence, and
4. keep packet execution bounded and reviewer-gated.

Phase 4: update carryover flow

1. audit target project,
2. write durable audit artifact,
3. review the audit,
4. let orchestrator create one safe packet from accepted findings, and
5. repeat until carryover is green.

## Non-Goals For This Sandbox

1. Do not replace `templates-v2` yet.
2. Do not auto-copy templates into target projects.
3. Do not break LangGraph's current working flow while designing the better one.
4. Do not make the worker or reviewer decide their own rules from memory.

## Success Test

This operating-system effort is successful when all of these are true:

1. A reusable rule changes once in Templates and LangGraph picks it up through the runtime mirror.
2. Another person can install LangGraph on a different machine and run from the packaged mirror.
3. Auditor, orchestrator, worker, and reviewer all use the same operating-system contracts.
4. A target repo is audited before any carryover changes are made.
5. The orchestrator can tell the local coder exactly what to do without running away from scope.
6. The reviewer can reject weak work based on explicit operating-system rules.
7. The operator can run the system in plain language without needing to write code.

## Next Step

Next, we should map the current `templates-v2` files into this reduced operating-system structure and decide which exact files become the first mirrored operating-system subset that LangGraph must consume.