---
name: shell
description: ALWAYS use this skill when creating, modifying, or debugging sh, Bash, Zsh, POSIX shell, setup, run, CI, or automation scripts.
---

# Shell scripts

## Runtime and failures

- Use POSIX `sh` for portable automation. Use an interpreter and utilities that the target systems support. Resolve repository paths regardless of where the caller runs the script.
- Pass variable values as arguments. When users can choose a command, accept only commands from an explicit list. Avoid `eval` and building command strings from data.
- Check exit statuses when failure must stop the script. Pay particular attention to conditions, pipelines, and substitutions where `set -e` can miss failures. Handle expected nonzero statuses and use `wait` to propagate failures from background commands.

## Side effects and verification

- Validate inputs before side effects. Resolve paths for destructive operations and check that they stay inside the allowed directory. Make setup and deployment safe to retry after partial failure.
- Create private temporary directories with `mktemp -d`. Clean up the script's temporary files, locks, mounts, and child processes on exit or interruption. Keep secrets out of traces and logs.
- Run the project's shell checks and test the script with its declared interpreter. Use a temporary workspace to test changes to paths and side effects. Where relevant, run from an unrelated working directory and test failure and retry.
