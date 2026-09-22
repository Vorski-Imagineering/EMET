# CLAUDE.md / AGENTS.md

## 1. Mandate

This repository is the working surface of **EMET**, a consultancy practising **empathic agent design**.

*Emet* (אמת) is the word inscribed on the golem's forehead, which animates the made thing; strike the aleph and *met* (מת), "dead", remains. It also means **truth**. Both readings are the standard of the practice: we build agents that are alive to the people they serve, and we are honest about what they are and are not.

Agents operating here act as **transparent, auditable collaborators** — not assistants. Outputs accumulate into a body of method: how to design agents that read context well, respond to people as people, and fail gracefully.

Everything written here is **public and permanent**. Write so others can build on, inspect, cite, or fork your work.

---

## 2. Sensitive Information Policy (Highest Priority — Non-Negotiable)

This repository is public. Violations are **irreversible**. This policy overrides all other guidance below.

Because this is a consultancy, the likeliest leak is **client material**, not research material. §2.2 is the section that matters most here and has no equivalent in a research commons.

### 2.1 Never include

- Personal identifiable information (PII)
- Names of private individuals (use roles, e.g. "the founder", "an engineer")
- Private conversations, DMs, Slack/Discord excerpts
- Credentials, API keys, tokens, `.env` contents
- Company-internal URLs, ticket IDs, internal tool links
- Non-public business, financial, or roadmap data
- Contract terms or anything shared under NDA / expectation of privacy

### 2.2 Never include — client and commercial (EMET-specific)

- **Client or prospect names**, or any description identifying either
- **Engagement details** — scope, deliverables, timelines, status
- **Rates, proposals, SOWs, invoices, contract terms**
- **Anything learned inside an engagement**, including in paraphrase or as an unattributed "we once saw…" anecdote
- **Case studies, even anonymised, without written client sign-off**

Client and commercial material does not live in this repository at all. There is no directory here where it is acceptable.

### 2.3 Pre-write checklist (run mentally before writing ANY file)

- [ ] No names of private individuals (replaced with role)
- [ ] No client or prospect names, nor identifying description of either
- [ ] No engagement scope, deliverables, timelines, or status
- [ ] No rates, proposals, SOWs, or contract terms
- [ ] Nothing learned inside an engagement, including paraphrased or anonymised
- [ ] No company-internal URLs, ticket IDs, or chat excerpts
- [ ] No API keys, tokens, or `.env` contents (grep output for `sk-`, `key=`, `token=`, `password=`, `Bearer `)
- [ ] No quoted private messages or DMs
- [ ] No financial figures, contract terms, or NDA-bound roadmap items
- [ ] No PII (names, emails, phone numbers, addresses)

**If any box is unchecked, do not write. Ask the user.**

### Explicit rule

> If the information would be inappropriate on a public website, it does not belong in this repository.

### When in doubt

Do not include it. Replace with abstraction, anonymization, or omission.

---

## 3. File Layout & Naming Conventions

### Directory layout

```
research/
  logs/        # Date-stamped activity logs — what was done, when, why
  notes/       # Working notes — raw thinking, sub-questions, fragments
  synthesis/   # Clean, structured outputs that stand alone
specs/         # Design specs — internal, not published
docs/          # ⚠ THE PUBLISHED WEBSITE — see below
```

### `docs/` is the live website

`docs/` is the GitHub Pages source. Anything committed there appears at **https://emet.audax.earth**. Nothing internal — specs, notes, drafts, scratch work — goes in `docs/`. Design specs go in `specs/`.

### Naming rules (mandatory)

- **kebab-case, lowercase, ASCII only** — e.g. `empathic-defaults-vs-explicit-consent.md`
- **Logs**: one file per topic, append entries with `## YYYY-MM-DD` headings inside it. File: `research/logs/<topic>.md`.
- **Notes**: one file per topic. File: `research/notes/<topic>.md`.
- **Synthesis**: one file per topic. File: `research/synthesis/<topic>.md`.
- No spaces, no Title Case, no Unicode in filenames.

### Repo memory vs agent memory

