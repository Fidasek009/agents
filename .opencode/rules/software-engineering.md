# Software Engineering Standards

It is mandatory that you adhere to these principles throughout your work.

## Philosophy

- Build simple, explicit, maintainable systems.
- Optimize for correctness, readability, debuggability, and safe change.
- Solve the root problem with the smallest proper fix.
- Keep behavior consistent with the surrounding codebase.
- Make decisions from evidence gathered in code, tests, docs, logs, or authoritative sources.
- Reuse established code in the codebase and mature packages for commodity problems.
- Choose tools and abstractions for demonstrated needs. Prefer the simplest correct implementation; add reusable structure when it reduces duplicated knowledge or clarifies ownership.
- Do not add speculative flexibility, configuration, or extension points. A little repetition is preferable to coupling unrelated concepts.
- Prefer boring, reversible decisions over clever or speculative ones.

## Problem Solving

- Reproduce or inspect the failure before changing code.
- Identify the root cause before implementing a fix.
- Treat symptoms, logs, and failing tests as evidence, then verify the hypothesis.
- Implement proper fixes that remove the cause of the problem.
- Preserve useful failure signals so future issues are diagnosable.
- Define success criteria before larger implementation work.

## Design

- Start from the desired behavior, constraints, and failure modes.
- Keep modules cohesive and loosely coupled.
- Put domain rules, validation, and business concepts in one source of truth.
- Use explicit contracts between boundaries: API, database, UI, queues, files, and external services.
- Add abstractions when they reduce duplicated meaning or clarify ownership.
- Use composition and small focused units as the default design shape.
- Give each module, function, and component one clear responsibility.
- Keep interfaces focused on what callers actually need.
- Depend on stable contracts at boundaries, not volatile implementation details.

## Consistency

- Follow existing project patterns for structure, naming, errors, logging, tests, and configuration.
- Extend established conventions before introducing new ones.
- Keep related code shaped the same way across the codebase.
- Update docs, rules, generated types, schemas, and tests made inaccurate by the change.
- Keep cleanup within the requested scope or necessary to implement it safely. Report unrelated opportunities separately; do not edit during read-only tasks.

## Dependencies And Reuse

- Search the codebase for existing implementations before adding new code.
- Use established internal utilities and shared components for repeated behavior.
- Use well-maintained packages for standard problems such as parsing, validation, dates, auth, crypto, and protocol clients.
- Before adding or upgrading external dependencies (packages, container images, GitHub Actions, Helm charts, runtimes, CLIs), verify the current stable version from an authoritative source and validate maintenance status and ecosystem fit.

## Failure Behavior

- Fail fast on invalid input, impossible states, missing configuration, and violated invariants.
- Use explicit errors for misconfiguration, invalid state, and data issues.
- Keep internal error messages compact: failed operation, violated invariant, and safe diagnostic value when needed.
- For user-facing errors, name what failed and include one recovery action when the user can act.
- Keep fallback behavior deliberate, observable, and tied to a real product requirement.
- Put diagnostic detail in structured fields, cause chains, or logs rather than long messages.
- Write log messages as event names plus structured fields; log state changes only when operationally useful.
- Keep state transitions explicit and observable.
- Handle partial failure deliberately with retry, compensation, degradation, or safe failure.

## Correctness And Safety

- Validate untrusted input at boundaries.
- Add internal checks only for distinct invariants or concrete failure modes, not to repeat validation already guaranteed by the caller or type system.
- Keep secrets and environment-specific credentials out of source code.
- Make operational changes reversible, observable, and scoped.
- Treat security, privacy, and data safety as baseline requirements.
- Use least privilege for credentials, permissions, tokens, services, and infrastructure.

## Verification

- Run the smallest relevant verification first, then broaden based on risk.
- Complete required checks; repeat or broaden them only after relevant changes, failures, or unresolved concerns. Match claims to what was actually verified.
- Add or update tests for changed behavior, bug fixes, and regression-prone paths.
- Keep tests deterministic and behavior-focused.
- Treat type checks, lint, formatting, tests, and CI as quality gates.
- Report verification commands and results when finishing implementation work.
- Inspect the diff for redundant comments, duplicated checks, speculative abstractions, and tests without distinct coverage. No cleanup is needed when the change is already clear and sufficient.
