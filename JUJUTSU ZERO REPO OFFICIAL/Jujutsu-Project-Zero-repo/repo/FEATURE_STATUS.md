# FEATURE_STATUS.md

Status: LIVE TRACKER (update every session)
Last updated: 2026-11-23 (design-guidance expansion)

Legend: [x] done, [~] in progress, [ ] not started

## A. Repository build checklist
### Core files
- [x] README.md
- [x] CLAUDE.md (session startup and agent operating guidance)
- [x] PROJECT_RULES.md
- [x] MASTER_GAME_DESIGN.md (draft north star; owner vision + proposed direction)
- [x] TECHNICAL_ARCHITECTURE.md (draft)
- [x] DEVELOPMENT_ROADMAP.md
- [x] FEATURE_STATUS.md
- [x] RESEARCH_SOURCES.md (research registry; evidence quality varies by entry)
- [x] ASSET_LICENSING.md

### New design guidance (2026-11-23)
- [x] docs/03-combat/combat-design-standard.md
- [x] docs/03-combat/defense-states-and-duel-flow.md
- [x] docs/04-damage-rct/injury-rct-and-content-profiles.md
- [x] docs/08-progression/soulslike-progression-design.md
- [x] docs/11-world-story/narrative-world-design.md (premise is proposed, not owner-approved)
- [x] docs/12-claude-workflow/agent-operating-standard.md
- [x] docs/12-claude-workflow/decision-and-research-playbook.md
- [x] docs/01-reference-games/vv-ultimatum-design-takeaways.md (secondary research only)

### Templates and indexes
- [x] technique, animation, VFX, SFX, boss, system, lore, research-entry templates
- [x] docs/01 to docs/09 indexes
- [~] docs/11 and docs/12 indexes created; further content expansion pending

### Content phases
- [~] Part 1: reference-game research. Secondary research exists for JJI, RETRO, Sorcery, Shibuya, VV: Ultimatum, and other Roblox JJK games. First-hand OBSERVED notes and non-Roblox action RPG/fighting-game/injury references still needed.
- [~] Part 2: JJK encyclopedia first pass exists; remaining topics and owner chapter verification still open.
- [~] Part 3: combat design standards added; technical implementation and measured balance remain not started.
- [~] Part 4: injury/RCT gameplay guidance added; implementation and current policy verification remain open.
- [ ] Part 5: animation database
- [ ] Part 6: VFX/SFX library
- [ ] Part 7: technique database
- [~] Part 8: Soulslike progression design added; economy, odds, and implementation remain open.
- [~] Part 9: Roblox technical handbook; remaining topics listed in docs/09-roblox-handbook/README.md.
- [ ] Final audit report

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
- [ ] Posture / guard break
- [ ] Hit reactions and knockdowns
- [ ] Cursed energy and reinforcement
- [ ] First technique
- [ ] Injury visuals (stylized)
- [ ] RCT (basic regeneration)
- [ ] Test arena + dummy

## C. Future tracks
- [~] Dismemberment + RCT regrowth: design/policy research draft; implementation not started; separate Restricted experience decision remains open.
- [~] Ragdoll and mesh-slicing studies: research exists; runtime spikes pending.
- [ ] First-hand reference capture and analysis from owner.

## D. Priority backlog
| Priority | Item | Value | Dependency / acceptance |
|---|---|---|---|
| P0 | Build and test combat state machine + remote validation | Foundation of all fighting | Server owns states; adversarial remote tests pass |
| P1 | Four-hit M1 + block + dodge + parry + posture vertical slice | Proves combat identity | Two-player duel is readable and fun |
| P1 | Camera and R6 animation pass | Core feel and readability | PC/mobile/controller test |
| P2 | First enemy archetype + boss prototype | Tests PvE combat | Telegraphs and multiple counters work |
| P2 | One hub-to-district exploration slice | Establishes Soulslike loop | Shortcut, checkpoint, lore clue, reward |
| P3 | Domains, complex injury visuals, broad origin roster | High-cost future depth | Only after core combat and world slice |

## D. Known conflicts / owner decisions
- JJI Star Rage 0.25% vs Special Grade 0.25% cumulative: unresolved, UNVERIFIED.
- JJI Black Flash resource: tokens vs fill bar: unresolved.
- JJI technique count varies by source date.
- Confirm story premise and timeline before treating proposed narrative as canon.
- Decide whether stamina is separate from posture and CE after prototype tests.
- Revisit Restricted-content architecture only after checking current official policy.
