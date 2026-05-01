# User Instructions

Simple prompts for starting and finishing AI work while keeping Templates as the source of truth.

## Purpose

Use this folder when you want to know what to say to an AI assistant before it starts work or after it says it is done.

Templates remains the source of truth for:

- project rules
- profile migration
- adoption/carryover checklists
- post-coding checks
- traceability updates
- worker packets
- closing checklists

## Main Rule

Start every serious request by pointing the AI at `AI_AGENT.md`.

Then tell it which mode you are using:

- Hybrid local mode: small, obvious, low-risk change
- Orchestrator mode: big, risky, multi-step, migration, or refactor work
- Template carryover mode: apply updates from Templates into a project

## Important Follow-Up

When the AI says it is done, do not stop at the summary.

Ask it to verify that it followed the Templates checklist and updated required docs.

Use the prompts in `FOLLOW_UP_PROMPTS.md`.
