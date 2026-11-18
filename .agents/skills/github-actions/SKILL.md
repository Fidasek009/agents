---
name: github-actions
description: ALWAYS use this skill when creating or modifying GitHub Actions workflows, reusable actions, CI/CD triggers, secrets, or deployment jobs.
---

# GitHub Actions

## Jobs and caching

- Split jobs where permissions or runners differ, or where work can run independently. Reuse the project's build and test commands. Pass small values as job outputs and build products as artifacts.
- Key package download caches on the lockfile, platform, and toolchain. Keep installs working on cache misses. Keep credentials out of caches.
- Use a matrix to test the supported combinations that need coverage. Fetch more Git history only for jobs that need it, such as release and versioning jobs.

## Security and deployment

- Start with read-only repository permissions. Grant extra permissions to the jobs that need them. Keep fork-controlled code and artifacts out of privileged jobs, including `pull_request_target` jobs. Prefer OIDC to long-lived cloud credentials. Pin third-party actions in privileged workflows to full commit SHAs.
- Deploy the tested artifact after required build and test jobs pass. Use a protected environment and serialize deployments to the same target.
- Keep required check names stable. When changing job names, filters, or conditions, verify how required checks behave on pushes and pull requests.

## Verification

- Use the project's workflow linter or `actionlint`. Run affected jobs with `act` where supported. Use representative events and test credentials.
- Check permissions, protected environments, OIDC, and concurrency on GitHub.
