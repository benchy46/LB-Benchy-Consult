# #r5-dv04-changes
**Slack channel ID:** C0ABG2VBAV9
**Purpose:** Running engineering changelog for the R5 DV04 build — torque specs, IPC/firmware configuration quirks specific to DV04, wiring/cable-slack standards, and stopgap 3D-printed fixtures — kept so changes are documented and (per Norris Joo) properly tracked as chargeable post-SOP changes. Fully read (single page, no more pagination), Jan–Mar 2026.

## Decisions & Reasoning (Benjamin)

- **Torque spec correction, no hedging**: Norris asked whether RGB camera screw torque was 0.1Nm or 0.2Nm given conflicting info; Benjamin: "should be 0.1Nm" — 2026-03-02 — [source](https://lionsbot.slack.com/archives/C0ABG2VBAV9/p1772415369436629)
- **Named a workaround as a workaround, not a fix**: introduced a bypass plug for battery-charging detection during system QC because "we unplugged the original cable," explicitly scoping it — "This is only done by Azmil now. And has to be done because we unplugged the original cable." — 2026-01-29 — [source](https://lionsbot.slack.com/archives/C0ABG2VBAV9/p1769673395520069)
- **Deliberately deprioritized a known defect** rather than let it block the line: "All IPCs have some weird distortion in the audio, we are ignoring this problem for now during system QC until we have a solution. This is an issue for DV03/04." — 2026-01-29 — [source](https://lionsbot.slack.com/archives/C0ABG2VBAV9/p1769672191091829)
- **Flagged a hardware-specific config trap for future builds**: "the IPC settings for the USB hub, startec is different. Which is custom for only startec. Only DV04 has startec. The IPC settings for this will change when we change back to the previous USB hub. Note for PV builds." — proactively documenting a gotcha so it doesn't silently regress in the next build phase — 2026-01-29 — [source](https://lionsbot.slack.com/archives/C0ABG2VBAV9/p1769671334238629)
- **Owned a gap the supplier left**: "IMU need to configure because supplier never configure for us. We are configuring for all IMUs for DV04, potentially PV also." — 2026-01-29 — [source](https://lionsbot.slack.com/archives/C0ABG2VBAV9/p1769669819928249)
- **Top-up tray adapter (3D-printed stopgap part)**: introduced a PLA-printed adapter + sponge combo to be used with the original grey part, explicit that "this is only for DV04 builds." When Lucas asked for an extensive sloshing-verification run (max clean water tank, race track + docking, 5 runs) before committing to it for shipping, the thread also surfaced a real supply risk — the team had "exactly 20" adapters/sponges for the whole build with no more available — and Benjamin's design stayed a factory-installed, ship-with-the-robot part despite that constraint being raised by Norris Joo and Joei Wee. — 2026-01-29 — [source](https://lionsbot.slack.com/archives/C0ABG2VBAV9/p1769665548554869) (full thread, 22 replies)
- **Explicit non-priority call on a design nice-to-have**: asked whether the sponge for the top-up tray should be pre-cut with a hole for the hose, Joei Wee said undecided/untested, Lucas said don't do it for now; Benjamin closed it out: "No, we don't cut. hose cannot hold is not priority now." — 2026-01-29 — [source](https://lionsbot.slack.com/archives/C0ABG2VBAV9/p1769664452071879) (full thread)
- Sticker/labeling detail for IMU configuration process, keeping physical documentation consistent with the fix — 2026-01-29 — [source](https://lionsbot.slack.com/archives/C0ABG2VBAV9/p1769669819928249)

## Notable Exchanges

- Terse, numeric answers under ambiguity ("should be 0.1Nm") rather than asking for more context first — he answers with the number and lets follow-up questions surface if needed.
- On the top-up tray adapter thread, his tone stays flat and practical even as Norris Joo raises supply-continuity concerns ("would be good to have spares, thats all") — he doesn't overreact to the scarcity, treating it as an ad-hoc/interim part rather than escalating.
- Multiple DV04-only carve-outs in his messages ("Note for PV builds," "This is only for DV04 builds," "This is an issue for DV03/04") show a consistent habit of scoping exactly which build phase a decision applies to, so it isn't silently inherited by the next revision.

## Recurring Themes / Principles Observed

- Distinguishes clearly between a permanent fix and an interim workaround, and documents workarounds with their trigger condition (e.g., bypass plug because "we unplugged the original cable") so someone downstream understands why it exists.
- Willing to explicitly deprioritize a known defect (audio distortion) to keep system QC moving, rather than block the line for a non-critical issue.
- Takes ownership of gaps left by suppliers (unconfigured IMUs) rather than pushing back on scope — configures it in-house and documents the reason.
- Scopes every ad-hoc change to a specific build (DV04 only, note for PV, etc.) — treats build phases as configuration boundaries that must be explicitly carried forward or not.

## Referenced Files (not content-readable)
- Consolidated Screw.xlsx — DV04 screw-list changes (Lawrence De Leon)
- top_up_tray_adapter.STL — Benjamin's 3D-printed adapter file
- IMG_0657/0658/0660/0662 — sponge rack, sponge stuffing, IMU sticker, bypass plug photos (Benjamin)
- IMG_9992.jpg — USB hub port 0 cable left unscrewed for USB glueing access (Norris Joo)
- IMG_6830–6837 — cable slack/cable-tie placement reference photos (Ong Ning Wei)
