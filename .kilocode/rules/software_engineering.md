# General Software Engineering Principles

Core philosophy for development: **simple, maintainable, and robust** code.

## Context

These guidelines take precedence over language-specific rules. They establish the foundational principles that all code should follow.

## Best Practices

### Philosophies

#### Simplicity (KISS)

- **Simple is better than complex.** Avoid unnecessary abstraction or "clever" solutions.
- **Readable code is reliable code.** Write for the human reader first.
- **Reduce cognitive load.** Break complex logic into smaller, self-contained components.

#### You Aren't Gonna Need It (YAGNI)

- **Do not over-engineer.** Solve the problem at hand, not hypothetical future ones.
- **Iterative Complexity.** Start simple; add complexity only when constraints demand it.

#### Don't Repeat Yourself (DRY)

- **Single Source of Truth.** Every piece of logic should have one unambiguous representation.
- **Abstraction vs. Duplication.** Abstract identical, conceptually related logic—but don't couple unrelated code just because it looks similar.

### Solid

#### SOLID Principles

- **SRP:** A class/module should have one reason to change.
- **OCP:** Open for extension, closed for modification.
- **LSP:** Subtypes must be substitutable for base types.
- **ISP:** Prefer small, specific interfaces over large ones.
- **DIP:** Depend on abstractions, not concrete details.

#### Functions

- **Small:** A function should fit on a single screen.
- **Pure (Preferred):** Avoid side effects; output depends only on input.

### Comments

**Default to no comment.** Most code should be self-explanatory through naming and structure. Only add a comment when the code alone cannot convey *why* a decision was made.

**Litmus test:** If deleting the comment forces the reader to check git blame or ask a teammate to understand a non-obvious decision, keep it. Otherwise, delete it.

- **Document "Why":** Explain business constraints, edge cases, and non-obvious reasons — not what the code does.
- **Capture Non-Obvious Tradeoffs:** Record rationale when alternatives were considered or when the obvious approach was intentionally avoided.
- **Never Write Changelog Comments:** Do not describe what you just changed or why you changed it. The comment must make sense to a reader who has no knowledge of the change history.
- **Keep comments short.** One line is ideal. Two lines is the maximum.

**Bad** — restates what the code says, or reads like a changelog:

```python
# Sort users by last login date
users.sort(key=lambda u: u.last_login)

# Check if the user is an admin
if user.role == Role.ADMIN:

# Changed from 5 to 10 because the old value was too low
MAX_BATCH_SIZE = 10

# Replaced threading with asyncio for better performance
await process_batch(items)

# Removed the old validation logic and added schema-based validation
schema.validate(payload)
```

**Good** — explains something the code *cannot* tell you:

```python
# Cold accounts fail fast — process them first to free up batch slots
users.sort(key=lambda u: u.last_login)

# Admins bypass rate limiting per contract with enterprise clients
if user.role == Role.ADMIN:

# Benchmarked: 10 saturates the connection pool without triggering OOM
MAX_BATCH_SIZE = 10

# no comment needed — self-explanatory
await process_batch(items)

# no comment needed — self-explanatory
schema.validate(payload)
```

### Errors

#### Error Handling

**Bad:**

```python
try:
    do_something()
except:
    pass  # Silent failure
```

**Good:**

```python
try:
    do_something()
except ValueError as e:
    log.error(f"Invalid input: {e}")
    raise
```

### Naming

#### Naming & Magic Numbers

**Bad:**

```javascript
setTimeout(fn, 86400 * 1000);
```

**Good:**

```javascript
const MILLISECONDS_IN_DAY = 24 * 60 * 60 * 1000;
setTimeout(fn, MILLISECONDS_IN_DAY);
```

## Boundaries

- ✅ **Always:** Fail fast—validate inputs early, crash loudly
- ✅ **Always:** Use meaningful names that explain *why* and *what*
- ⚠️ **Ask:** Before adding dependencies (maintenance burden, security risk)
- ⚠️ **Ask:** Before optimizing ("Premature optimization is the root of all evil")
- 🚫 **Never:** Swallow errors with empty catch blocks
- 🚫 **Never:** Use magic numbers—define named constants
