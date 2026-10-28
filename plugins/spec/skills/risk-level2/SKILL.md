---
name: risk-level2
description: "Trigger: /spec:risk-level2 or root cause, blast radius, risk priority number, detection, fallback, residual risk request. Outcome: ASCII Level 2 detail lines under each Level 1 risk row, inline."
---
# Risk-Level2
Goal: Render spec as Risks and Failure Modes Level 2 (Failure Modes and Effects Analysis, IEC 60812:2018), Level 1 register plus detail lines, ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Risks Level 1 output is required, it fixes rows and guards; absent = run `risk-level1` first. Autonomy Level 1 supplies the reversing checkpoint and the tier drop; Evaluation, NFR, Data Access, Acceptance Level 2 the live signals; Product Surface Level 1 the fallback screen; absent = derive from spec, tag Inferred, one gap.
Scope: Six refinements, IDs kept. Cause: one mechanism per row, plus OWASP LLM Top 10 category, `none` where no model is involved. Blast: what one firing touches, reversible by which checkpoint. RPN: severity × occurrence × detection, 1 to 3 each. Detect: signal by ID, who is paged. Fallback: recovery barrier the user sees, the `AU-NN` tier drop. Residual: what no barrier removes per high row, its acceptor by name.
Cut: New rows, modes, guards, severities: a miss = Level 1 gap. Caps: NFR. Tests: Evaluation.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Risks and Failure Modes`, Cross-Section Rules 9, 11, 13.
Output: Element list, divider, register with detail lines, divider, gaps.
Args: `concise`: per contract Levels, Concise: register with detail lines, gap-count line.

## Process
1. Cause and Blast: One mechanism per row and its OWASP category; a rule or feed fault = `none`. Reversible while a T2 checkpoint or re-run stands before the person hurt; not once they acted or data left scope.
2. RPN and Detect: Severity from Level 1; occurrence 3 often, 2 sometimes, 1 rare; detection 1 code, 2 person, 3 no signal; spec silent = Inferred, said once on the Notes line. Detect is a sibling row that fires in production; a pre-release slice is `Unknown`. Pager from spec, else `Unknown`.
3. Fallback and Residual: What the user sees on the named screen, and `AU-NN T3 → T2`, the next tier that keeps a person in the loop. Residual per high row; acceptor from spec, else `Unknown`.
4. Render and Gaps: Level 1 rows unchanged; under each, cause, blast, RPN, detect, fallback lines; then Residual, Owner, Coverage, Notes, rule-check line: rows, OWASP mapped, detect Unknown, tier drops, acceptors. One question per detect, pager (grouped by section), or acceptor `Unknown`, per Inferred factor on a high row. Order: detection, pager, acceptor, RPN.

Requirements:
1. Every Level 1 `RK-NN` gets exactly five detail lines; `Unknown` where silent, never invented; creates no IDs; cites Level 1 `RK-NN`.
2. Register lines ≤ 110 characters: terminal pane; prefix `RK-NN label:` 14, text ≤ 96; over = shorten, never wrap.
3. ≤ 12 rows, 5 detail lines each, ≤ 1 residual line per high row; more = split by performer.
4. Elements prose ≤ 12 lines; the register is the artifact, and a markdown table that duplicates it is not allowed.
5. Every RPN shows its factors as `3 × 2 × 2 = 12`, so a rank is auditable; every fallback names the `AU-NN` and both tiers.
6. Every high row has one residual line, acceptor by name or `Unknown`: an unaccepted residual is a Decision Log row (Rule 14).
