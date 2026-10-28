---
name: evaluation-level1
description: "Trigger: /spec:evaluation-level1 or evaluation, evals, quality bar request. Outcome: ASCII evaluation register, one row per AI output and dimension, from spec and Autonomy, inline."
---
# Evaluation-Level1
Goal: Render spec as Evaluation Level 1 (Your AI Product Needs Evals, Husain 2024: a row is a test the domain owner can fail), ASCII, inline.
Target: Spec the user points at. Autonomy Level 1 output supplies the AI actions at T1 or above and the checkpoint person; absent = derive from spec, tag Inferred, one gap. Grounding Level 1 supplies the `GR-NN` each groundedness row tests; Acceptance Level 1 the deterministic `FR-NN` already carded; NFR Level 1 any stated bar.
Scope: Evaluated Outputs: `EV-NN` per AI output at T1 or above and per dimension, `AU-NN` in Output. Dimensions: accuracy, groundedness, format, refusal, one row each. Method: Husain's three levels, the cheapest check that catches the failure; LLM judge only for free text with no reference. Bar and Signer: threshold to launch from spec or NFR, else `Unknown`; groundedness and format 100 %, Inferred; Zero the count that must be 0; one named signer, since a bar with no signer gates nothing (Rule 8).
Cut: Dataset, slices, rubric, judge calibration, cadence, promotion, gate, drift, model change, budget: Level 2. Deterministic tests: Acceptance.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Evaluation`, Cross-Section Rules 6, 8, 11.
Output: Element list, divider, register, divider, gaps.
Args: `concise`: per contract Levels, Concise: register, gap-count line.

## Process
1. Outputs: One per Autonomy action at T1 or above whose result someone acts on; store, serve, rule-compare, and send actions go on one coverage line with their `AC-NN` (Rule 6).
2. Dimensions and method: Accuracy always; groundedness when a `GR-NN` exists (Rule 11); format when the spec fixes one; refusal when the Grounding empty result applies. Same method for the same dimension across outputs, so bars compare.
3. Render: Per legend, Signer line, coverage line, rule-check line: rows, outputs, T1+ covered, `GR-NN` tested, bars set, signer.
4. Gaps: One question per `Unknown` bar, naming the number wanted; signer `Unknown`; per T1+ action with no row; per `FR-NN` tested by neither `AC` nor `EV`. Order: bar, signer, coverage, method.

Requirements:
1. Every T1+ AI action has ≥ 1 `EV-NN` row or one coverage entry with its `AC-NN` (Rule 8); every `GR-NN` has one groundedness row (Rule 11); Level 1 creates `EV-NN` only.
2. Register lines ≤ 110 characters: terminal pane. Columns: ID 6, Output ≤ 26, Dimension ≤ 12, Method ≤ 24, Bar ≤ 8, Zero ≤ 24; over = shorten the phrase, never drop or wrap a row.
3. ≤ 12 rows, one output and one dimension per row, a refusal row never shared, since the bar per output is what promotes it; more = split by performer.
4. Every row has exactly one method and a bar or `Unknown`; a bar never defaults: an invented threshold goes unquestioned.
5. Elements prose ≤ 12 lines; the register is the artifact; a markdown table that duplicates it is not allowed.
6. One Signer line with one name or `Unknown`; a role list is not a signer.
