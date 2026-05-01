# Orchestrator Template (Cloud Mastermind + Local Worker)

This folder is the reusable orchestrator-pattern variant for projects that split AI work across three roles:

- `Cloud Orchestrator`: premium model that understands the whole project, plans slices, writes packets, and reviews outcomes.
- `Local Worker`: local LLM that performs bounded implementation, test, refactor, docs, and verification loops.
- `Cloud Investigator`: premium escalation model for repeated BLOCKED states, test-honesty failures, production regressions, or architectural unknowns.

It is intended for the workflow we have been discussing:

- keep global architecture and project memory on the cloud side,
- push most code creation and test loops to a local model,
- have GPT/Claude-class models act as checker, reviewer, and escalation brain,
- reduce cloud token burn by avoiding repeated full-repo rereads.

## Design Goals

- Preserve the existing V2 lean startup, validation, changelog, and traceability discipline.
- Add explicit delegation rules so the local worker stays inside a narrow slice.
- Make token savings operational rather than aspirational.
- Keep code drift low through packet classes, allowed commands, test-first evidence, post-coding review, and rollback fields.
- Give a non-coder operator a safe decision surface through `OPERATOR_DASHBOARD.md.template`.

## Pack Layout

- `AI_AGENT.md.template` -> canonical startup contract for orchestrator-driven projects
- `SESSION_BRIEF.md.template` -> lean startup current-state snapshot
- `CONTEXT_ROUTING.md.template` -> event/doc trigger map so the AI loads deeper docs only when needed
- `SCENARIO_PLAYBOOK.md.template` -> Level 1/2/3 decision guide for template retrofit, cloud-to-local migration, and overnight local-agent work
- `ORCHESTRATOR_CARRYOVER_EXAMPLE.md.template` -> worked existing-project upgrade example for the carryover checklist
- `CLOSING_CHECKLIST.md.template` -> final operator closeout gate before handoff
- `GAME_PLAN.md.template` -> live execution checklist for vibe-coding sessions
- `PROJECT_CANVAS.md.template` -> project purpose and higher-level state
- `ENGINEERING_PLAYBOOK.md.template` -> 9-step local worker loop, Packet Class ceilings, test-first rules
- `ORCHESTRATION_MAP.md.template` -> source of truth for role split, handoff rules, and token policy
- `WORKER_TASK_PACKET.md.template` -> reusable packet format for worker subtasks
- `WORKER_RESULT_PACKET.md.template` -> reusable result format returned to orchestrator
- `APPLY_CHECKLIST.md.template` -> worker pre-return gate
- `POST_CODING_CHECKS.md.template` -> mandatory cloud review gate for every DONE packet
- `INVESTIGATOR_PROTOCOL.md.template` -> escalation role protocol
- `TEST_BLOAT_SWEEP.md.template` -> ASUS-proven test-suite bloat prevention, generalized for any orchestrator project
- `MASTER_TRACEABILITY_TABLE.md.template` -> Path ID and smoke evidence map
- `SMOKE_TEST_CATALOG.md.template` -> smoke registry
- `WORKFLOW_TEST_MATRIX.md.template` -> workflow-to-command verification map
- `FEATURE_SPEC_TEMPLATE.md.template` -> spec before packet decomposition
- `STATE_LEDGER_PROTOCOL.md.template` -> packet/session state protocol
- `LOCAL_WORKER_HEALTH.md.template` -> generic local-worker readiness and degraded/offline rules
- `packet_ledger.json.template` -> starter packet ledger
- `session_budget.json.template` -> starter session budget
- `OPERATOR_DASHBOARD.md.template` -> plain-English operator control surface
- `TEMPLATE_INDEX.yaml.template` -> `docs/ORCHESTRATOR_TEMPLATE_INDEX.yaml`, machine-readable navigation map for this variant
- `scripts/orchestrator_state.py.template` -> packet folder initialization, ledger lifecycle updates, and orchestrator-state validation

## Intended Operating Model

1. Human starts with `AI_AGENT.md`.
2. Cloud orchestrator reads the lean startup set: `AI_AGENT.md`, `SESSION_BRIEF`, `CONTEXT_ROUTING`.
3. When the work type is unclear or high leverage, the orchestrator reads `SCENARIO_PLAYBOOK` to choose Level 1/2/3 mode and gates.
4. Cloud orchestrator updates the plan and issues a narrow `WORKER_TASK_PACKET`.
5. Local worker runs the 9-step test-first loop and returns `WORKER_RESULT_PACKET`.
6. Cloud orchestrator runs mandatory `POST_CODING_CHECKS`.
7. Outcome is accepted, repaired, rejected, or escalated to investigator.
8. AI runs `CLOSING_CHECKLIST` before final handoff.
9. Human approves a reviewed outcome, not raw code.

## Apply To A Project

Use the v2 bootstrap script with the orchestrator overlay so Templates remains the source of authority:

```bash
bash templates-v2/scripts/bootstrap_agent_ready.sh.template \
	--target /path/to/project \
	--project-name "My Project" \
	--tier TIER_B_STANDARD \
	--tier-profile auto \
	--orchestrator \
	--strict
```

For existing lean/v2 projects, run `docs/TEMPLATE_ADOPTION_WALKTHROUGH.md` section 5 and the lean audit before allowing local-worker implementation packets.

`--orchestrator` also installs `scripts/orchestrator_state.py` and creates persisted packet directories under `docs/packets/` so packet state is not hand-edited from memory.

## Token Control Rules

- The orchestrator should not re-read the full project for every subtask.
- The worker should not broaden scope beyond the assigned files unless it hits a concrete blocker.
- The result packet should summarize only what the orchestrator needs to decide the next step.
- Large architectural rereads should be reserved for milestone changes, blockers, or risk review.

## Status

This variant is the v3-style orchestrator reference inside `templates-v2`. It is the source of authority for future project implementation; ASUS remains the Z13 hardware/runtime proving-ground repo.

Use this as the source to apply the orchestrator model to future projects after the local-worker flow has been proven in practice.