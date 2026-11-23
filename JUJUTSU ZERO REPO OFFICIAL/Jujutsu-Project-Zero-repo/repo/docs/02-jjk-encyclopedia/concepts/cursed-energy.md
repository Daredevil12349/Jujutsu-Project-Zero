# Cursed energy

Status: DRAFT
Purpose: Canon basis and game adaptation for cursed energy (CE), output, reserves and reinforcement.
Last reviewed: 2026-11-22
Sources: J01 (old revision), J03, J07, J27
Related: [[cursed-techniques]], [[../README]], ../../08-progression/README

## Canon basis
| Claim | Label | Source |
|---|---|---|
| CE is born from negative emotions that flow through the body; almost all humans output it in some form | `CANON-MANGA (reported, ch.74)` | J01 (**old revision of a wiki page; may be outdated**) |
| Toji Fushiguro is reported as the only person who does not output CE | `CANON-MANGA (reported, ch.71, 77)` | J01 (old revision; `UNVERIFIED` that this still holds in later chapters) |
| Sorcerers are people with increased CE who can see curses and use CE to fight them | `CANON-MANGA (reported)` | J03 |
| **Reinforcement** coats a body or object in CE; it is not a cursed technique because it does not perform a specific task | `CANON-MANGA (reported)` | J03 |
| Reinforcement can improve speed, strength, reflexes and durability, with limited soul protection | `UNVERIFIED` (TV Tropes summary only) | J-TV |
| A sorcerer's rank and skill usually depend on both technique proficiency and the amount of CE they have | `CANON-MANGA (reported)` | J03 |
| Seasoned sorcerers can sense other people's CE output, gauging their power | `CANON-MANGA (reported)` | J03 |
| A special-grade sorcerer typically combines large CE reserves, a powerful domain, technique and martial mastery, and Reverse Cursed Technique | `INTERPRETATION` (article generalization) | J27 |
| Output vs reserves vs efficiency are distinct ideas (raw amount vs usable output vs cost-efficiency) | `INTERPRETATION`: terms come from guide writers, not confirmed definitions | various, low reliability |

## Not yet researched
How CE "output" is defined in the work; CE cost conventions; CE perception rules; cursed-spirit CE; hereditary reserves.

## Game adaptation (GAME-ORIGINAL proposal)
| Concept | Proposed mechanic |
|---|---|
| CE reserve | A resource pool (max CE stat) regenerating out of combat |
| Output | A stat scaling technique damage and strength of reinforcement |
| Reinforcement | Toggle/stance that raises defense, speed or strike strength while draining CE per second; free-use baseline so non-technique builds remain viable |
| Efficiency | Mastery reduces CE cost of techniques |
Heavenly Restriction path replaces CE mechanics (see [[heavenly-restriction]]).

## Implementation notes
Server owns CE values; clients only display. Drain/regen rates live in config, not code.

## Testing criteria
- [ ] CE cannot go negative or above max by any remote sequence.
- [ ] Reinforcement drain stops when CE reaches zero and the state exits cleanly.

## Open questions
- Which CE rules from the manga should be strict (cost/exhaustion) versus abstracted for fun?
