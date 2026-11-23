# MASTER_GAME_DESIGN.md

Status: DRAFT — DESIGN NORTH STAR
Purpose: High-level source of truth for the game's identity, design pillars, and major systems. Detail lives in `docs/`.
Last reviewed: 2026-11-23
Sources: Project owner's stated vision; recommendations in linked design documents.
Related: [[TECHNICAL_ARCHITECTURE]], [[DEVELOPMENT_ROADMAP]], [[docs/03-combat/combat-design-standard]], [[docs/08-progression/soulslike-progression-design]], [[docs/11-world-story/narrative-world-design]]

## 1. Vision
Build a deep, original-story, JJK-inspired R6 sorcery action RPG with competitive PvP. The game should feel like a dangerous supernatural world with deliberate duels, memorable bosses, meaningful exploration, and long-term character identity — not a generic anime simulator or repetitive NPC grinder.

The intended blend:
- **Combat:** readable fighting-game decision-making with Soulslike commitment, punish windows, and boss mastery.
- **Progression:** the breadth and build identity of Roblox action RPGs such as VV: Ultimatum, adapted to a more deliberate world loop.
- **Presentation:** strong R6 silhouettes, bespoke animation, weighty hit reactions, cursed-energy effects, and carefully staged high-impact moments.
- **World:** interconnected districts, secrets, factions, environmental storytelling, and original narrative.
- **Fairness:** competitive integrity, transparent progression, multiple viable builds, and no pay-to-win.

References are inspiration for design principles only. Never copy assets, maps, code, names, dialogue, animations, or protected expression.

## 2. Design pillars
1. **Combat first.** A dummy-less duel must be fun without rewards.
2. **Intentional commitment.** Attacks have startup, active, recovery, range, and counterplay.
3. **Multiple defensive answers.** Block, parry, dodge, spacing, interrupts, and technique-specific responses each matter.
4. **R6 is a design choice.** Build around R6 proportions and animation constraints rather than treating it as a limitation to hide.
5. **World depth.** Exploration, shortcuts, bosses, and environmental clues reward curiosity.
6. **Meaningful progression.** New unlocks change decisions and identity, not just damage values.
7. **Fair and transparent.** No pay-to-win; published odds, pity, duplicate compensation, earned acquisition paths.
8. **Server-authoritative.** Client intent is validated; server owns outcomes.
9. **Original expression.** JJK-inspired mechanics and themes are adapted into original playable content and story.
10. **Cross-platform.** PC, mobile, and controller parity is mandatory.

## 3. Reference inspirations
| Reference | Learn from | Evidence status |
|---|---|---|
| Jujutsu: RETRO | Atmosphere and presentation | Secondary research; first-hand observation needed |
| Jujutsu Infinite | Technique variety, clans, customization | Secondary research; verify current systems |
| Sorcery | Combat intensity and PvP | Secondary research; first-hand observation needed |
| VV: Ultimatum | Progression breadth, faction identity, combat progression | [[docs/01-reference-games/vv-ultimatum-design-takeaways]]; secondary only |
| Soulslike action RPGs | Boss learning, shortcuts, world storytelling, build identity | Research queue; adapt principles only |

## 4. Character origins (planned)
Sorcerer, Heavenly Restricted, Cursed Spirit, Incarnated Sorcerer, Cursed Object User, Cursed Corpse. Each needs starting identity, unique mechanic, progression track, counterplay, story route, and comparable long-term viability. `GAME-ORIGINAL` adaptation.

## 5. Signature systems (planned)
Black Flash as a precise timing skill event; cursed energy and reinforcement; weapon specializations; staged RCT restoration; vessel suppression; binding vows; anti-domain techniques; domain clashes with refinement; playable cursed-spirit evolution; boss mastery and rematches.

## 6. Core combat target (first milestone)
Over-the-shoulder camera; R6 rig; four-hit M1 combo; block; perfect block/parry; dodge; posture/guard break; cursed energy + reinforcement; one technique; hit reactions and knockdowns; stylized injury state; basic RCT; one arena with dummy and two-player PvP testing.

## 7. World and progression target
Start with one hub, one interconnected dangerous district, one shortcut, three enemy archetypes, one elite, one boss, a small NPC cast, one meaningful story mystery, one checkpoint, and one permanent unlock. Build a vertical slice before expanding the world.

## 8. Injury and presentation policy
Injury gameplay and visual intensity are separate. Provide permitted accessibility settings for injury intensity, blood effects, screen shake, and hit flashes where platform policy allows. These settings never change gameplay or content maturity. The existing design distinguishes Tier 0/1 main-experience presentation from a future Tier 2 Restricted-content decision. Re-check current Roblox rules before any release decision. See `docs/04-damage-rct/`.

## Implementation notes
This is the north star, not a command to build every system immediately. Build the combat prototype first, then one world/progression vertical slice. Claude's proactive operating expectations live in `docs/12-claude-workflow/`.

## Testing criteria
- "Is a dummy-less duel fun for 10 minutes?"
- "Does the player have a reason to explore when no quest marker points there?"
- "Can a boss be learned through observation and multiple defensive strategies?"
- "Does a new unlock change how the player fights?"
- "Can players on mobile/controller compete using the same core decisions?"

## Open questions
- Open-zone, hub-and-spoke, or instanced chapter structure?
- Which original story premise and player origin should be ratified?
- Launch origin count and PvP normalization approach?
- Restricted Tier 2 experience decision and current policy implications?
- Max concurrent players and target-device performance budgets?
