---
name: acceptance-level1
description: "Trigger: /spec:acceptance-level1 or acceptance criteria, Given/When/Then request. Outcome: ASCII acceptance cards, one per deterministic requirement, from spec and Functional Requirements, inline."
---
# Acceptance-Level1
Goal: Render spec as Acceptance Criteria Level 1 (Behaviour-Driven Development, North 2006), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Functional Requirements Level 1 output supplies the `FR-NN` rows, their `PU-NN` and Detail element; absent = derive from spec, tag Inferred, one gap. Autonomy Level 1 marks the rows a model performs; Data Model Level 1 the entities and states a Then may name; Product Surface Level 1 the screens; Evaluation Level 1 the `EV-NN` an AI row lands in.
Scope: Four elements. Behaviors: `AC-NN` per deterministic `FR-NN`; deterministic = a specified test oracle, same input, same result; a model's output = Evaluation, no card. Scenario: one Given, one When, one Then, happy path, spec words. Pass Signal: one observable a tester points at: an entity in a state, a screen value, a message received. Trace: `FR-NN · PU-NN` in the header.
Cut: Edge cases, negatives, example values, thresholds, test type and path, bindings, load tests: Level 2. AI output: Evaluation.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Acceptance Criteria`, Cross-Section Rules 6 to 7.
Output: Element list, divider, cards, divider, gaps.

## Process
1. Partition: Each `FR-NN` is deterministic or AI output, never both; the Autonomy performer at T1 or above decides doubtful rows. A row a person or an agent may both perform keeps the person's half as the card and names the split in gaps.
2. Scenario: One card per deterministic row. Given: the state before. When: the row's EARS event. Then: one observable; a second observable, an example value, or a negative case is Level 2.
3. Render: Cards per legend, header `AC-NN title ── FR-NN · PU-NN`, in `FR` order; one kind line listing every `FR` number under `AC` or `EV`; one rule-check line: deterministic FR, cards, AI FR, AI FR with an `EV-NN`, FR in both kinds.
4. Gaps: One question per Then resting on an `Unknown`, per row split across kinds, per AI row with no `EV-NN`, per deterministic row with no card. Order: Then, split, EV.

Requirements:
1. Every deterministic `FR-NN` has exactly one `AC-NN` card and every AI `FR-NN` has none (Rule 6); Level 1 creates `AC-NN` and no other ID.
2. Card lines ≤ 110 characters: terminal pane. Box 108 wide, label 7, text ≤ 98, title ≤ 30; over = shorten the title, never drop a card.
3. ≤ 12 cards, ≤ 5 lines each: header, Given, When, Then, footer; more = merge rows sharing a Then and say which.
4. Then in Data Model, Product Surface, or channel words; `correctly` is nothing a tester can point at.
5. Elements prose ≤ 12 lines; the cards are the artifact, a markdown table that repeats them is not allowed.
6. Kind line, rule-check line, and gaps agree on every count; a count a gap contradicts is a failed check.
