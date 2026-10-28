---
name: grounding-level1
description: "Trigger: /spec:grounding-level1 or grounding, sources, citations request. Outcome: ASCII grounding register, one row per AI output, from spec and Data Model, inline."
---
# Grounding-Level1
Goal: Render spec as Grounding Level 1 (Attributable to Identified Sources, Rashkin et al. 2021: an element is fact only where "according to source P" holds), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Autonomy Level 1 output supplies the AI outputs at T1 or above; absent = derive from spec, tag Inferred, one gap. Data Model Level 1 and 2 supply entities and attributes; C4 Level 2 the container of record; Data Access Level 1 the agent's rights; Glossary Level 1 the words.
Scope: Four elements. Sources: `GR-NN` per AI output a person or system acts on; source P is `Entity.attr │ container of record`. Scope: least privilege; closed list of entities, documents, tools, folders, ending `nothing else`. Evidence: reference plus as-of attribute each element carries back. Empty Result: abstention as a designed output; spec silent = contract default, say so and stop, tagged Inferred; user text from spec, else one `Unknown` gap for all rows.
Cut: Freshness, retrieval method, entitlement at retrieval, input as data, citation schema, pointer or passage, partial result, refusal text per case, memory: Level 2. Who may read: Data Access. How good: Evaluation.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Grounding`, Cross-Section Rules 10 to 12.
Output: Element list, divider, register, divider, gaps.
Args: `concise`: per contract Levels, Concise: register, gap-count line.

## Process
1. Outputs: One row per Autonomy action whose result someone acts on, labelled by the Data Model entity it produces (Rule 15); store, index, rule-compare, and send actions go on one coverage line with the reason.
2. Sources: `Entity.attr` the Data Model holds, `│`, the C4 container of record, or the likely one tagged Inferred when C4 lists none; attribute absent = `Unknown`, never invented (Rule 10).
3. Render: Per legend, one rule-check line: outputs, sourced, evidence, empty text, T1+ covered.
4. Gaps: One question per `Unknown`, per source outside the Data Model, per T1+ action with no row and no reason, per scope entry with no Data Access row (Rule 12), per spec phrase that may be the abstention in disguise. Order: source, evidence, empty result, scope.

Requirements:
1. Every acted-on AI output has one `GR-NN` row with a Data Model source or `Unknown` (Rule 10); Level 1 creates `GR-NN` only.
2. Register lines ≤ 110 characters: terminal pane. Columns: Output ≤ 24, Source ≤ 42, Evidence ≤ 22, Empty ≤ 8; over = shorten entity names or move an attribute to a gap, never drop a row.
3. ≤ 10 rows, ≤ 3 source lines per row; more sources = one gap; more rows = split by performer.
4. Elements prose ≤ 12 lines; the register is the artifact.
5. Scope line closed with `nothing else`; tools present even when `Unknown`.
