# EMET — repository and site scaffolding

**Date:** 2026-09-22
**Status:** approved design, pending implementation plan
**Scope:** stand up `emet.audax.earth` and its repository, mirroring the ARK setup

---

## 1. Context

EMET is a consultancy practising **empathic agent design**. The name is the
word on the golem's forehead — אמת, *emet*, "truth" — which animates the made
thing; strike the aleph and מת, *met*, "dead", remains. A practice that builds
agents, named for the word that brings a made thing to life.

Its public surface will live at `emet.audax.earth`, a subdomain of the existing
`audax.earth` zone.

The setup mirrors **ARK** (`Vorski-Imagineering/ARK`, published at
`ark.audax.earth`): a public repository whose `docs/` directory is deployed to
GitHub Pages by a GitHub Actions workflow, with an agent protocol in `AGENT.md`
symlinked to `CLAUDE.md`.

EMET reuses ARK's *scaffolding*. It is not a sibling lab and does not mirror
ARK's content. Where a consultancy differs materially from a research commons
— chiefly licensing and confidentiality — this spec departs from ARK
deliberately, and says so.

---

## 2. Decisions

| Decision | Value | Rationale |
|---|---|---|
| Local folder | `/Users/vvorski/web/EMET` | Mirrors ARK, the one folder in `web/` named for its repo rather than its domain. |
| GitHub repo | `Vorski-Imagineering/EMET` | ARK's org. |
| Visibility | **Public** | Both orgs are on GitHub's free plan, where Pages serves only from public repos. |
| Domain | `emet.audax.earth` | |
| Licence | **All rights reserved** | Departs from ARK's CC0. A consultancy's method is the thing clients pay for; CC0 would place it in the public domain. |
| Copyright holder | `Emet` | Bare trading name. Amend when a legal entity exists. |
| Publishing | GitHub Actions → Pages, source `docs/` | Verbatim from ARK. |
| DNS | Cloudflare, DNS-only CNAME | Matches `ark`. |
| Spec location | `specs/` at repo root | **Not** `docs/superpowers/specs/` — see §6. |

### 2.1 Consequence of the public-repo decision

Everything committed to this repository is world-readable and permanent. A
consultancy accumulates client notes, proposals, rates and engagement detail;
none of it may enter this repo. The confidentiality policy in §4.2 is the only
control standing between a public repo and a confidentiality breach, which is
why it is strengthened rather than copied.

Client and commercial material lives outside this repository entirely. Where it
lives is out of scope here.

---

## 3. Repository structure

```
EMET/
├── AGENT.md                  # the protocol — the real file
├── CLAUDE.md → AGENT.md      # symlink (ARK's pattern)
├── AGENTS.md                 # near-copy of AGENT.md, Codex memory path
├── README.md                 # what EMET is, for a human arriving
├── LICENSE                   # all rights reserved notice
├── .gitignore                # from ARK
├── specs/                    # design specs — NOT published
│   └── 2026-09-22-emet-scaffolding-design.md
├── research/
│   ├── logs/                 # dated activity logs, one file per topic
│   ├── notes/                # working notes, one file per topic
│   └── synthesis/            # standalone structured outputs
├── docs/                     # ← THE PUBLISHED WEBSITE
│   ├── CNAME                 # emet.audax.earth
│   ├── .nojekyll
│   └── index.html            # placeholder
└── .github/
    └── workflows/
        └── pages.yml         # from ARK, comment retargeted
```

`research/{logs,notes,synthesis}` is carried over from ARK unchanged. A
consultancy-flavoured taxonomy (`method/`, `case-studies/`) is deliberately not
invented ahead of content; the protocol in §4 is built around these three
directories, and the shape can grow once real work indicates what it needs.

`AGENTS.md` is a near-copy rather than a symlink, matching ARK, where the two
files differ only in the agent-memory path they cite (`~/.claude/…` vs
`~/.Codex/…`).

Empty directories under `research/` are held by `.gitkeep` files, since git does
not track empty directories.

### 3.1 LICENSE and README

`LICENSE` carries an explicit all-rights-reserved notice rather than being
omitted. On a public GitHub repository an absent licence file is widely read as
an invitation to reuse, and GitHub's Terms of Service grant every user
fork-and-view rights on public repositories regardless of its contents. The
notice reads:

```
Copyright © 2026 Emet. All rights reserved.

No part of this repository may be reproduced, distributed, or transmitted in
any form or by any means without the prior written permission of the copyright
holder, except as permitted by GitHub's Terms of Service for public
repositories and by applicable law.
```

