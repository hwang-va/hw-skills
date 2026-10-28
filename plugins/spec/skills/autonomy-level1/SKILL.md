---
name: autonomy-level1
description: "Trigger: /spec:autonomy-level1 or autonomy, decision rights, oversight request. Outcome: ASCII autonomy map, one row per action, from spec and Activity, inline."
---
# Autonomy-Level1
Goal: Render spec as Autonomy Level 1 (Types and Levels of Human Interaction with Automation, Parasuraman, Sheridan, Wickens 2000: one tier per function, never per agent), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Activity Level 1 output supplies the actions (Rule 4); absent = derive from spec, tag Inferred, one gap. Interfaces Level 1 supplies tool ratings (Rule 13); Glossary Level 1 the words.
Scope: Four elements. Actions: `AU-NN` per decision or side effect, AI or human, verb phrase plus the agent, system, or role performing it. Tier: launch ● and target ○ on T0 Human Only, T1 AI Assists, T2 AI Proposes, T3 AI Acts Human Monitors, T4 AI Acts Alone. Checkpoints: role approving before (T2) or reviewing after (T3); T0 and T1 name the human performer; T4 `audit only`. Escalation and Override: hand-back trigger and stop path, one line under the map, `Unknown` where silent.
Cut: Risk profile, volume, conditional tiers, promotion criteria, deadlines, evidence pack, kill switch, owner, audit entity: Level 2. Bar per tier move: Evaluation. Guards: Risks. Approver screen: Product Surface.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Autonomy`, Cross-Section Rules 4, 8, 9, 13.
Output: Element list, divider, map, divider, gaps.
Args: `concise`: per contract Levels, Concise: map, gap-count line.

## Process
1. Actions: One row per Activity action that decides or has a side effect, in process order, Activity spelling (Rule 4); a spec verb Activity lacks is one gap, never a new action.
2. Tiers: Launch from spec words; target from stated intent, else equals launch, tagged Inferred. "Analyst or AI" names no decider: launch T2, target `Unknown`, one gap. Irreversible, externally visible, or high-risk-tool action (Rule 13) holds T2 minimum at launch; spec implying lower = keep it, one gap.
3. Render: Per legend, columns T0 to T4, checkpoint right, escalation line under the map. One rule-check line: actions, T2 minimums held, T2 and T3 checkpoints named, T1+ actions needing `EV-NN` (Rule 8), T3 and T4 needing `RK-NN` (Rule 9).
4. Gaps: One question per `Unknown`, per nameless T2 or T3 checkpoint, per action outside Activity, per undercut T2 minimum, per missing stop path. Order: who decides, before or after, who stops it.

Requirements:
1. Autonomy attaches to an action, never to an agent: the only unit a checkpoint binds to. Level 1 creates `AU-NN` only, in process order.
2. Register lines ≤ 110 characters: terminal pane. Columns: Action ≤ 32, Performer ≤ 15, tier grid 20, Checkpoint ≤ 22; over = shorten the verb phrase, never drop a row.
3. ≤ 12 actions; more = split by performer, since a stakeholder reads the map in a minute.
4. Every row carries all five fields; `Unknown` where silent, never blank, so a gap has a cell to point at.
5. Elements prose ≤ 12 lines; the map is the artifact, and a markdown table that duplicates it or restates the tier scale is not allowed.
