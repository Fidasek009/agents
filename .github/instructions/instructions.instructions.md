---
applyTo: "**/*.instructions.md"
---
# Guidelines for Writing Instruction Files

Instruction files (`.instructions.md`) are **skills** that teach Copilot how to use a specific tool, language, or framework correctly. They contain universal best practices, NOT project-specific details.

## Philosophy

- **Instructions are Skills:** They teach procedural knowledge about a tool/language (e.g., "how to write idiomatic Python," "Docker best practices").
- **NOT Project Config:** Do not include project-specific paths, business logic, or team conventions. Those belong in `.github/copilot-instructions.md` or agent files.
- **Reusable Across Projects:** A good instruction file should be usable in any project that uses that tool.

## Structure

All instruction files must begin with YAML frontmatter:

```yaml
---
applyTo: "[Glob Pattern matching relevant files]"
---
```

**`applyTo` Patterns:**

- Language: `"**/*.py"`, `"**/*.ts"`, `"**/*.go"`
- Tool: `"**/Dockerfile,**/*.dockerfile"`, `"**/Makefile"`
- Framework: `"**/next.config.*"`, `"**/*.spec.ts"`

## Content

Focus on teaching the tool/language itself:

- **Idioms & Patterns:** Modern, recommended ways to use the language
- **Common Pitfalls:** What to avoid and why
- **Best Practices:** Security, performance, maintainability
- **Concrete Examples:** Show "Bad vs Good" code snippets

Do NOT include:

- Project directory structures
- Specific library choices (unless the skill IS about that library)
- Team conventions or business rules

## Boundaries

Use the "Always, Ask, Never" framework for clear rules:

- ✅ **Always:** Mandatory practices for the tool (e.g., "Always use f-strings in Python")
- ⚠️ **Ask:** Context-dependent decisions (e.g., "Ask before choosing between Alpine and Debian base images")
- 🚫 **Never:** Strict prohibitions (e.g., "Never use `any` in TypeScript")

## Examples

Always provide concrete code examples showing the right way:

**Bad:**

```python
path = os.path.join(data_dir, "file.txt")
```

**Good:**

```python
path = Path(data_dir) / "file.txt"
```

## Style

- **Concise:** Use short, imperative statements
- **Organized:** Use nested XML tags within `<best_practices>` to group related concepts (e.g., `<idioms>`, `<typing>`, `<anti_patterns>`)
- **Practical:** Focus on actionable guidance, not theory
- **Length:** Keep under 500 lines; split large topics into multiple files

## Template

```markdown
---
applyTo: "[Glob Pattern]"
---

# [Tool/Language] Guidelines

Brief description of what this skill covers.

## Context

When and why these guidelines apply.

## Best Practices

### Topic Name

#### Subtopic

Explanation with Bad/Good examples.

### Anti Patterns

#### Anti-Pattern Name

Bad/Good examples for common mistakes.

## Boundaries

- ✅ **Always:** [Rule 1], [Rule 2]
- ⚠️ **Ask:** [Rule 3]
- 🚫 **Never:** [Rule 4]
```
