---
name: risk-level1
description: "Trigger: /spec:risk-level1 or risks, failure modes, what could go wrong request. Outcome: ASCII risk register, one row per failure mode, from spec and Autonomy, inline."
---
# Risk-Level1
Goal: Render spec as Risks and Failure Modes Level 1 (Failure Modes and Effects Analysis, IEC 60812:2018), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Autonomy Level 1 supplies the T3 and T4 actions; absent = derive from spec, tag Inferred, one gap. Grounding Level 1 supplies the `GR-NN` rows; Evaluation, NFR, Data Access, Acceptance Level 1 the guards by ID; C4 Level 1 the person hurt.
Scope: Four elements. Failure Modes: `RK-NN` per catalogue mode (hallucination, stale data, prompt injection, wrong tool call, silent failure, cost runaway) per `AU-NN` at T3 or T4 and per `GR-NN`. Effect: the FMEA end effect on a C4 person. Severity: high, medium, low. Guard: a bow-tie barrier, prevention or detection, a sibling Level 1 row by ID, plus owner.
Cut: Cause, OWASP category, blast radius, RPN, detection, fallback, residual: Level 2. Deterministic defects: Acceptance.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Risks and Failure Modes`, Cross-Section Rules 9, 11, 13.
Output: Element list, divider, register, divider, gaps.

## Process
1. Modes: Walk the catalogue against every `AU-NN` at T3 or T4 and every `GR-NN`. One row per mode that applies; a mode that cannot apply gets a reason on the Coverage line (no tool granted = no wrong tool call).
2. Effect and Severity: The person hurt and what they lose, never "system fails". High = a person outside the team acts on it, or data leaves scope; medium = the team catches it, or a cost or delay; low = cosmetic. Stakes silent = tag `Inf`.
3. Guard and Render: The sibling Level 1 row that prevents or detects the mode; a Level 2 slot or a verb alone is `Unknown`. Owner from spec, else `Unknown`. Render per legend, Owner, Coverage, rule-check line: rows, high, guard Unknown, `AU` and `GR` covered.
4. Gaps: One question per guard `Unknown`, per owner `Unknown` grouped by section, per uncovered `AU-NN` or `GR-NN` with no reason, per `Inf` severity on a high row. Order: guard, owner, coverage, severity.

Requirements:
1. Every `AU-NN` at T3 or T4 and every `GR-NN` has one `RK-NN` row with a guard or `Unknown` (Rules 9, 11); Level 1 creates `RK-NN` only.
2. Register lines ≤ 110 characters: terminal pane. Columns: ID 5, Mode ≤ 28, Effect ≤ 30, Sev ≤ 4, Guard ≤ 28, Tag ≤ 8; over = shorten the mode name, never drop a row.
3. ≤ 12 rows, ≤ 3 guards per row; more = a gap, or a split by performer.
4. Elements prose ≤ 12 lines; the register is the artifact, and a markdown table that duplicates it is not allowed.
5. Guards are sibling Level 1 rows by ID, never a verb ("monitor"): a barrier that does not exist yet is a gap.
6. Owner per row or `Unknown`; missing owners are one gap per section, so each reaches the Decision Log (Rule 14).
