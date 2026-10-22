---
name: interface-level1
description: "Trigger: /spec:interface-level1 or interface catalog, integration list, exchange register, or agent tool inventory. Outcome: ASCII interface register, one row per exchange, risk line under agent-consumer rows, inline."
---
# Interface-Level1
Goal: Render spec as Interfaces, Level 1, scope and behavior (Interface Control Document lineage, INCOSE Handbook; C4 relationships, Brown; tool risk as in Autonomy risk profiles), one row per exchange, ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. C4 Level 2 output, if present, fixes the boxes and arrows a row sits on; Autonomy Level 1 the action that calls a tool; Data Access Level 1 whose rights an agent carries; Knowledge Level 1 the corpora whose agent-path column names a search tool row; Knowledge Level 2 shape hosted-sandbox implies one sync exchange, object store to per-user file system and back, as a file row.
Scope: Four fields per exchange, IDs `I-NN`, stable, ordered by provider. Parties: provider and consumer as C4 boxes or persons; the consumer is the party that starts the call or receives the event. Exchange: name, kind (API, event, file, tool), one-line purpose. In and out: main input and main result, in business terms. Owner and risk: who owns the contract, existing, changed, or new; when the consumer is an AI agent, a risk line: read or write │ reversible or not │ financial impact or none, and the Autonomy minimum it implies. A tool that writes and is not reversible, or has financial impact, makes every action that calls it T2 at minimum (Rule 13).
Cut: Protocol, endpoint, schema, payload examples, auth mechanism, error codes, limits, versioning, retries: Level 2. Person-to-screen use: Product Surface. Store internals: Data Model.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Interfaces`, Cross-Section Rule 13; if absent, standard box-drawing glyphs, one register row per exchange, a risk line under each agent-consumer row.
Output: Element list, divider, interface register, divider, gaps.

## Process
1. Enumerate: Walk every C4 arrow and every spec sentence where something crosses between two boxes or between a box and an external system. One row per exchange; a two-way arrow with different payloads splits in two. Person-to-screen arrows are cut.
2. Parties: Provider is the box that serves; consumer the box or person that calls or receives. Name them as C4 boxes; externals by their C4 name.
3. Exchange: Kind from spec words: API when one box asks another, event when one pushes and does not wait, file when a drop or export, tool when an AI agent calls it. Kind absent in spec = `Unknown`, tagged.
4. In and out: What goes in and what comes back, as business content, not fields.
5. Owner and risk: Owner from spec; absent = `Unknown`. Existing, changed, or new from spec; a box the spec introduces = new. For every row whose consumer is an AI agent, a risk line: read or write, reversible or not (name the undo), financial impact or none, and the tier minimum it implies; then the `AU-NN` that calls it and its launch tier, and a flag where the tool minimum exceeds the tier.
6. Render: Register, then risk lines under their rows, then a Tools line: every agent-consumer row by ID against the agent's Autonomy actions. One rule-check line: rows, kinds Unknown, owners Unknown, agent tools, T2-minimum tools, tier conflicts.
7. Gaps: Kind `Unknown`; owner `Unknown`; a tool an agent may call that no row holds (Grounding scope says tools `Unknown`); a tier conflict. One question each. Order: kind, owner, tools, tier.

Requirements:
1. Every exchange gets one row with all four fields; `Unknown` where spec is silent, never blank, never invented. IDs `I-NN`, never renumbered.
2. Every row whose consumer is an AI agent has one risk line with read or write, undo, financial impact, and a tier minimum; every T2-minimum tool names the `AU-NN` that calls it.
3. Provider and consumer names match C4 Level 2 boxes or externals where that output exists.
4. Fits one screen: ≤ 20 rows, lines ≤ 110 characters. More = split by provider class: sources, platform, delivery.
