# Templates V2 Fixture Harness

This folder defines expected outputs for bootstrap self-tests.

- Scope: Tier B, profile 2 (verification hardening), CI option 1.
- Producer: `scripts/bootstrap_agent_ready.sh.template`.
- Consumer: `.github/workflows/ci.yml.template` job `template-selftest`.

If bootstrap output expectations change intentionally, update:
- `expected_files_tier_b_profile2.txt`
