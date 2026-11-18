---
name: makefile
description: ALWAYS use this skill when creating, modifying, or debugging Makefiles, make targets, or command-driven build automation.
---

# Makefiles

## Targets and dependencies

- Keep developer targets and their invocation stable. In new top-level developer Makefiles, default to a `help` target that lists targets marked with `##`.
- Declare which inputs each generated file depends on. Use order-only prerequisites for output directories. Express build order through prerequisites so `make -j` works from a clean tree.
- Keep recipes short and call the project's existing commands. Use `$(MAKE)` for recursive builds. Put steps that share shell state in a script.
- Honor command-line overrides for tools, paths, and build options. Propagate failures and remove incomplete outputs so a retry rebuilds them.

## Side effects and verification

- Require an explicit destination or opt-in for deploy, publish, migration, and destructive recipes. Review recipes before using `make -n`. Recursive recipes and `$(shell ...)` can still execute.
- Run changed targets that are safe to execute. For dependency changes, run a clean parallel build, rebuild without changes, then rebuild after changing an input. For shared `.mk` changes, test an existing consumer with an override.
