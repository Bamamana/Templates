# V1 -> V2 Traceability Matrix

This file maps every V1 template artifact to its V2 location and parity status.
Goal: provide one-click auditability that V2 preserves structural and industry-standard project content while reducing file count.

## Summary
- V1 artifacts mapped: 25/25
- V2 strategy: consolidate overlapping governance into fewer canonical files, keep specialized items as optional add-ons
- Canonical startup in V2: `AI_AGENT.md`

## Mapping Table

| V1 Artifact | V2 Destination | Status | Notes |
|---|---|---|---|
| `templates/AI_AGENT.md.template` | `templates-v2/AI_AGENT.md.template` | Preserved | Canonical startup contract retained and strengthened |
| `templates/AI_SOURCE_OF_TRUTH.md.template` | `templates-v2/AI_AGENT.md.template` + `templates-v2/ENGINEERING_PLAYBOOK.md.template` + `templates-v2/PROJECT_CANVAS.md.template` | Merged | Non-negotiables, workflow rules, and execution state distributed into canonical core docs |
| `templates/CHANGELOG.md.template` | `templates-v2/CHANGELOG.md.template` | Preserved | Kept with `Unreleased` structure and verification/risk tracking |
| `templates/WORKFLOW_COMMANDS.md.template` | `templates-v2/ENGINEERING_PLAYBOOK.md.template` (Section 1) | Merged | Centralized command catalog |
| `templates/WORKFLOW_TEST_MATRIX.md.template` | `templates-v2/ENGINEERING_PLAYBOOK.md.template` (Section 3) | Merged | Workflow-to-test matrix retained |
| `templates/SMOKE_TEST_CATALOG.md.template` | `templates-v2/ENGINEERING_PLAYBOOK.md.template` (Sections 2, 2.1, 3) | Merged | Smoke policy/catalog intent preserved in test policy + matrix |
| `templates/MANUAL_SMOKE_RUNBOOK.md.template` | `templates-v2/ENGINEERING_PLAYBOOK.md.template` (Section 2.1) | Merged | Concise manual smoke flow retained |
| `templates/FEATURE_SPEC_TEMPLATE.md.template` | `templates-v2/ENGINEERING_PLAYBOOK.md.template` (Section 4) + `templates-v2/PROJECT_CANVAS.md.template` | Merged | Feature execution and scope/acceptance fields preserved |
| `templates/GAME_PLAN.md.template` | `templates-v2/PROJECT_CANVAS.md.template` (Sections 0, 4, 4.1) | Merged | Phase model + current-position tracking retained and made explicit |
| `templates/INSTRUCTIONS_INDEX.md.template` | `templates-v2/AI_AGENT.md.template` + `templates-v2/TEMPLATE_INDEX.yaml.template` | Merged | Human and machine-readable navigation added |
| `templates/repository-map.md.template` | `templates-v2/ENGINEERING_PLAYBOOK.md.template` (Section 5) | Merged | Repository structure map retained |
| `templates/POST_CODING_CHECKS.md.template` | `templates-v2/ENGINEERING_PLAYBOOK.md.template` (Section 6) + `templates-v2/AI_AGENT.md.template` | Merged | After-coding checks and DoD retained |
| `templates/REFRACTOR_PLAYBOOK.md.template` | `templates-v2/ENGINEERING_PLAYBOOK.md.template` (Section 7) + `templates-v2/AI_AGENT.md.template` | Merged | Refactor triggers and size limits retained |
| `templates/PROJECT_TIER_POLICY.md.template` | `templates-v2/OPS_SECURITY_RELEASE.md.template` (Section 1) + `templates-v2/TEMPLATE_VALIDATION_CHECKLIST.md.template` | Merged | Tier model and compliance obligations retained |
| `templates/DEPLOYMENT_RUNBOOK.md.template` | `templates-v2/OPS_SECURITY_RELEASE.md.template` (Section 3) | Merged | Deploy/rollback process retained |
| `templates/SECRETS_POLICY.md.template` | `templates-v2/OPS_SECURITY_RELEASE.md.template` (Section 2) | Merged | Secrets baseline retained |
| `templates/SECURITY_AUTOMATION_BASELINE.md.template` | `templates-v2/OPS_SECURITY_RELEASE.md.template` (Section 4) + `templates-v2/.github/workflows/ci.yml.template` | Merged | Scanner commands + CI security job retained |
| `templates/OBSERVABILITY_RUNBOOK.md.template` | `templates-v2/OPS_SECURITY_RELEASE.md.template` (Section 5) | Merged | Signals, SLO fields, and incident flow retained |
| `templates/RELEASE_POLICY.md.template` | `templates-v2/OPS_SECURITY_RELEASE.md.template` (Section 6) | Merged | Promotion path + release evidence retained |
| `templates/RISK_REGISTER.md.template` | `templates-v2/OPS_SECURITY_RELEASE.md.template` (Section 7) | Merged | Risk table + escalation rules retained |
| `templates/ADR_TEMPLATE.md.template` | `templates-v2/addons/ADR_TEMPLATE.md.template` | Preserved as add-on | Kept optional to avoid core bloat |
| `templates/MULTI_APP_SERVER_BLUEPRINT.md.template` | `templates-v2/addons/MULTI_APP_SERVER_BLUEPRINT.md.template` | Preserved as add-on | Specialized multi-app guidance retained |
| `templates/docker-compose.local.yml.template` | `templates-v2/addons/docker-compose.local.yml.template` | Preserved as add-on | Local compose profile retained |
| `templates/FIRST_SESSION_PROMPT.txt` | `templates-v2/addons/FIRST_SESSION_PROMPT.txt.template` | Preserved as add-on | Optional human startup helper retained |
| `templates/TEMPLATE_LINT_CHECKLIST.md.template` | `templates-v2/TEMPLATE_VALIDATION_CHECKLIST.md.template` + `templates-v2/APPLY_CHECKLIST.md.template` + `templates-v2/scripts/validate_templates.sh.template` | Merged + strengthened | Manual + automated validation split and hardened (fail-fast placeholders) |

