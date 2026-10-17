---
name: purpose-level1
description: "Trigger: /spec:purpose-level1 or purpose, problem, success measures request. Outcome: ASCII purpose card and measure rows, one row per outcome, from spec and C4, inline."
---
# Purpose-Level1
Goal: Render spec as Purpose Level 1 (Planguage, Gilb 2005: a measure is a Scale with a Past and a Goal level), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. C4 Level 1 output supplies the people and the system purpose line; absent = derive roles from spec, tag Inferred, one gap. Requirements Level 1, when present, supplies the `FR-NN` or `NF-NN` serving each measure (Rule 5).
Scope: Four elements. Problem: who has what problem and today's workaround, in the spec's words; workaround absent = `Unknown`. Users: one row per benefiting role, matching C4 people; agents are not users. Success Measures: `PU-NN` per outcome the spec names or implies, Scale with unit, Past as baseline, Goal as target; silent = `Unknown`. Non-Goals: exclusions made on purpose, one line each; a real non-goal could have been a goal (Ubl 2020).
Cut: Evidence, cost, job stories, formulas, sources, leading versus lagging, dates, reasons, bets, constraints: Level 2. Shall sentences: Requirements. Quality numbers: NFR. System purpose line: the C4 box, checked here, never restated.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Purpose`, Cross-Section Rule 5.
Output: Element list, divider, card and measure rows, divider, gaps.

## Process
1. Extract: Problem, workaround, roles, exclusions from spec; tag each Verified or Inferred; a role in C4 or here but not both = one gap, never a folded cell.
2. Measures: One `PU-NN` per outcome the user gains, outcome before output (Impact Mapping, Adzic 2012); a proxy the system can game, such as drafts accepted or reports sent, is a gap, not a row; Past and Goal from spec or `Unknown`.
3. Render: Per legend: card with Problem, Users, Non-goal lines, then measure rows; one rule-check line: measures, with baseline, with target, served by `FR-NN` or `NF-NN` (Rule 5, `n/a` without a Requirements output), users matching C4, purpose line consistent.
4. Gaps: One question per `Unknown`, per unserved measure, per role mismatch, per exclusion the spec leaves open. Order: baseline and target, workaround, non-goals, users.

Requirements:
1. Every measure has one `PU-NN` row with Scale, Past, Goal; each cell a number with unit or `Unknown`, never blank, never invented; Level 1 creates `PU-NN` from `PU-01` upward and no other IDs.
2. Register lines ≤ 110 characters: terminal pane. Columns: `#` 6, Measure ≤ 56, Baseline ≤ 14, Target ≤ 14; card lines the same width; over = shorten wording, never drop a row.
3. ≤ 6 measures, ≤ 5 users, ≤ 5 non-goals: a napkin, not a scorecard; more = keep the outcomes the spec states, move the rest to a gap.
4. Elements prose ≤ 12 lines; the card and rows are the artifact, a markdown table that duplicates them is not allowed.
5. Measures are outcomes a user gains, never features or activity counts of the system: a feature count rewards building, not solving.
