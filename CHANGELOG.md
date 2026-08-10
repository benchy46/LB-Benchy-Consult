# Knowledge base changelog

One entry per weekly refresh that actually changed something, newest first. Each
entry corresponds to exactly one commit, so any week's interpretation can be
reverted in isolation with `git revert`. Empty windows are deliberately not
recorded here — `logs/` is the record that the job fired.

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
