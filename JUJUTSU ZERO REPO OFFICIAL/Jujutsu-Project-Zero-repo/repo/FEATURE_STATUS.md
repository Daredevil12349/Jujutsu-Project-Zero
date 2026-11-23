# FEATURE_STATUS.md

Status: LIVE TRACKER (update every session)
Last updated: 2026-11-22 (session 4)

Legend: [x] done, [~] in progress, [ ] not started

## A. Repository build checklist
### Core files
- [x] README.md
- [x] CLAUDE.md
- [x] PROJECT_RULES.md
- [x] MASTER_GAME_DESIGN.md (draft, from owner vision; no external research)
- [x] TECHNICAL_ARCHITECTURE.md (draft)
- [x] DEVELOPMENT_ROADMAP.md
- [x] FEATURE_STATUS.md
- [x] RESEARCH_SOURCES.md (framework + research queue; no sources logged yet)
- [x] ASSET_LICENSING.md
### Templates
- [x] technique, animation, vfx, sfx, boss, system, lore, research-entry
### Directory indexes (README per docs folder)
- [x] docs/01 to docs/09 index files (all STUB)
### Content phases (each needs its own session)
- [~] Part 1: reference-game research. DONE (secondary only): Jujutsu Infinite, RETRO, Sorcery, Shibuya, survey of 8+ other Roblox JJK games, comparison + takeaways. TODO: first-hand OBSERVED notes (owner), non-Roblox action RPG / fighting-game / injury-system references
- [ ] Part 2: JJK encyclopedia
- [ ] Part 3: combat engineering docs
- [ ] Part 4: damage, slashing, RCT
- [ ] Part 5: animation database
- [ ] Part 6: VFX/SFX library
- [ ] Part 7: technique database
- [ ] Part 8: progression and probability tables
- [~] Part 9: Roblox technical handbook (5 files done: validation, hit detection, remotes, server authority, animation events; remaining topics listed in docs/09-roblox-handbook/README.md)
- [ ] Final audit report

### Future tracks (owner-requested, not for early milestones)
- [~] Dismemberment + RCT regrowth (Restricted content track): policy research and design DRAFT done (docs/04-damage-rct/dismemberment-restricted-track.md); implementation not started
- [~] Ragdoll physics study (docs/09-roblox-handbook/06): research done, spike pending
- [~] Mesh slicing study (docs/09-roblox-handbook/07): research done, pure-math prototype, spikes pending
- [~] AKAYUKI reference (docs/01-reference-games/akayuki-steel-blossoms-red.md): its slicing method UNVERIFIED, needs owner observation
- [ ] Decision: whether to build the Restricted (Tier 2) experience at all

## B. Game systems
- [ ] PlayerData (DataStore + session lock)
- [ ] CharacterInit
- [ ] Stats
- [ ] Input
- [ ] Camera (over-the-shoulder)
- [ ] Movement (sprint, dash)
- [ ] Combat state machine
- [ ] M1 combo (4-hit)
- [ ] Block / perfect block / parry / dodge
- [ ] Hit reactions and knockdowns
- [ ] Cursed energy and reinforcement
- [ ] First technique
- [ ] Injury visuals (stylized)
- [ ] RCT (basic regeneration)
- [ ] Test arena + dummy

## Known contradictions / data conflicts logged
- JJI Star Rage 0.25% vs Special Grade 0.25% cumulative (docs/01-reference-games/jujutsu-infinite.md): unresolved, UNVERIFIED.
- JJI Black Flash resource: tokens (max 5) vs fill bar: unresolved.
- JJI technique count differs by article date (17/19/23).


## Update 2026-11-22 (session 5): Obsidian vault + visual references
- [x] Obsidian vault connected; repo verified in sync (44 notes).
- [x] docs/10-picture and video reference/README.md created (index + reference-to-doc map)
- [~] Visual reference analysis: 0 of 10 pack items analyzed; needs owner-captured frames (Claude cannot watch video)


## Update 2026-11-22 (session 6): Part 2 JJK encyclopedia, first pass
- [~] Part 2 encyclopedia. DONE (secondary-source, chapter-attributed, labelled): README + concepts for cursed energy, cursed techniques, RCT, Black Flash, binding vows, Heavenly Restriction, barrier techniques and domains; technique stubs for Idle Transfiguration and Sukuna's cutting techniques (Dismantle partial). Sources J01 to J27 logged.
- [ ] Part 2 TODO: cursed spirit grades, cursed objects, incarnated sorcerers/vessels, death paintings, clans and inherited techniques, cursed tools, sorcerer grades, domain clashes/refinement, Cleave/Fuga, per-character entries, anime-only differences.
- [ ] Owner verification: spot-check chapters flagged `UNVERIFIED` against the manga (esp. ch.11, 71, 227, 256 to 258, 263, 266).
- [ ] Decision logged: Heavenly Restriction note is a pointer to binding-vows.md#Heavenly Restriction.