## V2-Native Additions (No V1 equivalent)
- `templates-v2/TEMPLATE_INDEX.yaml.template`: machine-readable map for AI navigation and tier applicability
- `templates-v2/APPLY_CHECKLIST.md.template`: apply-order checklist separated from validation checklist
- `templates-v2/AI_MEMORY.md.template`: persistent memory for user preferences and lessons learned
- `templates-v2/TECH_STACK.md.template`: centralized architecture and dependency choices
- `templates-v2/addons/AI_OPERATING_CONTRACT.md.template`: legacy compatibility alias (optional only)
- `templates-v2/addons/README.md.template`: optional standardized project landing page
- `templates-v2/addons/.gitignore.template`: optional repository hygiene baseline
- `templates-v2/addons/CONTRIBUTING.md.template`: optional collaboration and review workflow
- `templates-v2/addons/LICENSE.template`: optional licensing placeholder
- `templates-v2/addons/.github/PULL_REQUEST_TEMPLATE.md.template`: optional PR quality gate template
- `templates-v2/addons/.github/ISSUE_TEMPLATE/*`: optional issue intake templates
- `templates-v2/addons/.github/workflows/ci.python.yml.template`: optional Python-specific CI variant
- `templates-v2/addons/.github/workflows/ci.node.yml.template`: optional Node-specific CI variant

## Parity Notes
- V2 consolidates overlapping V1 governance into fewer canonical files while preserving all core concerns: startup contract, phase/state tracking, command matrix, testing policy, deployment, rollback, security automation, observability, release, and risk.
- Specialized or context-dependent artifacts are intentionally add-ons to reduce default token load without losing capability.
- For strict legacy compatibility, optional alias `AI_OPERATING_CONTRACT.md` can mirror `AI_AGENT.md`, but canonical startup remains `AI_AGENT.md`.
