# Orchestrator Profile

Orchestrator is a **load profile of `templates-v3`**, not a fork. It reuses every
core doc and the lean startup triplet, and adds only the cloud-orchestrator +
local-worker delegation deltas.

## What it adds
- `AI_AGENT.md` — orchestrator startup contract (rails, decision tree, timeout rules)
- `docs/SESSION_BRIEF.md`, `docs/CONTEXT_ROUTING.md` — shared with lean (routed startup)
- `docs/ORCHESTRATION_MAP.md` — role split, packet requirements, 9-step worker loop, token rules
- `docs/SCENARIO_PLAYBOOK.md` — Level 1/2/3 workflow mode decision guide
- `docs/WORKER_TASK_PACKET.md`, `docs/WORKER_RESULT_PACKET.md` — delegation formats
- `docs/POST_CODING_CHECKS.md` — mandatory cloud review of every DONE packet
- `docs/INVESTIGATOR_PROTOCOL.md` — escalation role
- `docs/STATE_LEDGER_PROTOCOL.md`, `docs/state/packet_ledger.json`, `docs/state/session_budget.json` — state
- `docs/LOCAL_WORKER_HEALTH.md`, `docs/OPERATOR_DASHBOARD.md`
- `docs/TEST_BLOAT_SWEEP.md`, `docs/CLOSING_CHECKLIST.md`, `docs/FEATURE_SPEC_TEMPLATE.md`
- `scripts/orchestrator_state.py` — packet lifecycle and state validation

## What it does NOT change
- All core docs remain single-source: `PROJECT_CANVAS`, `ENGINEERING_PLAYBOOK`,
  `OPS_SECURITY_RELEASE`, `MASTER_TRACEABILITY_TABLE`, `TECH_STACK`, `CHANGELOG`.
- The workflow/test matrix and smoke catalog live in `docs/ENGINEERING_PLAYBOOK.md`
  §3–§4 (the profile no longer ships separate copies).
- The worker pre-return ritual lives in `docs/WORKER_RESULT_PACKET.md` (Apply
  Checklist Result section); the cloud review lives in `docs/POST_CODING_CHECKS.md`.

## Apply
```bash
bash templates-v3/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/project \
  --project-name "My Project" \
  --tier TIER_B_STANDARD \
  --tier-profile auto \
  --orchestrator \
  --strict
```

Then:
1. `python3 scripts/orchestrator_state.py init`
2. Resolve `docs/ORCHESTRATION_MAP.md`, `docs/LOCAL_WORKER_HEALTH.md`, and budget ceilings.
3. Dry-run one doc-only packet end to end (issue → result → review → ledger → closing checklist).
4. Only then allow local-worker implementation packets.

## Intended operating model
1. Human starts with `AI_AGENT.md`.
2. Cloud orchestrator reads the lean startup set plus `ORCHESTRATION_MAP`.
3. High-leverage or unclear work loads `SCENARIO_PLAYBOOK` to pick Level 1/2/3.
4. Orchestrator issues a narrow `WORKER_TASK_PACKET`.
5. Local worker runs the 9-step loop and returns `WORKER_RESULT_PACKET`.
6. Orchestrator runs `POST_CODING_CHECKS`; outcome is accepted, repaired, rejected, or escalated.
7. `CLOSING_CHECKLIST` gates final handoff.
8. Human approves a reviewed outcome, not raw code.

## Status
This profile is the orchestrator reference inside `templates-v3`. Proven generic
rules should be promoted back here before becoming standard for other repos.