`README.md` states what EMET is — a consultancy practising empathic agent
design — what the name means, what the repository is for, and how its
directories are organised. It does not describe services, clients, engagements
or commercial terms.

---

## 4. AGENT.md — adaptations from ARK

ARK's protocol has eight sections. Three change; five carry over close to
verbatim.

### 4.1 §1 Mandate — rewritten

ARK's mandate frames the repo as a public collaborative research process whose
outputs feed a knowledge commons. EMET's frames it as a consultancy practising
empathic agent design, working in public: agents act as transparent
collaborators building an accumulating body of method, and everything written
is public and permanent.

### 4.2 §2 Sensitive information — strengthened

ARK's list was written for a research commons. It already forbids PII, private
individuals' names, credentials, private conversations, internal URLs,
non-public business data and NDA-bound terms. EMET adds explicit client
clauses, because in a consultancy these are the likely leak and the existing
wording does not name them:

- No client or prospect names, nor identifying description of either
- No engagement details, scope, deliverables or timelines
- No rates, proposals, SOWs or contract terms
- Nothing learned inside an engagement, in any paraphrase
- No case study, even anonymised, without written client sign-off

The pre-write checklist gains corresponding items, and the §6 stop-and-ask
triggers gain "publishing any client-derived material".

### 4.3 §3 File layout — one addition

Adds `specs/` to the documented layout, with a note that `docs/` is the
published website and that nothing internal belongs there.

### 4.4 Sections carried over

§4 (the scan → decompose → explore → synthesise → reflect → persist loop, with
its pre- and post-conditions), §5 (citation and uncertainty markers), §6
(stop-and-ask triggers, plus the addition above), §7 (collaboration and style)
and §8 (anti-patterns) carry over essentially as-is. The research loop suits
practice-building as well as it suits research.

---

## 5. Publishing and DNS

### 5.1 Pages

`.github/workflows/pages.yml` is copied from ARK verbatim, with its header
comment retargeted to `emet.audax.earth`. It triggers on push to `main` and on
`workflow_dispatch`; uses `actions/checkout@v7`, `configure-pages@v6`,
`upload-pages-artifact@v5` with `path: docs`, and `deploy-pages@v5`; sets
`contents: read`, `pages: write`, `id-token: write`; and uses a `pages`
concurrency group with `cancel-in-progress: false`.

The repository must have **Settings → Pages → Source = GitHub Actions**. This
is set via `gh api`, not left to the default — ARK's Pages build broke on
2026-08-06 precisely because the legacy branch-source builder was active
instead.

`docs/.nojekyll` is present so the static HTML is served untouched.

### 5.2 DNS

In the Cloudflare `audax.earth` zone:

```
CNAME  emet  →  vorski-imagineering.github.io   (DNS-only, grey cloud)
```

DNS-only is required, matching the existing `ark` record. Proxying through
Cloudflare's orange cloud prevents GitHub from validating the domain and
issuing its certificate.

Cloudflare is reached through its MCP server, which requires an interactive
auth handshake.

### 5.3 Order of operations

DNS and the repo's Pages configuration are interdependent: GitHub validates the
custom domain by resolving it. The CNAME record should exist and have
propagated before "Enforce HTTPS" is enabled, or certificate issuance fails and
needs retrying.

### 5.4 Verification

The scaffolding is done when:

1. `https://emet.audax.earth` serves the placeholder over a valid certificate
2. The Pages workflow shows a green run
3. `dig +short emet.audax.earth CNAME` returns `vorski-imagineering.github.io.`
4. "Enforce HTTPS" is enabled in the repo's Pages settings

---

## 6. `docs/` is the website

Superpowers' default spec path is `docs/superpowers/specs/`. On this layout
`docs/` is the Pages source, so that path would publish internal design notes
to the public site. Specs therefore live in `specs/` at the repository root.

This trap is inherited from ARK's layout and applies to anything internal:
**nothing goes in `docs/` that is not intended to be on the public web.**

---

## 7. Out of scope

- **Site design.** `docs/index.html` is a minimal placeholder carrying the name
  and a single line, sufficient to prove the pipeline end to end. Designing the
  consultancy's actual site is separate work, to follow once the scaffolding
  stands.
- **Content.** No research, method or positioning material is written here.
- **Where client and commercial material lives.** Established as outside this
  repo (§2.1); choosing its home is a separate decision.
- **Changes to ARK.** The `docs/` trap and the `research/` naming drift
  (`The Coherence Company/`, `The Gathering/` violate ARK's own kebab-case rule)
  are noted, not fixed.

---

## 8. Open items

- **Legal name for the copyright notice.** Currently `Emet`. To be amended if
  and when a registered entity exists.
