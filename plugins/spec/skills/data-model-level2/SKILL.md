---
name: data-model-level2
description: "Trigger: /spec:data-model-level2 or logical data model request. Outcome: ASCII logical data model, detailed design, from spec, inline."
---
# Data-Model-Level2
Goal: Render spec as Data Model Level 2, Logical (ANSI/SPARC three-schema architecture; UML 2.5 multiplicity, per legend), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Level 1 output, if present, is additional input.
Scope: Six element types. Entities: those passing the Level 1 identity test (Chen ER); attributes with type and required flag; identifiers (PK, natural key, external reference); states and transitions where a lifecycle exists. Relationships: cardinality both ends with optionality; lineage from every derived item to its source. Rules: constraints written testably (uniqueness, range, cross-field); propagation on correction or deletion (cascade, soft delete, re-index); who may write is the Access pointer, when something happens is Activity material. Source of Truth: history fields (timestamps, version, audit, retention); access as one pointer line to the Data Access section. Volumes: rough counts and growth. Notes: assumptions, out of scope.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Data Model`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.
Args: `concise`: per contract Levels, Concise: diagram, gap-count line.

## Process
1. Extract: From spec, list Entities + attributes + identifiers + states, Relationships + cardinality, Lineage, Constraints, Propagation, History, Access pointer, Volumes, Notes. Tag each Verified, Inferred, or Unknown.
2. Cut: Drop people, screens, UI words, process steps: Activity, Product Surface, and Data Access material. Drop storage, index, DDL, wire names: Level 3.
3. Type: Every attribute carries a type; `Unknown` if spec silent. Mark required `*`, identifiers `PK` or `FK`.
4. Count: Write cardinality at both ends of every relationship.
5. Render: ASCII per legend. Entity cards with attribute compartment. Transitions under any card with a state. Rules R1.. and propagation lines below diagram.
6. Gaps: List Unknown. One question each.

Requirements:
1. Every FK names an entity on the diagram. Every derived entity carries a lineage FK to its source.
2. No storage, index, DDL, or wire names. Level 3 material.
3. Fits one screen. More = group entities into subject areas (ERD subject area; DDD aggregate): one map, one node per area, arrows between areas, then one view per area; each entity in one area only.
