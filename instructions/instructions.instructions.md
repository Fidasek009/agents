---
applyTo: "**/*.instructions.md"
---

# Guidelines for Writing GitHub Copilot Instruction Files

You are an expert in "Context Engineering" for GitHub Copilot. When asked to create or update an `.instructions.md` file, adhere to the following principles to ensure high-quality context retrieval and complementarity with Agent files.

## 1. Core Philosophy: Separation of Concerns
To ensure instructions complement `*.agent.md` files rather than fighting them, follow this strict separation:

- **Instructions (`*.instructions.md`) are the "Constitution":** They define **universal rules**, coding standards, tech stacks, and project structures that apply regardless of who (which agent) is doing the work.
- **Agents (`*.agent.md`) are the "Job Descriptions":** They define **personas**, specific workflows, and tool access.
- **Rule:** Do **NOT** define personas (e.g., "You are a senior React developer") in instruction files. Save personas for Agent files. Focus instructions purely on the *technical constraints* and *patterns*.

## 2. File Structure and Frontmatter
All path-specific instruction files must begin with valid YAML frontmatter.

```yaml
---
name: [Short, descriptive name, e.g., "React Component Guidelines"]
description: [Brief summary of what these rules enforce]
applyTo: [Glob pattern, e.g., "src/components/**/*.tsx"]
---
```

- **`applyTo` is Critical:** Use specific glob patterns to prevent "Context Dilution." Only load rules when the user is working in relevant files (e.g., SQL rules should not load when editing CSS).

## 3. Required Content Sections
Every instruction file should contain the following structured sections. Use clear Markdown headers.

### A. Project Overview (Elevator Pitch)
- **What:** A 1-2 sentence description of what the specific module or project does.
- **Why:** Helps Copilot understand the business goal behind the code.

### B. Tech Stack (Manifest)
- **Be Specific:** Do not say "React." Say "React 18 with TypeScript, Vite, and Tailwind CSS."
- **Versions:** Mention major versions if relevant (e.g., "Next.js 14 (App Router)").

### C. The "Always, Ask, Never" Framework
Organize behavioral rules into these three categories to set clear boundaries:
- **✅ Always:** Mandatory practices (e.g., "Always use `zod` for schema validation," "Always write unit tests for utility functions").
- **⚠️ Ask:** Gray areas requiring human input (e.g., "Ask before adding new npm dependencies," "Ask before deleting legacy database columns").
- **🚫 Never:** Strict prohibitions (e.g., "Never commit `.env` files," "Never use `any` in TypeScript," "Never use `console.log` in production code").

### D. Code Style and Examples
- **Show, Don't Just Tell:** Provide concrete "Do vs. Don't" code snippets.
- **Example:**
  ```typescript
  // ❌ Bad: Vague naming
  const d = new Date();

  // ✅ Good: Descriptive naming
  const currentDate = new Date();
  ```

### E. Project Structure
- Briefly map out relevant folders.
- **Example:**
  - `src/components/ui`: Reusable atomic components.
  - `src/features`: Domain-specific business logic.

## 4. Writing Style and Formatting
- **Concise:** Use short, imperative statements. Avoid narrative prose.
- **Readable:** Use bullet points and bold text for emphasis.
- **Length Limit:** Keep files under 1,000 lines to avoid exceeding the context window.
- **No External Links:** Do not ask Copilot to "read this URL." Paste the relevant context directly into the file.

## 5. Anti-Patterns to Avoid
- **Context Dumping:** Do not paste entire documentation manuals. Summarize the 5-7 most critical rules.
- **Stylistic Fluff:** Avoid instructions like "Be a friendly colleague" or "Respond in Spanish".
- **Conflicting Scopes:** Do not put backend rules (SQL, Python) in a file targeted at frontend paths via `applyTo`.

## Template for New Instruction Files
When generating a new file, use this structure:

```markdown
---
name: [Name]
description: [Description]
applyTo: "[Glob Pattern]"
---

# [Topic] Guidelines

## Context
[Brief explanation of the module/project goals]

## Tech Stack
- [Framework/Library 1]
- [Framework/Library 2]

## Coding Standards
- **Naming:** [Convention]
- **Typing:** [Strictness level]
- **Testing:** [Framework and strategy]

## Boundaries
- ✅ **Always:** [Rule 1], [Rule 2]
- ⚠️ **Ask First:** [Rule 3]
- 🚫 **Never:** [Rule 4]

## Examples
[Code snippet showing preferred pattern]
```
