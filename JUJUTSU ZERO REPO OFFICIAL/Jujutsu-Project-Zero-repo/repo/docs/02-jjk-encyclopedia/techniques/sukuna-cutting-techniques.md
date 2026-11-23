# Technique: Sukuna's cutting techniques (Dismantle, Cleave, related)

Status: STUB (Dismantle partially sourced; Cleave and Fuga unresearched; contains manga spoilers)
Purpose: Canon basis and game-adaptation scaffold for Shrine-style slashing, feeding the damage and dismemberment docs.
Last reviewed: 2026-11-22
Sources: J22, J23, J26, J-DT (low-reliability blog), J12
Related: [[../concepts/barrier-techniques-and-domains]], [[../concepts/black-flash]], [[../../04-damage-rct/dismemberment-restricted-track]], ../../../templates/technique

## Canon basis (what was actually sourced)
| Claim | Label | Source |
|---|---|---|
| Sukuna's technique **Dismantle** was kick-started by a Black Flash hit on him (after Maki's return) | `CANON-MANGA (reported)` ⚠ MANGA-SPOILER | J23 |
| Sukuna has an innate "Shrine" technique; a source reports Yuji, after an awakened state following Black Flashes, drew it out and used it as his own | `CANON-MANGA (reported)` ⚠ MANGA-SPOILER | J22 |
| Malevolent Shrine is Sukuna's domain; he reproduced it at full output after the Black Flash sequence | `UNVERIFIED` (fan translation) ⚠ MANGA-SPOILER | J26 |
| A blog describes Yuji using Dismantle on the boundary of Sukuna's and Megumi's souls as part of his domain's sure-hit | `UNVERIFIED` (low-reliability blog) ⚠ MANGA-SPOILER | J-DT |
| Sukuna uses Hollow Wicker Basket against domains | `CANON-MANGA (reported, ch.249, 266)` | J12 |
| Cleave (adaptive cutting), Fuga (fire), fire/flame abilities, and the "Shrine" specifics (cutting scope, range, domain details) | `UNVERIFIED`: not yet sourced in this repo | none |

## Game adaptation (GAME-ORIGINAL scaffold; not canon)
| Family (from the dismemberment track) | Hitbox idea | Counterplay |
|---|---|---|
| Straight slash (Dismantle-style) | Thin long box (GetPartBoundsInBox) | Dodge sideways, block, parry |
| Multi-slash volley | Several staggered boxes over active frames | Rhythm-based dodge; guard-break window at the end |
| Area slash | Radial or cone, wider with longer startup | Distance, vertical dodge |
| Adaptive cut (Cleave-style) | Damage scales with target's durability/reinforcement; short range, strong telegraph | Reinforcement stat, repositioning |
| Domain slashing | Sure-hit within the domain | Simple Domain / HWB / FBE / leave range / interrupt |
| Environmental cutting | Props split via mesh-slicing study | n/a |
Weapons: blade classes with distinct arcs and reach classes (docs/03 weapon combat).
Tier 0/1 presentation: energy slash lines, limb "disabled"; Tier 2 (Restricted build only): severing per [[../../04-damage-rct/dismemberment-restricted-track]].

## Required before implementation
- [ ] Source Dismantle, Cleave, Fuga and Malevolent Shrine mechanics from primary chapters.
- [ ] Verify the Black Flash-kickstart and soul-boundary claims.
- [ ] Complete the technique template for each ability with startup/active/recovery frames.

## Implementation notes
Shapes and timings live in per-move config; hitbox queries use [[../../09-roblox-handbook/02-hit-detection]].

## Testing criteria
- [ ] Each slash shape visualized and tested for hit-once-per-target and wall blocking.

## Open questions
- Which of these become unlockable techniques vs boss-only moves?
