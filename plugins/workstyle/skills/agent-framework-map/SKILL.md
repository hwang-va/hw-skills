---
name: agent-framework-map
description: Build a one-page interactive HTML mental-model map of an AI agent framework (products row, agent-loop diagram with plug-ins, multi-agent, run-and-ship, plus a 10-row mapping to a framework the user already knows). Use when the user gives a docs URL for an agent SDK/framework and says "map this framework", "same shape as my last framework map", "/agent-framework-map", or wants to learn a new agent framework by analogy to one they know. For a general docs site that is not an agent framework, use /docs-map instead.
---

# /agent-framework-map : one page that explains an agent framework

## Purpose (restate to the user in one line before starting)

People learn a new agent framework fastest by seeing it as "the same loop, different names".
The deliverable is one HTML file: a product row, one diagram of the agent loop with the pieces
that plug into it, the multi-agent layer, how to run it, and a short table that maps the new
framework onto one the user already knows. Every box opens a panel with a plain-English essence,
a minimal code sample and links to the real doc pages.

The page must be reproducible by any model from this file alone. Do not rely on memory of
the framework; everything comes from pages fetched in the session.

## Inputs

- `url`: the docs entry page of the framework (overview / index). Required.
- `compare_to`: the framework to map against in the last section. Ask if the user has not named
  one and no earlier map exists. Only that framework's concept *names* appear on the new page;
  no other content from it.
- Output path: default `<slug>-map.html` in the current folder. Ask only if the slug is unclear.
- Fetch tool: whatever the session has (WebFetch, a browser tool, curl). If a page is too long,
  read it in parts; do not skip it.

## Procedure

### 1. Harvest (read before you design)

1. Fetch the entry page and its navigation: overview, get-started / tutorials, concepts or
   user-guide, capabilities, integrations, hosting, migration guides.
2. Fetch, in parallel, the page behind each of the node slots below. Fetch the GitHub README
   (and `docs/` folder) when a docs page is thin or missing.
3. For each slot record: the class or function names the docs use *today* (frameworks rename
   things), 2–4 hard facts, one code sample and its language, and 3–6 doc URLs you actually
   fetched or saw linked in a fetched nav.
4. A page that 404s: try the GitHub repo path; if still missing, drop the link. Never invent a URL.

### 2. Write the one idea (header tagline)

One sentence, derived from the overview, in the shape "an agent is X in a loop; Y wraps the
loop". Example: "an agent is a chat client plus instructions and tools in a function-calling
loop; a workflow is a typed graph of executors around agents".

### 3. Fill the fixed sections (same grammar every time)

| Section | Grid | Node slots (ids are suggestions; keep them short) |
| - | - | - |
| Packages and products | g5 | language package(s), batteries-included agent if any, dev UI / CLI, hosted runtime if sold as a product, what it supersedes |
| The loop (SVG, clickable) | svg | `surface`, `agent` (instructions + history), `models` (chat client / provider), `loop` (stop reason, limits), `tools` (function, MCP, hosted, agents), `responses` (stream, structured) |
| Plugs into the loop | 3 + 3 | left: sessions/threads, context providers/memory, middleware/hooks; right: human-in-the-loop/approvals, observability, checkpoints/state |
| Beyond one agent | g4 | workflows/graph, orchestration patterns, agents-as-tools and workflows-as-agents, A2A / remote agents |
| Run and ship | g3 | hosting (managed + self-host + durable), declarative/YAML/skills, security + responsible AI |
| How this maps to `<compare_to>` | table | exactly 10 rows: new concept → known concept name, one phrase each, no detail |

If the docs lack a slot (e.g. no checkpoints), merge it into the nearest node and say so in the
report. Do not pad with a node the docs do not support. 19–22 nodes is the target.

### 4. Node content rules (schema is in `template.html`)

```js
id: { k:"prod|loopc|plug|run", t:"Title", s:"subtitle, 2-5 words",
  e:"Essence: 2-3 plain sentences a product manager can read.",
  b:["2-4 bullets with exact names, defaults, limits"],
  c:`# Python\n<minimal runnable sample, or null>`,
  l:[["Link label","/relative/doc/path"], ["GitHub thing","https://..."]] }
```

- `e` says what the thing is and what it is for; no marketing words.
- `b` carries the names: classes, decorators, packages, flags, env vars.
- `c` is one sample from the docs, shortened, with a first-line comment naming the language.
  Prefer Python; use .NET/TypeScript only where Python has none. Avoid backticks and `${` inside it.
- `l` paths are relative to `BASE`; absolute URLs for GitHub or other hosts.
- Mention `compare_to` nowhere except the final table.

### 5. Build from the template

Copy `template.html` (next to this file). Change only: `<title>`, `<h1>`, the tagline, the
section `<h2>` texts, the SVG `<text>` labels (keep the geometry and `data-id`s), `BASE`, the
`D` object, the `SMAP` rows, the `put(...)` id lists, the panel hint sentence, and the footer
source line. Keep CSS and the script engine untouched.

Footer line format: `Source: <docs host> and <repo>, fetched <YYYY-MM-DD>.`

### 6. Check, open, report

- Open the file in a browser (`Start-Process <path>` on Windows, `open` on macOS, `xdg-open`
  on Linux). Click three boxes and the table; the panel must fill.
- Report under 25 lines: the absolute path; the node ids; framework areas the docs did not
  cover (so they are absent from the map); the 10 mapping rows.

## Design rules

- One file, no build step, no external scripts, all text inline; under 16 MB.
- Light and dark theme through the CSS tokens already in the template.
- Same four colours as the template: product (green), loop (blue), plug-in (purple), run (orange).
- No emoji. No new sections. No content from any framework other than the one being mapped,
  except the 10 names in the last table.

## Quality bar (done only when all hold)

- A reader who reads the tagline and clicks the six loop boxes has a correct model of the framework.
- Every node has 3–6 working links to pages fetched this session.
- Names on the page match the docs on the fetch date, not an older release.
- The mapping table has exactly 10 rows and nothing else about the other framework.

## Reference output

First produced for AWS Strands Agents and Microsoft Agent Framework (docs read 2026-10-23):
21 nodes each, one loop diagram, one 10-row table between them. Match that density and tone.
