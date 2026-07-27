# Standard Torque Values and Guidelines — team standard

**Source:** Notion, "Standard Torque Values and Guidelines"
(`https://app.notion.com/p/176ca9552bd880bda956e62fdd267ff0`), under
Homepage → Mechanical Knowledge Wiki. Retrieved 2026-07-27; page content as of
2026-05-20. Linked from `cad-integration.md` as the authority on fastening
torque and Loctite practice.

**Purpose, in the page's own framing:** torque values exist to standardise robot
quality at the factory — if the line always applies a verified torque, the joint
always works.

**Note on provenance:** this page is the codification of decisions already
visible in the channel evidence. The `TMx_<material>` notation (writing a code
in the SOP rather than a literal value) and the 1.0 Nm M4 standard both appear
in the Slack record before this page existed — the standard and the observed
behaviour agree.

**Not captured:** several images on the page could not be read — the torque
symbol used in SOPs, photos of components with printed torque ratings, the SMA
torque wrench, and an **A2-70 fastener tightening-torque chart** used to
estimate values for the A2-70 bolts used in production. Anything living only in
those images is missing here.

---

## Torque wrench standards

- The torque **notation must be labelled on the wrench itself**.
- Torque wrenches must be **calibrated monthly**.
- SOPs carry a standard torque symbol (image, not captured).

## Notation

Values are written into SOPs as a **code, not a number** — `TM<size>_<material>`
— so the value can be revised centrally without editing every SOP.

### Brass inserts

Requires **> 3 mm thread engagement**.

| Code | Torque |
|---|---|
| `TM3_Brass` | 0.8 Nm |
| `TM4_Brass` | 1.0 Nm |
| `TM5_Brass` | 1.6 Nm |
| `TM6_Brass` | 2.0 Nm |

### Aluminium threads

**LB internal:**
- Screws into aluminium **always get Loctite** if not an electrical contact, and
  then **no torque wrench is needed** — unless otherwise specified.
- Screws into aluminium **for electrical contacts** (e.g. a ring terminal onto
  an aluminium plate for grounding) **must have a torque value in the SOP**. If
  one doesn't exist, request it from the R&D engineer.

**For CM (contract manufacturer)** — same two rules, plus published values:

| Code | Torque |
|---|---|
| `TM3_ALU` | 1.2 Nm |
| `TM4_ALU` | 1.5 Nm |
| `TM5_ALU` | 2.4 Nm |
| `TM6_ALU` | 3.0 Nm |

- These are **all-encompassing, deliberately conservative** values, accounting
  for the range of materials (plastics, metals) a given screw might fasten.
- **If your mechanism needs more, specify it in the SOP** — e.g. cleaning
  floortool lift mechanisms.

### Stainless steel and mild steel threads

**LB internal:** identical rules to aluminium — Loctite and no wrench when not
an electrical contact; a mandatory SOP torque value when it is (e.g. a ring
terminal onto an SS chassis for grounding).

**For CM** — same, plus the same conservative-value and specify-if-higher
caveats:

| Code | Torque |
|---|---|
| `TM3_SSMS` | 1.2 Nm |
| `TM4_SSMS` | 1.5 Nm |
| `TM5_SSMS` | 2.4 Nm |
| `TM6_SSMS` | 3.0 Nm |

Note that the ALU and SSMS tables carry identical values.

### Copper threads

Mainly docking-related mechanisms, fastening a ring terminal. Few screw-size
variants exist on the line. Requires **> 3 mm thread engagement**.

| Code | Torque |
|---|---|
| `TM4_Copper` | 2 Nm |

## Electrical components

- **Use a torque wrench** for wires going into or out of electrical components.
- Each component has a recommended value, usually printed on it or in the
  datasheet — but **physically test it and tune from there**. Reduce it if
  ferrules start to break or the component begins to snap apart.
- **Tuned values must be written into the SOP**, and any additional tool bits
  needed must be purchased accordingly.

### SMA connectors

- A **dedicated SMA torque wrench must always be used**, and the SOP must
  explicitly call for it.
- Torque is **fixed at 0.4 Nm**.
- **Factory workers must not use pliers or a spanner** of any kind on these.

## General rules

- **No torque value is given for a screw that has Loctite**, unless it is really
  needed.
- **ALL electrical connections need torque values** — docking contacts, safety
  relays, terminal blocks, antennas, and so on. Usually the value is on the
  component or in its datasheet.
- **Torque values must always be verified physically.**
- A manufacturer's stated value **need not be followed strictly** if testing
  shows it impractical or too high. Worked example from the page: a component's
  rated torque made it easy to snap the connector out of its plastic casing, so
  reducing it slightly was judged perfectly acceptable.
- Production uses **A2-70 bolts**, so general manufacturer tables can be used to
  estimate tightening torque (chart on the page, not captured here).
