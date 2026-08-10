# #r5-development
**Slack channel ID:** C07MH5AV97D
**Purpose:** R5 development channel spanning mechanical, autonomy, and embedded — squeegee/water-trail behaviour, turning-radius and dry-patch analysis, hose and vac-cast part iteration, charging current, ball-valve reliability, and cleaning-behaviour workflow design. Regular voices include Joei Wee, Tat Leong, Andrian Huang, Lucas, Akhil Jayadeep, Lennon Jiang, and Oh Yunjae.

**Added 2026-08-10.** Missed by the initial 50-channel seed.

## Decisions & Reasoning (Benjamin)

- **Direct measurement beats indirect inference when FMEA risk scoring is the arbiter** — "Undercurrent detection is an indirect method, flow sensing is a direct method. Based of FMEA scoring, the risk is further reduced if it is a direct method." — 2026-06-10. This is an important boundary on his better-known preference for inferring new states from existing signals (float-switch combinations, vacuum-motor RPM drop). The inference-over-hardware default applies when the signal is adequate and the hardware is avoidable; when a detection-rated function is being scored formally, he argues the other way and accepts the sensor.
- **Diagnosed a dry-patch complaint from video geometry rather than from settings** — "Based off the video, I can very clearly tell that the robot is turning about one wheel, where the dry spot also coincides with the wheel. therefore the brush deck also clearly did not go over that dry spot, since it is occupieed by the wheel in the entire turn." Then converted it into a control question ("May we know what are the values that can be adjusted to constrain the actual turning radius?") and finally into a geometric statement of the limit: "any fixed turning radius will have a dry patch. If you don't want a dry patch then you have to turn out first, then turn in, hair pin shape." — the fix is a manoeuvre change, not a parameter tweak. — 2026-05-21
- **Refuses a water-setting reduction without floor-dryness data, but states exactly what would unblock it** — "My concern is the dryness of the floor after, if there is concrete data that the floor is still dry at lower settings, then for sure we can lower." — 2026-06-08. Textbook shape: the objection and its dissolving condition in one sentence.
- **Killed a proposed field fix on effort-equivalence grounds** — on flipped hoses: "Better to make decisions based off that info, because that way, it is the same, or more effort on PDI side if we want to give them a part to swap, vs them just swapping the hose. But the effect is the same, so it makes no sense. Only for new robots it may make sense, but we don't want to create new problems when adjusting the dimensions e.g the hose now is too hard to push in. We can consider swapping at CM side also?" — rejects the change because it costs the same and achieves the same, flags the regression risk of the "better" alternative, and still offers a third venue. Preceded by the diagnostic question: "do you know for robots that has the hoses flipped, does the problem occur again quickly or it is fixed for a long time?" — 2026-06-15/16
- **Flat refusal when there's no case at all** — "Nope, there is no reason why we should be doing it" — 2026-07-22
- **Validated the ball-valve current-limit fix himself before recommending it** — "the supplier is able to solder internally a 180ohm, 2W resistor to limit the current. I tested and it does seem a good way to make sure the gears will not break, other than making the gears metal. Since it only turns on for 10sec or so at a time, it should be a pretty robust solution to hard limit, while neglecting eff, due to power loss from the resistor." — explicitly prices the trade (accepts efficiency loss for a hard limit) and notes the duty cycle that makes it acceptable. Cross-references the option list he'd posted in [#r5-mech-architecture](./r5-mech-architecture.md). — 2026-05-04
- **Checks a cross-domain assumption rather than assuming it** — to embedded: "is it correct to say that if the robot draws abit more current (1--3A) while charging, it would just have slightly slower charging, since we're already turning on other stuff like ts and ipc and cooling fans?" — 2026-05-04
- **Material iteration by sample, not by spec argument** — "lets test with the higher shore hardness sample that we will be getting from kaier. this one possibly too soft" (2026-04-30); "Prototype Vac cast shore 80A, $34.56 SGD/pc, 15 pcs. I just tell them to go ahead first with the production since it's urgent?" (2026-05-06)
- **Explicit priority ranking on a known-but-minor issue** — "ya some, but very very mild i would say. We can still make the interface tighter but it would be lowest priority" — 2026-05-07

## Notable Exchanges

- **Postponed a meeting rather than run it short-handed** — asked for a squeegee-cleaning workflow discussion to be moved because he'd be out and Akhil Jayadeep was on MC: "sorry I won't be in office then, and Akhil Jayadeep is on MC, do you want to postpone it?" Joei Wee rescheduled to the next day. Small, but consistent: he treats the right people being present as a precondition for a design discussion rather than proceeding with whoever's available. — 2026-08-05 — [source](https://lionsbot.slack.com/archives/C07MH5AV97D/p1785903581320979)
- The same thread (Oh Yunjae asking for a mech-side squeegee-cleaning flowchart) was answered substantively by Joei Wee, not Benjamin — including the scope calls that squeegee cleaning can't overlap vacuum drying and that brush cleaning isn't on the roadmap. Attributable to Joei, not to Benjamin.
- **The 2026-05-21 turning-radius thread** shows him doing frame-by-frame reasoning from a video and confirming a number back to autonomy ("Yes your are right, 27cm. The turning radius band only indicates if the robot leaves water or not") — he corrects and confirms others' figures rather than restating his own.

## Recurring Themes / Principles Observed

- **States the dissolving condition alongside the objection** — "if there is concrete data that the floor is still dry at lower settings, then for sure we can lower." Objections are framed as open questions with a named answer, not as vetoes.
- **Effort-equivalence test on field fixes** — if a proposed remedy costs service the same as the workaround and achieves the same outcome, he kills it; new-build application is evaluated separately.
- **Tests the fix himself before recommending it** (the 180Ω resistor), and prices what the fix gives up (efficiency) rather than presenting it as free.
- **Direct vs indirect detection is a live distinction for him**, decided by FMEA scoring rather than by a blanket preference — a genuine nuance against his usual "infer from existing signals" instinct.
- **Reads evidence geometrically** — the dry-patch diagnosis comes from where the wheel was during the turn, not from telemetry.

## Referenced Files (not content-readable)
- Turning-radius / dry-patch videos referenced in the 2026-05-21 thread — not retrievable.
- Vac-cast and Kaier shore-hardness samples discussed by name only; no CAD or datasheets shared in-channel.

## Coverage note
**Partial.** Built 2026-08-10 from a targeted search of Benjamin's own messages (most recent 20, spanning 2026-04-29 → 2026-08-05) plus a full read of the 2026-08-05 squeegee-cleaning thread. A further page of his messages exists before 2026-04-29 and was not read; non-Benjamin channel traffic was not swept. Sample, not exhaustive extract.
