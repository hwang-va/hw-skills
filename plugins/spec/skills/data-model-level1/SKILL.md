---
name: data-model-level1
description: "Trigger: /spec:data-model-level1 or conceptual data model request. Outcome: ASCII conceptual data model from spec, inline."
---
# Data-Model-Level1
Goal: Render spec as Data Model Level 1, Conceptual (ANSI/SPARC three-schema architecture), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. C4 Level 1 output, if present, is additional input.
Scope: Four element types only. Entities: things the system stores or references by identity (Chen ER), one box per singular noun, one-line definition; look-alikes disambiguated (event as occurrence vs event as record). Relationships: which entity connects to which, static association verb on the line (has, belongs to, applies to, records), one or many in words; a verb needing when or then is a process step, not a relationship. Rules: invariants on stored data, true at every moment, one sentence each; a rule with when, then, or who does it is Activity material. Source of Truth: where each entity is born, which system or team owns it.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Data Model`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.
Args: `concise`: per contract Levels, Concise: diagram, gap-count line.

## Process
1. Harvest: Candidates: every noun the spec gives its own ID, type block, or `X[]` list; every Glossary row; every stored thing an Acceptance Criterion reads or writes. One verdict each: box; fold, `attribute of <entity>`; reference box, owned by another system this model targets, selects, or sets values on; cut, naming the owning section. None dropped.
2. Extract: From the boxes, Entities + definition, Relationships + verb, Rules, Source of Truth. Tag each Verified (stated) or Inferred (implied).
3. Cut: Folds and cuts leave the diagram: attributes, identifiers, states, constraints, history, access are Level 2; people, screens, process steps belong to Data Access, Product Surface, Activity.
4. Render: ASCII per legend. One box per entity with definition. Verb on every line, both ends named. Rules numbered R1.. below diagram. Source of Truth line per entity.
5. Gaps: List elements spec omits as Unknown. One question each.

Requirements:
1. Singular nouns only. No orphan entity. Harvest closed: one `Harvest:` line per verdict kind in Elements names every candidate; a box that is not a candidate, or a candidate with no verdict, fails.
2. Fits one screen. More = group entities into subject areas (ERD subject area; DDD aggregate): one map, one node per area, arrows between areas, then one view per area; each entity in one area only.
