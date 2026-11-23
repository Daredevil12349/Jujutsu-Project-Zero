# MASTER_GAME_DESIGN.md

Status: DRAFT
Purpose: High-level design source of truth. Detail lives in `docs/`.
Last reviewed: 2026-11-22
Sources: project owner's stated vision (no external research yet)
Related: [[TECHNICAL_ARCHITECTURE]], [[DEVELOPMENT_ROADMAP]], `docs/03-combat/`, `docs/08-progression/`

## 1. Vision
A deep, original, polished JJK-inspired RPG with competitive PvP. Not a generic anime simulator and not a "beat up bandits" grinder.

## 2. Design pillars
1. **Combat first.** 1v1 combat must be fun with no rewards attached.
2. **Fair and transparent.** No pay-to-win; published odds; pity; duplicate compensation.
3. **Multiple paths to power.** Rolling, story, exploration, bosses, mastery. Never a single forced farm.
4. **Server-authoritative.** Cheating-resistant by construction.
5. **Original expression.** Inspired by reference games' ideas, never their assets or code.
6. **Cross-platform.** PC, mobile, and controller.

## 3. Reference inspirations (owner-stated; research pending, see `docs/01-reference-games/`)
| Game | Owner wants to learn from | Status |
|---|---|---|
| Jujutsu: RETRO | Atmosphere, presentation | UNRESEARCHED |
| Jujutsu Infinite | Technique variety, clans, customization | UNRESEARCHED |
| Sorcery | Combat intensity, PvP | UNRESEARCHED |

## 4. Character origins (planned)
Sorcerer, Heavenly Restricted, Cursed Spirit, Incarnated Sorcerer, Cursed Object User, Cursed Corpse. Each needs: starting stats, unique mechanic, progression track, counterplay. `GAME-ORIGINAL`.

## 5. Planned signature systems
Black Flash as a precise timing mechanic; staged visual RCT restoration; vessel suppression battles; domain clashes with refinement; weapon specializations; playable cursed-spirit evolution.

## 6. Core combat target (first milestone)
Over-the-shoulder camera; 4-hit M1 combo; block, perfect block, dodge, parry; cursed energy + reinforcement; one technique; hit reactions, knockdowns, stylized limb damage; basic RCT regeneration; one arena with dummy and PvP testing.

## 7. Injury presentation policy
Main experience: stylized and non-graphic (Tier 0/1). **Owner-confirmed future feature:** dismemberment with Sukuna-style cutting techniques/weapons and sharp Idle Transfiguration variants, with RCT limb regrowth, shipped as a Restricted-rated Tier 2 build only. Roblox's own docs list dismemberment under Restricted violence, so it must live in a separate experience; see `docs/04-damage-rct/dismemberment-restricted-track.md`. Physics studies: `docs/09-roblox-handbook/06` (ragdolls) and `07` (mesh slicing).

## Implementation notes
Each pillar maps to a roadmap phase; see [[DEVELOPMENT_ROADMAP]].

## Testing criteria
Playtest question for the combat pillar: "Is a dummy-less duel with no rewards still fun for 10 minutes?"

## Open questions
- Open-world scale and streaming budget?
- Monetization model that stays strictly non-pay-to-win?
- Max concurrent players per server for PvP?
