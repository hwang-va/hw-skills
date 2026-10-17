---
name: c4-level2
description: "Trigger: /spec:c4-level2 or C4 container request. Outcome: ASCII C4 Container diagram from spec, inline."
---
# C4-Level2
Goal: Render spec as C4 Level 2, Container (Simon Brown, c4model.com), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Level 1 output, if present, is additional input.
Scope: Six element types. Roles: each person type, what they may do, channel used (browser, CLI, Teams). Containers: deployable units inside the system (web app, API, database, agent runtime), each with technology; Components only where spec names internals. External Systems: each with integration type (REST, MCP, webhook, file), owner, and read / write. Relationships: every arrow with protocol and direction. Boundaries: what runs where. Notes: assumptions.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## C4`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.

## Process
1. Extract: From spec, list Roles + channel, Containers + technology, External Systems + integration type + owner, Relationships + protocol + direction, Boundaries, Notes. Tag each Verified, Inferred, or Unknown.
2. Frame: Dashed system boundary. Containers inside as `[Name │ Technology]`. People and externals outside.
3. Render: ASCII per legend. Every arrow labelled `what / protocol`. Direction explicit; read vs write stated.
4. Gaps: List Unknown. One question each.

Requirements:
1. Every container carries a technology label; `Unknown` if spec silent.
2. Fits one screen: ≤ 10 containers. More = split by boundary.
