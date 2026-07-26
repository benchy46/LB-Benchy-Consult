# #temp-traction-motor
**Slack channel ID:** C0AUN1AEG2J
**Purpose:** Incident/war-room channel for the R5 (SC25/VP25-generation) traction motor brake-rubbing and high-current issue traced to ZLTech-supplied motors — root-causing the washer/nut/torque design, defining IQC/robot-level QC criteria, and coordinating CM rework. Fully read, no pagination remaining (single page, ~100 messages, Apr–May 2026).

## Decisions & Reasoning (Benjamin)

- **IQC bench test is a floor, not a guarantee** — "it should rule out the very obviously bad motors. But if marginally bad it may still pass, especially if the break design internally is bad, not as per the document they sent." He follows up: "If we want to be strict, we can do multiple tests on a motor and make sure it always passes, then if one failure, dont use." — 2026-04-23 — [source](https://lionsbot.slack.com/archives/C0AUN1AEG2J/p1776907188570299)
- **Isolate variables before blaming assembly** — instructed the team to fully remove the brake and bench-test the bare motor standalone on the Flipsky controller, checking hex concentricity on video, and to "Compare the exact same motor, and compare the values output from the flipsky UI" rather than trust an already-confounded in-robot reading — 2026-04-23 — [source](https://lionsbot.slack.com/archives/C0AUN1AEG2J/p1776910083645529)
- **Checked CAD before accepting a supplier-side theory**: "I checked CAD the mounting for the motors are the same for DV and SOP. The only different we know now is the extra washer mounted with the motor." — narrowed the investigation to a single suspect part — 2026-04-23 — [source](https://lionsbot.slack.com/archives/C0AUN1AEG2J/p1776923387062799)
- **Made the root-cause argument visual for the supplier**: forwarded a comparison — "Comparing SAME torque, one WITH WASHER, one WITHOUT WASHER. 1. With Washer - Nut can slip and potentially loosen 2. Without Washer - Nut is secure, even if shaft moves, Nut doesn't move and cannot continue to loosen" — 2026-04-23 — [source](https://lionsbot.slack.com/archives/C0AUN1AEG2J/p1776935709289729)
- **Process discipline over speed**: "need to let the robot rest for 24hrs after removing the nut. loctite needs 24 hours to cure fully, especially for the traciton motor nut. This should be done for ALL robots. This means that once the robot is assembled, the robot cannot immediately go to burn in the same day, need to wait for the next day." — 2026-04-23 — [source](https://lionsbot.slack.com/archives/C0AUN1AEG2J/p1776938450186439)
- **Caught a spec drift and corrected it immediately**: "I saw we are using blue now?" followed by "We should be using red loctite on the traction motor nuts" — 2026-04-24 — [source](https://lionsbot.slack.com/archives/C0AUN1AEG2J/p1777001100714549)
- **Floated a mechanical hypothesis proactively**: asked whether the wheel/brake module being biased to opposite sides on left vs right (due to nut-tightening direction) could be causing the fault; Chong Lee Seng confirmed this as "mechanical precession" the next reply — Benjamin surfaced the theory, Chong Lee Seng named and confirmed it — 2026-04-29 — [source](https://lionsbot.slack.com/archives/C0AUN1AEG2J/p1777441816868679)

## Notable Exchanges

- Direct, terse style when pressed on QC sufficiency: Lawrence asked "Is the Bench Test enough for IQC Level / Piece Part Level Check at the moment?" — Benjamin's answer above avoided a flat yes/no, instead scoping what the test can and can't catch — [source](https://lionsbot.slack.com/archives/C0AUN1AEG2J/p1776907129466789)
- Requests for physical measurement are specific and hands-on rather than delegated abstractly: "Yes will need to measure the dimensions of the hex also, both the hex on the break, and on the motor side." — 2026-04-23 — [source](https://lionsbot.slack.com/archives/C0AUN1AEG2J/p1776909922141899) (Kalai's reply just asks for a reference photo to forward to CM, showing Benjamin's requests get relayed as literal instructions to the factory)

## Recurring Themes / Principles Observed

- Prefers controlled, single-variable comparisons (same motor, same torque, before/after) over anecdotal reports when diagnosing hardware failures.
- Treats supplier-provided root causes skeptically until backed by CAD or bench data he's checked himself.
- Insists on cure/rest times and torque/loctite discipline even when it slows down burn-in schedules — process correctness over throughput.
- Comfortable overriding a stricter-than-supplier internal threshold ("if we want to be strict... any failure, dont use") when supplier reliability is in doubt.

## Referenced Files (not content-readable)
- Motor and Driver Test Data Analysis and Standard Definition-20260427.pdf (ZLTech's proposed QC criteria/thresholds)
- IMG_3021/3022/3020.jpg — dimension-check photos (Lawrence)
- IMG_1001–1004 .MOV — traction motor brake gap measurement videos (Ayman)
- image.png (F0AV5QDNBCH) — Benjamin's washer/torque comparison image, forwarded to Chong Lee Seng for ZLTech discussion
