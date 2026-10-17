---
name: decision-log-level2
description: "Trigger: /spec:decision-log-level2 or decision context, options, consequences, revisit trigger request. Outcome: ASCII Level 2 detail lines under each Level 1 decision row, from spec and Decision Log Level 1, inline."
---
# Decision-Log-Level2
Goal: Render each decision as Decision Log Level 2 (Architecture Decision Records, Nygard 2011), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Decision Log Level 1 output supplies rows and `DEC-NN`, required; absent = run `decision-log-level1` first, one gap. Row sources supply context and consequence IDs; Evaluation Level 2 the bars a revisit reads; Autonomy Level 1 the tiers an answer moves.
Scope: Five elements, IDs kept. Context: spec sentence or silence, then what the outputs drew, one clause. Options: two to four choices the outputs imply (MADR, default first), bars between. Changes: rows and boxes that move with the answer, by ID. Supersedes: the row replaced or replacing; none = one line naming merge candidates. Revisit: the tripwire (Heath and Heath 2013) that reopens a row, a number where an `EV-NN` or `NF-NN` holds one; none = `Unknown`.
Cut: New rows or questions, answers the spec does not hold (a miss = Level 1 gap). `Unknown` items born after Level 1 ran: one counted gap, never new rows.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Decision Log`, Cross-Section Rule 14.
Output: Element list, divider, register with detail lines, divider, gaps.

## Process
1. Bind: Per row, context from its source items, spec first; options from the drawn default, the alternative a gap named, and do-nothing; no new design.
2. Trace: Changes = every ID and box in the row's sources the answer moves; a tier answer names `AU-NN`, a number answer the row holding it. Revisit = a spike's closing run; else a bar over a window or a cap breached.
3. Render: Per legend, the Level 1 row unchanged, then four lines `context:`, `options:`, `changes:`, `revisit:`; then Supersedes lines; one rule-check line: rows, context, options, changes, revisit, supersedes, unassigned.
4. Gaps: One question per `Unknown` revisit, merged by family; one per row whose options hold the answer (stale status); one per merge pair; one for all unassigned items. Order: revisit, stale, merge, re-run.

Requirements:
1. Creates no IDs; cites Level 1 `DEC-NN`. Exactly four detail lines per row; `Unknown` where nothing measurable exists, never blank or invented.
2. Register lines ≤ 110 characters: terminal pane. Prefix `DEC-NN context: ` 16, content ≤ 94; over = shorten a clause or move an option to a gap, never a continuation line.
3. ≤ 60 rows, ≤ 5 lines each (Level 1 row plus four); over = Level 1 splits first.
4. Every changes line names at least one row or box by ID; every options line holds two to four choices; no ID = moves nothing, merge candidate.
5. Exactly one Supersedes block; the unassigned count appears in the rule check and the gaps.
6. Elements prose ≤ 12 lines; the register is the artifact, and a markdown table that repeats it is not allowed.
