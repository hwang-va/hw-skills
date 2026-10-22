# Spec Sections

Shared reference for the section skills under `skills\`. One `##` heading per section. Readers: a human reads the whole file as the overall view; `/spec:plan-level0` reads Levels and Catalog; each section skill reads Levels plus its own heading and renders only its own level. Text sections number their rows with an ID prefix (PU, GL, I, DA, KN, FR, NF, AC, AG, ME, AU, GR, EV, OP, RK, DEC); the cross-section rules bind by those IDs.

## Levels

Level 1 covers scope and behavior: a stakeholder reads it in a minute. Level 2 is the detailed design an engineer or QA builds and tests from. Letters in Level 2 refine the same letter in Level 1. "Other" holds items that exist only at Level 2. Level 0 skills draw no section: ingest, plan, Glossary harvest, assemble, lessons. Ingest (`ingest-level0`) builds the spec folder: the source verbatim as `brief.md`, raw sources, and graded research for the sections the source leaves thin. Plan (`plan-level0`) picks a depth per section and the run order. The Glossary term harvest (`glossary-level0`) then lifts words from the raw prose, so every later section uses fixed words. Assemble (`assemble-level0`) runs last and stitches the section outputs, unchanged, into one `spec.md`. Lessons (`lessons-level0`) judges each studied pattern Adopt, Adapt, or Avoid for a target product the user describes. `Inferred`: confirm.

- Level 0 is a folder of sources, a run plan, a list of words with a flag on each, or the assembled spec, nothing more.
- Level 1 fits on a napkin and reads as a story.
- Level 2 is the same story with enough precision to build from.

**Two Families:** diagram sections render boxes and arrows; text sections render tables and cards in the Interfaces catalog style. Same contract for both: four elements A to D at Level 1, refined by letter at Level 2, plus E and F under Other.

**Rendering:** Monospace. Box-drawing glyphs only. No emoji. Align columns and arrows. Tag beside each glyph says which level uses it.

## Catalog

Purpose for why and how success is measured, glossary for the words, C4 for structure, activity for process, state machine for one entity's legal moves, sequence for one concrete interaction in time, interfaces for the contract on each arrow, data model for the nouns every section shares, data access for who may read or write each of them, knowledge for how an agent or a person finds what the product knows and how new knowledge flows back in, product surface for what the user sees and touches, functional requirements for the shall sentences that index everything, non-functional requirements for the numbers the system must hit, acceptance criteria for the deterministic tests, agents for which AI workers exist, what wakes each, and where it shows, memory for what each agent keeps between runs, how it resumes, and what fades, autonomy for who decides each action, the AI or a human, grounding for where each AI output comes from and how it proves it, evaluation for the bar AI output must clear, operation for what each agent costs, its limits, what is traced, and how a model or prompt changes, risks for how it fails and what catches it, decision log for what was decided about every gap.

**Choice:** `/spec:plan-level0` picks one per section: Skip, L1, or L2, with a risk reason and a run order, saved as `plan.md`. L2 runs after L1: Level 2 creates no IDs and cites Level 1.

**Trigger:** what in a brief switches the section on. Initial draft, refined as `/spec:plan-level0` runs on more briefs. `Inferred`

**AI Sections:** Agents, Memory, Autonomy, Grounding, Evaluation, Operation, and Risks switch on together for any feature where a model produces output a person or a system acts on. Agents first, then Autonomy: Agents names the workers; Autonomy tiers their actions: it sets what the other three have to be strong enough to support. The tier question decides how much of each is needed: an AI that only suggests needs Grounding and Evaluation; one that does work with tools needs all four plus a risk rating on every Interfaces tool row; one that runs on its own also needs Data Access as a principal and Memory under Grounding.

| Section | Level 1 | Level 2 | Trigger | L1 Skill | L2 Skill |
|---|---|---|---|---|---|
| **Purpose** | Problem, users, success measures, non-goals | Evidence, cost, job stories, metric formulas, bets, constraints | Always: every spec opens with it | `purpose-level1` | `purpose-level2` |
| **Glossary** | Term, definition, not to be confused with, owner; Level 0 is the term harvest | Binding to Data Model, synonyms, examples, usage rules, change control | Always: Level 0 runs first, on raw prose | `glossary-level0` for Level 0; `glossary-level1` | `glossary-level2` |
| **C4** | System context: people, system, externals, what flows | Containers and technology, protocol on every arrow; Deployment view: nodes, instances, environments; Component view: modules inside one container, allowed calls | The system is new, or adds a user role or external dependency beyond its host product; Deployment view when hosting, environment, region, or where the model runs is decided or changes; Component view when one container's internal structure, folder layout, or module boundaries are decided or changes | `c4-level1` | `c4-level2`; `c4-deployment-level2` for the Deployment view; `c4-component-level2` for the Component view |
| **UML Sequence** | One scenario as numbered plain messages | Sync and async calls, payloads, alt, opt, loop, and par fragments | One interaction where the order or timing of calls between parties matters | `sequence-level1` | `sequence-level2` |
| **UML Activity** | Steps, branches, and owners in swimlanes | Guards, object flow, handoffs, fork and join, exceptions | A multi-step process with branches, or handoffs between humans and AI | `activity-level1` | `activity-level2` |
| **UML State Machine** | One entity's states, events and transitions, initial and final, forbidden transitions | Guards and timeouts, entry and exit actions, composite and parallel states; who may fire each event; audit per transition | An entity whose status has rules: order, request, approval, subscription, agent run | `state-level1` | `state-level2` |
| **Interfaces** | Register: one row per exchange, in business terms; risk when an agent is the consumer | Contract card per exchange: endpoint, schema, errors, limits, tool risk rating | A new or changed exchange across a system boundary: API, event, file, or MCP tool | `interface-level1` | `interface-level2` |
| **Data Model** | Entities, relationships, rules, source of truth | Attributes, keys, cardinality, states, constraints, history | A new entity, attribute, or source of truth, including stored AI output | `data-model-level1` | `data-model-level2` |
| **Data Access** | Roles, entities, read or write per pair, rule source | Gate and filter, agent as principal, fields never held, delegation, revocation | A role, an entity, or an AI agent reads or writes data it did not before | `data-access-level1` | `data-access-level2` |
| **Knowledge** | Corpus register: one row per corpus with layer (raw, catalog, distilled), store kind, origin, unit, search kind, consumer path; layer diagram with feedback arrows | Schema per layer, hybrid search recipe, embedding choice, context pack per agent task, promotion rule from decision to distilled unit, freshness and retirement | Any agent that searches a corpus beyond keyed lookups, or any product where decisions, memos, or notes are meant to become searchable knowledge | `knowledge-level1` | `knowledge-level2` |
| **Product Surface** | Screen inventory and screen map | Wireframe per screen with states, bindings, interactions | A new or changed screen, pane, message, or document the user sees | `product-surface-level1` | `product-surface-level2` |
| **Functional Requirements** | One shall sentence per requirement, source, detail element, priority | Preconditions, rationale, implementing elements, test link, release | Always: the index every test and diagram hangs from | `requirements-level1` | `requirements-level2` |
| **Non-Functional Requirements** | Quality, numeric target, measure, owner | Load conditions, ceiling, measuring tool, breach action, trade-offs | A quality with a number matters: latency, uptime, security, cost per run, residency | `nfr-level1` | `nfr-level2` |
| **Acceptance Criteria** | Given / When / Then per deterministic requirement, pass signal, trace | Edge cases, example data, thresholds, test type, bindings | Every deterministic `FR-NN` | `acceptance-level1` | `acceptance-level2` |
| **Agents** | Agent inventory: name, job, trigger kind, surface or hidden, tier pointer | Tools, memory, session, model and cost cap, handoffs and orchestration pattern | Any feature where more than one AI worker runs, or one runs without a user turn: after a run, in the background, on a schedule | `agents-level1` | `agents-level2` |
| **Memory** | Memory register: one row per memory kind per agent (working, episodic, semantic, procedural) with scope, what persists, what loads on resume, retention | Entity and write rule, consolidation (merge, drop contradictions, absolute dates), resume recipe with ceiling, salience score and pinned events, decay, forget rights, fields never remembered | Any agent that runs more than once for the same user, resumes a session, or is expected to learn from what it did | `memory-level1` | `memory-level2` |
| **Autonomy** | Tier per action, checkpoints, escalation | Conditional tiers, promotion criteria, evidence pack, kill switch | Always: every AI feature has decision rights | `autonomy-level1` | `autonomy-level2` |
| **Grounding** | Sources, scope, evidence, empty result per AI output | Freshness, entitlement at retrieval, input as data, citation schema, partial results, memory | Any AI output a person or a system acts on | `grounding-level1` | `grounding-level2` |
| **Evaluation** | Evaluated outputs, quality dimensions, method, bar and signer | Dataset, slices, rubric, judge calibration, cadence, promotion, drift, model change | Every AI action at T1 or above in Autonomy | `evaluation-level1` | `evaluation-level2` |
| **Operation** | Operation register: one row per agent with cost per run and per day, limits, what is traced, change owner | Cost formula and alarms, limit values and degrade order, trace fields and dashboards, canary and rollback, incident severity and on-call | Any agent that spends money per run, or any product where a model or prompt change reaches users | `operation-level1` | `operation-level2` |
| **Risks and Failure Modes** | Failure mode, effect, severity, guard | Cause, OWASP category, blast radius, RPN, detection, fallback, residual risk | Every T3 and T4 action, and every Grounding row | `risk-level1` | `risk-level2` |
| **Decision Log** | Decision, status, answer, owner and date | Context, options, consequences, supersession, revisit trigger | Always: runs last, one row per Unknown across outputs | `decision-log-level1` | `decision-log-level2` |

