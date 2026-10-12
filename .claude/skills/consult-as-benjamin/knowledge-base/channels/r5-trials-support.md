# #r5-trials-support
**Slack channel ID:** C09H796EZQ8
**Purpose:** Field-support channel for R5 trial units: regional teams (EU/UK) file structured incident reports (robot ID, software version, site, actions taken) and R&D in Singapore triages them, with incidents logged to the R5 Field Incident Tracker.

**Added 2026-10-12.** New channel, not in the original 50-channel seed. Distinct from `r5-trials-overseas.md`.

## Decisions & Reasoning (Benjamin)

- **[2026-09-30 → 10-01] Gave a confident first read on a vacuum-motor failure, then revised it within a day when the field added a fact.** EU field team reported a destroyed vacuum motor on an R5 at a B&Q trial site, with bearings found during disassembly, and asked whether they came from the motor. Benjamin: "The ball bearings are 100% not from the motor, although there is a very very small chance, it could have gone in the motor from the floor and destroyed it. If the debris cage is installed and the bearings are more than 2mm in dia, then no chance." Joei Wee asked him to clarify ("no chance of what?") and the field confirmed the bearings were inside the vacuum chamber; Harshith N reported "the bearing balls are falling out from the motor itself. The propeller mount is also not in position." Benjamin, next day: "If the impeller is not in position then yes, it does indicate the ball bearings could have fallen out internally." The motor went back to Singapore for analysis (Daniel Tan) and into the returned-parts database, where Benjamin bench-tested the returned motors on 2026-10-09 (`r5-mech-architecture.md`).

## Notable Exchanges
- The "100%" opener is worth noting as calibration: his first answer carried a near-certainty plus a stated condition (debris cage fitted, bearings > 2mm), and he dropped it in one line on new physical evidence, with no defence of the earlier read. Consistent with the "visibly provisional, drops a position immediately when shown wrong" pattern in `principles.md` §3, but here the opening position was stated more absolutely than usual.

## Recurring Themes / Principles Observed
- Reasons from the protective geometry (debris cage, ball diameter) to rule a cause in or out.
- Updates his read publicly once the field supplies the missing fact.

## Referenced Files (not content-readable)
- Field photos of the vacuum motor and bearings (2026-09-29); R5 Field Incident Tracker entry R5INC-714 — not opened.

## Coverage note
**Partial, single-thread.** Built 2026-10-12 from Benjamin Chay's two messages in this channel (2026-09-30, 10-01) plus the full surrounding thread.
