# Safeguard Gap Report

Status: draft sandbox

Purpose: compare the current `templates-v2/orchestrator-template` safeguard surfaces against the reduced operating-system sandbox and identify what is still unmatched.

This is not a migration plan by itself.
It is the shortlist of remaining safeguard work.

## Result

The broad safeguard pass is mostly closed.

There are no major unknown families left.

There are no remaining identified structural or profile-fidelity gaps inside this sandbox.

The only remaining follow-through after this phase is future adoption work in LangGraph and eventual retirement of compatibility-only exports.

## Coverage Summary

| Current orchestrator-template surface | Reduced OS coverage | Status | Notes |
|---|---|---|---|
| Worker task packet | `WORKER_TASK_PACKET.md.template` | covered | Core bounded work contract exists. |
| Worker result packet | `WORKER_RESULT_PACKET.md.template` | covered | Core result artifact exists. |
| Post-coding review gate | `REVIEWER_CONTRACT.md.template` + `REVIEW_CHECKLIST.md.template` | covered | Review logic and concrete checklist both exist. |
| State ledger protocol | `STATE_LEDGER_PROTOCOL.md.template` | covered | Packet/session state protocol exists. |
| Audit manifest | `TEMPLATE_AUDIT_MANIFEST.yaml.template` | covered | Reduced audit inventory exists. |
| Startup contract family | `AI_AGENT.md.template` + `SESSION_BRIEF.md.template` + `CONTEXT_ROUTING.md.template` | covered | Reduced startup set exists. |
| Engineering and operations safeguards | `ENGINEERING_RUNBOOK.md.template` + `OPERATIONS_RUNBOOK.md.template` + scripts + CI templates | covered | Validate, verify, doc guard, predeploy, and CI are present. |
| Operator dashboard | `OPERATOR_DASHBOARD.md.template` | covered | Explicit operator decision and rollback surface now exists. |
| Closing checklist | `CLOSING_CHECKLIST.md.template` | covered | Explicit closeout PASS/FAIL gate now exists. |
| Investigator protocol | `INVESTIGATOR_PROTOCOL.md.template` | covered | Dedicated escalation workflow and tie-breaker protocol now exist. |
| Local worker health | `LOCAL_WORKER_HEALTH.md.template` | covered | Concrete worker readiness and degraded/offline artifact now exists. |
| Orchestrator profile variants | `profiles/orchestrator/AI_AGENT.md.template` + `profiles/orchestrator/TEMPLATE_INDEX.yaml.template` | covered | Orchestrator startup and inventory fidelity now exist in the sandbox. |
| Template index profile variants | `profiles/lean/TEMPLATE_INDEX.yaml.template` + `profiles/orchestrator/TEMPLATE_INDEX.yaml.template` | covered | Profile-specific inventory variants now exist in the sandbox. |

## Closed In Sandbox

### 1) Operator dashboard

Current source: `templates-v2/orchestrator-template/OPERATOR_DASHBOARD.md.template`

What the reduced OS already covers:

1. plain-language operator communication expectations in `ORCHESTRATOR_CONTRACT.md.template`,
2. current phase and next action in `PROJECT_STATE.md.template`,
3. rollback expectations in `OPERATIONS_RUNBOOK.md.template`.

Sandbox result:

`OPERATOR_DASHBOARD.md.template` now exists and closes this gap.

### 2) Closing checklist

Current source: `templates-v2/orchestrator-template/CLOSING_CHECKLIST.md.template`

What the reduced OS already covers:

1. done rules in `AI_AGENT.md.template`,
2. review decision rules in `REVIEW_CHECKLIST.md.template`,
3. handoff expectations in `ENGINEERING_RUNBOOK.md.template`.

Sandbox result:

`CLOSING_CHECKLIST.md.template` now exists and closes this gap.

### 3) Investigator protocol

Current source: `templates-v2/orchestrator-template/INVESTIGATOR_PROTOCOL.md.template`

What the reduced OS already covers:

1. escalation triggers in `REVIEWER_CONTRACT.md.template`,
2. packet and session tracking in `STATE_LEDGER_PROTOCOL.md.template`,
3. stop conditions in `ORCHESTRATOR_CONTRACT.md.template`.

Sandbox result:

`INVESTIGATOR_PROTOCOL.md.template` now exists and closes this gap.

### 4) Local worker health

Current source: `templates-v2/orchestrator-template/LOCAL_WORKER_HEALTH.md.template`

What the reduced OS already covers:

1. worker authority and boundaries in `WORKER_CONTRACT.md.template`,
2. operational risk and release concerns in `OPERATIONS_RUNBOOK.md.template`,
3. orchestrator stop conditions in `ORCHESTRATOR_CONTRACT.md.template`.

Sandbox result:

`LOCAL_WORKER_HEALTH.md.template` now exists and closes this gap.

## Closed Migration Gaps

These are important, but they are not new safeguard families.

### AI agent profile variants

Sandbox result:

1. `profiles/lean/AI_AGENT.md.template`
2. `profiles/orchestrator/AI_AGENT.md.template`

These now provide profile-shaped startup behavior without relying on legacy files.

### Template index profile variants

Sandbox result:

1. `profiles/lean/TEMPLATE_INDEX.yaml.template`
2. `profiles/orchestrator/TEMPLATE_INDEX.yaml.template`

These now provide profile-specific inventory behavior without relying on legacy files.

## Recommendation Order

Compatibility decision recorded:

1. `COMMANDS.md.template` remains compatibility-only because command guidance already lives in `ENGINEERING_RUNBOOK.md.template`.
2. `VISION.md.template` remains compatibility-only because mission and workflow intent already live in `README.md` and the role contracts.

## Exit Condition For The Sandbox

The reduced operating system is ready for the first serious LangGraph adoption pass when:

1. no remaining orchestrator-template safeguard depends only on legacy files,
2. compatibility-only exports have a deliberate retention decision until migration is complete.