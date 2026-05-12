# LangGraph Session Handoff

Read when: resuming the LangGraph operating-system incorporation work, especially after starting a new AI session.
Skip when: the task is unrelated to LangGraph, runtime mirrors, orchestrator contracts, or packet/reviewer enforcement.

## Purpose

Keep the current migration state visible while LangGraph-Orchestrator-Runner enforces the reduced `Templates/operating-system` contract.

This file is a temporary working handoff. Update it after each meaningful incorporation phase until LangGraph fully reads and enforces the operating-system contracts from its runtime mirror.

## Source And Runtime Shape

- Source of truth: `/root/repos/Bamamana/Templates/operating-system`
- LangGraph repo: `/root/repos/Bamamana/LangGraph-Orchestrator-Runner`
- Runtime mirror: `/root/repos/Bamamana/LangGraph-Orchestrator-Runner/vendor/operating-system`
- Refresh command from LangGraph repo: `npm run operating-system:sync`
- Check command from LangGraph repo: `npm run operating-system:check`
- Full LangGraph verification: `npm run verify`

Do not treat `vendor/operating-system` as the editable source. Edit `Templates/operating-system`, sync the mirror, then verify LangGraph.

## Current Incorporation State

As of 2026-05-08:

1. LangGraph has a validated `vendor/operating-system` runtime mirror.
2. LangGraph cloud auditor/orchestrator prompt support reads the validated mirror through `loadOperatingSystemSource(configRoot)`.
3. Lean adoption/bootstrap reads `vendor/operating-system` and writes the OS-native lean baseline (`PROJECT_STATE.md`, runbooks, validators, and compact startup docs).
4. Worker packet drafts receive the OS `WORKER_TASK_PACKET` template through the cloud-plan path.
5. Worker, audit, and plan reviewer handoffs receive OS `REVIEW_CHECKLIST` context.
6. Plan review also receives the OS `ORCHESTRATOR_PLAN` template.
7. Packet lifecycle allows Run-first to issue or continue bounded packets even when older issued packets remain stale; validation still checks packet shape and review/result consistency.
8. Prompt support receives OS `CLOSING_CHECKLIST` and `OPERATOR_DASHBOARD` contracts.
9. Packet closeout now requires an `ACCEPT` review before LangGraph records the packet as closed.
10. Planner/startup state uses OS-native `PROJECT_STATE.md` and writes chunked execution plans to `ORCHESTRATOR_PLAN.md`.

## Verification Evidence

Latest known passing LangGraph checks:

- `npm run operating-system:check`
- `npm run test:operating-system-mirror`
- `npm run test:operating-system-source`
- `npm run test:cloud-review-prompt`
- `npm run test:packet-state`
- `npm run test:lean-adoption-os-source`
- `npm run test:lean-adoption-fixture`
- `npm run test:game-plan-manager`
- `npm run test:planner-contract`
- `npm run test:inspect-project`
- `npm run test:request-plan-webview`
- `npm run check`
- `npm run verify`

## New Session Prompt

Use this prompt if the work resumes in a fresh AI session:

```text
We are working in /root/repos/Bamamana/LangGraph-Orchestrator-Runner.
Use /root/repos/Bamamana/Templates/operating-system as the source of truth.
LangGraph should read its validated runtime mirror at vendor/operating-system.
Continue migrating LangGraph to enforce the operating-system contracts.
Do not edit Templates unless explicitly asked; sync/check the mirror when needed.
Read /root/repos/Bamamana/Templates/operating-system/LANGGRAPH_SESSION_HANDOFF.md first.
```

## Next Likely Phase

Continue state enforcement and role-contract migration:

1. Expand packet lifecycle validation toward the OS `STATE_LEDGER_PROTOCOL`.
2. Make closeout and operator handoff read OS `CLOSING_CHECKLIST` / `OPERATOR_DASHBOARD` contracts.
3. Smoke test the OS-native planner/state path in VS Code after cleanup.
4. Keep tests focused and update `npm run verify` when a new enforcement path becomes canonical.

## Documentation Policy During Migration

Use three documentation layers:

1. `CHANGELOG.md` in LangGraph for behavior changes that affect the runner.
2. LangGraph docs such as `docs/COMMANDS.md` when commands, verification, or operator-facing workflow changes.
3. This handoff file for cross-session migration state and the plain-English map of what has moved.

Do not put every implementation detail here. Put durable behavior in normal docs, release history in changelogs, and resumption context in this file.
