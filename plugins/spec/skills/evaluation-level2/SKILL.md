---
name: evaluation-level2
description: "Trigger: /spec:evaluation-level2 or eval dataset, slices, rubric, judge, promotion, drift request. Outcome: ASCII Level 2 detail lines under each Level 1 evaluation output, from Level 1 and Autonomy, inline."
---
# Evaluation-Level2
Goal: Render spec as Evaluation Level 2 (The ML Test Score, Breck et al. 2017), Level 1 register plus detail lines, ASCII, inline.
Target: Evaluation Level 1 output, required; absent = run `evaluation-level1` first. Autonomy Level 1 supplies tiers per `AU-NN` and the checkpoint person who labels; Data Model Level 2 the enum values slices key on; NFR Level 2 the cost cap; Risks Level 1 the adversarial slice. Sibling absent = derive from spec, Inferred, one gap.
Scope: A.1 Dataset: source, size, labeller, location; the domain person labels, not engineering (Husain). A.2 Slices: enum value, sector, edge, adversarial; the bar holds per slice. B.1 Rubric per human or judge row: anchors two graders agree on (EvalGen). C.1 Judge: model, one question, human-agreement bar (Zheng), only where Level 1 names one; else say so. C.2 Cadence: pre-release, prompt or model change, every PR, online share. D.1 Promotion per `AU-NN`: launch ━━▶ target when bar over window; demotion back. D.2 Gate: score below which no ship; kill path. E Drift: online sample; model change: pin model id, re-run before the flag returns. F Budget: eval cost, latency.
Cut: New rows, dimensions, bars, IDs: a miss is a Level 1 gap. Guards: Risks.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Evaluation`, Cross-Section Rules 8, 11, 14.
Output: Element list, divider, register with detail lines, divider, gaps.
Args: `concise`: per contract Levels, Concise: register with detail lines, gap-count line.

## Process
1. Bind: Per Level 1 output, set, slices (enum values, an edge, an adversarial), rubric, tier line; a value the spec omits = `Unknown`, never blank or invented.
2. Register lines: Once each: Judge, Cadence, Gate, Drift, Model change, Budget; gate = every code row 100 % and every human bar met.
3. Render: Level 1 lines unchanged; detail lines keyed `EV-NN` under each output; rule-check line: outputs, sets, sized sets, slices, rubrics, tier lines, gate.
4. Gaps: One question per `Unknown`, naming the number wanted; per labeller not the domain person; per slice enum with no value list; bar waiting on the model = spike (Rule 14). Order: tier bars, dataset, sample, budget.

Requirements:
1. Creates no IDs; cites Level 1 `EV-NN`; every detail line starts with the `EV-NN` it refines.
2. Register lines ≤ 110 characters: terminal pane; over = move a slice or anchor to a gap, never wrap: a wrapped register no longer reads by row.
3. ≤ 6 outputs, ≤ 5 lines each: set, slices, rubric, tier; more outputs = split by performer.
4. Labeller is the checkpoint person or signer; every slice is an enum value, a sector, or a named edge: a slice with no key cannot be sampled.
5. Exactly one Judge, Cadence, Gate, Drift, Model change, and Budget line; a tier line names `AU-NN`, both tiers, bar and window, or `Unknown`.
6. Elements prose ≤ 12 lines; the register is the artifact; a markdown table that duplicates it is not allowed.
