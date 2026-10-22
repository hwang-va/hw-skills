---
name: agents-level1
description: "Trigger: /spec:agents-level1 or agent inventory, which agents, background agent, scheduled agent request. Outcome: ASCII agent register, one row per AI worker with trigger, surface, tier pointer, from spec, Activity, and Autonomy, inline."
---
# Agents-Level1
Goal: Render spec as Agents Level 1, Agent Register (Anthropic "Building effective agents" for what counts as an agent; CSA "Agentic Universe" April 2026 for the row attributes), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Activity Level 1 output, if present, supplies the actions agents perform; Autonomy Level 1 output, if present, supplies `AU-NN` pointers; Product Surface Level 1, if present, supplies surface names; else infer, tag Inferred.
Scope: Four element types only. Agents: every AI worker named, `AG-NN`, one-line job stating the outcome it owns; a worker is any model call with its own job and trigger, so a hidden suggester counts. Trigger: one word from the vocabulary: user turn, after run, background, scheduled, review. Surface: a Product Surface screen or surface type, or hidden, plus who receives the output. Tier: pointer to the `AU-NN` rows the agent performs and the highest tier among them; `Unknown` when Autonomy has not run. Cut: tools, memory, model, cost, handoffs, orchestration pattern, failure text. Level 2 material.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Agents`; if absent, standard box-drawing glyphs.
Output: Element list, divider, register, divider, gaps.

## Process
1. Extract: From spec and siblings, list every AI worker: each place a model runs with its own job and trigger. Tag each Verified, Inferred, or Unknown.
2. Split or merge: One agent per trigger and job; the same job on two triggers is two rows, two jobs behind one chat is two rows, because trigger and surface are what the engineer builds.
3. Render: ASCII per legend. Register first, one row per agent, `AG-NN` in Catalog order: user turn, after run, background, scheduled, review. Rule check line: count, rows with an `AU` pointer, hidden rows.
4. Gaps: List Unknown. One question each.

Requirements:
1. Every row has a trigger word from the vocabulary and a surface or `hidden`; "various agents" or "the AI" is not a row.
2. Creates no `AU-NN`: an agent whose actions Autonomy lacks gets tier `Unknown` and one gap line, so Autonomy stays the only owner of tiers.
3. No agent the spec never implies: a worker exists only when the spec names a job that runs on its own trigger; a pattern from the anchors is not evidence.
4. Fits one screen: ≤ 10 agents, rows ≤ 110 characters. More = the product has sub-products; split by surface.
