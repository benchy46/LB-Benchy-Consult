# #r5-planning-eng
**Slack channel ID:** C0AN627TZ5L
**Purpose:** Working channel for R5 robot engineering planning — docking/waste-water system design, vacuum motor water/foam ingress mitigation, COS (charging/docking station accessory) part decisions, and cross-functional coordination between engineering, RST (regional support), and supply chain on the R5 program. Channel history in range runs 2026-03-23 to 2026-05-11 (fully covered in one page, no pagination needed).

## Decisions & Reasoning (Benjamin)
- **Foam/chemical ingress risk is not urgent for wire safety** — Benjamin ran a full test (chemical + water at 1:50 ratio, cleaning until recovery tank full, full cleaning path) and observed foam, but not enough to spew past the vacuum motor acoustic foam onto wires. His conclusion: "It isn't that urgent or that risky for one entire cleaning cycle." — 2026-04-09 — [source](https://lionsbot.slack.com/archives/C0AN627TZ5L/p1775722980365069)
- **Parylene coating solves vacuum motor foam vulnerability** — after testing, reported the parylene-coated motor "is more invincible even with overwhelming foam it still runs no issue," attaching photos (IMG_1269.png, IMG_1267.png) — 2026-03-31 — [source](https://lionsbot.slack.com/archives/C0AN627TZ5L/p1774963489515939)
- **Rejects exhaustive scenario-testing of foam ingress as low-value; prefers a sensor-based detection approach instead** — when Dylan proposed testing foam ingress point at 10/20/30/40L across scenarios, Benjamin pushed back: "Even if we know at what point the foam flies in, what do we do next? Every environment, and floor type, and foamy chemical will react differently, so it makes no sense to test this." He instead pointed at using existing vacuum motor impeller-speed telemetry to detect ingress by RPM drop, noting the hardware signal already exists on the board but flagged uncertainty on whether it's actually piped through to software ("I know at least the hardware exists on the board. If it's piped in, prolly not.") — 2026-03-26 — [source](https://lionsbot.slack.com/archives/C0AN627TZ5L/p1774494386219519)
- **Follow-up empirical test result on foam ingress threshold**: on an uncoated-PCB robot, foam ingress into the PCB only began around 35L+ of waste water, consistent with prior test; also noted foam wetting the HEPA filter increases internal pressure/chokes airflow further — 2026-03-26 — [source](https://lionsbot.slack.com/archives/C0AN627TZ5L/p1774521775437759)
- **Float switch height can only be adjusted on new tank builds, not reworked on completed units** — confirmed as a hard manufacturing constraint when Dylan/Joei asked about lowering the float switch to cut off water earlier and protect the vacuum motor: "It can only be done on new tanks, that is correct." — 2026-03-26 — [source](https://lionsbot.slack.com/archives/C0AN627TZ5L/p1774502447726729)
- **HEPA-vs-foam-sponge tradeoff / porosity decision**: per Tat Leong reporting back from a direct discussion with Benjamin, the team settled on 30PPI foam sponge (over 20PPI) since the two performed almost the same and 30PPI was judged the safer option — this was the porosity Benjamin had already passed along for use at the NTUC site — 2026-04-28 — [source](https://lionsbot.slack.com/archives/C0AN627TZ5L/p1777377934450399)
- **Sourcing figure for the sponge component**: "1000 pcs, 15-20 days, $0.52USD per piece." — a terse cost/lead-time answer closing out the porosity/sourcing thread — 2026-04-28 — [source](https://lionsbot.slack.com/archives/C0AN627TZ5L/p1777381196664499)

## Notable Exchanges
- The foam-ingress-testing pushback (above) is a good example of Benjamin's style: short, blunt reasoning ("it makes no sense to test this") followed immediately by a concrete alternative (use existing telemetry) rather than just objecting — [source](https://lionsbot.slack.com/archives/C0AN627TZ5L/p1774494386219519).
- His messages tend to be short, declarative, and test/data-driven ("Only started to have foam ingress from about 35L and above") rather than speculative.
- One very terse aside — "Can import the convo here?" — got a confused reply from Joei Wee ("sorry which convo") and was never resolved in-channel; illustrative of occasional context-free short messages — 2026-03-23 — [source](https://lionsbot.slack.com/archives/C0AN627TZ5L/p1774270375725299).

## Recurring Themes / Principles Observed
- Prefers to validate with real, full-cycle tests (actual chemical ratios, full tank fills) over theoretical worst-case worry, and is willing to say a risk is "not that urgent" when data supports it.
- When a proposed test plan seems like it would multiply without converging on an actionable answer (too many variables: floor type, chemical, environment), he redirects toward instrumentation/telemetry-based detection instead of brute-force testing.
- Distinguishes clearly between what can be changed retroactively (nothing on completed tank builds) versus what's only feasible in new production — engineering answers are anchored to manufacturing reality, not just ideal design.
- Comfortable making sourcing/cost/lead-time calls in a single terse line once the underlying technical question (porosity) is settled.

## Referenced Files (not content-readable)
- IMG_1269.png, IMG_1267.png — photos from Benjamin's parylene-coated motor foam test (2026-03-31)
- R5_Issue_Review_Report.docx — a Claude-generated review of issues raised across r5-planning-eng, r5-trials-support, and R5-planning channels (shared by Dylan Ng, not Benjamin)
- image (443).png — CAD screenshot referenced in the COS side-handle thickness discussion (no Benjamin involvement)
- image.png — Tesco HEPA issue photo (Tat Leong)
- 20260505_162058_1.mp4 — video of new baffle design test (Lucas)
