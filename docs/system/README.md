# System Handbook

This handbook preserves a small, verified mental model of this software. Source code is authoritative; handbook pages are a map that helps people find and understand the relevant code.

## Contents

- [`overview.md`](overview.md): purpose, boundaries, and how the system starts.
- [`modules.md`](modules.md): major modules and dependencies.
- [`flows/`](flows/): important end-to-end behaviors.
- [`decisions/`](decisions/): durable architectural decisions and their context.
- [`evolution.md`](evolution.md): notable system changes, with links to commits or pull requests.

## Maintenance rules

- Include source paths and symbols for claims that can be verified in code.
- Record stable facts; put temporary investigation notes in the relevant review or issue.
- Mark assumptions and open questions explicitly.
- Update only what was checked. Add a last-verified date when a page is substantially reviewed.
- Keep secrets, credentials, personal data, and copied production data out of this handbook.
