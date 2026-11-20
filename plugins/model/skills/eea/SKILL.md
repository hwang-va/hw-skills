---
name: eea
description: The EEA model (Entities, Events, Actions) and its runtime counterpart (store, query, message, clock, route, guard, worker, door), a shared vocabulary for describing a real-world domain so it can become a spec, a repo and an AI-native system. Use this skill whenever the user invokes /eea, says "EEA", "runtime model", "map this to EEA", "break this description into EEA pieces", "is this a thing, a record or state", "check or trigger", or gives a plain-language description of a business process, team workflow or agent system and asks how to model it, spec it, structure a repo for it or make it AI-native. Also use it when reviewing an existing codebase against the two models, and before writing a data model, workflow or agent design for a domain the user described in words, even if they do not name EEA.
---

# /eea : describe a real world, then build it

## Why this exists

A domain owner can describe a process in plain words (a PM describing a morning research routine, an operations lead describing a compliance check) but that description is not yet something a team or an AI agent can build. The hard part is the middle: without a structure between the prose and the code, a large system is one big problem that cannot be split, checked or scaled. The EEA model is that structure for the real world, and the runtime model is its counterpart for the software. Once a domain is in these pieces, each chain, each record shape and each worker is a sub-problem that can be built and tested alone.

Use the words below consistently, one term per idea, so every output lines up with the last.

## The EEA model: what exists and what happens

Three top-level concepts. An **entity** is what exists, an **event** is what happens, an **action** is what is done in response. Nothing else needs a top-level box.

### Entities (nouns)

| Kind | Where its data comes from | Test | Examples |
|---|---|---|---|
| **Thing** | Is there. Entered and kept up to date. | It is what records are about, and stays the same thing while records pile up. | company, stock, sector, portfolio, a user, a rule |
| **Record** | Is written. Once, by an actor, about a thing, at a moment. Never changed afterwards. | It cannot be rebuilt from anything else. | trade, price, news item, filing, report, order, decision |
| **State** | Is calculated. Read from the records as of a date. | It can be rebuilt from other records. | holding, exposure, profit and loss, the current thesis |

- **Things include four special kinds:** books (a grouping that says whose: portfolio, watchlist), actors (a human or an AI agent, with a role and rights), rules (checks and triggers, below), and methods (how an action is carried out: a skill file, a checklist, a payment procedure).
- **A record is a fact or a claim.** A fact reads the same whoever wrote it. A claim (a thesis, "overvalued") depends on its author, so it carries its evidence. Evidence is the role a record plays when a claim points to it.
- **A record that changes is a series of versions.** Each update is a new record. "The current one" is state: a pointer to the latest version. "Our thesis" (state) and "our thesis over the year" (history) are two questions on the same records.
- **State belongs to the thing, not to a record.** The records are the thing's history; the state is where that history leaves it as of a date.

### Events (past-tense verbs)

An event is a happening, a moment of change, not a fourth kind of entity. It has three sources: a record is written, state fails a check, or a set time arrives. They come at three levels, each built from the one below: **raw** (a fact record arrives from outside), **calculated** (state fails a check; a program can detect it), **judged** (an actor concludes something changed and writes a claim).

An event is not stored itself. Its trace is the record that was written, or an alert record written for a calculated event.

### Actions (instruction verbs)

An action is done by an actor, following a method, and writes a new record. That record is the next event, which is how a chain continues. The chain ends when an event happens that no trigger reacts to. Reading state is not an action: it writes nothing and creates no event.

### Rules: check and trigger

| Kind | What it says | Applied to | Everyday name |
|---|---|---|---|
| **Check** | A condition that must hold. Pass or fail. | An actor, before an action | Permission |
| | | A record, when written | Validation |
| | | State, at any time | Limit |
| **Trigger** | When an event of this kind happens, start that action, by that actor. | An event | Routing |

A check is a thing, not an event. Four pieces sit around one check: the check itself (thing), testing it (action), the result (record), and it failing (event). A trigger sits outside the record it reacts to, because one record can trigger several actions and that list changes while a record never does.

### Traps

- **One word, two meanings.** "Portfolio" is the book (a thing) and also what it holds today (state). "Payroll" is the rules (a method) and also the monthly run (an action). Say which one you mean.
- **A holding is state**, not a thing or a record. The trades are the records.
- **"Overvalued" is a claim**, not state, unless a check fixes the rule ("P/E above its 10-year 90th percentile").
- **Do not tag a record.** A news item is never changed. An agent that judges it critical writes a new assessment record pointing to it.
- **Time is an event.** A scheduler is not a new EEA piece; it is the runtime part that notices the time event.

## The runtime model: how it runs

EEA says nothing about software, by design. Each EEA piece has one runtime counterpart:

