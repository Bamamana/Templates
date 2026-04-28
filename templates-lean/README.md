# templates-lean (Moved)

The lean approach is no longer a separate pack. It is now a **profile of `templates-v2`**.

This eliminates drift: every improvement to v2 automatically benefits lean projects, because lean only overrides the three startup-context files.

## Where it lives now
- Profile templates: `templates-v2/profiles/lean/`
  - `AI_AGENT.md.template` (slim startup contract)
  - `SESSION_BRIEF.md.template` (current execution state)
  - `CONTEXT_ROUTING.md.template` (load-on-trigger map)
- Profile README: [../templates-v2/profiles/lean/README.md](../templates-v2/profiles/lean/README.md)
- Roadmap (historical): [../templates-v2/profiles/lean/ROADMAP.md](../templates-v2/profiles/lean/ROADMAP.md)

## How to apply
```bash
bash templates-v2/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/project \
  --project-name "My Project" \
  --tier TIER_B_STANDARD \
  --lean
```

The `--lean` flag applies v2 normally, then overlays the three lean files and installs `validate_context_budget.sh` and `report_context_size.sh`.

## Why the change
Two separate packs drifted. A profile cannot. Lean is now defined as: **v2 + slim AI_AGENT + SESSION_BRIEF + CONTEXT_ROUTING + budget tooling**. Nothing else changes. All v2 governance, tooling, validators, drift checks, CI workflows, and addons remain available.
