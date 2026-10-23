---
name: docs-map
description: Turn a large documentation site into one interactive single-page HTML mental-model map (hub + regions + clickable chips with detail drawer and doc links). Use when the user gives a docs URL and says "map this", "mental model", "I can't read all these docs", "/docs-map", or asks for a one-page diagram to internalize a tool and still look up details.
---

# /docs-map : one-page mental-model map from a docs site

## Purpose (restate this to the user in one line before starting)

The user has limited reading bandwidth. The docs are the gold standard but too big to hold in the head.
The deliverable is one HTML file that does two jobs at once:

1. **Internalize the core**: 5–7 sentences a human can memorize, plus one central diagram of the main mechanism.
2. **Refer to details**: every capability is a clickable chip that opens a drawer with rules, bullets and a link back to the exact doc page.

The map must work for any docs site, any tool, and must be reproducible by any model following this file.

## Inputs

- `url`: the docs entry page (overview / index). Ask for it only if missing.
- Optional: output path. Default `<tool>-map.html` in the current folder (replace `<tool>` with a short slug).

## Procedure

### 1. Harvest (read, do not design yet)

1. Fetch the entry page. Look for a full index: try `<docs root>/llms.txt`, a sitemap, or the sidebar links.
2. Fetch the 6–10 pages that explain **how it works**, **what it has** (feature overview), **reference lists** (commands, tools, events, settings), and the **glossary** if one exists. Fetch in parallel.
3. Record for each capability: name, one-line definition, when to use it, 2–4 hard facts (limits, paths, precedence, defaults), and the doc URL.
4. Do not stop at the overview. Reference pages hold the facts that make chips useful.

### 2. Find the hub

Ask: what is the one mechanism everything else attaches to? (For Claude Code it is the agentic loop: gather → act → verify → repeat.) Draw that in the center. If the docs have no single loop, use the main object lifecycle or the request path.

### 3. Group into 6–10 regions

Each region answers one human question. Good region questions, reuse when they fit:

| Region | Question it answers |
| - | - |
| Hub | What is the core mechanism? |
| What it sees | What knowledge or state loads in? |
| What it can do | What actions or tools exist? |
| Safety | What can be undone, what asks permission, what enforces? |
| Extend | How do I add knowledge, tools, automation? |
| Scale | How do I run more than one at once? |
| Where it runs | Surfaces, environments, integrations |
| Session / lifecycle | Resume, steer, inspect |
| Configuration | Where settings live, which value wins |
| Administration | Org policy, cost, security (skim region) |

Each region gets 3–8 chips. More than 8: split the region. Fewer than 3: merge it.

### 4. Write the essence strip (6 cards max)

Each card: a 2–4 word label plus one sentence that states a rule, not a feature. Test: would the sentence still be useful if the reader forgot every chip? Prefer contrasts ("instructions are requests, hooks are guarantees") and budgets ("everything costs context").

### 5. Write a trigger line

One footer line of "symptom → add this" pairs. This is the fastest decision aid on the page.

### 6. Build the page from `template.html`

Copy the `template.html` that sits next to this SKILL.md, replace the `REGIONS` array, the essence cards, the header text, the footer trigger line, and the `D` doc-root constant. Keep the engine (grid, drawer, filter) untouched.

Chip data schema, one object per chip:

```js
{ n:"Name", one:"One-line definition.", when:"When / how to use it.",
  b:["Hard fact 1","Hard fact 2"], l:[["Link label","relative/doc/path"]] }
```

Rules for content inside chips:
- `one` is a definition, not marketing. Under 25 words.
- `when` is the decision rule: when to reach for it, or the command that invokes it.
- `b` holds facts that change what the reader does: paths, precedence orders, limits, defaults, flags. 2–4 items.
- `l` always has at least one link to the doc page that covers it.
- Write exact names: commands, flags, file paths, event names verbatim in backticks or `<code>`.

### 7. Check once, open, report

- Open the file in a browser (`Start-Process <path>` on Windows). Confirm the drawer opens and the filter dims chips.
- Report in two sentences: the path, and what the page contains (hub, number of regions, how to use it). Name the source and the read date in the page header.

## Design rules (keep the look consistent across maps)

- One file, no build step, no framework. Vanilla HTML, CSS and JS. Google Fonts allowed, nothing else external.
- Light and dark theme through CSS tokens on `:root`, dark under `prefers-color-scheme` and `[data-theme="dark"]`.
- Layout: CSS grid with named areas, hub in the center column, regions around it; collapses to two columns under 860px and one under 520px.
- The hub is the only dark-filled card. Every other region is a flat card with a border. Chips are pills; the active chip inverts.
- Drawer slides from the right, `Esc` or ✕ closes it, width `min(440px, 100%)`.
- Search box filters chips by name, definition, rule and bullets; non-matches dim, never hide.
- No emoji, no numbered sections unless the content is a real sequence, no hero.
- Phone width works: side gutter 16px, no horizontal scroll.

## Quality bar (the page is done only when all hold)

- A reader who only reads the essence strip has a correct model of the tool.
- Every chip's drawer tells the reader when to use the thing and where to read more.
- No chip repeats another chip's content; cross-reference instead.
- Facts come from the docs fetched in this session, with the read date in the header. Nothing from memory alone.
- The file opens from disk with no console errors.

## Exemplar

Reference density: 1 hub, 9 regions, about 45 chips, 6 essence cards, built from a 230-page docs site. Match that density and tone.
