---
name: data-model-level1
description: "Trigger: /spec:data-model-level1 or conceptual data model request. Outcome: ASCII conceptual data model from spec, inline."
---
# Data-Model-Level1
Goal: Render spec as Data Model Level 1, Conceptual (ANSI/SPARC three-schema architecture), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. C4 Level 1 output, if present, is additional input.
Scope: Four element types only. Entities: things the system stores and tells apart by identity (Chen ER), one box per singular noun, one-line definition; a noun with no identity or no records of its own is an attribute, not an entity; look-alikes disambiguated (event as occurrence vs event as record). Relationships: which entity connects to which, static association verb on the line (has, belongs to, applies to, records), one or many in words; a verb needing when or then is a process step, not a relationship. Rules: invariants on stored data, true at every moment, one sentence each; a rule with when, then, or who does it is Activity material. Source of Truth: where each entity is born, which system or team owns it.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Data Model`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.

## Process
1. Extract: From spec, list Entities + definition, Relationships + verb, Rules, Source of Truth. Tag each Verified (stated) or Inferred (implied).
2. Cut: Drop attributes, types, identifiers, multiplicity notation, states, constraints, propagation, history, access: Level 2 material. Drop people, screens, UI words, process steps, event verbs: Activity, Product Surface, and Data Access material.
3. Render: ASCII per legend. One box per entity with definition. Verb on every line, both ends named. Rules numbered R1.. below diagram. Source of Truth line per entity.
4. Gaps: List elements spec omits as Unknown. One question each.

Requirements:
1. Singular nouns only. No entity the spec never implies. No orphan entity.
2. Fits one screen. More = group entities into subject areas (ERD subject area; DDD aggregate): one map, one node per area, arrows between areas, then one view per area; each entity in one area only.
