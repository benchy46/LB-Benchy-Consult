# #ai-mech-tools
**Slack channel ID:** C0ARPF1FARL
**Purpose:** Channel Benjamin created/leads (he's the first joiner, 2026-04-09) to drive AI-tooling adoption within the Mechanical team — rolling out Claude/AI-assisted workflows (SolidWorks MCP, AI-assisted drawings, procurement automation, FMEA generation, internal dashboards) and pushing Daniel Tan, Lucas, Pradeep Kumar, Ayman Khan, and Sunardi Tay to actually use them. Entire history (2026-04-09 to 2026-07-22) fits in one page — channel is only ~3.5 months old.

## Decisions & Reasoning (Benjamin)

- **Mandated hands-on AI practice, not passive awareness**: "would you all be able to create an AI artifact by claude by end this week, to improve any of our workflows, do calcs or plan or anything? I would like for us to continue practice using AI, and get used to it," with a linked 30-min video lesson and instruction to share the resulting artifact back to the channel for everyone to see. Reasoning: skill only builds through repeated hands-on use, not by watching him do it. 2026-06-08. [source](https://lionsbot.slack.com/archives/C0ARPF1FARL/p1780930224872779)
- **Built and standardized a "Mech AI context database" in Notion** — populated a database of instructions specifically so *other people* could get better results prompting AI ("Claude cowork or chat") for their own work, rather than keeping tacit knowledge to himself. 2026-05-09. [source](https://lionsbot.slack.com/archives/C0ARPF1FARL/p1778329406117719)
- **SolidWorks MCP rollout — deliberate, safety-gated install process**: gave teammates (Daniel, Lucas) a highly specific, step-by-step Claude Code install prompt for the internal SolidWorks MCP server, explicitly requiring the agent to STOP and ask for confirmation before any step needing admin/elevated rights (Node.js/`.NET` system install, Visual Studio Build Tools, `regsvr32`/COM re-registration), and requiring transparent error reporting rather than blind retries ("If any step fails, show me the actual error output and the specific fix before retrying — don't loop blindly"). 2026-06-22. [source](https://lionsbot.slack.com/archives/C0ARPF1FARL/p1782139569041539)
- **Constrained an AI procurement experiment's scope deliberately**: when describing his Claude-driven Alibaba sourcing experiment, explained he intentionally "constrain[ed] it to alibaba for now" since it already has LionsBot's shipping/address context, and was candid about where it broke down — "I still had to intercept it's conversation with the supplier, but that's cause it cannot upload files for me." Realistic, not oversold, assessment of what AI can/can't do yet in his own workflow. 2026-05-21. [source](https://lionsbot.slack.com/archives/C0ARPF1FARL/p1779367758067849)
- **Suggested a live Precoro dashboard via API + Claude** to Daniel Tan for chasing outstanding finance orders, but explicitly delegated it rather than doing it himself: "I'll leave it up to you to do it with claude." 2026-07-02. [source](https://lionsbot.slack.com/archives/C0ARPF1FARL/p1782958727001259)
- **Practical/skeptical tone on hardware review AI**: shared a SolidWorks-drawing-generation-via-Claude attempt with the caveat "Much to improve but, not bad still" — balances enthusiasm for the tooling with honest limitation-flagging rather than hype. 2026-06-01. [source](https://lionsbot.slack.com/archives/C0ARPF1FARL/p1780288989973779)

## Notable Exchanges

- Daniel Tan asked a sharp follow-up question on the procurement AI experiment ("would be great to know what are the boundaries you're not allowing the AI to cross today") — Benjamin's answer (see above) shows he'd already thought about guardrails, not just capability.
- On GitHub account setup nagging Daniel/Lucas repeatedly over months (2026-04-10 through 2026-07-14) — persistent but good-humored: "Hi sir, tmr never comes 😂😂😂" (2026-07-22), showing he tracks slow-moving admin blockers with patience and light ribbing rather than escalation.
- Casual/local vernacular used freely even in a technical-process channel: "walao so sad 🫠" in reaction to a vendor limitation (Precoro API not in their plan tier).

## Recurring Themes / Principles Observed

- **"Learn by doing" leadership style for tooling adoption** — repeatedly sets concrete, time-boxed tasks (build an artifact in 30 min, try the SolidWorks MCP, create a canvas) rather than issuing top-down mandates without a path to skill-building.
- **Explicit safety/guardrail thinking baked into automation instructions** — the SolidWorks MCP install prompt is unusually careful about elevation/admin risk and insists on transparent failure reporting, suggesting a broader principle of "don't let automation do silent/risky things without a human checkpoint."
- **Honest about AI's current limits** in his own experiments (can't upload files to suppliers, "much to improve") rather than oversell — consistent with his general low-hype, plain-spoken style seen elsewhere.
- **Sees himself as an internal driver/champion of a company AI initiative**, not just a user — building shared context databases and dashboards for others to leverage, not only using AI for his own tasks.

## Referenced Files (not content-readable)
- Various screenshots (`image.png`) illustrating Alibaba AI-procurement conversations, Precoro API doc, SolidWorks AI drawing attempts, and wiring diagrams — filenames/context only, content not verifiable.
- `3DEXPERIENCE + SOLIDWORKS + AI.zip` (posted in mech-leads by Daniel Tan, cross-referenced context, 435MB) — not opened.
