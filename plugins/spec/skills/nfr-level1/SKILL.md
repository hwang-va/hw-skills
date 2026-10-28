---
name: nfr-level1
description: "Trigger: /spec:nfr-level1 or non-functional requirements, quality targets, or SLO request. Outcome: ASCII quality register, one NF-NN row per quality, from spec, C4, and Autonomy, inline."
---
# Nfr-Level1
Goal: Render spec as Non-Functional Requirements Level 1 (Planguage, Gilb 2005: a quality exists only with a Scale, Meter, and Goal level), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. C4 Level 2 supplies the container per quality; Interfaces Level 1 the `I-NN` a measure reads at; Purpose Level 1 the `PU-NN` a row serves; Autonomy Level 1 the AI actions at T1 or above. Sibling absent = derive from spec, tag Inferred, one gap.
Scope: Four elements. Quality: `NF-NN`, one Scale per row, an ISO 25010 word (performance, reliability, security, maintainability) or an AI word (cost per run, token budget, model latency, data residency, audit). Target: the Goal level, one number with unit and direction; a percentile carries its window. Measure: the Meter, the reading and the `I-NN` or C4 container it reads at. Owner: the Stakeholder, one role.
Cut: Component scope, load, ceiling, measuring tool, breach action, trade-offs: Level 2. Outcomes: Purpose. Behavior: Functional Requirements.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Non-Functional Requirements`, Cross-Section Rules 5 and 6.
Output: Element list, divider, register, divider, gaps.
Args: `concise`: per contract Levels, Concise: register, gap-count line.

## Process
1. Qualities: One candidate per number or quality word in spec, per external feed (freshness), per user-facing `I-NN` (latency), per data store (security, residency), per AI action at T1 or above (cost, model latency, audit); merge same-Scale candidates.
2. Targets: Lift number, unit, owner from spec; a word instead of a number = `Unknown` with the word quoted, never a supplied number, since a guessed target binds nobody; a contract rule may supply one, tagged Inferred.
3. Render: Per legend, one rule-check line: rows, with number, with measure, with owner, AI rows, `PU-NN` served (Rule 5).
4. Gaps: One question per `Unknown` cell, naming the number or role; per `PU-NN` no row serves; per T1+ action missing a cost, latency, or audit row. Order: target, owner, measure, coverage.

Requirements:
1. Every row has a number with unit or `Unknown` with the spec's word quoted; a bare adjective is not a target (Rule 6). Level 1 creates `NF-NN` and only `NF-NN`, from `NF-01`.
2. Register lines ≤ 110 characters: terminal pane. Columns: ID 6, Quality ≤ 24, Target ≤ 30, Measure ≤ 32, Owner ≤ 12; over = move detail to a gap, never drop a row.
3. ≤ 12 rows, 1 line each; more = keep rows that serve a `PU-NN` or gate an Autonomy tier, the rest in one gap.
4. Every measure names a reading and a place (`I-NN` or C4 container); Inferred allowed, blank not, because a target with no Meter cannot fail.
5. Every T1+ AI action has a cost, a model-latency, and an audit row, or one gap names the missing one.
6. Elements prose ≤ 12 lines; the register is the artifact and a markdown table that duplicates it is not allowed.