## Purpose

### Level 1: Scope and Behavior

- **A. Problem.** Who has what problem, and today's workaround, in their words.
- **B. Users.** Who benefits, one row per role, matching the C4 people.
- **C. Success Measures.** Outcome metric, baseline, target. ID `PU-NN`. The C4 system box keeps its one-sentence purpose line; that line is the summary of this section, so the two stay consistent.
- **D. Non-Goals.** What this deliberately does not do, one line each.

### Level 2: Detailed Design

- **A.1** Evidence of the problem: tickets, transcripts, counts. **A.2** Cost of the problem today, baselined.
- **B.1** Job stories per role: when, I want, so I can.
- **C.1** Metric formula and data source. **C.2** Leading versus lagging, and the target date.
- **D.1** Reason per non-goal.
- **Other:** **E.** Assumptions and bets, one line each. For an AI feature the first bet is **why a model**: why a form, a rule, or a template will not do. A weak answer here is a reason not to build. **F.** Constraints: budget, deadline, regulation.

### Legend

```
┌─ Purpose ────────────────────────────────────────┐   Card L1: one per spec.                          L1
│ Problem  analysts re-read 40 filings each quarter│   Who, what, the workaround today.                L1
│ Users    Research Analyst │ PM                   │   One per role; matches C4 people.                L1
│ Non-goal no trade execution                      │   One line each.                                  L1
└──────────────────────────────────────────────────┘
 #     Measure                   Baseline  Target    Success measures L1: one row each.               L1
 PU-01 hours per quarterly read  6 h       1 h       Number with unit, baseline, target.              L1
 PU-01 = Σ read time / filings │ source: time log   Formula and data source L2.                      L2
 PU-01 lagging │ by 2026-Q4                         Leading or lagging, target date L2.              L2
 Bet: a model, not a rule: filing formats vary      Why a model L2: the first bet.                   L2
```

## Glossary

### Level 0: Term Harvest

- Candidate nouns and jargon lifted from the raw spec, one row each, before any diagram is drawn. Each flagged clear, ambiguous, or synonym clash. ID `GL-NN`. Level 0 exists only here. `Inferred`: confirm.

### Level 1: Scope and Behavior

- **A. Term.** The word as the team uses it, one row per term.
- **B. Definition.** One sentence: the class it belongs to plus the trait that sets it apart (ISO 704).
- **C. Not to Be Confused With.** The look-alike, and the difference, one line.
- **D. Owner or Source.** Who owns the meaning, or the document it comes from.

### Level 2: Detailed Design

- **A.1** Binding to the Data Model entity or attribute the term names. **A.2** Allowed and banned synonyms.
- **B.1** Examples and non-examples.
- **C.1** Usage rule for UI labels and code names.
- **D.1** Change control: who may change the definition, and what changes with it.
- **Other:** **E.** Terms borrowed from a client or a regulator, with the source cited. **F.** Notes.

### Legend

```
 #     Term            Flag        Harvest L0: word and flag, nothing more.            L0
 GL-01 event           ambiguous   clear │ ambiguous │ synonym clash.                  L0
 GL-02 signal ~ flag   clash       ~ joins two words used for one thing.              L0

 #     Term     Definition                          Not to confuse with     Owner     Row L1: one per term.   L1
 GL-01 Event    record of a price or news change    the occurrence itself   KB team   Class plus trait.       L1
 GL-01 ◆ Market Event │ allowed: event │ banned: alert                                Binding, synonyms L2.   L2
 GL-01 e.g. "AAPL cuts guidance" │ not: "AAPL call scheduled"                         Examples L2.            L2
 GL-01 UI: "Event" │ code: market_event                                               Usage rule L2.          L2
 GL-01 change: KB team, with Data Model A.1                                           Change control L2.      L2
```

## C4

### Level 1: Scope and Behavior

- **A. People.** Who uses the system, one box per role.
- **B. The System.** The one box being described, with a one-sentence purpose.
- **C. External Systems.** What it depends on or feeds, one box each.
- **D. Relationships.** Labelled arrows saying what flows, not how.

### Level 2: Detailed Design

- **A.1** Distinct roles and what each may do. **A.2** Channel used, such as browser, CLI, or Teams.
- **B.1** Containers inside the system, such as web app, API, database, or agent runtime, each with a technology label. **B.2** Containers whose inside matters, named only; their components belong to the Component view.
- **C.1** Integration type per external system, such as REST, MCP, webhook, or file. **C.2** Owner, and whether the system reads, writes, or both.
- **D.1** Protocol on every arrow. **D.2** Direction and read or write.
- **Other:** **E.** Boundaries: what sits inside the system and what outside; where it runs belongs to the Deployment view. **F.** Notes and assumptions.

### Level 2 Deployment: Detailed Design

- C4 supplementary Deployment diagram (c4model.com): where each Level 2 container runs. One diagram per environment. Input: C4 Level 2, plus Non-Functional Requirements residency and uptime rows when present. Deployment exists only at Level 2. `Inferred`: confirm.
- **A.1** Environments, such as production and staging, one diagram each. **A.2** Hosting model per environment: cloud, on-prem, vendor-hosted, or customer-hosted, and region.
- **B.1** Deployment nodes, nested: region, cluster, VM, or managed service, each with a technology label. **B.2** Infrastructure nodes: load balancer, gateway, DNS, firewall.
- **C.1** Container instances: every Level 2 container placed on one node, with replica count. **C.2** Model and agent placement: where model inference runs, where the agent runtime and its sandbox run, where each MCP server runs.
- **D.1** Protocol and port on every link between instances. **D.2** Network zone each link crosses: public, private, or vendor.
- **Other:** **E.** Data residency: the region holding each data store, and which data leaves it. **F.** Notes and assumptions.

### Level 2 Component: Detailed Design

