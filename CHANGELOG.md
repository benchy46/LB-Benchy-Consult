# Knowledge base changelog

One entry per weekly refresh that actually changed something, newest first. Each
entry corresponds to exactly one commit, so any week's interpretation can be
reverted in isolation with `git revert`. Empty windows are deliberately not
recorded here — `logs/` is the record that the job fired.

## 2026-08-17 — window 2026-08-07 to 2026-08-16

- **Messages reviewed:** 10 of his across 5 channels (2026-08-08 → 2026-08-16);
  1 was the already-captured 2026-08-08 hub draft, deduped, leaving 9 new. Two
  threads read in full. Search ran from 2026-08-07 (watermark minus one day) and
  reached "no more pages," so the window is complete.
- **Channels updated:** `ai-mech-tools`, `s3-mech-architecture`,
  `s3-mech-cad-changelog`, `mech-leads`
- **New channels added:** `hardware` — the **department-wide** channel, his
  widest audience, missing from the 50-channel seed. Partial coverage: his two
  messages in the window plus enough surrounding traffic to characterise the
  channel. Notable because it is not a niche project channel; `index.md` now
  says the seed's channel list should be treated as materially incomplete rather
  than nearly complete.
- **Principles changed:**
  - **NEW** (§4) — *Keeps the cost of contributing near zero, and pushes any
    judgment that needs org-wide context upward.* Two instances in-window:
    the CAD-logging readiness bar lowered to near-zero ("It doesn't matter that
    you're not done", 2026-08-14) and an explicit objection to making engineers
    rank their own work by impact ("Those should be for management to determine
    instead, while having the full picture", 2026-08-16). The second is a stated
    rule, not an offhand remark, so the bar for a new principle is met.
  - **REFINES** (§4, delegation) — the Precoro API escalation of 2026-08-10.
    Delegation unchanged and for the same reason; what's added is a funding
    argument and a direct ask to the named budget holder. Delegation ≠ abdication.
  - **REFINES** (§7, platform) — the 2026-08-08 dry-run went out materially
    unchanged, so socialise-before-broadcast is rehearsal rather than review;
    and he ran frontline support on the shipped tool himself (2026-08-11).
  - **REFINES** (§3, register) — adds an audience-size axis, evidenced by a
    clean A/B: the same announcement drafted with "Very exciting, I'm excited"
    and sent department-wide without it. Widening the audience strips
    enthusiasm, not informality.
  - **REFINES** (§7, low-effort documentation) — readiness bar is near-zero, not
    merely low; granularity rules untouched.
- **Not written:** his habit of adopting a prior programme's convention rather
  than authoring a new one (R5 naming 2026-07-22, R5 folder structure for S3
  NPPA 2026-08-10) — two one-line instances across two windows is suggestive but
  thin, and it may be plain efficiency rather than a principle. Recorded in
  `s3-mech-architecture.md` as evidence; revisit on a third instance.
- **Consult skill changed:** yes — one bullet added to `## 5. His register`
  covering the new §4 principle, since it changes how the persona should answer
  any process/reporting design question. `## 2. Open with intake` unchanged; no
  evidence his scoping questions have shifted.

## 2026-08-10 — window 2026-07-25 to 2026-08-08

- **Messages reviewed:** 21 of his across 9 channels (2026-07-26 → 2026-08-08),
  plus 8 threads read in full for context. A ~2-week window, since this was the
  first incremental run after the seed.
- **Channels updated:** `s3-mech-architecture`, `s3-mech-cad-changelog`,
  `mech-leads`, `s3-chassis-and-brush-assemblies`, `ai-mech-tools`
- **New channels added:** `internal_product_mech`, `r5-development`,
  `s3-development`, `r5-mech-architecture` — all four active and substantive,
  all four missing from the 50-channel seed. Each was backfilled from a targeted
  search of his most recent ~20 messages (reaching back to roughly April–May
  2026) rather than a full history sweep; their coverage notes say so, and
  `index.md` now flags the seed's channel list as demonstrably incomplete.
- **Principles changed:**
  - **REFINES** §1 — the "infer from existing signals over new hardware" default
    now carries its boundary: when FMEA detection scoring is the arbiter he
    argues the opposite and accepts the sensor (evidence 2026-06-10,
    `r5-development`).
  - **EVOLVES** §7 — AI posture moves from *build a throwaway artifact to
    practise* (2026-06-08) to *operating a logged-in internal platform*, the
    Hardware Tools Hub, 8 tools (2026-08-08). Old text kept and dated.
  - **NEW** §7 — will reverse his own recent infrastructure rollout without
    defensiveness, and always names the constraint the fix introduces:
    SolidWorks Toolbox network-read (2026-07-13) → local auto-sync (2026-08-07).
  - **NEW** §4 — personally owns shared physical/CAD infrastructure (print farm,
    mech room, Toolbox, templates, presets) and reduces friction before
    increasing pressure. Sourced almost entirely from the newly-added
    `internal_product_mech`; this facet was absent from the seed.
  - **NEW** §3 — visibly provisional in live debate; concedes in one line when
    shown wrong, and is plain about the limits of his own recall. Distinct from
    the settled tone of his `<!channel>` standards posts.
- **Consult skill changed:** yes — `§5 His register`. The
  infer-over-hardware bullet was too absolute and now carries the FMEA boundary;
  added bullets on pairing an objection with its dissolving condition, naming
  the phase-gate when rejecting late scope, and not defending a beaten position.
  `§2 Open with intake` left unchanged.
- **Not written:** `reference/` untouched, per the guardrail. The 2026-08-07
  Toolbox change does not contradict `cad-integration.md` (which has no Toolbox
  or template-distribution section) — it extends it, and is recorded in the
  channel file only.

## 2026-07-26 — initial seed

- **Messages reviewed:** two years of history (2024-07-26 → 2026-07-26)
- **Channels:** 50, extracted in parallel into `channels/*.md`
- **Principles:** initial synthesis across seven sections
- **Automation:** weekly incremental refresh installed (see `README.md`)
- **Validation:** two dry runs on the seed date confirmed the pipeline
  end-to-end against an empty window. Both correctly found the only in-window
  messages already captured and changed nothing. They also established that
  Slack's `after:` filter is **exclusive** of the named date, which is why the
  updater searches from `watermark − 1 day` and dedupes — that overlap is what
  makes a gap impossible.
