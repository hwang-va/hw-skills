---
name: agents-level2
description: "Trigger: /spec:agents-level2 or agent tools, memory, cost cap, handoff, orchestration pattern request. Outcome: ASCII Level 2 line block under each Level 1 agent row, from Level 1, Interfaces, and the capabilities reference, inline."
---
# Agents-Level2
Goal: Render Agents Level 2, detail lines per agent (Azure Architecture Center "AI Agent Orchestration Patterns" for the handoff vocabulary; CSA "Agentic Universe" for persistence and tool scope), ASCII, inline.
Target: Agents Level 1 output user points at; infer from full chat context. Interfaces Level 1 supplies `I-NN` tool rows; Data Model Level 2 supplies entities for inputs, outputs, and memory; Autonomy Level 1 supplies tiers and kill switch; Knowledge Level 1 supplies corpora an agent loads; Product Surface Level 1 supplies delivery screens; `${CLAUDE_PLUGIN_ROOT}/references/agent-capabilities.md` supplies capability names; missing sibling = `Unknown`, never invented.
Scope: Six line kinds per `AG-NN`. Inputs and outputs: `◆ Entity` each side. Trigger detail: schedule expression, watched event or entity, debounce, what stops a background agent. Model and cost cap: model class, dollars per run and per day; tokens only when the spec gives no price. Tools and memory: `I-NN` pointers; what persists across runs, its entity, retention. Handoff and failure: arrows to other agents with the pattern word, once per product: single, sequential, concurrent, group chat, handoff, magentic; what the user sees when the agent fails or is late, who is paged. Capability: names from the reference only, `Unknown` plus one gap when the reference lacks it. Cut: prompts, system text, evaluation bars, risk rows.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Agents`, `### Level 2`; if absent, standard box-drawing glyphs.
Output: Element list, divider, Level 1 register verbatim with Level 2 lines under each row, divider, gaps.

## Process
1. Extract: Per `AG-NN`, list the six line kinds from spec and siblings. Tag each Verified, Inferred, or Unknown.
2. Bind: Every input, output, and memory to a Data Model entity; every tool to an `I-NN`; every capability to a reference row. No match = `Unknown`, one gap line naming the section that owns the fix.
3. Pattern: One line for the product's orchestration pattern, then per-agent arrows; a product with one agent is `single` and gets no arrows.
4. Render: ASCII per legend. Level 1 rows unchanged, six lines under each, `AG-NN` prefix on every line, ≤ 110 characters.
5. Gaps: List Unknown. One question each.

Requirements:
1. Creates no `AG-NN`, `I-NN`, `AU-NN`, or entity; a missing one is a gap for its section, so Level 1 stays the only register.
2. Every agent has a cost cap and a stop: a background or scheduled agent with no cap and no kill switch is a gap, because unbounded spend is the common agent failure.
3. Capability lines cite reference names only, never a vendor or model name; the reference is not edited during a run.
4. Fits one screen: ≤ 10 agents, six lines each, ≤ 110 characters per line.
