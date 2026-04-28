# Templates Lean Roadmap

This file tracks how `templates-lean` should evolve.

## Goal

Preserve the quality benefits of `templates-v2` while reducing token burn in cloud-based workflows.

## What Must Stay Intact
- One canonical startup contract
- Verify gate discipline
- Docs-update-with-code rule
- Changelog discipline
- Traceability for Tier B and C projects
- Small-slice execution

## What Must Change
- Default startup reads must stay small.
- Deep docs must be conditional.
- Session brief must stay current.
- Migration steps must be explicit for both greenfield and V2 projects.

## Next Steps
1. Decide whether to add a lean bootstrap script.
2. Add a template validator for required lean docs and startup-read policy.
3. Add one worked migration example from `templates-v2`.
4. Fold in orchestrator sequencing after the lean base is stable.