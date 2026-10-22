---
name: c4-component-level2
description: "Trigger: /spec:c4-component-level2 or component, module, folder structure, codebase layout request. Outcome: ASCII C4 Component diagram for one container plus folder tree, from spec and C4 Level 2, inline."
---
# C4-Component-Level2
Goal: Render one container as C4 Component diagram (Simon Brown, c4model.com; Level 3 in C4 numbering), ASCII, inline, each component one folder (arc42 §5 whitebox).
Target: Descriptive spec user points at; infer from full chat context. C4 Level 2 output, if present, is container source; Data Model Level 2 and Interfaces Level 2, if present, supply entities and contracts; else infer, tag Inferred. Container: the one user names; none named = the container holding the most logic, say which.
Scope: Container in Focus: Level 2 name, technology. Callers: people, containers, external systems at the edge. Components: name, one-line responsibility, technology; kind one of entry point, domain logic, data access, integration adapter, shared utility. Ownership: which component owns each Data Model entity and serves each Interfaces contract. Relationships: what is called, call style (function, interface, event, query); outward arrows with protocol. Dependency Rules: forbidden directions (Clean Architecture dependency rule). Folder Tree: one top-level folder per component, same names. Notes: assumptions. Cut: classes, functions, file names below folder; where it runs (Deployment view).
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## C4`, `### Level 2 Component`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, folder tree, divider, gaps.

## Process
1. Extract: From spec and siblings, list each Scope element for the one container. Tag each Verified, Inferred, or Unknown.
2. Assign: Every Data Model entity and Interfaces contract to exactly one component; unassigned = new component, tag Inferred, or Unknown.
3. Render: ASCII per legend. Callers at the edge, components inside the double border, arrows labelled `what / call style`; outward arrows `what / protocol`.
4. Rules: One line per forbidden direction, with the reason, so a reader can check any arrow against it.
5. Tree: Folder per component, kind in a trailing comment; package-by-feature, never by layer, because a layer folder hides which component owns a file.
6. Gaps: List Unknown. One question each.

Requirements:
1. One container per run; every Data Model Level 2 entity and Interfaces Level 2 contract appears in exactly one component or in gaps.
2. Fits one screen: ≤ 10 components, ≤ 110 columns. More = split the container or merge shared utilities.