| Runtime part | What it does | EEA piece it carries |
|---|---|---|
| **Store** | Keeps things and records. Decides and calculates nothing. | Thing, Record |
| **Query** | Calculates state when asked. Only reads. | State |
| **Message** | A small note that an event happened: kind, about what, when, the record's id. | Event |
| **Clock** | Turns time into messages, from a schedule. | Event from time |
| **Route** | Delivers each message to the workers that should react. Holds the triggers as a table. | Trigger |
| **Guard** | Tests a check and acts on the answer. | Check |
| **Worker** | Does an action: a program, an AI agent or a human. | Action |
| **Door** | How an actor gets in: a screen, an endpoint, an agent tool. | None |

- **The shape is not the store.** A proto message or Pydantic model defines the fields of a thing or record; it is a spec the machine enforces, shared by every part. The database keeps the data.
- **The check says what must be true, the query finds what is true, the guard compares the two.** A query never writes; the guard writes the result record.
- **Two guards block, one reports.** Permission and validation stop a request before anything happens. A limit on state is tested after the change, so it can only save a result and raise an event.
- **A message with no matching line in the route goes nowhere.** That is how a chain ends at runtime.
- **A human can be a worker.** A human is inside the process but outside the software, connected by doors in both directions: a notification out, a screen back in. An AI agent is connected the same way through its tools. Going AI-native swaps the worker and leaves message, route and store as they are.
- **Wiring and deployment are outside both models.** Wiring is how parts connect at startup; deployment is where they run.

## The four columns

Use this to carry a model down to a spec and a repo. Use conventional folder names in a real repo and keep the model as the map beside it.

| EEA piece | Spec section | Runtime part | Conventional home |
|---|---|---|---|
| Things, record shapes | Glossary, data model | Shape, Store | `models/` or `.proto`, `db/` |
| State | Data model: what is calculated, and how | Query | `services/` |
| Events, triggers | Activity, sequence, lifecycle | Message, Clock, Route | `events/`, `config/triggers`, `config/schedule` |
| Actions | Requirements; agents and autonomy | Worker | `services/`, `agents/` |
| Checks | Requirements (limits), data access (who may) | Guard | `validators/`, `config/checks`, auth |
| Actors | Roles, autonomy | Door | `api/`, `web/`, `tools/` |
| (none) | C4 containers, deployment | Wiring, deployment | startup code, `infra/` |

A repo then has two axes: top-level folders split by runtime part, and inside each, files split by EEA thing (one per domain noun).

## Procedure: from a description to a system

1. **Tag the words.** Nouns become entities; sort each into thing, record or state with the tests above. Time words and "when" become events. Verbs become actions. "If", "only" and "different types" become checks and triggers.
2. **Lay out the chain.** One row per step: the event that triggers it, the actor and action, the record written. Mark where the chain ends.
3. **List the remaining pieces.** Things (with books, actors, methods), state versus claims, checks.
4. **List what the description leaves open, and ask.** A plain description always has gaps (for example: what tells the synthesis step that all inputs are in?). These are the owner's decisions. Put them back to the owner as questions; if you fill them silently, the system is built on guesses.
5. **Map down when asked.** Runtime parts and spec sections with the four columns, then a repo sketch. Prefer executable stages (shapes as models, triggers, checks and schedule as data files), because a stage the program runs cannot drift from the code.
6. **Advise one chain first.** A model is unproven until something runs: build one chain end to end, then widen.
7. **Name the limit.** The models get the structure right. They do not say whether an agent's judgment is any good; that needs evaluation from the start.

## Output format

- Tables for mappings, and one concise ASCII diagram per idea when the user asks for one. In diagrams, write EEA and runtime words in capitals (THING, RECORD, TRIGGER, GUARD) so the model shows through the example.
- Mark invented examples and hypotheticals as such. When reading existing code, say what was verified in the code and what is inferred.
- If the user works one point at a time, give one point per reply and let them ask for the next.

**Example of a chain table** (from a morning research description):

| Step | Event (trigger) | Actor and action | Record written |
|---|---|---|---|
| 1 | Time: the morning arrives | Morning agent reads news, posts and the research inbox | Signals, each with timestamp, sector and source |
| 2 | Signal created, routed on its sector field | Sector agent researches | Sector report |
| 3 | All sector reports are in (open: what tells it?) | Synthesis agent aggregates | Morning digest |
| 4 | Digest created | PM reviews | None if nothing stands out; the chain ends |

## Where the ideas come from

The names are this skill's own, chosen so each runtime part lines up with one EEA piece. The ideas are classics, worth reading when a question goes deeper:

- **Event Storming and Domain-Driven Design:** domain event, command, policy (the trigger here) and read model (state here).
- **CQRS and event sourcing:** writes and reads kept separate; save every event and calculate state from them.
- **Event-driven architecture and Enterprise Integration Patterns:** message, router, broker.
- **Ports and adapters (hexagonal architecture):** the core is reached only through ports (the door here).
- **UML state machines:** the guard condition.
