# Text Economy

Prefer self-explanatory code and concise prose. Add explanation only when it contributes information the reader cannot readily infer. Use the fewest words that preserve correctness, intent, and useful context.

## Communication

- Prefer precise nouns and verbs over boilerplate, narration, reviewer notes, and status commentary.
- Let names, types, signatures, structured fields, stack traces, and nearby code carry self-evident context.
- Keep progress updates to meaningful findings or blockers. Final responses should state the outcome, verification, and material caveats without replaying the work.

## Code Comments

- Make ordinary code self-explanatory through names and structure; improve unclear code before explaining it with comments.
- Write comments and docstrings only for necessary, durable information not evident from names, types, implementation, or the surrounding contract.
- Prefer one or two lines; use more only when a non-obvious contract or safety constraint requires it.
- Do not use source comments as agent memory, handoff notes, plan tracking, patch narration, or a record of rejected implementations. Preserve rationale only when it explains a constraint of the final design.
- Reserve parameter, return, field, and control-flow descriptions for non-obvious contracts.
- Use a comment when deleting it would force the reader to inspect git history or ask a teammate. Preserve workaround rationale and removal conditions when they still constrain the code.
- Preserve tool directives, licenses, and documentation consumed by tooling; docstrings can be runtime-visible, not just prose.

## Documentation

- Keep docs task-oriented and dense: purpose, constraints, commands, decisions, and gotchas.
- Keep change history in git history, commit messages, pull requests, and changelogs.
- Keep public docs and agent-facing project instructions aligned with the code.
