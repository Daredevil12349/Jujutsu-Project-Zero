# Comparison and design takeaways

Status: DRAFT (secondary research only)
Purpose: Compare reference games and turn findings into labelled design recommendations.
Last reviewed: 2026-11-22
Sources: see per-game docs
Related: [[jujutsu-infinite]], [[jujutsu-retro]], [[sorcery]], [[shibuya]], [[other-roblox-jjk-games]], ../../MASTER_GAME_DESIGN.md

## 1. Comparison matrix (all REPORTED)
| Aspect | Jujutsu Infinite | Jujutsu: RETRO | Sorcery | Shibuya |
|---|---|---|---|---|
| Technique acquisition | Spin gacha, rarity tiers, pity for Special Grade | Random awaken per wave in Initiation; blessing cards; abilities in world in Culling Game | Techniques unlocked via roll/level (details UNVERIFIED) | Race + clan + technique layers (roll details UNVERIFIED) |
| Combat identity | M1 chain, heavy, block, dash, Rush flight, Black Flash prompt, chanting | Technique kits on Z/X/C/F combos; Black Flash gates a move | Parry-centric, dash-cancel, weapons, wall run, aerial/uptilt | Techniques ranked; reinforcement absorbs hits |
| PvP | Modes exist; tier lists | Sandbox/PvP switch, Culling Game | Core pillar | Fighting game |
| Progression | Mastery, stat trees, gear, awakenings | Run-based blessings; grade progress | Levels, missions, loot | Races, clans, trials |
| Domain | Legendary/Special Grade only, equipable multiple | Unlock card with 1200 CE cost | Exists (details UNVERIFIED) | Not covered |

## 2. Design takeaways (RECOMMENDATION; each cites its evidence)
| # | Takeaway | Evidence | Feeds |
|---|---|---|---|
| T1 | Provide **at least three technique-acquisition paths** (roll, run/wave rewards, story/world finds) so nobody must grind one thing | JJI spin-only (G03); RETRO waves (G12); Odyssey Cursed Wombs (G23) | docs/08 |
| T2 | **Carry mastery across rerolls** and convert duplicates into mastery/currency | JJI mastery persists (G03, G04) | docs/08 |
| T3 | Show a **technique preview** before locking in; never hide what a technique does | JJI opacity (G11) | docs/08, UI |
| T4 | Publish and display odds in-game; guides here had to rely on unconfirmed community figures | G05 caveat | docs/08 |
| T5 | Defense deserves depth: block/parry/dash-cancel, with a **cooldown on missed parries** | Sorcery (G14); Heian-style guide (G25) | docs/03 |
| T6 | Keep identity layers (origin, clan, technique) **sidegrades** with similar power | Shibuya HP spread (G18) | docs/08 |
| T7 | Ship a **Sandbox** mode early: our own testbed and a teaching tool | RETRO (G13) | roadmap |
| T8 | Make Black Flash a **skill outcome inside combos**, resource-gated, not just a prompt pop-up | JJI (G10); RETRO V move locked behind it (G13) | docs/03, 04 |
| T9 | Wave/run mode as the on-ramp (co-op PvE) before PvP | RETRO (G12) | roadmap phase 5 |

## 3. What this research cannot tell us
- Animation, VFX, SFX, and atmosphere quality (needs [[OBSERVATION_PROTOCOL]] sessions).
- Real drop rates and monetization audits.
- Hit-stop, parry-window, and stagger values.

## 4. Not yet researched (queued)
High-quality action RPGs, competitive fighting games, advanced melee/injury systems (Part 1 outside Roblox). Needs developer talks and official documentation; will be added with sources rather than from memory.

## Implementation notes
Takeaways are inputs, not requirements; adopt only via MASTER_GAME_DESIGN.md decisions.

## Testing criteria
- [ ] Each takeaway has at least one source ID.
- [ ] Owner confirms or rejects each takeaway; log in MASTER_GAME_DESIGN.md.

## Open questions
- Which takeaways become pillars (T1, T4, T5, T7 are my suggested first picks).
