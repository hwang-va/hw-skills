---
name: data-access-level2
description: "Trigger: /spec:data-access-level2 or gate versus filter, field mask, delegation, revocation request. Outcome: ASCII Level 2 line block under each Level 1 access role, from spec and Level 1, inline."
---
# Data-Access-Level2
Goal: Render spec as Data Access Level 2 (attribute based access control, NIST SP 800-162: each right a predicate on attributes), Level 1 matrix plus a line block per role, ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Data Access Level 1 required: cells, `DA-NN`; absent = run it first. Data Model Level 2 supplies attribute spelling and states; Interfaces Level 2 the call and credential per gate; Grounding Level 1 the `GR-NN` each filter protects; Autonomy Level 1 what triggers each run; Risks Level 2 the fallback on revoke. Absent = derive from spec, Inferred, one gap.
Scope: Per role, IDs kept. Gate and filter: block at `I-NN`, predicate `Entity.attribute = value` before the model reads, never only at the screen; `GR-NN` protected. Attributes: masks, settable states, system-only writes. Never holds (agents): credentials, payment details, secrets, where each lives. Delegation (agents): `delegated by DA-NN │ expires`, subset and term (RFC 8693); no triggering user = `service identity`. Revocation: data on screen, queued, cached, remembered. Identity: per principal, method one of OIDC login, API key, service identity, agent credential; token or session lifetime; step-up rule for a higher-risk action. Chain: one line from the user to the last hop, each hop marked `user token`, `exchange` (the user's identity carried by token exchange, RFC 8693), `agent`, or `service`; a token passed unchanged to the next hop is a gap, because MCP authorization (2026-07-28) binds a token to one server and forbids passthrough. Then `Store:` rules, maintainer, audit; `Retrieval:`; `Notes:`.
Cut: New roles, entities, or cells: a wrong cell is a Level 1 gap. Citations: Grounding. Auth per call: Interfaces.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Data Access`, Cross-Section Rules 12 to 15.
Output: Element list, divider, matrix with Level 2 lines, divider, gaps.
Args: `concise`: per contract Levels, Concise: matrix with Level 2 lines, gap-count line.

## Process
1. Bind: Gate from the Interfaces credential line; predicate in Data Model Level 2 spelling, no attribute = `?`, since a filter with no column cannot run; attribute rules from Data Model states and Autonomy checkpoints.
2. Identity: `delegated by DA-NN`, subset, expiry, when a person triggers the run; a feed, queue, or clock trigger = `service identity` (OWASP LLM06), never both. Revocation from Risks fallbacks; silent = `Unknown`.
3. Render: Level 1 matrix unchanged; block lines per role in ID order; then `Store:`, `Retrieval:`, `Notes:`. Rule-check line: roles, filters `Unknown` or `?`, attribute rules, never-holds, service identities, revokes `Unknown`, store.
4. Gaps: One question per filter `Unknown` or `?`, agent with no identity, unmasked field, store `Unknown`, cached or remembered data `Unknown` on revoke. Order as listed.

Requirements:
1. Every `DA-NN` gets each Scope line that applies to it; silent = `Unknown`, never blank. Creates no IDs; cites Level 1 `DA-NN`; no cell changes.
2. Register lines ≤ 110 characters: terminal pane. Layout: ID ≤ 7, label ≤ 12, body ≤ 90; legend glyphs `│`, `·`, `?` only, no `(I)`; over = move a reference to a gap.
3. ≤ 8 roles, ≤ 5 lines per role; every `Retrieval:` line names `I-NN` and `GR-NN`.
4. Every agent with no triggering user carries `service identity` and no `delegated by` (Rule 12), since a grant with no grantor cannot expire.
5. Elements prose ≤ 12 lines; the block is the artifact, and a markdown table that duplicates it is not allowed.
