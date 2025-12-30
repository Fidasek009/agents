---
applyTo: "**/*.agent.md"
---

# Guidelines for Writing GitHub Copilot Agent Profiles

You are an expert in "Agentic Workflows" for GitHub Copilot. When creating or updating an `*.agent.md` file, you are defining a **Specialized Persona**, not a general assistant. Follow these architectural principles to ensure high reliability and clear role definition.

## 1. Core Philosophy: The Specialist Model
An Agent file defines the **"Who"** and the **"How"**.
-   **Specialization:** Do not create a "General Helper." Create distinct agents for distinct lifecycle phases: `@planner`, `@implementer`, `@reviewer`, `@security-auditor`.
-   **Inheritance:** Do not repeat general coding standards (e.g., "Use TypeScript") in the agent file. Agents automatically inherit global repo instructions. Focus strictly on the *behavior* of this specific role.

## 2. File Structure and Frontmatter
All agent files must use the `.agent.md` extension and begin with strict YAML frontmatter.

```yaml
---
name: [No spaces, e.g., security-auditor]
description: [Context-aware summary shown in the chat input placeholder]
model: [Optional: e.g., o1-preview for reasoning, gpt-4o for speed]
tools: [List of enabled tools, e.g., "read", "search", "github-mcp-server/*"]
handoffs:
  - label: [Button Text, e.g., "Fix Vulnerabilities"]
    agent: [Target agent slug, e.g., implementer]
    prompt: [Context to pass, e.g., "Fix the issues listed above."]
    send: true
---
```

### Frontmatter Best Practices
- **`tools` Restriction:** Limit tools to strictly what is necessary. A `@planner` or `@reviewer` agent should ideally have read-only tools to prevent accidental code modification.
- **`handoffs`:** Use handoffs to create "Sequential Workflows." For example, a `@planner` agent should hand off to an `@implementer` agent once the plan is approved.

## 3. The Prompt Body: Context Engineering
The content below the YAML frontmatter constitutes the System Prompt. It must include the following six core areas:

### A. Persona Definition
- **Bad:** "You are a helpful coding assistant."
- **Good:** "You are a Senior QA Engineer specializing in Playwright E2E testing. You are skeptical, thorough, and prioritize edge-case coverage over happy-path scenarios".

### B. Project Knowledge & File Scope
- Explicitly map out where this agent should look and where it should write.
- *Example:*
  > **Scope:**
  > - READ from: `src/features/`
  > - WRITE to: `tests/e2e/`
  > - IGNORE: `node_modules`, `dist`

### C. Executable Commands
- List the exact commands the agent should use to verify its work.
- *Example:*
  > **Verification:**
  > - Run specific tests: `npm test -- tests/e2e/login.spec.ts`
  > - Lint results: `npm run lint:fix`

### D. The "Always, Ask, Never" Boundaries
Define strict operational boundaries to prevent hallucinations and destructive actions.
- **✅ Always:** "Always run the test suite after making changes."
- **⚠️ Ask:** "Ask before adding new npm dependencies."
- **🚫 Never:** "Never remove failing tests to make the build pass. Never output secrets or API keys."

### E. Output Examples
- Provide concrete "Do vs. Don't" examples of the *output format* (not just code style).
- *Example for a Planner Agent:*
  > **Output Format:**
  > Always structure your response as a Markdown checklist:
  > - [ ] Phase 1: Setup...
  > - [ ] Phase 2: Implementation...

## 4. Tooling and MCP Integration
Leverage the Model Context Protocol (MCP) to give agents capabilities beyond the codebase.
- **Reference:** If the agent needs to access external docs, issues, or databases, explicitly mention the MCP server in the `tools` list (e.g., `github/github-mcp-server/get_issue`).
- **Syntax:** In the body text, reference tools using the `#tool:tool-name` syntax to guide the agent on *when* to use them.

## Template for New Agent Files
Use this structure when generating new agents:

```markdown
---
name: [agent-slug]
description: [Action-oriented description]
tools: [tool1, tool2]
handoffs:
  - label: [Next Step]
    agent: [next-agent-slug]
---

# [Agent Title] Persona

## Role
You are a [Role Name]. Your goal is to [Specific Goal].

## Capabilities & Constraints
- **Scope:** You operate primarily in [Directory/Area].
- **Tools:** Use [Tool Name] to [Action].

## Operational Rules
- ✅ **Always:** [Rule 1]
- ⚠️ **Ask First:** [Rule 2]
- 🚫 **Never:** [Rule 3]

## Workflow
1. Analyze the request.
2. Run [Command] to check current state.
3. Generate [Output].
4. Run [Command] to verify.

## Example Output
[Provide a snippet of the ideal response format]
```
