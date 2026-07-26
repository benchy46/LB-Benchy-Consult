# #r5-incoming
**Slack channel ID:** C09UQR6NVRN
**Purpose:** IQC/warehouse incoming-parts logging channel for R5 — receiving confirmations, SKU/dimension discrepancy checks, and part-vs-drawing tolerance questions routed to R&D before goods receipt. Fully read (two pages, no more pagination), Nov 2025–Jul 2026.

## Decisions & Reasoning (Benjamin)

- **BOM/SKU scoping decision**: "ALL Cables do not have separate SKUs for this build." — a build-level simplification decision on cable part-numbering — 2025-11-20 — [source](https://lionsbot.slack.com/archives/C09UQR6NVRN/p1763619626736829)
- **Resolved a wire-length spec ambiguity from the factory** rather than let it block goods receipt: Kalai asked whether MOT-0051-X0's wire was "100mm on the first half and 50mm on the second half"; after Lucas asked for clarification, Benjamin cut through it: "Yes it is fine for now, they misunderstood but no worries. Should be 100mm total length." — 2025-12-02 — [source](https://lionsbot.slack.com/archives/C09UQR6NVRN/p1764644160883479) (full thread)

## Notable Exchanges

- Benjamin is one of several named contacts (with Lucas and Ayman Khan) that IQC (Kalai, Faiz) routes dimensional-tolerance questions to — e.g. FPV-0142-X0 hole ID measuring 4.22mm against a drawing spec of 4.60mm ±0.20mm. Note: in that specific thread the disposition call ("This is fine to proceed, we will accept them and feedback to supplier") was made by **Lucas, not Benjamin** — Benjamin was tagged but did not reply in the thread within range; do not attribute that acceptance decision to him — [source](https://lionsbot.slack.com/archives/C09UQR6NVRN/p1765335140411029)
- Channel tone is almost entirely transactional/logistics (Faiz and Kalai logging incoming quantities, Lucas answering "yes/is it ours/its ours" style traffic-cop questions) — Benjamin's few appearances are narrowly scoped to resolving ambiguity in a spec or BOM rule, not general receiving logistics.

## Recurring Themes / Principles Observed

- When a factory-side miscommunication produces a confusing spec question (wire length split into two "halves"), Benjamin resolves it by restating the single correct total figure rather than debating the miscommunication itself — pragmatic closure over process litigation.
- Comfortable making blanket BOM-simplification calls (no separate cable SKUs for a build) that reduce downstream IQC/SKU tracking overhead.

## Referenced Files (not content-readable)
- IMG_3479/3480.jpg — FPV-0142-X0 hole measurement photos (Kalai)
- IMG_3307/3308.jpg — MOT-0051-X0 wire length photos (Kalai)
- Numerous incoming-parts photos (tanks, brushes, chargers, cables, screws) logged by Faiz/Kalai with no R&D commentary attached
