Create an `AGENTS.md` file specifically for the current project. If specified with a specific project component (eg. api, ui), only focus on that component.

The goal of this file is to provide an LLM agent with immediate "situational awareness" so it can navigate the codebase without scanning every file first.

Follow this strict structure:

1. **Mission Statement**: One sentence on what this component exists to do.
2. **Architecture & Patterns**: Identify the specific patterns used (e.g., Repository Pattern, CQRS, Adapter). Mention why these were chosen if it’s not standard.
3. **Core Dependencies**: List only the "critical path" libraries that dictate the logic (e.g., Zod for validation, Prisma for ORM).
4. **Data Flow**: Briefly describe how data enters and leaves this component.
5. **The "Gotchas" (Critical)**: List non-obvious rules, such as "Always use the custom useAuth hook instead of standard context" or "Database migrations must be handled manually for this module."
6. **Entry Points**: List the 2-3 main files where execution starts.

Constraint Checklist:
- No line numbers.
- Never link to specific files like this: [`api/main.py`](api/main.py) - instead, just mention the file without a link: `api/main.py`.
- No redundant explanations of standard syntax.
- Use Mermaid.js diagrams if the logic flow is complex.
- Keep the tone technical and concise.
