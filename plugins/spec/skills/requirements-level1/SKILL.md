---
name: requirements-level1
description: "Trigger: /spec:requirements-level1 or functional requirements, shall statements request. Outcome: ASCII requirement register, one EARS row per requirement, from spec and diagrams, inline."
---
# Requirements-Level1
Goal: Render spec as Functional Requirements Level 1 (EARS, Mavin et al. 2009: one sentence, one pattern, system as subject), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Purpose Level 1 output supplies `PU-NN`; Activity Level 1 actions and exceptions; Product Surface Level 1 screens; Autonomy Level 1 actions; Interfaces Level 1 rows; Grounding Level 1 rows and empty results; Glossary Level 1 the words. Each absent = derive from spec, tag Inferred, one gap.
Scope: Four elements. Requirement: `FR-NN`, one shall sentence in one EARS pattern, singular, system as subject; points to a diagram element, never repeats its steps. Source: upward trace, the `PU-NN` served, else the spec words quoted. Detail: downward trace, the one element holding the how: `ACT [Action]`, `PS n Screen`, `AU-NN`, `I-NN`, `GR-NN`, named as its sibling prints it. Priority: MoSCoW, must, should, could.
Cut: Preconditions, rationale, implementing elements, test link, release, rejected asks: Level 2. Numeric targets: NFR. Given, When, Then: Acceptance.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Functional Requirements`, Cross-Section Rules 5 to 7.
Output: Element list, divider, register, divider, gaps.

## Process
1. Harvest: One candidate per Activity action, Autonomy action, Product Surface screen, Interfaces row, and spec sentence asking for behavior (need, please, will, shall); one capability in several siblings = one row. Unwanted: one If … then row per Grounding empty result and Activity exception, Detail pointing at that row, tagged Inferred; none anywhere = one gap.
2. Bind: Source = the `PU-NN` served; none = `spec` in the column, quoted words on a `src:` line under the row; neither = gap. Detail = the one element holding the how (Rule 7); none = gap. Priority: must = a `PU-NN` fails without it; should = a measure improves; could = spec hint only; silent = Inferred.
3. Render: Per legend; patterns line; one rule-check line: rows, `PU-NN` served of total (Rule 5), Activity actions traced of total (Rule 7), rows with an element, If … then rows.
4. Gaps: One question per `PU-NN` with no row, Activity action with no row, row with no source, Inferred unwanted row, Inferred priority. Order: measure, action, source, unwanted, priority.

Requirements:
1. Level 1 creates `FR-NN` only, numbered in register order; every other ID cited exists in a sibling output, never invented.
2. Register lines ≤ 110 characters: terminal pane. Columns: ID 5, Requirement ≤ 46, Source ≤ 7, Detail ≤ 34, Pri ≤ 6; over = wrap the sentence, never shorten an element name (Rule 15).
3. ≤ 12 rows, ≤ 4 lines each including the `src:` line; more = merge same-capability rows, then drop could.
4. One element per Detail cell; more hides which diagram holds the how, and the rest is Level 2 material.
5. Elements prose ≤ 12 lines; the register is the artifact, and a markdown table that duplicates it is not allowed.
6. Every `PU-NN` is served by one row or more, or is one gap; every Activity action traces to a row, or is one gap.
