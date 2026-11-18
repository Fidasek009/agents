---
name: helm
description: ALWAYS use this skill when creating or modifying Helm charts, values, templates, chart tests, or Helm-managed Kubernetes deployments.
---

# Helm

## Values and rendering

- Keep chart values compatible with existing overrides. Maintain a values schema for non-trivial charts. Preserve explicit `false` and `0` when applying defaults.
- For GitOps, render the same manifests from the same chart and values. Include the chart name in helper names. Share selector helpers between workloads and services. Use `tpl` only for values that the chart accepts as templates.
- Use existing Secrets or the platform's secret store. Match RBAC, resource settings, and pod security to the workload and platform policy.

## Upgrades and verification

- Preserve deployed selectors and persistent volume claims. Plan a migration before changing their identity or immutable fields. Plan CRD upgrades explicitly because Helm skips already-installed CRDs in `crds/`.
- Run `helm lint`. Render with defaults and representative overrides, including feature toggles. Check the rendered diff for resource replacements, selector mismatches, and changes to existing installs.
- For changes involving cluster APIs, hooks, or storage, run a server-side dry run or test an upgrade in a disposable cluster. Test an upgrade from the previous release when lifecycle behavior changes.
