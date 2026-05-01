# Mode Guide

## Use Hybrid Local Mode When

- the task is small
- the target area is obvious
- only a few files should change
- no planning decision is needed
- no auth, data, security, deployment, or destructive operation is involved

Examples:

- fix a syntax error
- move a button
- adjust a label
- repair a small styling issue
- update one small docs section

## Use Orchestrator Mode When

- the task spans multiple files or systems
- the work needs a plan
- the work needs review before acceptance
- the work is a migration or carryover
- the task touches project architecture
- tests are failing for unclear reasons
- the change may affect auth, data, security, deployment, or destructive operations

Examples:

- migrate lean v2 to orchestrator v2
- apply Templates updates to a project
- refactor Visual Planner state handling
- fix test structure across a module
- prepare an overnight maintenance run

## Use Template Carryover Mode When

- Templates changed
- a bug slipped past a checklist
- a project needs updated AI rules
- a project needs updated validation expectations
- a project needs a new doc/checklist copied from Templates

## Simple Rule

Small and obvious: hybrid local.

Big, risky, or multi-step: orchestrator.

Template source-of-truth update: carryover mode.
