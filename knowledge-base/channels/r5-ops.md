# #r5-ops
**Slack channel ID:** C09QUH9ESBB
**Purpose:** Manufacturing/supply-chain operations channel for R5 — contract manufacturer (CM) build coordination, BOM/SKU questions during DV03→DV04→SOP transition, parts shipment and warehouse logistics, kitting/training at Kranji, and assembly troubleshooting during production ramp-up. Channel runs 2025-12-05 (creation) to present (last activity 2026-07-23); volume is high and dominated by logistics/production-floor coordination (Lawrence De Leon, Norris Joo, Soong Choo Kien, Lucas, Sam Ang, Venus Gan, Venessa NG, Rajen Kumaran, Randy Chua). Benjamin posts occasionally, almost always fielding specific hardware/assembly spec questions escalated to him directly.

## Decisions & Reasoning (Benjamin)
- **Battery-cable safety hold**: instructed that a specific cable be unplugged from all robots and cable-tied separately, "suspected to spoil the batteries," pending investigation — a precautionary stop-work on a suspected but unconfirmed hardware defect rather than waiting for root cause first — 2026-01-29 — [source](https://lionsbot.slack.com/archives/C09QUH9ESBB/p1769660457097179)
- **Retired a part outright once judged unfit**: "FLT-0029-X0 will not be used in DV04 or any other builds. All scrap, dimensions don't fit well. It was only used in DV03 builds." Framed as "closing the loop" — a clean, final call rather than leaving it ambiguous for the floor — 2026-01-29 — [source](https://lionsbot.slack.com/archives/C09QUH9ESBB/p1769654391512279)
- **Set a quantitative IQC acceptance spec for magnets** holding the squeegee/brush cartridge tooling in place: required 100% QC via pull-force testing with a force gauge, minimum 50N — a concrete, testable threshold rather than a qualitative "make sure it's strong enough" — 2026-01-27 — [source](https://lionsbot.slack.com/archives/C09QUH9ESBB/p1769481796596419)
- **Fastener spec scoped explicitly to build phase**: when the floor found a mismatch between what the water-line cable-tie-mount BOM called for (M4x6 CSK) and what CM had issued (M4x6 cap screw, which protruded and left a gasket gap), Benjamin clarified "M4x6 CSK ONLY FOR DV04. SOP will change to M4x6 SHCS" — treating DV04 and SOP as different, non-interchangeable configurations rather than a single evolving spec — 2026-01-26 — [source](https://lionsbot.slack.com/archives/C09QUH9ESBB/p1769399896708049)

## Notable Exchanges
- Benjamin's replies in this channel are consistently short, imperative, and part-number/spec-precise (SKUs, screw types, force thresholds) — he answers exactly the floor question asked without broader commentary, characteristic of fast build-floor troubleshooting rather than deliberative discussion.
- Many technical questions addressed directly to him from the production/CM-support team (Soong Choo Kien, Norris Joo) went unanswered within the captured window or were answered by others (e.g., Lucas answering an E-Box cable SKU question addressed to both Lucas and Benjamin; Benjamin Ang Zi Jian — a different person, note the name collision — answering a hatch-gasket length question also addressed to both Benjamins). This suggests he is one of several people fielding floor questions and not always the one who ends up responding.
- A recurring channel theme independent of Benjamin: repeated requests (from Norris Joo, Joshua Fang) for a proper documented change-control process between DV03→DV04→SOP builds, since undocumented on-the-floor substitutions (screws, tube lengths) were creating divergence between as-built robots and official BOM/SOP docs, with cost consequences once CM formally takes over ("They will charge us every change after SOP").

## Recurring Themes / Principles Observed
- Willing to impose a precautionary hold on hardware (unplug/cable-tie the suspect cable) before root cause is confirmed, when there's a plausible battery-damage risk.
- Draws a hard line between prototype/DV-build compromises and what's acceptable for SOP/production — the same nominal part or fastener can have different accepted specs depending on build phase, and he's explicit about which phase a given answer applies to.
- Prefers scrapping and closing out a part decisively once it's shown not to fit, rather than leaving it as a tolerated exception.
- Turns qualitative reliability concerns (e.g., "is the magnet strong enough") into a specific measurable test and threshold (pull force ≥ 50N via force gauge).

## Referenced Files (not content-readable)
- IMG_0654.jpg — photo of the cable flagged for the battery-spoilage precaution.
- IMG_0343.MOV — video referenced in the magnet pull-force IQC message.
- Various assembly/BOM photos from Soong Choo Kien, Norris Joo, Lucas documenting CM build issues (motor nozzle mount insert, water-line screw, E-Box cable, hatch gasket) — not opened, only surrounding text considered.
