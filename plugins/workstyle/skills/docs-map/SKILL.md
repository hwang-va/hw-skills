---
name: docs-map
description: Turn a large documentation site into one interactive three-tab HTML mental-model map (Components = nouns, Drive = verbs with a chooser, Q&A = the user's own questions), hub + regions + clickable chips with a detail drawer and doc links. Use when the user gives a docs URL and says "map this", "mental model", "I can't read all these docs", "/docs-map", or asks for a one-page diagram to internalize a tool and still look up details.
---

# /docs-map : three-tab mental-model map from a docs site

## Purpose (restate to the user in one line before starting)

The user has limited reading bandwidth. The docs are the gold standard but too big to hold in the head.
The deliverable is one HTML file with three tabs that each answer a different reader question:

| Tab | Reader question | Shape |
| - | - | - |
| **Components** | What are the pieces and how do they fit? | Nouns. Hub = the core mechanism (a loop or lifecycle). Regions = what it sees, what it does, safety, extend, scale, where it runs, session, config, admin. |
| **Drive** | How do I run it, alone or at scale, and from where? | Verbs. Hub = a ladder of autonomy (lowest rung first). A 3–4 question chooser on top that names the approach. Regions = delegate, dispatch, coordinate, script, connect, schedule, reach, guard. |
| **Q&A** | The user's own questions, answered short, with links. | Hub = the questions the user typed, answered fully, with honest gaps. Regions = situation groups (context, autonomy, many agents, routine, steering, safety, cost, where, building). |

Every tab shares one engine: an essence strip of up to 6 rule sentences, a hub, up to 9 regions, chips that open a drawer with definition, decision rule, facts and doc links, and a search box that dims non-matching chips.

## Inputs

- `url`: the docs entry page (overview / index). Ask only if missing.
- The user's own questions, if they gave any. They become the Q&A hub. If none were given, ask for two or three in one line; if the user declines, write the three most likely for a builder.
- Optional output path. Default `<tool>-map.html` in the current folder (short slug for `<tool>`).

## Procedure

### 1. Harvest (read, do not design yet)

1. Fetch the entry page. Find the full index: try `<docs root>/llms.txt`, a sitemap, or the sidebar.
2. Fetch 8–14 pages in parallel: **how it works**, **feature overview**, every **reference list** (commands, tools, events, settings, flags), the **glossary**, and every page about **running more than one instance** (subagents, teams, workflows, background sessions, scheduling, messaging, channels, remote access, programmatic use).
3. For each capability record: name, one-line definition, when to use it, 2–4 hard facts (limits, paths, precedence, defaults, exact commands), doc URL.
4. Reference pages hold the facts that make chips useful. The overview alone is never enough.

### 2. Tab 1, Components

1. Find the hub: the one mechanism everything attaches to (an agent loop, a request path, an object lifecycle). Draw it as 3 steps plus a loop note.
2. Group into 6–9 regions, each answering one question (see the table above). 3–8 chips per region; more → split, fewer → merge.
3. Essence strip: 6 cards, each a rule the reader keeps without the chips. Prefer contrasts and budgets.
4. Footer: one "symptom → add this" trigger line.

### 3. Tab 2, Drive

1. Hub: a ladder from the least to the most autonomous way of running the tool. Each rung: number, name, what it adds. Hub chips answer "who coordinates", "where results land", "what each rung costs".
2. Chooser: 3–4 questions whose answers decide the approach (who holds the plan, do workers talk, same files, unattended). `recommend(answers)` returns one bold approach plus how to start it plus extra advice per answer. Every recommendation must name a real command or setting.
3. Regions are verbs the user performs: delegate, dispatch, coordinate, script, connect, schedule, reach, guard. Each chip's `when` is the exact command or prompt that does it.
4. Essence: 6 rules about running agents (climb only when forced, who holds the plan, workers start empty, text in / summary out, isolate files, unattended = verify + allow + no prompts).
5. Footer: "symptom → verb" line.

### 4. Tab 3, Q&A

1. Hub: the user's own questions in their words. Answer each fully: a one-sentence answer, a "do this" line with the command, 4–7 bullet facts, and an honest caveat or gap. Link every mechanism to its doc page.
2. 6–9 situation groups with 4–6 questions each. Questions are phrased as a user would ask them ("Why did it forget what I said an hour ago?"), answers are one or two sentences plus a `when` line with the command. Bullets optional.
3. Essence: the five shortest answers plus one card named "Honest gaps" listing what the tool cannot do yet.
4. Footer: reading order.

### 5. Build from `template.html`

Copy the `template.html` that sits next to this SKILL.md. Replace the three tab objects (`MODEL`, `DRIVE`, `QA`), the header text, and the `D` doc-root constant. Keep the engine below the `ENGINE` comment untouched. Drop a tab only if the user asks for fewer.

Chip schema, one object per chip, same on every tab:

```js
{ n:"Name or question", one:"One-line definition or answer.", when:"Decision rule, or the command that invokes it.",
  b:["Hard fact 1","Hard fact 2"], l:[["Link label","relative/doc/path"]] }
```

Rules for chip content:
- `one` is a definition or a direct answer, under 25 words. No marketing.
- `when` is the decision rule or the exact command or prompt. On the Drive and Q&A tabs it is mandatory.
- `b` holds facts that change what the reader does: paths, precedence orders, limits, defaults, flags, env vars. 2–4 on Components and Drive; 0–7 on Q&A.
- `l` has at least one link. Paths are relative to `D`; full URLs are allowed.
- Exact names verbatim: commands, flags, file paths, event names, setting keys.
- No chip repeats another chip's content on the same tab; a Q&A answer may point to the Drive or Components chip where the mechanism lives.

### 6. Check once, open, report

- Parse-check the script: extract the `<script>` body to a temp file and run `node --check` on it.
- Open the file in a browser (`Start-Process <path>` on Windows). Confirm tabs switch, the chooser updates, the drawer opens, the filter dims chips.
- Report in two sentences: the path, and what each tab holds. Name the source and the read date in the page header.

## Design rules (keep the look consistent across maps)

- One file, no build step, no framework. Vanilla HTML, CSS and JS. Google Fonts allowed, nothing else external.
- Light and dark theme through CSS tokens on `:root`, dark under `prefers-color-scheme` and `[data-theme="dark"]`.
- Grid with named areas, hub in the center column; two columns under 860px, one under 520px.
- The hub is the only dark-filled card. Chips are pills; the active chip inverts; non-matching chips dim, never hide.
- Drawer slides from the right, `Esc` or ✕ closes it, width `min(440px, 100%)`.
- Tab ids are the URL hash (`#model`, `#drive`, `#qa`), so a tab can be linked.
- No emoji, no numbered sections unless the content is a real sequence, no hero.
- Phone width works: side gutter 16px, no horizontal scroll.

## Quality bar (done only when all hold)

- A reader who only reads the Components essence strip has a correct model of the tool.
- The Drive chooser gives a concrete, correct approach for every combination of answers.
- Every Q&A hub answer says what works today, how to start it, and what does not exist yet.
- Every chip drawer tells the reader when to use the thing and where to read more.
- Facts come from docs fetched in this session, with the read date in the header. Nothing from memory alone.
- The file opens from disk with no console errors.

## Exemplar

Reference density, built from a 230-page docs site: Components with 1 hub and 9 regions (about 45 chips), Drive with a 5-rung ladder, 4-question chooser and 8 verb regions (about 40 chips), Q&A with 3 user questions in the hub and 8 groups (about 40 questions). Match that density and tone.
