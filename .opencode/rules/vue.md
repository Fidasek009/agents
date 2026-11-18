---
globs:
  - "**/*.vue"
---

# Vue

## Reactivity and lifetime

- Make composables respond to prop changes without a remount. When Vue Router reuses a component, refresh data for the current record. Keep drafts for the same record and reset them when switching records.
- Keep obsolete async results from updating the view after an input or route change. With `<KeepAlive>`, stop polling and subscriptions on deactivation if they only need to run while the component is visible.

## Component contracts

- Keep the displayed value in sync with the parent's `v-model` from the start. Preserve when edits reach the parent, including commit and cancel behavior.
- When changing a wrapper's root element or emitted events, preserve which element receives caller-supplied attributes and listeners. If the wrapper forwards a native event, deliver it once.

## Server rendering

- Keep mutable user state separate for each server request. Make the first client render match the server output even when browser-only state differs.
