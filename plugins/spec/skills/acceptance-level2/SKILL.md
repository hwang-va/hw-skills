---
name: acceptance-level2
description: "Trigger: /spec:acceptance-level2 or edge case, example data, or test binding request. Outcome: ASCII Level 2 lines inside each Level 1 acceptance card, from spec and Level 1, inline."
---
# Acceptance-Level2
Goal: Render spec as Acceptance Criteria Level 2 (Specification by Example, Adzic 2011), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Acceptance Level 1 output supplies the cards, required; absent = run it first. Activity Level 1 supplies the decision branches; Data Model Level 2 the attributes; Interfaces Level 1 the `I-NN`; NFR Level 1 the targets with a rate. A sibling absent = derive from spec, tag Inferred, one gap.
Scope: Six elements. Edge: one case per card, a partition or a boundary value (ISO/IEC/IEEE 29119-4), arrow to the result. Data: one key example, column headers `│` values, spec words. Threshold: the number in the Data expected column, else `Unknown` plus its `GL-NN` or `DEC-NN`. Test: manual or automated and the path. Binds: `I-NN ▶ ◆ Entity.attr`. Load: one line per `NF-NN` with a rate. Out of scope: by ID, one line.
Cut: New cards, Given, When, or Then lines, or IDs: a miss is a Level 1 gap.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Acceptance Criteria`, Cross-Section Rules 6 to 7.
Output: Element list, divider, cards, divider, gaps.
Args: `concise`: per contract Levels, Concise: cards, gap-count line.

## Process
1. Extract: Per card, the branch or boundary its Then hides; each Activity branch to one Edge line. Example row in the tester's columns; a value the spec lacks = placeholder, Inferred.
2. Bind: Test: store or rule = automated, screen = manual unless the spec names a tool; path from spec, else `Unknown`. Binds: the `I-NN` the When crosses, the attribute the Then reads. Load: rate and what is counted.
3. Render: Level 1 lines unchanged; Edge, Data, Test, Binds inside each box; Load, Out-of-scope, kind lines after. One rule-check line: cards, thresholds `Unknown`, manual, automated, `I-NN` bound, attributes bound, branches covered, load.
4. Gaps: One question per threshold `Unknown`, per Then with no attribute, per branch with no Edge, per Inferred value, one for the path, in that order.

Requirements:
1. Every `AC-NN` gets Edge, Data, Test, Binds lines, `Unknown` where silent; Level 2 creates no IDs; cites Level 1 `AC-NN`.
2. Card lines ≤ 110 characters: terminal pane. Box 108 wide, label 7, text ≤ 98; Data ≤ 4 columns; over = move a column to a gap.
3. ≤ 12 cards, ≤ 9 lines each; one case per Edge line; each Activity branch on exactly one Edge line or a gap.
4. Binds: one `I-NN` from Interfaces, ≤ 2 attributes from Data Model Level 2; absent there = `Unknown`, never invented: a test binds to what exists.
5. Test type follows the Then; all automated while a Then reads a screen is a failed check. Load lines only for an `NF-NN` with a rate; none = say so once, a load test is its rate.
6. Elements prose ≤ 12 lines; the cards are the artifact, a markdown table that repeats them is not allowed.
