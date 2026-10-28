---
name: memory-level2
description: "Trigger: /spec:memory-level2 or memory consolidation, salience, decay, resume recipe, forget cascade request. Outcome: ASCII Level 2 line block under each Level 1 memory row, from Level 1, Data Model, and the capabilities reference, inline."
---
# Memory-Level2
Goal: Render Memory Level 2, detail lines per memory row (Generative Agents, Park et al. 2023, for salience by recency, importance, relevance; Ebbinghaus forgetting curve for decay; GDPR Article 17 for the forget cascade; 2026 consolidation features, Claude Code Auto Dream, ChatGPT Dreaming, Letta sleep-time compute, for the tidy-up run), ASCII, inline.
Target: Memory Level 1 output user points at; infer from full chat context. Data Model Level 2 supplies the memory entity and attributes; Agents Level 1 supplies the writer and its trigger; Autonomy Level 1 supplies the `AU-NN` for the consolidation run; Data Access Level 1 supplies who may read, pin, delete; Product Surface Level 1 supplies the screen where a user sees the diff; `${CLAUDE_PLUGIN_ROOT}/references/agent-capabilities.md` supplies capability names; missing sibling = `Unknown`, never invented.
Scope: Six line kinds per `ME-NN`. Entity: `◆ Entity.attributes` with the link to the run or session. Write rule: when extracted, by the agent in the run or by consolidation after it; never written: secrets, Data Access barred fields, other users' data. Consolidation: trigger (after N sessions or hours, or on demand), actions (merge duplicates, drop contradicted facts, absolute dates, cap the index), reviewer, whether the user sees the diff, pointer to its `AU-NN`. Resume recipe: one ceiling per agent stated on its first row; order pinned, then score, then on demand. Salience: three weights as numbers for recency, importance, relevance, `Unknown` when the spec gives none; who may pin. Decay and forget: half-life or schedule, what revives, delete removes derived memories, audit of reads and deletes. Capability: names from the reference only. Cut: storage engine, embedding model, prompt text, vendor names.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Memory`, `### Level 2`; if absent, standard box-drawing glyphs.
Output: Element list, divider, Level 1 register verbatim with Level 2 lines under each row, divider, gaps.
Args: `concise`: per contract Levels, Concise: Level 1 register verbatim with Level 2 lines under each row, gap-count line.

## Process
1. Extract: Per `ME-NN`, list the six line kinds from spec and siblings. Tag each Verified, Inferred, or Unknown.
2. Bind: Entity to Data Model Level 2; consolidation to an `AU-NN`; pin and delete rights to Data Access; capability to a reference row. No match = `Unknown`, one gap line naming the owning section.
3. Budget: One ceiling per agent; rows of that agent share it; a pinned set larger than the ceiling is a gap.
4. Render: ASCII per legend. Level 1 rows unchanged, six lines under each, `ME-NN` prefix on every line, ≤ 110 characters.
5. Gaps: List Unknown. One question each: weights not given, consolidation with no reviewer, a shared row with no delete owner, a forever row with no pin owner.

Requirements:
1. Creates no `ME-NN`, `AG-NN`, `AU-NN`, or entity; a missing one is a gap for its section.
2. Every row that is not pinned has a decay or age limit, and every row has a forget line; a memory that never fades and cannot be deleted is a gap, because that is the retention risk the section exists to surface.
3. Weights are numbers or `Unknown`, never words; consolidation lines point to an `AU-NN` or state its absence as a gap.
4. Fits one screen: ≤ 12 rows, six lines each, ≤ 110 characters per line. More = split by agent.
