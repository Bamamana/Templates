# Orchestrator Template (Cloud Planner + Local Worker)

This folder is a draft template pack for projects that split AI work across two roles:

- `Orchestrator`: premium cloud model that understands the whole project, plans slices, reviews outcomes, and handles escalations.
- `Worker`: local model that performs bounded implementation, test, refactor, and verification loops.

It is intended for the workflow we have been discussing:

- keep the global architecture and project memory on the orchestrator side,
- push repetitive coding and test loops to a local model,
- reduce cloud token burn by avoiding repeated full-repo rereads.

## Design Goals

- Preserve the existing V2 guardrails and document discipline.
- Add explicit delegation rules so the worker stays inside a narrow slice.
- Make token savings operational rather than aspirational.
- Keep code drift low by enforcing acceptance criteria, command limits, and result packets.

## Draft Pack Layout

- `AI_AGENT.md.template` -> canonical startup contract for orchestrator-driven projects
- `PROJECT_CANVAS.md.template` -> current execution state plus orchestration state
- `ENGINEERING_PLAYBOOK.md.template` -> commands, validation policy, and delegation rules
- `ORCHESTRATION_MAP.md.template` -> source of truth for role split, handoff rules, and token policy
- `WORKER_TASK_PACKET.md.template` -> reusable packet format for worker subtasks
- `WORKER_RESULT_PACKET.md.template` -> reusable result format returned to orchestrator
- `TEMPLATE_INDEX.yaml.template` -> machine-readable navigation map for this variant

## Intended Operating Model

1. Human starts with `AI_AGENT.md`.
2. Orchestrator reads the project canon once.
3. Orchestrator defines a narrow subtask using `docs/WORKER_TASK_PACKET.md`.
4. Worker executes only inside that scope and returns `docs/WORKER_RESULT_PACKET.md`.
5. Orchestrator reviews only the result packet, diff summary, and targeted validation output.
6. Orchestrator either accepts, requests a narrow repair, or escalates to broader review.

## Token Control Rules

- The orchestrator should not re-read the full project for every subtask.
- The worker should not broaden scope beyond the assigned files unless it hits a concrete blocker.
- The result packet should summarize only what the orchestrator needs to decide the next step.
- Large architectural rereads should be reserved for milestone changes, blockers, or risk review.

## Status

This is the first draft scaffold. It is not yet wired into the main bootstrap script.
The goal of this folder is to define the contract and sequencing first, then decide whether to fold it into the broader templates-v2 bootstrap flow.