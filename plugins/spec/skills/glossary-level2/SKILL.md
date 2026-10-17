---
name: glossary-level2
description: "Trigger: /spec:glossary-level2 or term binding, synonyms, UI label, code name request. Outcome: ASCII Level 2 detail lines under each Level 1 glossary row, from Level 1 and Data Model, inline."
---
# Glossary-Level2
Goal: Render spec as Glossary Level 2 (Ubiquitous Language bound to the model, Evans 2003), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Glossary Level 1 output required: rows, IDs, winners, owners; absent = stop and name it. Data Model Level 2 supplies the entity or attribute a term binds to and its spelling; C4 Level 2 the container or person; Product Surface Level 1 the screen; a sibling absent = derive from spec, tag Inferred, one gap.
Scope: Five refinements per Level 1 row. Binding: `◆ Entity` or `◆ Entity.attr` from Data Model Level 2, `C4: name` for a container or person, else `none`. Synonyms: allowed, then banned, Level 1 losers first (ISO 1087 admitted and deprecated terms). Examples: one instance, one near miss, spec words. Usage: UI label with screen number; code name in Data Model spelling, else snake_case tagged Inferred (ISO/IEC 11179-5 naming). Change: Level 1 owner and what moves: entity, box, or label. Borrowed: client or regulator terms with source, once per block; none = say so.
Cut: New terms, definitions, winners: a miss is a Level 1 gap. Attribute types, keys, states: Data Model. Screen content: Product Surface. Sweep: Level 1, carried.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Glossary`, Cross-Section Rule 15.
Output: Element list, divider, register with detail lines, divider, gaps.

## Process
1. Bind: Per term, the one thing it names in Data Model Level 2, else C4 Level 2, else `none`; `none` on a box term is a missing entity (Rule 15), one gap.
2. Refine: Per Scope; Level 1 sense `Unknown` = example `Unknown`, never a guess; owner `Unknown` = change line names what moves, the owner stays a Level 1 gap.
3. Render: Per legend, Level 1 row unchanged, then four detail lines: binding and synonyms, examples, UI and code, change; sweep and `Borrowed:` after the rows; one rule-check line: terms, Data Model, C4, none, UI labels, code names, owners.
4. Gaps: One question per `none` on a box term, per UI label clashing with a container name, per Inferred code name where a schema exists, per borrowed term with no source; that order.

Requirements:
1. Level 2 creates no IDs; cites Level 1 `GL-NN` on every detail line, so a line reads alone.
2. Register lines ≤ 110 characters, no continuation lines: terminal pane; over = drop a synonym or shorten the example, never wrap: a wrapped line has no ID.
3. ≤ 36 terms, ≤ 5 lines each, Level 1 row included; a term with nothing to bind still gets four lines with `none`: a blank reads as forgotten.
4. Bindings and code names match the Data Model Level 2 or C4 Level 2 spelling exactly, so a grep finds both.
5. Every Level 1 banned word sits in its winner's banned list, so Rule 15 has one place to look.
6. Elements prose ≤ 12 lines; the register is the artifact, and a markdown table that duplicates it is not allowed.
