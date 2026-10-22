---
name: memory-level1
description: "Trigger: /spec:memory-level1 or agent memory, session resume, what the agent remembers, forget request. Outcome: ASCII memory register, one row per memory kind per agent with scope, persist, resume, retention, from spec and Agents, inline."
---
# Memory-Level1
Goal: Render spec as Memory Level 1, Memory Register (CoALA, Sumers et al. 2023, for the kinds working, episodic, semantic, procedural; GDPR right to erasure for the forget right), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Agents Level 1 output, if present, supplies the `AG-NN` writers; Knowledge Level 1 supplies `KN-NN` for semantic rows; Data Access Level 1 supplies who may read and delete; Product Surface Level 1 supplies where a user sees or edits memory; else infer, tag Inferred.
Scope: Four element types only. Memories: `ME-NN`, one row per kind per agent, what it holds in one line; a semantic row is a `KN-NN` pointer, never a copy; a working row only when the spec says sessions resume. Scope and Owner: per user, per agent, or shared; the person who owns it and may see it. Persist and Resume: persist one of full transcript, summary, facts, nothing; resume one of full, summary, last N turns, by relevance. Retention: one of forever, age limit, decay, pinned; forget right: what a user may delete, default delete removes derived memories too. Cut: entity, write rule, consolidation, resume order and ceiling, salience weights, decay function, audit. Level 2 material.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Memory`; if absent, standard box-drawing glyphs.
Output: Element list, divider, register, divider, gaps.

## Process
1. Extract: Per `AG-NN`, ask what it keeps after a run ends and what it reads when it starts; each answer is a row of one kind. Tag each Verified, Inferred, or Unknown.
2. Kind: Classify by what the row holds: this session is working; what the agent did or decided is episodic; what it knows is semantic, pointed at Knowledge; how it works is procedural. A row that fits two kinds is two rows.
3. Render: ASCII per legend. One register, rows grouped by agent, kinds in CoALA order. Rule check line: rows, pinned or forever rows, forget right stated.
4. Gaps: List Unknown. One question each: an agent with no row, a shared row with no owner, a resume with no persist, a retention with no forget right.

Requirements:
1. Every agent that runs more than once has at least one row; an agent with none is a gap, because an agent that remembers nothing is a design choice to state, not an omission.
2. Every row fills scope, persist, resume, and retention; `Unknown` allowed, blank not, so a missing decision reads as a gap.
3. Creates no `AG-NN`, `KN-NN`, or Data Model entity; a missing one is a gap for its section.
4. Fits one screen: ≤ 12 rows, ≤ 110 characters per row. More = split by agent.
