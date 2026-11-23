# DEVELOPMENT_ROADMAP.md

Status: DRAFT
Purpose: Phase order and exit criteria.
Last reviewed: 2026-11-22
Related: [[FEATURE_STATUS]], [[MASTER_GAME_DESIGN]]

| Phase | Scope | Exit criteria |
|---|---|---|
| 1 Foundation | Architecture, character init, data, stats, input, camera, movement | Two players join, save/load stats, move and dash with server-validated state |
| 2 Combat | M1 combos, block, perfect block, parry, dodge, hit reactions, knockdown | A duel with no rewards is fun |
| 3 Cursed energy and techniques | CE pool, reinforcement, first technique, technique template | One technique fully implemented from the template |
| 4 Advanced systems | RCT, binding vows, Heavenly Restriction, incarnation, Black Flash, domains | Each system has docs, tests, counterplay |
| 5 Content | Maps, NPCs, bosses, quests, progression | Multiple acquisition paths live |
| 6 PvP | Matchmaking, ranked, balance tooling, anti-exploit audit | Balance dashboards, no known duplication exploits |
| 7 Polish | VFX/SFX pass, mobile and controller, optimization | Target frame rates on test devices (targets UNVERIFIED) |

| 8 (future, post-launch) | Restricted track: dismemberment, limb regrowth animations, mesh slicing, ragdoll polish | Policy re-check complete; separate Restricted experience decision made; Tier 0/1 gameplay already shipped |

Preparation that happens earlier (cheap): limb-state machine and Presentation Profile abstraction in Phase 4; ragdoll/mesh-slicing spikes any time after Phase 2.

## First milestone (combat prototype)
See [[MASTER_GAME_DESIGN]] section 6.

## Open questions
- Target devices and frame-rate budget for mobile?