- C4 Component diagram (c4model.com, Level 3 in C4's own numbering): the modules inside one Level 2 container and how they call each other. One diagram per container that matters. Input: C4 Level 2, plus Data Model Level 2 and Interfaces Level 2 when present. Component exists only at Level 2. Each component maps to one top-level folder or package; each arrow is an allowed dependency. `Inferred`: confirm.
- **A.1** The one container in focus, with its Level 2 name and technology. **A.2** Who or what calls into it from outside: people, other containers, external systems, one box each at the edge.
- **B.1** Components inside the container: name, one-line responsibility, technology label such as a module, library, or framework element. **B.2** Component kind: entry point, domain logic, data access, integration adapter, or shared utility.
- **C.1** Which component owns each Data Model Level 2 entity. **C.2** Which component serves each Interfaces Level 2 contract card.
- **D.1** Arrows between components: what is called and the call style, such as function, interface, event, or query. **D.2** Arrows from components to outside containers and external systems, with protocol.
- **Other:** **E.** Dependency rules: which directions are forbidden, such as domain logic never calling an adapter directly. **F.** Folder tree: one top-level folder per component, same names, package by feature. **G.** Notes and assumptions.

### Legend

```
┌─────────────┐   Person: single border, role name.                        L1 L2
│ Analyst     │
└─────────────┘
╔═════════════╗   System in focus: double border, name + one-line purpose.  L1
║ Acme AI     ║
╚═════════════╝
┌─────────────┐   External system: single border, name.                    L1 L2
│ Jira        │
└─────────────┘
┌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┐  System boundary: dashed box around containers.            L2
╌ [API │ .NET] ╌  Container: [name │ technology] inside boundary.           L2
└╌╌╌╌╌╌╌╌╌╌╌╌╌╌┘
──reads issues──▶   Relationship L1: what flows.
──issues / REST─▶   Relationship L2: what / protocol; direction explicit.
┌ Node │ Tech ─┐  Deployment node: titled border, name │ tech; nests.      Dep
│ [App] ×2     │  Container instance: Level 2 name, replica count.         Dep
└──────────────┘
<LB │ Tech>       Infrastructure node: angle brackets, name │ technology.  Dep
──HTTPS:443 / private─▶  Relationship Dep: protocol:port / network zone.
╔═ Container │ Tech ══╗  Container in focus: double titled border, name │ tech.  Cmp
║ (Name │ Tech) <kind>║  Component: parentheses, name │ technology, kind tag.    Cmp
╚═════════════════════╝
──query / function──▶   Relationship Cmp: what is called / call style.          Cmp
```

## UML Sequence

### Level 1: Scope and Behavior

- **A. Participants.** Who is in the scenario, one lifeline per actor or system.
- **B. Messages.** What happens, in order, one plain sentence per step.
- **C. Outcome.** What the scenario ends with, one line.
- **D. Trigger and Boundary.** What starts it and what is out of scope.

### Level 2: Detailed Design

- **A.1** Actors, meaning people or roles. **A.2** Systems and components, each with a technology label.
- **B.1** Sync call or async event. **B.2** Return values. **B.3** Parameters or payload carried.
- **C.1** Happy-path result. **C.2** Alternatives and errors, drawn as alt or opt fragments.
- **D.1** Preconditions that must hold before the first message. **D.2** Explicit out-of-scope list.
- **Other:** **E.** Loops and parallel work, drawn as loop or par fragments. **F.** Notes and assumptions attached to steps.

### Legend

```
 Analyst        Acme            Jira      Lifeline header: one name per column.  L1 L2
    │              │              │        Lifeline: vertical bar.                L1 L2
    │─1. asks Q───▶│              │        Message L1: numbered, plain sentence.  L1
    │              │──query(id)──▶│        Message L2 sync: solid arrow, params.  L2
    │              │- - event - -▶│        Message L2 async: dashed arrow.        L2
    │              │◀- - list - - │        Return L2: dashed arrow back.          L2
    │              ┃              │        Activation L2: thick bar while busy.   L2
    │   ┌[alt: found]─────────────┐        Fragment L2: alt / opt / loop / par.   L2
    │   └─────────────────────────┘
Trigger: one line above first message.   Outcome: one line below last.        L1 L2
```

## UML Activity

### Level 1: Scope and Behavior

- **A. Start and End.** What triggers the process and what state it ends in.
- **B. Actions.** The steps, one verb phrase each, in order.
- **C. Decisions.** The branches that change the path, one question each.
- **D. Owners.** Swimlanes showing who or what performs each action.

### Level 2: Detailed Design

- **A.1** Trigger event and preconditions. **A.2** Every end state, such as done, rejected, or abandoned.
- **B.1** Sub-steps where one action hides real work. **B.2** Object flow: the data or document each action consumes and produces.
- **C.1** Guard condition on every outgoing arrow. **C.2** Merge points where branches rejoin.
- **D.1** Lanes split into roles and systems. **D.2** Handoffs across lanes called out, since that is where delays live.
- **Other:** **E.** Fork and join for parallel work. **F.** Exceptions, timeouts, and notes.

### Legend

```
│   Analyst    │   Acme       │      Swimlane: one column per owner.            L1 L2
│    (●)       │              │      Start.                                     L1 L2
│     │        │              │
│  [Ask Q]─────────▶[Search]  │      Action: verb phrase in brackets.           L1 L2
│              │      │       │
│              │   <Found?>   │      Decision: question in angle brackets.      L1 L2
│              │   │[yes]     │      Guard L2: [condition] on every exit.       L2
│  [Read]◀──────────┘         │      Cross-lane arrow: handoff, label it.       L2
│     │        │              │
│    (◉) done  │              │      End: one per end state, labelled at L2.    L1 L2
═══════════════════             Fork / Join: thick bar across parallel paths.  L2
──{Report}──▶                   Object flow: {Object} on arrow.                L2
```

## UML State Machine

### Level 1: Scope and Behavior

- **A. States.** Each named condition one entity rests in, one box each, spelled as the Data Model Level 2 state attribute spells it.
- **B. Events and Transitions.** The business event that moves the entity from one state to another, one arrow each, no guard.
- **C. Initial and Final.** Where the lifecycle starts, and every state it can end in.
- **D. Forbidden Transitions.** Moves the spec says must never happen, listed under the diagram with the reason.

### Level 2: Detailed Design

- **A.1** Composite states: sub-states inside one state. **A.2** Parallel regions when two independent aspects of the entity move at once.
- **B.1** Guard and effect on every transition that needs one, `event [guard] / effect`. **B.2** Timeouts as `after <t>` events.
- **C.1** Entry and exit actions per state. **C.2** What happens to the record in each final state: cleanup, retention, re-entry as a new entity.
- **D.1** Each forbidden move bound to the `FR-NN` or `RK-NN` that forbids it. **D.2** The guard that enforces it.
- **Other:** **E.** Who may fire each event: the Autonomy tier and the Data Access role. **F.** The audit record written per transition: the history or run entity in the Data Model.

### Legend

```
        (●)                                  Initial: where the lifecycle starts.           L1 L2
         │ create
         ▼
   ┌───────────┐   submit    ┌───────────┐   State: box, one named condition.             L1 L2
   │   Draft   │────────────▶│   Open    │   Transition: event on the arrow.              L1 L2
   └───────────┘             └─────┬─────┘   Guard L2: event [guard] / effect.            L2
                                   │ fill    Timeout L2: after <t> as the event.          L2
                                   ▼
                             ┌───────────┐
                             │  Closed   │──▶(◉)   Final: one per terminal state.         L1 L2
                             └───────────┘
Closed ✗▶ Open: filled order never reopens   Forbidden: listed under the diagram.        L1 L2
┌─ Open ──────────────────┐                  Composite L2: box holding sub-states.        L2
│ entry / lock book       │                  Entry and exit actions L2.                   L2
│ [Placed] ──▶ [Filled]   │
└─────────────────────────┘
fire: Trader (T0) │ audit: Order history    Who may fire, audit record L2 (E, F).        L2
```

## Interfaces

### Level 1: Scope and Behavior

- **A. Parties.** Who exchanges with whom: provider and consumer, one row per exchange.
- **B. Exchange.** What crosses and why: name, kind such as API call, event, or file, and a one-line purpose.
- **C. Inputs and Outputs.** Main input in and main result out, in business terms.
- **D. Ownership and Risk.** Who owns the contract, and whether it is existing, changed, or new. When the consumer is an AI agent, a risk rating on the row: read or write, reversible or not, financial impact or none. A high-risk tool makes every Autonomy action that calls it T2 at minimum.

### Level 2: Detailed Design

- **A.1** Provider and consumer named as containers, matching the C4 Level 2 boxes. **A.2** Authentication and authorization: how the consumer proves identity and what it may call.
- **B.1** Endpoint or event name plus transport, such as REST, gRPC, MCP tool, webhook, queue topic, or SFTP drop. **B.2** Interaction style: sync request and response, or async event, with direction.
- **C.1** Request, response, or event schema: fields, types, required versus optional. **C.2** One representative payload each way. **C.3** Errors: codes and what the consumer does on each.
- **D.1** Versioning and deprecation rules. **D.2** Rules for repeated requests: idempotency key, retry policy, deduplication. **D.3** Tool risk, when the consumer is an agent: the worst outcome of a wrong call, the undo path, and the Autonomy action that calls it.
- **Other:** **E.** Limits: rate limits, timeouts, payload size, latency target. **F.** Notes and assumptions, explicit out-of-scope list.

### Legend

```
 #  Provider    Consumer   Exchange / kind   In ▶ Out        Owner     Catalog L1: one row per exchange.  L1
 1  Ingestion   KB Svc     submit / API      content ▶ ref   KB team   Kind: API, event, or file.         L1
 2  KB Svc      Analyst    ready / event     ref ▶ notice    KB team   In ▶ Out, in business terms.       L1
 3  KB Svc      Sector agt save_draft / tool draft ▶ ref     KB team   Agent consumer: rate the risk.     L1
 3  risk: write │ reversible │ no $ → T2 minimum                       Risk L1: read/write │ undo │ $.    L1

┌─ I-1 submit ───────────────────────────┐   Contract card L2: one per catalog row.  L2
│ POST /documents │ REST │ sync          │   Endpoint │ transport │ style.           L2
│ Auth     bearer token, scope kb:write  │   Who may call, and what.                 L2
│ Request  { source*, content*, tags }   │   Schema. * marks required.               L2
│ Response { ref*, status* }             │   One representative payload each way.    L2
│ Errors   400 fix; 429 retry; 5xx retry │   Code, then what the consumer does.      L2
│ Version  v1 │ Repeat: idempotency key  │   Versioning and rules for repeats.       L2
│ Limits   1 MB │ 5 s │ 100 per minute   │   Rate, timeout, size, latency.           L2
│ Risk     write │ undo: delete │ no $    │   Tool risk L2: agent consumer only.      L2
└────────────────────────────────────────┘
```

## Data Model

### Level 1: Scope and Behavior

- **A. Entities.** The main business things, one box each, singular noun plus a one-line definition. Disambiguate look-alikes, such as event as a real-world occurrence versus event as the record describing it.
- **B. Relationships.** Which entity connects to which, a verb on the line, and one or many.
- **C. Rules.** The critical business rules the model must hold, one sentence each.
- **D. Source of Truth.** Where each entity is born and which system or team owns it.

### Level 2: Detailed Design

- **A.1** Attributes: fields, types, required versus optional. **A.2** Identifiers: primary key, natural key, external reference. **A.3** States: the state attribute and its values, for entities that have them; transitions live in UML State Machine.
- **B.1** Cardinality on both ends of every relationship, plus optionality. **B.2** Lineage: how a derived item points back to its source.
- **C.1** Constraints: uniqueness, ranges, cross-field rules, written so QA can test them. **C.2** Propagation: what a correction or deletion does downstream, such as cascade, soft delete, or re-index.
- **D.1** History: timestamps, versioning, audit trail, retention. For an AI feature the audit trail is a run entity, one row per run, carrying trigger, model id, prompt version, tool calls, approvals, errors, and cost, with a retention period. **D.2** Access: who may read or write each entity, as one pointer line to the Data Access row.
- **Other:** **E.** Volumes: rough counts and growth. **F.** Notes and assumptions, explicit out-of-scope list.

### Legend

```
┌──────────────────────┐       Entity: single border, singular noun, one-line definition.  L1 L2
│ Market Event         │
│ record of a price or │
│ news change          │
└──────────────────────┘
Document ──produces── Event    Relationship L1: verb on the line, both ends named.         L1
Document 1──produces──* Event  Cardinality L2: 1, 0..1, *, or 1..* at each end.            L2
R1. One item, one source.      Rule: numbered, one sentence, testable.                     L1 L2
Owner: KB team │ SQL DB        Source of Truth: owner and system of record per entity.     L1 L2

┌──────────────────────┐       Entity card L2: name compartment, then attributes.          L2
│ Market Event         │
├──────────────────────┤
│ event_id     id   PK │       Identifier: PK own key, FK reference to another entity.     L2
│ source_id    id   FK │       Lineage: FK to the source the item derives from.            L2
│ occurred_at  time  * │       Attribute: name, type; * marks required.                    L2
│ version      int   * │       History: timestamps and version fields.                     L2
│ state        enum    │       State: closed set; transitions listed under the card.       L2
└──────────────────────┘
draft ▶ published ▶ retracted  Transitions: one line, arrows between states.               L2
on delete: retract items       Propagation: what a correction or deletion does downstream. L2
AgentRun: trigger, model_id,   Run entity L2: one row per AI run, see rule 4.              L2
  prompt_v, tool_calls, cost
```

## Data Access

### Level 1: Scope and Behavior

- **A. Roles.** Every role that reads or writes data, one row each, matching the C4 people, plus any AI agent that acts as a principal.
- **B. Entities.** The Data Model entities each role touches.
- **C. Rights.** Read, write, or both, per role and entity. `Unknown` where the spec is silent, never blank.
- **D. Rule Source.** Where the right comes from: the org chart, the client contract, an entitlement record, or the user who delegated it.

### Level 2: Detailed Design

- **A.1** Agent as principal: its own row, its own rights, never a proxy for the user who triggered it. **A.2** Fields the agent never holds: credentials, payment details, raw secrets.
- **B.1** Attribute-level rights where a row is not enough, such as a field masked for one role.
- **C.1** Gate and filter: whether the right blocks the call, filters the rows returned, or both. **C.2** Filter at retrieval: applied before any AI reads the data, never only at the screen. Pointer to Grounding B.1.
- **D.1** Where the rule is stored and who maintains it. **D.2** Revocation: what a removed right does to data already retrieved, cached, or remembered.
- **Other:** **E.** Delegation: how a user grants an agent a subset of their own rights, and when it expires. **F.** Identity: how each principal proves who it is and how that proof travels. Per principal: the authentication method (OIDC login, API key, service identity, agent credential), the token or session lifetime, and the step-up rule for a higher-risk action. Per hop where an agent calls a tool, a sub-agent, or an external MCP server: whether the hop carries the user's identity by token exchange, the agent's own identity, or a service identity, and the rule that a token is never passed through unchanged to the next hop (MCP authorization 2026-07-28: tokens bound to one server by resource indicator, passthrough forbidden). The chain from user to last hop is written once, so a tool that runs as the caller and a tool that runs as the product are both visible. **G.** Notes and assumptions, explicit out-of-scope list.

### Legend

```
 #     Role           Entity           R  W   Source            Matrix L1: one row per role and entity.  L1
 DA-01 Analyst        Recommendation   ●  ●   org chart         ● right held; blank means none.          L1
 DA-02 PM             Recommendation   ●      org chart         Read only.                               L1
 DA-03 Sector agent   Recommendation   ●  ●   delegated: DA-01  Agent as principal: its own row.         L1 L2
 DA-03 gate: role check │ filter: sector = own                  Gate and filter L2.                      L2
 DA-03 never holds: broker credentials                          Fields the agent never holds L2.         L2
 DA-03 delegated by Analyst │ expires: end of run               Delegation L2.                           L2
 DA-03 on revoke: purge cache, forget memory                    Revocation L2.                           L2
 Identity: Analyst ▶ OIDC, 8 h session, step-up: re-auth before trade   Identity L2: per principal.      L2
 Identity: Sector agent ▶ agent credential, 1 h token, no step-up         method │ lifetime │ step-up.     L2
 Chain: Analyst ─user token─▶ Chat agent ─exchange─▶ MCP /tools (as Analyst) ─service─▶ Vendor API   Hop L2. L2
```

## Knowledge

### Level 1: Scope and Behavior

- How anything the product knows is found, by an agent or a person, and how new knowledge flows back in. Data Model holds the entities; Grounding says which corpus an answer cites; Knowledge is the design of the corpora themselves. Layers after the DIKW ladder and the retrieval-augmented generation literature: raw holds originals, catalog holds one row per original with metadata, summary, and embedding, distilled holds units an agent loads whole into context. `Inferred`: confirm.
- **A. Corpora.** Every searchable body of content named, `KN-NN`, one row each, with its layer: raw, catalog, or distilled; and its store kind: local file system, object store, relational table, vector index, never a vendor name. A folder of Markdown or JSONL on a user's machine is a raw corpus: keyed by path, full-text by grep.
- **B. Origin and Unit.** Where the content comes from: internal file, vendor feed, agent web search, human note, decision or memo made inside the product; and the unit a search returns: file, row, chunk, or unit.
- **C. Search and Consumer.** The search kind: keyed, full-text, semantic, hybrid, or agentic (the agent loops over list, read, and grep until it finds what it needs; a kind of search, not a store); and the path per consumer: the agent through a tool, the person through a screen.
- **D. Feedback.** Which agent or role writes new knowledge, into which layer, and what triggers it: a decision, a review, a memo, a meeting.

### Level 2: Detailed Design

- **A.1** Schema per layer: the Data Model entity for the catalog row and the distilled unit, with the link field back to the raw object. **A.2** Size and growth: objects per layer and additions per day.
- **B.1** Capture step per origin: who or what writes the catalog row, and what is lost when the step is skipped. **B.2** Embedding: what is embedded per corpus, summary per catalog row by default; chunked full text only on a row where agents must quote a passage; model class; chunk size and overlap when chunked.
- **C.1** Search recipe per corpus: filters first, then full-text, then semantic, and how results merge; result cap and ranking. Primitives line: which of list, read, grep, query, fulltext, vector the store exposes to the agent, each as ms, s, or none, because agentic search is only cheap where list, read, and grep are. Order line: question shape to primitive, exact name or path to grep, structured filter (date, person, status) to the catalog query, vague or meaning question to vector; cheapest first, next only on empty. Deployment shape, one of local, hosted, hosted-sandbox: local keeps raw as files and catalog, full-text, and vector in one embedded database file, agentic search default; hosted keeps raw in an object store and the three indexes in one relational store, agentic search through `I-NN` tools over the catalog; hosted-sandbox syncs raw from the object store into a per-user file system with the local stack inside, writes synced back, the sync itself an Interfaces row. Indexes are derived and rebuildable from raw, never a source of truth. **C.2** Context pack: one block per agent task kind, keyed by the subject (a stock, a sector, a client), listing each corpus it loads with a detail level, whole, summary, index (titles and dates only), or count, in load order under a token ceiling; plus the upload path: a file the user attaches is captured into the catalog first, so the same pack covers it. Default: find by catalog, read raw whole, chunk only when one file exceeds the ceiling.
- **D.1** Promotion rule: when a decision, review, or memo becomes a distilled unit, who approves, and the unit's owner. **D.2** Freshness and retirement: age limit per layer, re-embedding trigger, and what retires a unit.
- **Other:** **E.** Access: one pointer line per corpus to the Data Access row for the agent and for the role. **F.** Notes and assumptions.

### Legend

```
 #     Corpus            Layer      Store        Origin             Unit   Search   Agent via  Person via  Register L1   L1 L2
 KN-01 Research reports  raw        object store vendor feed, file  file   keyed    I-21       Library     one row each  L1 L2
 KN-02 Report catalog    catalog    table        capture of KN-01   row    hybrid   I-22       Library     Store: kind   L1 L2
 KN-03 Sector playbooks  distilled  local files  analyst, AG-04     unit   keyed    load whole Playbooks   Unit: returned L1 L2
Rule check: 3 corpora · 3 layers · 2 feedback arrows                                             one line       L1 L2

┌ distilled ─────────────┐  ◀── promote: AG-04 weekly review, analyst approves   Layer diagram L1: three   L1
│ KN-03 Sector playbooks │                                                        boxes, raw at the bottom.
├ catalog ───────────────┤  ◀── capture: ingest agent writes row, summary, vector  Feedback arrow L1: who
│ KN-02 Report catalog   │──link──▶ raw                                            writes up, on what trigger.
├ raw ───────────────────┤  ◀── inflow: vendor feed, web search, meeting note
│ KN-01 Research reports │
└────────────────────────┘

KN-02  ◆ ReportCatalog.s3_key .date .tags .summary .embedding     Schema L2: ◆ Data Model entity.attributes. L2
KN-02  embed: summary per row │ model class: small                 Embedding L2: what, model class.            L2
KN-02  filter date, sector ▶ full-text ▶ semantic ▶ merge, top 20   Search recipe L2: order and cap.            L2
KN-02  primitives: query ms │ fulltext ms │ vector s │ grep none      Primitives L2: each ms, s, or none.        L2
KN-03  primitives: list ms │ read ms │ grep ms │ query via KN-02      Agentic search cheap here.                 L2
KN-03  order: path or name ▶ grep; date, person ▶ KN-02 query; vague ▶ I-22 vector; next on empty   Order L2.  L2
Shape: hosted-sandbox │ raw synced per user, local stack inside, sync = I-23                Deployment shape L2.   L2

Pack: stock research │ key: Security │ ceiling 40k │ upload ▶ KN-02 capture first   Context pack L2: per task kind.  L2
  1 KN-03 sector playbook      whole                                               Detail: whole │ summary │ index │ count
  2 KN-04 investment memos     latest whole, prior index (title, date)             Load order under the ceiling.
  3 KN-05 decisions and trades count, last 5 summary
  4 KN-02 report catalog       top 10 summary, raw on demand
KN-03  promote: decision approved by PM ▶ unit, owner: analyst      Promotion rule L2.                          L2
KN-02  stale > 2 y │ re-embed on model change │ retire on delist    Freshness and retirement L2.                L2
```

## Product Surface

### Level 1: Scope and Behavior

- **A. Screens.** Every screen, pane, or tool surface named, each with a one-line purpose: the job the user does there. A tool surface is the set of tools a product exposes to an external AI host, such as Claude or ChatGPT over MCP; the host renders it, the product only names and returns.
- **B. Components.** What sits on each screen, named from a fixed vocabulary: AI component, table, list, form, chart, detail panel, control, tool. A tool is one MCP tool as the user sees it in the host.
- **C. Entry and Exit.** How the user arrives at each screen and where they go next.
- **D. Surface Type.** Where the screen lives: web app, mobile app, CLI, chat pane, email, message, document, or host chat (the tool surface). A CLI command is a screen: its arguments are the form, its output the table or detail panel.

### Level 2: Detailed Design

- **A.1** Layout: regions in order, top to bottom, and what the user sees first. **A.2** States: empty, loading, populated, and error on every screen that loads data, each with the text the user sees.
- **B.1** Component detail: columns for a table, fields for a form, streaming or static for an AI component, with its evidence fields from Grounding C.1 and its empty-result text from Grounding D.2; for a tool, the name and description text the host shows, the inputs the host asks the user for, and the shape of the returned text, citing its Interfaces row. **B.2** Binding: the Data Model entity and attributes each component shows.
- **C.1** Interactions: every control, its trigger, and the result on the screen. **C.2** Navigation: the exact target of every exit.
- **D.1** Surface constraints: what the surface cannot do, such as no interaction inside an email, or, in a host chat, no layout and no controls: the host renders only the text a tool returns. **D.2** Permission: which role may open the screen, as one pointer line to the Data Access row. **D.3** Capability per surface: one line per surface type the product offers, saying what the user can do there, what is read-only, and which session or conversation it shares with the other surfaces, so a product reached from a web app, a phone message, and a host chat states where each action is allowed.
- **Other:** **E.** Accessibility: keyboard path and screen-reader labels. **F.** Notes and assumptions, explicit out-of-scope list.

### Legend

```
 #  Screen     Purpose              Components      Surface     Inventory L1: one row per screen.         L1
 1  Watchlist  pick a company       table, control  web app     Components: vocabulary words only.        L1
 2  Alert      tell the PM now      detail panel    message     Surface: where the screen lives.          L1

(●)──▶┌────────────────┐          ┌────────────────┐  Screen: name, one-line purpose.      L1
      │ Watchlist      │──opens──▶│ Company        │  Entry: (●) where the user arrives.   L1
      │ pick a company │          │ read a thesis  │  Exit: verb on arrow, target named.   L1
      └────────────────┘          └────────────────┘  Map: how the user moves between.     L1

╔═ Watchlist ════════════════ web app ═╗  Wireframe L2: screen name and surface.           L2
║ ┌─ Filter ─────────────────────────┐ ║  Region L2: named, in order, top to bottom.       L2
║ │ [sector v] [search..........]    │ ║  Control L2: [label] button, input, or menu.      L2
║ ├─ Results ── table ───────────────┤ ║  Component L2: region ── kind from list.          L2
║ │ Company │ Sector │ Signal        │ ║  Table L2: column names on one row.               L2
║ │ ◆ Company.name .sector           │ ║  Binding L2: ◆ Data Model entity.attribute.       L2
║ └──────────────────────────────────┘ ║
╚══════════════════════════════════════╝
empty ▶ loading ▶ populated ▶ error       States L2: four on every data screen.            L2
empty: "no company matches"               State text L2: what the user sees.               L2
[Row] click ▶ opens Company               Interaction L2: [control] trigger ▶ result.      L2

 3  Holdings tools  answer PM questions  tool ×4        host chat   Tool surface L1: one row, tools counted. L1

╔═ Holdings tools ══════════ host chat ═╗  Tool surface L2: the tool set as one screen.    L2
║ GetHoldings "holdings on a date" I-06 ║  Tool L2: name "description shown" Interfaces row. L2
║   asks: portfolio, date               ║  Inputs L2: what the host asks the user for.    L2
║   returns: rows ◆ Holding.security .qty║  Return L2: text shape ── binding.             L2
╚═══════════════════════════════════════╝
empty: "no holdings for that date"        State text L2: returned text, host shows as is. L2

 Surface     Can do                     Read-only      Shares session with
 web app     place, amend, cancel order  none           mobile app               Capability L2: one line per surface.  L2
 message     approve, ask status         blotter        web app (same user)      Read-only: what it shows but cannot change.
 host chat   ask holdings, compliance    all            none (stateless)         Shares: which conversation or state.
```

## Functional Requirements

### Level 1: Scope and Behavior

- **A. Requirement.** One "shall" sentence in an EARS pattern: ubiquitous, event (When), state (While), unwanted (If ... then), optional (Where). ID `FR-NN`. A requirement never repeats a diagram; it points to one.
- **B. Source.** The `PU-NN` it serves, or the spec sentence it comes from, quoted.
- **C. Detail.** The diagram element that holds the detail: Activity action, Interfaces row, Product Surface screen, Autonomy action, Grounding row.
- **D. Priority.** Must, should, could (MoSCoW).

### Level 2: Detailed Design

- **A.1** Preconditions and business rules the requirement depends on.
- **B.1** Rationale, one line.
- **C.1** Every diagram element that implements it, not only the main one.
- **D.1** Test link: the `AC-NN` if deterministic, the `EV-NN` if AI output; exactly one kind. **D.2** Release it lands in.
- **Other:** **E.** Requirements rejected, with reason. **F.** Notes and assumptions.

### Legend

```
 #     Requirement (EARS)                            Source  Detail         Pri    Row L1: one shall sentence.          L1
 FR-01 When a filing lands, the system shall extract PU-01   ACT [Extract]  must   Source, detail element, priority.    L1
       guidance figures.
 FR-02 If no source supports a figure, then the      PU-02   GR-01          must   Unwanted pattern: If … then.         L1
       system shall mark it unavailable.
 FR-01 pre: filing is a 10-Q or 10-K │ test: EV-01 │ rel: 1.0                      Preconditions, test link, release L2. L2
 Patterns: ubiquitous │ When (event) │ While (state) │ If … then (unwanted) │ Where (optional)   EARS patterns.  L1 L2
```

## Non-Functional Requirements

### Level 1: Scope and Behavior

- **A. Quality.** One row per quality that matters: performance, reliability, security, usability, maintainability, plus AI rows: cost per run, token budget, latency per model call, data residency. ID `NF-NN`.
- **B. Target.** A number with a unit, such as p95 under 5 s or under $0.20 per run. A target without a number is a gap.
- **C. Measure.** How it is measured and where the number comes from.
- **D. Owner.** Who is accountable for the target.

### Level 2: Detailed Design

- **A.1** The component or Interfaces row the quality applies to.
- **B.1** Load conditions under which the target holds. **B.2** Ceiling: the monthly or per-client cap, and what happens at the cap.
- **C.1** Tool, dashboard, or test that produces the number.
- **D.1** What happens on breach: alert, degrade, stop, and who is paged. For an AI quality, degrade usually means a lower Autonomy tier.
- **Other:** **E.** Trade-offs between qualities, such as cost versus latency. **F.** Notes and assumptions.

### Legend

```
 #     Quality           Target                   Measure           Owner      Row L1: one per quality.           L1
 NF-01 latency, search   p95 < 5 s                APM dashboard     KB team    Number with unit, or a gap.        L1
 NF-02 cost per run      < $0.20 │ cap $500 / mo  token log         AI Labs    AI row: cost and ceiling.          L1 L2
 NF-02 applies: Sector agent │ at 1k runs / day │ breach: drop to T1, page owner   Scope, load, breach L2.        L2
 Trade-off: NF-02 cost vs NF-01 latency: smaller model under load              Trade-off L2.                      L2
```

## Acceptance Criteria

### Level 1: Scope and Behavior

- **A. Behaviors.** One per deterministic `FR-NN`. ID `AC-NN`. Deterministic means same input, same result, pass or fail; AI output goes to Evaluation instead. Every behavior belongs to exactly one of the two.
- **B. Scenario.** Given / When / Then, happy path, in business terms.
- **C. Pass Signal.** The observable result a tester can point at.
- **D. Trace.** The `FR-NN` and `PU-NN` it proves.

### Level 2: Detailed Design

- **A.1** Edge cases and negative scenarios, one per branch in the Activity diagram.
- **B.1** Example data table per scenario (Specification by Example).
- **C.1** Measurable threshold. **C.2** Test type: manual or automated, and where the test lives.
- **D.1** Binding to the Interfaces row and Data Model attribute the scenario exercises.
- **Other:** **E.** Load tests for `NF-NN` targets. **F.** Out of scope.

### Legend

```
┌─ AC-01 filing extraction ── FR-01 · PU-01 ─┐   Card L1: one per deterministic requirement.  L1
│ Given  a 10-Q filing is in the drop folder │   Given / When / Then, business terms.         L1
│ When   ingestion runs                      │
│ Then   one Filing exists, state new        │   Pass signal: observable.                     L1
│ Edge   duplicate filing → no second entity │   Edge and negative L2.                        L2
│ Data   ticker │ period │ expected state    │   Example table L2.                            L2
│ Test   automated │ tests/ingest_test.py    │   Type and location L2.                        L2
│ Binds  I-2 ▶ ◆ Filing.state                │   Interfaces row and Data Model attribute L2.  L2
└────────────────────────────────────────────┘
```

## Agents

### Level 1: Scope and Behavior

- Agent inventory: the AI workers a product contains, as a system is a set of containers in C4. One row per agent. Runs before Autonomy, which tiers each agent's actions. Anchors: Anthropic "Building effective agents" (2024) for what counts as an agent; CSA "Agentic Universe" (April 2026) for the row attributes: autonomy, persistence, tool scope, communication pattern, trigger; Azure Architecture Center "AI Agent Orchestration Patterns" (2026-09) for Level 2 handoff patterns: sequential, concurrent, group chat, handoff, magentic. Confirmed with Hai 2026-10-21.
- **A. Agents.** Every AI worker named, with its one-line job: the outcome it owns, not the model it uses.
- **B. Trigger.** What wakes each agent, one kind from a fixed vocabulary: user turn, after run (reacts to another agent's or a user's result), background (continuous, watches data or behavior), scheduled (clock), review (periodic reflection over a window).
- **C. Surface.** Where the agent shows itself: a Product Surface screen or surface type, or hidden; and who receives its output.
- **D. Tier.** One pointer to the Autonomy action rows the agent performs (`AU-NN`), and the highest tier among them.

### Level 2: Detailed Design

- **A.1** Inputs and outputs per agent, bound to Data Model entities. **A.2** Model and cost cap: model class, tokens or dollars per run and per day.
- **B.1** Trigger detail: schedule expression, watched event or entity, debounce, and what stops a background agent. **B.2** Session and memory: what the agent remembers across runs, the Data Model entity holding it, and retention.
- **C.1** Tools per agent, as pointers to Interfaces tool rows (`I-NN`). **C.2** Delivery: the channel and the exact surface for each output, including a hidden agent's write target.
- **D.1** Handoffs: which agent calls, spawns, or waits on which, and the pattern: single, sequential, concurrent, group chat, handoff, magentic (Azure Architecture Center). **D.2** Failure: what the user sees when the agent fails or is late, and who is paged.
- **Other:** **E.** Capability dependencies: platform features each agent needs, such as scheduled runs, voice, or MCP, as pointers into the dated capabilities reference, never vendor names. **F.** Notes and assumptions.

### Legend

```
 #     Agent          Job                          Trigger     Surface            Tier      Inventory L1: one row per agent.   L1 L2
 AG-01 Chat agent     answer holdings questions    user turn   chat pane          AU-11 T1  Trigger: one vocabulary word.      L1 L2
 AG-02 Next-question  suggest the next question    after run   chat pane, hidden  AU-13 T1  Surface: screen, or hidden.        L1 L2
 AG-03 Signal scout   find strong signals daily    scheduled   message (Slack)    AU-14 T2  Tier: highest Autonomy row.        L1 L2
 AG-04 Week reviewer  review decisions, prep week  review      document           AU-15 T2
Rule check: 4 agents · 4 with AU pointer · 1 hidden                                        Rule check: one line under table.  L1 L2

AG-03  in: ◆ Quote, PriceColor │ out: ◆ Signal           Inputs and outputs L2: ◆ Data Model entities.  L2
AG-03  cron 06:30 ET weekdays │ stop: kill switch        Trigger detail L2.                               L2
AG-03  model: large │ cap: $2 per run, $40 per day       Model and cost cap L2.                           L2
AG-03  tools: I-05, I-06 │ memory: ◆ AgentRun 90 d       Tools and memory L2: pointers.                   L2
AG-03  ──▶ AG-04 (pipeline) │ late: "no signal today"    Handoff and failure L2.                          L2
AG-03  needs: scheduled run, message channel             Capability L2: pointer into the reference.       L2
```

## Memory

### Level 1: Scope and Behavior

- What each agent keeps between runs, as a human analyst keeps notes, habits, and a sense of what mattered. Kinds after CoALA (Sumers et al. 2023): working (this session), episodic (what the agent did and decided), semantic (what it knows; points to Knowledge), procedural (instructions and skills it follows). Scoring after Generative Agents (Park et al. 2023): recency, importance, relevance. Consolidation after the 2026 sleep-style features: Claude Code Auto Dream, ChatGPT Dreaming, Letta sleep-time compute. `Inferred`: confirm.
- **A. Memories.** One row per memory kind per agent, `ME-NN`: kind, the agent that writes it (`AG-NN`), one line on what it holds; a semantic row is a pointer to a `KN-NN` corpus, never a copy.
- **B. Scope and Owner.** Per user, per agent, or shared across users; the person who owns it and may see it.
- **C. Persist and Resume.** What persists when a run ends: full transcript, summary, extracted facts, or nothing; what loads when a session resumes: full, summary, last N turns, or by relevance.
- **D. Retention.** Forever, age limit, decay, or pinned; and the forget right: what a user can delete and whether derived memories go with it.

### Level 2: Detailed Design

- **A.1** Entity: the Data Model entity and attributes holding each row, with the link to the run or session it came from. **A.2** Size: entries per user and growth per day.
- **B.1** Write rule: when a memory is extracted, by the agent during the run or by a consolidation run after it, and what is never written: secrets, fields the Data Access section bars, other users' data. **B.2** Consolidation: trigger (after N sessions or hours, or on demand), what it does (merge duplicates, drop contradicted facts, turn relative dates absolute, cap the index), who reviews the result, and whether the user can see the diff.
- **C.1** Resume recipe: load order and token ceiling, which rows load whole, which as summary, which on demand. **C.2** Salience: the score that ranks memories for loading, recency, importance, relevance, with weights; pinned events that always load; who may pin.
- **D.1** Decay: the function or schedule by which unpinned memories fade, and what revives one (re-use, re-mention). **D.2** Forget: user delete removes the memory and every memory derived from it; audit of reads and deletes; retention law pointer when one applies.
- **Other:** **E.** Capability dependencies: memory, scheduled run for consolidation, as names from `references/agent-capabilities.md`. **F.** Notes and assumptions.

### Legend

```
 #     Agent  Kind        Holds                      Scope     Persist   Resume        Retention        Register L1.    L1 L2
 ME-01 AG-01  working     this chat's turns          per user  summary   last 20 turns session end      one row per     L1 L2
 ME-02 AG-01  episodic    questions asked, answers   per user  facts     by relevance  decay 90 d       kind per agent  L1 L2
 ME-03 AG-04  episodic    decisions, reviews, memos  shared    facts     by relevance  pinned, forever  semantic row =  L1 L2
 ME-04 AG-04  semantic    sector playbooks ▶ KN-03   shared    pointer   whole         per KN-03        KN pointer      L1 L2
 ME-05 AG-04  procedural  review checklist           per agent file      whole         until edited                     L1 L2
Rule check: 5 rows · 2 pinned or forever · 1 forget right stated                                        one line        L1 L2

ME-02  ◆ AgentMemory.text .kind .score .source_run_id .created          Entity L2: ◆ Data Model entity.attributes.  L2
ME-02  write: agent at run end │ never: credentials, other clients      Write rule L2.                              L2
ME-02  consolidate: after 5 sessions or 24 h │ merge, drop, absolute dates │ user sees diff   Consolidation L2.       L2
ME-02  resume: pinned ▶ score top 30 ▶ ≤ 8k tokens │ rest on demand     Resume recipe L2: order and ceiling.        L2
ME-02  salience: 0.5 recency + 0.3 importance + 0.2 relevance │ pin: user, PM   Salience L2.                        L2
ME-02  decay: half-life 30 d │ revive on re-use │ delete removes derived Decay and forget L2.                        L2
```

## Autonomy

### Level 1: Scope and Behavior

- **A. Actions.** Every decision or side effect, AI or human, one verb phrase each, with the agent, system, or role that performs it.
- **B. Tier.** Launch tier and target tier per action on one scale: T0 Human Only, T1 AI Assists, T2 AI Proposes (human-in-the-loop), T3 AI Acts, Human Monitors (human-on-the-loop), T4 AI Acts Alone (human-out-of-the-loop). The path from launch tier to target tier is the rollout plan.
- **C. Human Checkpoints.** Which role approves before the action (T2) or reviews after it (T3).
- **D. Escalation and Override.** When the AI hands back to a human, and how a human stops it.

### Level 2: Detailed Design

- **A.1** Risk profile: reversibility, blast radius, cost of error, and the risk rating of every Interfaces tool the action calls. **A.2** Volume: actions per day.
- **B.1** Conditional tiers, such as T3 below a threshold and T2 above it. **B.2** Promotion and demotion criteria, as one pointer line to the Evaluation row that gates them (`EV-NN`, Evaluation D.1).
- **C.1** Approval deadline, timeout default, and load per approver. **C.2** Evidence pack: what the approver sees, bound to Data Model entities and a named Product Surface screen.
- **D.1** Escalation triggers with thresholds, such as low confidence or conflicting sources. **D.2** Undo mechanism, kill switch, and accountable owner.
- **Other:** **E.** Audit trail: the run entity in the Data Model, and retention. **F.** Notes and assumptions, explicit out-of-scope list.

### Legend

```
 #     Action               Performer     T0  T1  T2  T3  T4   Checkpoint       Map L1: one row per action.        L1 L2
 AU-01 Ingest news          Ingest agent                  ●    audit only       ● launch tier.                     L1 L2
 AU-02 Issue buy / sell     Sector agent          ●━━━○        Analyst before   ○ target tier; ━ promotion path.   L1 L2
 AU-03 Execute trade        PM            ●                    human only       Checkpoint: role, before / after.  L1 L2
Rule check: AU-03 irreversible + external → T0 ✓                                 Rule check: one line under map.    L1 L2

AU-02  T2 ━━▶ T3  when agreement ≥ 95% over 200 recs    Promotion L2: criterion on the path.       L2
AU-02  T3 if position < 1%; else T2                     Conditional tier L2: threshold per tier.   L2
AU-02  approve ≤ 4 h │ timeout: expire │ 20 per day     Checkpoint L2: deadline │ default │ load.   L2
AU-02  ◆ Recommendation.thesis .confidence .sources     Evidence L2: ◆ Data Model entity.attribute. L2
AU-02  escalate: confidence < 0.6 │ stop: kill switch   Escalation and override L2.                L2
```

## Grounding

### Level 1: Scope and Behavior

- **A. Sources.** One row per AI output a person or a system acts on. ID `GR-NN`. The Data Model entities and attributes the output may be built from, and the system of record each comes from. An output whose source is not a Data Model entity has no source, and that is a gap.
- **B. Scope.** What the AI may reach, granted explicitly: entities, documents, tools, folders. Nothing by default; the list is closed, and anything not on it is out of reach.
- **C. Evidence.** What every output element carries back to its source: the entity and attribute, the reference, the as-of. An element with no evidence is not shown as fact.
- **D. Empty Result.** What happens when no source supports an element: the output says so and stops. It never fills the gap with a plausible value. The text the user sees.

### Level 2: Detailed Design

- **A.1** Freshness per source: as-of, refresh cadence, and the age at which the output must say stale. **A.2** Retrieval: query, lookup, search, or the whole record, and the key it joins on.
- **B.1** Entitlement at retrieval: the Data Access filter for the agent applies before the model reads, never only on the screen; one pointer line to Data Access C.2. **B.2** Input as data: text that arrives inside a source, such as a document or a message, cannot change scope, tools, or instructions.
- **C.1** Citation schema: the fields each element carries, bound to Data Model attributes, such as source_id, span, value, as_of, and which are required. **C.2** Pointer or passage: whether the user sees a reference or the quoted text, and on which Product Surface screen.
- **D.1** Partial result: which elements may still be shown when others are unavailable, and how the gap is marked. **D.2** Refusal text per case: no source, stale source, conflicting sources.
- **Other:** **E.** Memory: what the AI retains across runs, for how long, and how a user makes it forget. **F.** Notes and assumptions, explicit out-of-scope list.

### Legend

```
 #     Output                Source ◆ entity.attr    Evidence           Empty       Register L1: one row per AI output.    L1
 GR-01 Guidance figure       ◆ Filing.text │ EDGAR   span + filing_id   unavailable ◆ Data Model source of truth.          L1
 GR-02 Test-fail explanation ◆ TestRun.contributions run_id + clause    "no run"    Evidence: what each element carries.   L1
 Scope: Filing, TestRun, Instrument │ tools: none │ nothing else                    Closed list L1: the rest is out of reach. L1
 GR-01 as-of: filing date │ stale > 90 d → say stale                                Freshness L2.                          L2
 GR-01 filter: DA-03 applied before retrieval                                       Entitlement at retrieval L2.           L2
 GR-01 input is data: text inside a filing changes nothing                          Input as data L2.                      L2
 GR-01 cites { source_id*, span*, value*, as_of* }                                  Citation schema L2. * required.        L2
 GR-01 partial: show figure, mark period unavailable                                Partial result L2.                     L2
 GR-01 empty: "No filing supports this figure."                                     Refusal text L2.                       L2
 Memory: none across runs │ forget: n/a                                             Memory L2.                             L2
```

## Evaluation

### Level 1: Scope and Behavior

- **A. Evaluated Outputs.** Every AI action at T1 or above in Autonomy, one row per output and quality dimension. ID `EV-NN`. Deterministic behavior goes to Acceptance Criteria instead.
- **B. Quality Dimensions.** What good means for that output: accuracy, groundedness, format, refusal when it should refuse.
- **C. Method.** Human review, reference match, code check, LLM judge, or business metric, per dimension.
- **D. Bar and Signer.** The pass threshold to launch, the count that must be zero (a wrong answer with no flag on it), and the one person who signs.

### Level 2: Detailed Design

- **A.1** Dataset: source, size, who labels it, where it lives. The person who knows the domain writes it, not engineering. **A.2** Slices: per sector, per client, edge cases, adversarial inputs.
- **B.1** Rubric per dimension with scale anchors, written so two graders agree.
- **C.1** Judge model and prompt, calibrated against human agreement; code checks preferred wherever the output is structured. **C.2** Cadence: pre-release, on every prompt or model change, regression on every PR, online sample.
- **D.1** Promotion and demotion criteria per Autonomy tier (fills the Autonomy Level 2 pointer). **D.2** Regression gate: the score below which the feature does not ship, and the kill path.
- **Other:** **E.** Online monitoring and drift; model change management: the dataset re-runs before the feature stays on after the provider changes the model. **F.** Eval cost and latency budget.

### Legend

```
 #     Output (AU)      Dimension    Method            Bar       Zero              Register L1: one row per output and dimension. L1
 EV-01 Guidance (AU-06) accuracy     reference match   ≥ 18/20   unflagged wrong   Bar to launch, and the count that must be 0.  L1
 EV-02 Guidance (AU-06) groundedness code: span ⊂ src  100%      unsourced         Groundedness tests the GR-NN row.              L1
 Signer: Analyst lead                                                              One name for the register L1.                  L1
 EV-01 set: 20 filings │ labelled by: Analyst │ tests/golden/                      Dataset L2.                                    L2
 EV-01 slices: large cap │ small cap │ restated filings                            Slices L2.                                     L2
 EV-01 rubric: 3 exact │ 2 rounding │ 1 wrong period │ 0 wrong                     Rubric anchors L2.                             L2
 EV-01 T2 ━━▶ T3 when ≥ 95% over 200 │ T3 ━━▶ T2 when < 90% over 50                Promotion and demotion L2.                     L2
 EV-01 cadence: pre-release │ prompt change │ every PR │ 1% online                 Cadence L2.                                    L2
 Model change: pin model id │ re-run the set before the flag returns               Model change management L2.                    L2
```

## Operation

### Level 1: Scope and Behavior

- What it costs to run each agent, what stops it running away, what is seen when it runs, and how a model or prompt change reaches users. Non-Functional Requirements hold the targets; Evaluation holds the bar; Operation holds the bill, the limits, the traces, and the change path. After SRE practice (Google SRE book: SLOs, error budgets, on-call) and the LLMOps literature. `Inferred`: confirm.
- **A. Cost.** One row per agent, `OP-NN`: cost per run and per user per day, in dollars, and the monthly ceiling; `Unknown` when the spec gives no price.
- **B. Limits.** Rate limit, concurrency, and token budget per agent and per user; what happens at the limit: queue, refuse, degrade.
- **C. Observability.** What is recorded per run (the run entity), where a person views it, and who watches; the one signal that pages someone.
- **D. Change Control.** Who may change the model, the prompt, or a tool list; what runs before the change reaches users; how it is rolled back.

### Level 2: Detailed Design

- **A.1** Cost formula: tokens in and out, tool calls, model class, times the price, per run; alarms at a share of the monthly ceiling. **A.2** Cost by tier of user or client, and who sees the bill.
- **B.1** Limit values per user tier and per agent, matched to the Non-Functional Requirements rows. **B.2** Degrade order: smaller model, fewer tools, shorter context, refuse; the user text at each step.
- **C.1** Trace fields: run id, agent, trigger, model and prompt version, tool calls, tokens, cost, latency, outcome, approvals; retention. **C.2** Dashboards and alerts: which metric, which threshold, who is paged, severity.
- **D.1** Release path: evaluation run against the Evaluation dataset, canary share, promotion rule, rollback trigger and time. **D.2** Incident: severity scale, on-call, user communication, post-incident review feeding Risks.
- **Other:** **E.** Capability dependencies: names from `references/agent-capabilities.md`. **F.** Notes and assumptions.

### Legend

```
 #     Agent  Cost / run  Cost / user / day  Monthly cap  Limits                    Traced     Change owner   Register L1. L1 L2
 OP-01 AG-01  $0.04       $2                 $4,000       20 / min, 2 concurrent    run entity AI Labs lead    one row per   L1 L2
 OP-02 AG-03  $1.50       n/a, scheduled     $500         1 run / day               run entity Unknown         agent         L1 L2
Rule check: 2 rows · 2 with a cap · 1 change owner Unknown · pages: cost > 80 % of cap                     one line      L1 L2

OP-01  cost = (tokens_in × $3 + tokens_out × $15) / 1M + tool calls × $0 │ alarm at 80 %   Cost formula L2.     L2
OP-01  limits: Pro 20 / min, Enterprise 60 / min │ at limit: queue 30 s, then refuse       Limit values L2.     L2
OP-01  degrade: small model ▶ no web search ▶ 8k context ▶ refuse "assistant busy"         Degrade order L2.    L2
OP-01  trace: run_id, agent, trigger, model@ver, prompt@ver, tools, tokens, cost, ms, outcome │ 400 d   Trace L2. L2
OP-01  alert: p95 latency > 8 s for 5 min ▶ page on-call, Sev 2                            Alert L2.            L2
OP-01  release: EV-03 run ≥ bar ▶ 5 % canary 24 h ▶ promote │ rollback: EV-03 < bar, 10 min   Release path L2.  L2
```

## Risks and Failure Modes

### Level 1: Scope and Behavior

- **A. Failure Modes.** Per AI action or component, one row each: hallucination, stale data, prompt injection, wrong tool call, silent failure, cost runaway. ID `RK-NN`.
- **B. Effect.** Who is hurt and how, in business terms.
- **C. Severity.** High, medium, low.
- **D. Guard.** Prevention or detection, with an owner, naming the section that holds it. A row with no guard is a gap.

### Level 2: Detailed Design

- **A.1** Cause. **A.2** OWASP LLM Top 10 category, where one applies.
- **B.1** Blast radius and reversibility, matching the Autonomy risk profile.
- **C.1** Risk Priority Number: severity × occurrence × detection.
- **D.1** Detection signal and alert: what fires, who is paged. **D.2** Fallback and recovery: what the user sees, and how the system degrades, such as dropping to a lower Autonomy tier.
- **Other:** **E.** Residual risk and who accepts it, by name. **F.** Notes and assumptions.

### Legend

```
 #     Failure mode                 Effect                     Sev   Guard                    Register L1: one row per failure mode.  L1
 RK-01 hallucinated guidance figure PM acts on a wrong number  high  GR-01 evidence required  Guard names the section that holds it.  L1
 RK-02 injection via filing text    agent changes its scope    high  GR B.2: input is data    Severity: high, medium, low.            L1
 RK-03 cost runaway on refetch      budget breached            med   NF-02 cap                                                        L1
 RK-01 cause: model fills a gap │ OWASP LLM09 misinformation                                  Cause and category L2.                  L2
 RK-01 blast: one report │ reversible before send (AU-10 T2)                                  Blast radius and reversibility L2.      L2
 RK-01 RPN: 3 × 2 × 2 = 12                                                                    Severity × occurrence × detection L2.   L2
 RK-01 detect: EV-02 online < 100% │ page: AI Labs                                            Detection and alert L2.                 L2
 RK-01 fallback: figure shown unavailable │ AU-06 drops to T1                                 Fallback and degrade L2.                L2
 Residual: rounding under 1% │ accepted by: Analyst lead                                      Residual risk, by name L2.              L2
```

## Decision Log

### Level 1: Scope and Behavior

- **A. Decision.** The question, with the skill and gap it came from. ID `DEC-NN`. One row per `Unknown` across every output; the counts match.
- **B. Status.** Open, spike, proposed, decided, superseded. A spike waits on the model, not on a person: it closes by a run against the Evaluation dataset, not by a meeting.
- **C. Answer.** The chosen option, one line.
- **D. Owner and Date.** Who decided, when. For a spike: who runs it, by when.

### Level 2: Detailed Design

- **A.1** Context: what was true when the question was asked.
- **B.1** Options considered, with trade-offs, one line each.
- **C.1** Consequences: which sections change, by ID.
- **D.1** Supersedes or superseded by.
- **Other:** **E.** Revisit trigger: the fact that would reopen it. **F.** Notes.

### Legend

```
 #      Question (source)                          Status    Answer              Owner · date       Row L1: one per Unknown.                L1
 DEC-01 Does an AI update go live unseen? (AU-06)  decided   no, T2 at launch    Product · 09-29    open │ spike │ proposed │ decided.      L1
 DEC-02 Can the model map nested clauses? (EV-01)  spike     run 5 cases first   AI Labs · by 10-06 Spike: closed by a run, not a meeting.  L1
 DEC-01 context: PM reads the view directly (C4 L1)                                                 Context L2.                             L2
 DEC-01 options: T2 now │ T3 with sample review │ T4                                                Options L2.                             L2
 DEC-01 changes: AU-06, Activity handoff, Product Surface screen 4                                  Consequences by ID L2.                  L2
 DEC-01 revisit: EV-01 ≥ 95% over 200 runs                                                          Revisit trigger L2.                     L2
```

## Cross-Section Rules

1. Every C4 arrow that crosses the system boundary or joins two containers is one Interfaces row. Level 2 Interfaces then supplies the message names for the sequence diagram.
2. Every object on an Activity object-flow arrow and every field in an Interfaces payload is a Data Model entity or attribute. Every database container in C4 Level 2 holds a named subset of the entities.
3. Every component at Level 2 Product Surface binds to a Data Model entity or attribute; a component with no binding is decoration or a missing entity. Every Activity action a person performs happens on a named screen.
4. Every Autonomy action is an Activity action; autonomy adds a tier, never a new action. Every T2 checkpoint is a cross-lane handoff in Activity and a named Product Surface screen. Every AI action at T1 or above has a run entity in the Data Model carrying trigger, model and prompt version, tool calls, approvals, errors, and cost, with a retention period.
5. **Purpose to Requirement:** every `PU-NN` success measure is served by at least one `FR-NN` or `NF-NN`.
6. **Requirement to Test:** every `FR-NN` is tested by exactly one kind: `AC-NN` if deterministic, `EV-NN` if AI output. Every `NF-NN` has a number and a measure.
7. **Requirement to Diagram:** every `FR-NN` points to at least one diagram element; every Activity action traces back to an `FR-NN`, or is a gap.
8. **Autonomy to Evaluation:** every T1 to T4 AI action has an `EV-NN` row; its bar gates tier promotion, and a bar with no signer gates nothing.
9. **Autonomy to Risk:** every T3 and T4 action has at least one `RK-NN` row with a guard.
10. **Grounding to Data Model:** every Grounding source is a Data Model entity with a named source of truth, and every citation field is a Data Model attribute. An AI output with no `GR-NN` row is decoration or a missing source.
11. **Grounding to Evaluation and Risk:** every `GR-NN` row has an `EV-NN` groundedness row and an `RK-NN` hallucination row; the Grounding empty-result behavior is that row's guard.
12. **Grounding to Data Access:** every entry in a Grounding scope is a Data Access row for the agent, filtered at retrieval. An agent scope with no Data Access row is a gap.
13. **Tools to Autonomy:** every tool an agent may call is an Interfaces row with a risk rating; a high-risk tool makes every Autonomy action that calls it T2 at minimum.
14. **Unknown to Decision:** every `Unknown` in any output becomes a `DEC-NN` row; one that waits on the model is a spike and closes by a run against the Evaluation dataset.
15. **Words:** every Data Model entity and every box name in C4 and Activity is a Glossary term; a banned synonym anywhere is a gap.
16. **Container to Deployment:** every C4 Level 2 container is an instance in each Deployment environment, or is marked not deployed there; every data store names its region.
17. **State to Autonomy and Data Model:** every state is a value of one Data Model Level 2 attribute; every State Machine event an AI fires is an Autonomy action; a transition a process performs is an Activity action.
18. **Agents to Autonomy, Interfaces, and Product Surface:** every `AG-NN` points to at least one `AU-NN`; every tool an agent lists is an `I-NN` row; every visible agent surface is a Product Surface screen, and a hidden agent names the Data Model entity it writes.
19. **Knowledge to Grounding, Interfaces, Product Surface, and Autonomy:** every Grounding source that is searched rather than looked up by key is a `KN-NN` row; every `KN-NN` agent path is an `I-NN` tool row and every person path is a Product Surface screen, so a Library screen or a retrieve tool exists because a corpus row demands it; every feedback arrow is an Autonomy action with a tier.
20. **Memory to Agents, Data Model, Knowledge, and Data Access:** every `ME-NN` names the `AG-NN` that writes it and the Data Model entity that holds it; a semantic row points to a `KN-NN`; every row has a Data Access row for who may read, pin, and delete; every consolidation run is an Autonomy action.
21. **Operation to Agents, Evaluation, Non-Functional Requirements, and Risks:** every `AG-NN` has one `OP-NN` row, and its Agents Level 2 cost cap equals that row; every model or prompt change runs an `EV-NN` before promotion; every limit value matches an `NF-NN`; every incident severity maps to an `RK-NN` guard.