- **Repo memory (`research/`)**: durable, public, citable knowledge. Anything another agent or human should be able to find later belongs here.
- **Agent memory (`~/.claude/.../memory/`)**: private session/user context only — preferences, ongoing task state, user profile. **Never put method or research findings here**; they belong in the repo.

---

## 4. Required Workflow

### Pre-conditions — before starting any task

1. Run `ls research/logs/` and `ls research/notes/` and `ls research/synthesis/`.
2. Grep the repo for the topic and adjacent terms.
3. State in your first response one of:
   - `Prior work found: [list of files]` — and explain how you'll cite or supersede it.
   - `No prior work on this topic.`

Skipping this step is a protocol violation.

### The loop (use these verbs, in order)

1. **Scan** — `ls research/` + grep for prior coverage.
2. **Decompose** — write sub-questions to `research/notes/<topic>.md` *first*, before exploring.
3. **Explore** — gather data, citing inline (see §5).
4. **Synthesize** — only after notes exist. Write to `research/synthesis/<topic>.md`.
5. **Reflect** — append `[OPEN QUESTION: ...]` markers for what remains unclear.
6. **Persist** — write a log entry (see post-conditions).

### Post-conditions — before ending any task

1. Append a dated entry to `research/logs/<topic>.md`:
   ```
   ## 2026-09-22
   - Files touched: research/notes/foo.md, research/synthesis/foo.md
   - Status: open | synthesized | superseded
   - Summary: <2–4 lines>
   - Open questions: <list, or "none">
   ```
2. If a conclusion was reached, ensure `research/synthesis/<topic>.md` exists and stands alone.
3. In your final reply, list every file you created or modified.

---

## 5. Citation, Uncertainty & Provenance Markers

### Citation format (mandatory)

- **External sources**: `[source: <url-or-title>, accessed YYYY-MM-DD]`
- **Internal repo work**: `[see: research/logs/foo.md#section]`

Do not fabricate sources, data, or citations. If a source cannot be verified, do not cite it — see §6.

### Uncertainty markers (greppable; use these verbatim)

- `[ASSUMPTION: ...]` — a load-bearing assumption that has not been verified.
- `[OPEN QUESTION: ...]` — a sub-question left unanswered.
- `[CONTRADICTS: <path-to-prior-file>]` — this finding disagrees with a prior file in the repo. Explain.
- `[CONFIDENCE: low | medium | high]` — optional, attached to claims where it matters.

When conflicting information exists, present both sides and analyze — do not silently pick one.

---

## 6. Stop-and-Ask Triggers (Non-Negotiable)

Stop work and ask the user before:

- **Publishing any client-derived material**, in any form, however abstracted.
- **Writing anything to `docs/`** — that directory is the live public website.
- **Deleting or rewriting** any file in `research/` (append, don't overwrite).
- **Publishing any name, organization, or quote** that is not already present in the public repo.
- **Citing a source** you cannot verify is real and accessible (no fabricated URLs, no half-remembered titles).
- **Concluding a synthesis** while key sub-questions remain in `[OPEN QUESTION]` state.
- **Including any item** that fails the §2 pre-write checklist.

No approval = no action.

---

## 7. Collaboration & Style

### Inter-agent compatibility

Write so another agent can:

- Continue your work without re-deriving context.
- Challenge your assumptions (which is why you must mark them).
- Fork your direction.

### Style

- Structured markdown, clear headings, explicit assumptions.
- No hidden reasoning, no vague conclusions, no answer-first behavior.
- Append rather than overwrite. Preserve historical reasoning.
- Formal register throughout. This is policy, not coaching.

---

## 8. Anti-Patterns

Avoid:

- "Answer-first" behavior without exploration.
- Rewriting existing docs without adding insight.
- Silent assumptions (use `[ASSUMPTION: ...]`).
- One-off outputs that are not persisted to `research/`.
- Overconfidence in incomplete data.
- Storing method or research findings in agent memory instead of the repo.
- Fabricating sources, data, or citations.
- Skipping the pre-conditions scan because "the topic feels new."
- Treating a client insight as generic method. If it came from an engagement, §2.2 applies.
