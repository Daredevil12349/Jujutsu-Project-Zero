# Reference: AKAYUKI: Steel Blossoms Red

Status: RESEARCHED-SECONDARY (fan wikis, stat sites, official community page); **mesh-slicing implementation UNVERIFIED**
Purpose: Study a katana duelling game the owner cited for mesh slashing and sword-driven combat.
Last reviewed: 2026-11-22
Sources: A01 to A04
Related: [[../04-damage-rct/dismemberment-restricted-track]], [[../09-roblox-handbook/07-mesh-slicing-study]], [[OBSERVATION_PROTOCOL]]

## 1. Identity
- By Roblox user/group owner `spidermanguy999`; place ID 137434708718714; described by its official community as "a katana duelling game in a snowy valley in Japan": draw from the sheath with a swipe, steer the blade, cut your opponent before they cut you. (A01)
- A stats site lists creation in **October 2026**, so it is a very new game; version strings seen: 1.3.12 to 1.4.1. (A03)
- 1.4.1 announcement: console support, new tachi draw style, free-cam mode, player transparency mode, improved lock-on. (A01)

## 2. Reported mechanics (fan wiki and guides; REPORTED)
- Skill-based 1v1 style duels, including a "First to 3" format; lethal strikes; lock-on; draw and sheath; side dash; kick; poise system with attack costs and blade clashes; **Iai** draw-cut-only style reportedly costing 40 poise with 40% recovery on a kill; a dual-wield "blood flick" is mentioned. (A02, A04)
- Progression: levels to 50, katana milestones about every five levels, a Forge to upgrade blades up to "Muramasa", rolling a family name, cosmetics. (A01, A04)

## 3. What is NOT established
- **Whether or how it slices meshes.** None of the sources I found describe the technique (EditableMesh, pre-cut parts, CSG, or effects). The owner's description is accepted as a goal, but the implementation is `UNVERIFIED`. First-hand observation needed: [[OBSERVATION_PROTOCOL]] (add: "what happens to the target on a lethal hit? Does geometry actually split, and is it consistent across angles?").
- Whether the game's content label is Moderate or Restricted.

## 4. Takeaways (RECOMMENDATION)
| # | Idea | Basis |
|---|---|---|
| A1 | **Poise** as the central duel resource (attacks cost it, clashes drain it, kills restore some) maps well to guard-break/stagger rules in docs/03 | REPORTED (A02) |
| A2 | Directional, aimed blade control (steer the draw) suits slash-based techniques with real direction | REPORTED (A01) |
| A3 | Short first-to-N duel format makes lethal hits feel significant and keeps matches short | REPORTED (A02) |
| A4 | Lock-on, free cam, and controller support are part of its recent updates; plan camera features early | REPORTED (A01) |

## Testing criteria
- [ ] Owner observation notes added (esp. the lethal-hit presentation and hit detection feel).
## Open questions
- Slicing technique, content rating, network model.
