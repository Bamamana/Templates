# Multi-App Server Blueprint (Optional Add-on)

Use this when hosting 2+ independent apps on one server.

## Goals
- Isolate each app to reduce blast radius.
- Keep one shared operational baseline.
- Preserve app-level deploy and rollback independence.

## Baseline Model
- Shared edge ingress and routing.
- Per-app runtime namespace/network/volumes/secrets.
- No cross-app traffic unless explicitly documented.

## App Onboarding Checklist
- [ ] App adopts v2 core templates
- [ ] App-specific env/secrets defined
- [ ] App-specific compose/network/volume configured
- [ ] Hostname/routing configured
- [ ] App smoke and verify gates pass
- [ ] App rollback path validated
