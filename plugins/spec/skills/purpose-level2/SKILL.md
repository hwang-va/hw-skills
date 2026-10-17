---
name: purpose-level2
description: "Trigger: /spec:purpose-level2 or metric formula, job stories, bets, or why a model request. Outcome: ASCII Level 2 lines under each Level 1 measure, plus story, bet, and constraint lines, inline."
---
# Purpose-Level2
Goal: Render spec as Purpose Level 2, detailed design (Planguage, Gilb 2005: a Meter and a dated Goal per measure), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Purpose Level 1 output fixes the card, users, `PU-NN`, non-goals; absent = run `purpose-level1` first. C4 Level 2 supplies the container a Meter reads; Data Model Level 2 the attributes a formula uses; Autonomy Level 1 the AI actions the first bet must justify. Absent = derive from spec, tag Inferred, one gap.
Scope: Six refinements, IDs kept. Evidence: tickets, transcripts, counts. Cost: the problem's cost today, with unit. Job Stories: one per Level 1 role, when, I want, so I can (Klement 2013). Measure Detail: per `PU-NN`, Meter as formula and data source, leading or lagging, target date. Reasons: one per non-goal. Bets: assumptions the build rests on, least evidence first (Assumptions Mapping, Bland and Osterwalder 2019); AI feature = first bet is why a model, what a form, rule, or template would miss. Constraints: budget, deadline, regulation.
Cut: New measures, roles, or non-goals: a Level 1 gap. Shall sentences: Requirements. Failure modes: Risks.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Purpose`, Cross-Section Rule 5.
Output: Element list, divider, register, divider, gaps.

## Process
1. Evidence and Cost: Counts, hours, money from spec; absent = `Unknown`, never an estimate: a guess reads as fact downstream.
2. Bind: Formula as ratio, median, or sum of Data Model attributes; source as the C4 container or log holding them, none = `Unknown`; leading predicts the outcome, lagging is it; date from spec or `Unknown`.
3. Render: Level 1 card and rows unchanged; per measure a formula line and a kind line; then Story lines, Bet lines, one Constraint line; one rule-check line: measures, with formula, with source, with date, bets, why-a-model tag.
4. Gaps: One question per `Unknown`, per Inferred bet, per formula whose attribute the Data Model lacks. Order: why a model, formula, date, cost, constraints, stories, reasons.

Requirements:
1. Every `PU-NN` gets one formula line and one kind line; `Unknown` where silent, never blank, never invented; Level 2 creates no IDs; cites Level 1 `PU-NN`.
2. Register lines ≤ 110 characters: terminal pane; a long story or bet is shortened, never wrapped.
3. ≤ 6 measures, ≤ 5 stories, ≤ 5 bets, ≤ 3 constraint values; more bets = keep the least evidenced, rest to a gap.
4. AI feature = first bet is why a model; Inferred or `Unknown` there is the first gap and the stop signal: a weak answer is a reason not to build.
5. Elements prose ≤ 12 lines; the register is the artifact, a markdown table that duplicates it is not allowed.
6. Stories use Level 1 roles only, one each, so-I-can tied to a `PU-NN`; agents have no story.
