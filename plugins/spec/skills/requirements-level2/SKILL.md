---
name: requirements-level2
description: "Trigger: /spec:requirements-level2 or requirement precondition, rationale, implementing elements, test link, or release request. Outcome: ASCII detail lines under each Level 1 requirement row, from spec and siblings, inline."
---
# Requirements-Level2
Goal: Render spec as Functional Requirements Level 2 (ISO/IEC/IEEE 29148 requirement attributes: condition, rationale, verification, release), Level 1 rows plus detail lines, ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Requirements Level 1 output is required: it fixes rows and `FR-NN`; absent = stop and ask. Acceptance Level 1 supplies `AC-NN` and the deterministic partition; Evaluation Level 1 `EV-NN`; Activity, Product Surface, Autonomy, Grounding, Interfaces, C4 Level 2, Data Model Level 2, Data Access, NFR the implementing elements; Purpose Level 1 non-goals; Glossary and Decision Log the open rules. Each absent = say so once, cite nothing from it.
Scope: Six refinements, IDs kept. Precondition: the state or rule the sentence rests on, one clause; unvalued = its `GL-NN` or `DEC-NN`. Rationale: why, one line, the `PU-NN` or spec words. Implementing Elements: every element that plays a part, Level 1 element first. Test Link: `AC-NN` if deterministic, `EV-NN` if AI output, exactly one kind (Rule 6). Release: from spec or chat; silent = `Unknown`. Rejected: one line per ask a Purpose non-goal rules out, reason, no ID.
Cut: New rows, sentences, sources, priorities: a miss is a Level 1 gap. Given, When, Then: Acceptance. Evaluation methods, quality targets, risks: own sections.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Functional Requirements`, Cross-Section Rules 5 to 7.
Output: Element list, divider, rows with detail lines, divider, gaps.

## Process
1. Bind: Per row, the precondition (entity exists, right held, threshold set, tier in force; unvalued = its open ID, never a guess), the rationale (spec silent = Inferred), and every implementing element from the outputs present.
2. Test: Deterministic row = its `AC-NN`; AI output row = its `EV-NN` set, per the Acceptance partition; both claimed = partition's kind, one gap; neither = one gap (Rule 6).
3. Render: Level 1 rows unchanged; under each `pre: … │ test: … │ rel: …`, `impl: …`, `why: …`; Rejected lines, patterns line, rule-check line: rows, with pre, AC rows, EV rows, one kind of total, rel `Unknown`, rejected.
4. Gaps: One question per precondition on an open ID, row with two kinds or none, Inferred rationale, release `Unknown` (one for all rows), element the spec implies but no output holds. Order as listed.

Requirements:
1. Level 2 creates no IDs; cites Level 1 `FR-NN` and sibling IDs only; a rejected ask carries its words and the non-goal, never an `R-NN`.
2. Register lines ≤ 110 characters: terminal pane. `pre` ≤ 60 characters, `test` ≤ 3 IDs, `impl` ≤ 6 elements on one line; over = rest to a gap, never a wrapped line.
3. ≤ 12 rows; detail ≤ 3 lines each under the Level 1 lines; ≤ 3 Rejected lines, more asks = one gap.
4. Every row has one `pre`, one `impl`, one `why`; spec silent = `Unknown`, never blank or invented.
5. Every row links exactly one test kind, matching the Acceptance partition (Rule 6).
6. Elements prose ≤ 12 lines; the register is the artifact, and a markdown table that duplicates it is not allowed.
