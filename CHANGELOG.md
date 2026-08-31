# Knowledge base changelog

One entry per weekly refresh that actually changed something, newest first. Each
entry corresponds to exactly one commit, so any week's interpretation can be
reverted in isolation with `git revert`. Empty windows are deliberately not
recorded here — `logs/` is the record that the job fired.

## 2026-08-31 — window 2026-08-16 to 2026-08-29

**Two-week window.** The scheduled 2026-08-24 run failed before doing any work
(`claude` exited 1: "OAuth session expired and could not be refreshed"), so the
watermark was correctly left at 2026-08-16 and this run covers both weeks. The
self-healing behaviour worked as designed — no gap.

- **Messages reviewed:** 48 of his across 12 channels (2026-08-16 → 2026-08-29);
  1 was the already-captured 2026-08-16 `mech-leads` weekly-updates message,
  deduped, leaving 47 new. Search ran from 2026-08-15 (watermark minus one day),
  paged to "End of results." Six threads read in full. One channel (`tapao-food`,
  one message: "Not today") was reviewed and skipped as pure logistics.
- **Channels updated:** `s3-development`, `s3-handlebar`, `s3-mech-architecture`,
  `s3-chassis-and-brush-assemblies`, `s3-mech-cad-changelog`, `mech-leads`,
  `ai-mech-tools`, `r5-development`, `r5-docking-trolley`
- **New channels added:** `engineering` — another long-running **workspace-wide**
  channel absent from the seed (one message; very partial coverage). And
  `s3-rnd-scm-approval`, the R&D→SCM purchasing gate, kept deliberately thin
  because most of its content is quotes and pricing and is filtered out of scope.
  Two consecutive refreshes each finding a department-scale channel is now noted
  in `index.md` as a structural gap, not a one-off: broad channels where he posts
  rarely are exactly what a per-window search of his own messages keeps missing.
  Total channels 55 → 57.
- **Principles changed:**
  - **REFINES → correction** (§1 + summary, evidence 2026-08-18) — the standing
    "prefers cheap software/signal fixes to new hardware" reading was too narrow
    and would have produced the wrong advice. Asked what software should do when
    the S3 HEPA filter is missing, he removed the premise — "the hopper should
    not be able to be inserted if there is no filter. So if that works, then
    software side is not required to do anything" — and the team cancelled the
    detection workflow and slated the sensor for removal. The invariant is
    *add no new part and no new code*; geometry wins when geometry is already
    being designed. The FMEA-detection-scoring exception is unchanged.
  - **NEW** (§1, evidence 2026-08-18 and 08-27) — checks whether the failing
    requirement is real before treating the failure as a problem: "very very
    likely we will not need max speed", then "we do not need high update rate,
    so if the sonar gives a good reading once a min, it is also acceptable".
    Two instances on one fault, plus explicit peer pushback (WeiTong: "we do not
    know the root cause") which he answered with a test plan rather than a
    defence — so spec relaxation runs *parallel* to root cause, not instead.
  - **NEW** (§1, evidence 2026-08-19) — isolation experiments where each step
    changes one variable and names what it rules in or out, including a control
    with no hypothesis attached ("to make sure we are not missing anything").
  - **NEW** (§6, evidence 2026-08-17) — on a price increase he ring-fences the
    feature a past field failure made mandatory ("don't wanna regress"), prices
    anything above that floor, and tests it by converting the delta into a value
    question ("is it 78.9% nicer?"). A clean A/B on what persuades him: the
    positional argument ("HMI is ranked by sales as the #1 top design factor")
    drew no reply; the service-life argument flipped him in one line ("Hmm true
    that it is scratch resistant also. Well okay i buy that").
  - **REFINES** (§4, evidence 2026-08-24/27/28) — the format-vs-completeness
    split now has a mechanism: the rules he enforces are exactly the ones a
    downstream machine breaks on. SKU/description/CAPS mandatory, status field
    optional, and file naming explicitly waived ("file name doesnt matter"),
    completeness waived again ("It doesn't matter if your stuff isn't fully
    finished"). Predictive test added: *would a script fail on this?*
  - **REINFORCES** (§7) — the platform posture holds and widens (Precoro spec'd
    as a hosted web app; metadata discipline aimed at an auto-export agent), and
    he now publishes his own automation's **failures** in the same channel and
    format as its successes (Pack and Go blocked, 2026-08-26 / 08-29): root
    cause, what is still deliverable, whose court the fix is in, and a
    pre-empted misread ("Not a regression from this update").
  - **Dated constraint recorded** (§5, evidence 2026-08-26, not his own words) —
    supplier *pricing* was formally moved from engineers to SCM ("From now on -
    R&D will share the engineering drawings - Eric will deal the quotation").
    His technical supplier pushback is untouched; pre-2026-08-26 examples of him
    working a price directly are now historical, not current practice.
  - Recorded in channel files only, below the bar for `principles.md`: Singlish
    register with juniors framed as protecting their time ("dont anyhow try
    different teeth, let me know first so you no need waste time", 2026-08-18);
    accepting a large SW2026/Windchill migration task with one unblocking
    question and no negotiation (2026-08-26); a near-verbatim repeat of the
    July childcare-leave notice (2026-08-25).
- **Consult skill changed:** yes. `§2 Open with intake` — the boundary question
  now also asks whether the failing requirement is firm. `§5 His register` —
  the "prefer inferring from existing signals" bullet rewritten to the
  no-new-part-and-no-new-code rule with the poka-yoke case; new bullet on
  relaxing the spec in parallel with isolating the variable; new bullet on how
  he handles a price increase.

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
