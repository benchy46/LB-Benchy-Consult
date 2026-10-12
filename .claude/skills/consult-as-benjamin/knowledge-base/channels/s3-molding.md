# #s3-molding
**Slack channel ID:** C0BUTLTN62F
**Purpose:** Channel for releasing S3 injection-moulded (IM) parts to tooling: drawing and file standards, CMF conventions and the PV BOM, broadcast to the S3 mechanical designers.

**Added 2026-10-12.** New channel, not in the original 50-channel seed. Every captured Benjamin message is a `<!channel>` standards broadcast.

## Decisions & Reasoning (Benjamin)

- **[2026-09-25] An IM release checklist as a copyable template.** "<!channel> Hi all, as we are releasing IM parts soon, you can use this for checking all your parts + drawings. TEMPLATE checklist • [ ] Material • [ ] Colour • [ ] Texture • [ ] Draft Angle • [ ] Wall Thickness • [ ] Fillets • [ ] Date Stamp (no need for very small parts) • [ ] Correct Drawing Notes • [ ] Correct SKU • [ ] Material Stamp." One inline exemption ("no need for very small parts"), no other prose. Preceded by a named ack request to three designers: "Please acknowledge thanks!"
- **[2026-09-25] PV BOM, and uprevs are back.** "<!channel> We have a new PV BOM [Google Sheet], which we will update the latest material + SKU here. Do remember to uprev the X number, and create a new folder in google drive ( you can do it from PLM ). If your drawings has the correct drawing notes, then we are able to filter out the respective drawings from PLM side." Seven days after his 2026-09-18 rule "From now on we will not do anymore uprevs of our SKUs" (`s3-mech-architecture.md` / `principles.md` §7), the X-number uprev is required again for the PV release. The freeze was scoped to the DV parts being rushed out before the holiday; a new build phase brings the versioning back. Drawing notes are justified by the automation that reads them (PLM filtering).
- **[2026-10-05] File-naming rule that pairs STEP to PDF.** "<!channel> for BOTH .step files and .pdf files, please name them like this. [SKU-XXXX-XX] Part Name REV0X Example: [SKN-0155-X1] Facade Panel REV01. This helps us and suppliers know what step file corresponds to what drawing, since it can quickly get confusing. We will go through the exact upload process soon. but just prep the drawing and step files first." Rule, worked example, reason (the supplier's confusion), and an explicit "prep now, process later" so nobody waits.
- **[2026-10-06] Natural colour for invisible internal parts, stated with its manufacturing reason.** "<!channel> for internal mounts that won't be visible AT ALL to the user, please put natural colour. This allows us to know that these parts are flexible to mold with items of other colours." A CMF convention that encodes a moulding-flexibility signal in the drawing.
- **[2026-10-06] CAD colour code for textured surfaces, extended within half an hour.** "<!channel> for any textured surface we are using BLUE and PINK AND GREEN to colour our surfaces, apart from GREY. Do colour your surface accordingly thanks!" then "ADDED Green" — corrected in the open, in the same thread, with no explanation.

## Notable Exchanges
- No replies to his broadcasts were captured in the window apart from the ack request; the channel is used as a one-way standards feed.

## Recurring Themes / Principles Observed
- **Standards land as templates and worked examples, not descriptions** — a checkbox list to copy, a filename with a real SKU in it.
- **Every rule carries its downstream reason**: suppliers matching STEP to PDF, PLM filtering drawings by notes, moulders knowing which parts can be shot in any colour.
- **Versioning discipline is phase-scoped**: off for the rushed DV parts (2026-09-18), back on for the PV release (2026-09-25).
- **Explicit acknowledgement requested** on standards posts (see also `s3-mech-architecture.md`, 2026-10-02).

## Referenced Files (not content-readable)
- S3 PV BOM Google Sheet (2026-09-25); file-naming example image (2026-10-05) — not opened.

## Coverage note
**Partial.** Built 2026-10-12 from Benjamin Chay's seven messages in this channel between 2026-09-25 and 2026-10-06 (his posts only; the wider channel history was not swept).
