---
name: decision-log-level1
description: "Trigger: /spec:decision-log-level1 or decision log, open questions request; runs last. Outcome: ASCII decision register, one row per Unknown question, from spec and every sibling gap list, inline."
---
# Decision-Log-Level1
Goal: Render the open questions as Decision Log Level 1 (Architecture Decision Records, Nygard 2011), ASCII, inline. Runs last.
Target: Descriptive spec user points at; infer from full chat context. Sibling `output-*.md` gap lists supply the `Unknown` items; spec and chat the answers, owners, dates; Evaluation Level 1 the set a spike runs against. No sibling = derive questions from the spec's silences, tag Inferred, one gap.
Scope: Four elements. Decision: `DEC-NN`, one question per line, primary source (row ID or output code) and item count; every `Unknown` item under exactly one row (Rule 14). Status: open, spike, proposed, decided, superseded; a spike (Extreme Programming, Beck 1999) waits on the model, closes by an Evaluation run, not a meeting. Answer: the chosen option, one line; none = `·`. Owner and Date: one approver (DACI), dated; for a spike, runner and by-when; absent = `Unknown`.
Cut: Context, options, consequences by ID, supersession, revisit trigger, notes: Level 2. Inferred-only items: their own gap lists.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Decision Log`, Cross-Section Rule 14.
Output: Element list, divider, register, divider, gaps.
Args: `concise`: per contract Levels, Concise: register, gap-count line.

## Process
1. Harvest: Under every sibling `## Gaps`, each numbered item carrying `Unknown` is one item keyed output code and number; count them.
2. Cluster: One row per distinct question; items asking one fact share a row; no item in two rows, none in none. `spike` only where an Evaluation run answers it; `proposed` or `decided` only where spec or chat holds the answer.
3. Render: Per legend, one line per row; one item-map line per row; one spike line naming each spike's set; one rule-check line: Unknown items, assigned, rows, open, spike, decided.
4. Gaps: One question per `Unknown` owner, merged by owner family so one person answers once; one per spike without runner or set; one per unplaced item; one per pair of rows that collapse on one answer. Order: owner, spike, unplaced, merge.

Requirements:
1. Every `Unknown` item sits under exactly one `DEC-NN` row; assigned count equals harvested count (Rule 14). Level 1 creates `DEC-NN` only.
2. Register lines ≤ 110 characters: terminal pane. Columns: ID 6, Question with source ≤ 58, Status ≤ 10, Answer ≤ 16, Owner ≤ 14; over = shorten the question, never drop the source or the row.
3. ≤ 60 rows: one item, one home (Rule 14); over = merge questions that share an answer, never drop an item.
4. Every row carries a primary source and item count; a row resting on an Inferred item alone is not a row.
5. Every spike names the Evaluation set that closes it and its runner, or `Unknown` with one gap; a spike with no set is an open row.
6. Elements prose ≤ 12 lines; the register is the artifact, and a markdown table that repeats it is not allowed.
