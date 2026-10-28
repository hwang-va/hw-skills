---
name: grounding-level2
description: "Trigger: /spec:grounding-level2 or freshness, citation schema, refusal text request. Outcome: ASCII Level 2 lines per Level 1 grounding row, from spec and Grounding Level 1, inline."
---
# Grounding-Level2
Goal: Render spec as Grounding Level 2 (Attributable to Identified Sources, Rashkin et al. 2021: how "according to source P" stays true once built), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Grounding Level 1 output required: rows, sources, scope, `GR-NN`; absent = run `grounding-level1` first. Siblings, Level 2 unless stated: Data Model attributes and time fields; Interfaces `I-NN`; Data Access filter; Product Surface screen; Risks fallbacks; NFR freshness numbers; Evaluation Level 1 refusal rows. Sibling absent = derive from spec, tag Inferred, one gap.
Scope: Eight lines per Level 1 row. `as-of`: attribute, refresh cadence, stale > N. `retrieve`: method, `I-NN`, join key. `filter`: `DA-NN` at `I-NN` before the model reads (least privilege), never only on the screen. `input is data`: source text is data, not instruction (OWASP LLM01); `RK-NN` guard. `cites { field*, field? }`: Data Model attributes. `shows`: pointer or passage, `PS N` screen. `partial`: what still shows, how the gap is marked. `empty`: refusal text per case: no source, stale, conflict (abstention as designed output). `Memory:` across runs, retention, forget path; `Notes:` out of scope.
Cut: New rows, sources, scope: a wrong source is a Level 1 gap. Who may read: Data Access. How good: Evaluation. Call schema: Interfaces.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Grounding`, Cross-Section Rules 10 to 12.
Output: Element list, divider, register with Level 2 lines, divider, gaps.
Args: `concise`: per contract Levels, Concise: register with Level 2 lines, gap-count line.

## Process
1. Bind: Per `GR-NN`, Level 1 order and spelling, each line from its Target sibling; stale age from NFR, else the Risk fallback; nothing held = `Unknown`, never invented (Rule 10).
2. Defaults: Spec silent = contract default, tagged Inferred: `partial` shows sourced elements, marks the rest; `empty` says so and stops, per case; user text `Unknown` once for all rows; `Memory` = `Unknown`, see Data Access revocation.
3. Render: Level 1 register unchanged, eight lines per row in Scope order, `Memory:`, `Notes:`. One rule-check line: rows, stale ages, `I-NN`, filters before read, `cites` bound, `EV-NN` and `RK-NN` per row (Rule 11).
4. Gaps: One question per `Unknown`, per `cites` field with `?`, per `unrendered` screen, per row missing `EV-NN` or `RK-NN` (Rule 11), per scope entry with no filter (Rule 12). Order: freshness, retrieval, citation, refusal, memory.

Requirements:
1. Level 2 creates no IDs; cites Level 1 `GR-NN` and sibling IDs as they stand; missing = `Unknown`.
2. Register lines ≤ 110 characters: terminal pane. Prefix `GR-NN label:` ≤ 20, content ≤ 90, two `│` fields per line; over = second line, same prefix, never a dropped field.
3. ≤ 8 rows, ≤ 8 lines each; `empty` may take a second line; more rows = split by performer.
4. `cites` fields: Data Model attributes in Level 1 spelling, `value`, `as_of`, or `?` (Rule 10); `filter` names `DA-NN` and `I-NN`; `empty` covers all three cases.
5. Elements prose ≤ 12 lines; the register is the artifact; a markdown table that duplicates it is not allowed.
