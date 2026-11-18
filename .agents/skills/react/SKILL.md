---
name: react
description: ALWAYS use this skill when working with React code, JSX/TSX, hooks, forms, UI state, or React application architecture.
---

# React

## State ownership

- Keep state local unless it must outlive the component or other parts of the app need it. Store filters, tabs, and pagination in the URL when a link or browser history should restore them. Reuse the project's existing way of fetching and caching server data.
- Keep drafts when refetching the same record. Reset them when switching records. Keep row state with the same record when a list reorders.
- Keep cached data separate across account or tenant switches. After a mutation, update or invalidate every view that uses the changed data.

## Effects and rendering

- Trigger writes from user actions so a remount or effect rerun cannot repeat them. Release subscriptions when their inputs change or the component unmounts. Keep stale responses from overwriting newer results.
- When rendering on the server, make the first client render match the server output. Read browser-only values after hydration or in a client-only component. Fix the cause of hydration mismatches.
- Add memoization when measurements show a performance problem or when the consumer requires stable identity.

## Interaction

- Reuse the design system's controls and the app's existing ways of showing feedback. Preserve keyboard navigation and restore focus when overlays close.
- Show distinct loading, empty, and error states. Keep form input after a failed submission. Prevent overlapping submissions when they could duplicate a write.
