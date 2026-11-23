# TECHNICAL_ARCHITECTURE.md

Status: DRAFT
Purpose: Where code lives and how systems talk. Decisions here are binding until superseded in the Decision log.
Last reviewed: 2026-11-22
Sources: standard Roblox project practice; **API details must be re-verified against create.roblox.com/docs before use** (UNVERIFIED until logged in RESEARCH_SOURCES.md)
Related: [[PROJECT_RULES]], `docs/09-roblox-handbook/`

## 1. Layout (Rojo-friendly)
```
src/
  shared/    -> ReplicatedStorage/Shared     (Types, Config, Util: pure logic)
  server/    -> ServerScriptService/Server   (init.server.luau + Systems/)
  client/    -> StarterPlayerScripts/Client  (init.client.luau + Controllers/)
```
- Exactly one server Script and one client LocalScript; everything else is a ModuleScript.
- Server-only logic never lives in ReplicatedStorage.

## 2. Bootstrap (two-phase)
All systems `init()` first (wire dependencies, create remotes), then all `start()`. Removes require-order bugs.

## 3. Planned systems (build order follows the roadmap)
| System | Side | Depends on |
|---|---|---|
| PlayerData (DataStore, session lock) | server | none |
| CharacterInit | server | PlayerData |
| Stats | server | PlayerData |
| Input | client | none |
| Camera | client | Input |
| Movement (dash, sprint) | both | Stats, Input |
| Combat state machine | both (server decides) | Stats, Movement |
| CursedEnergy | server | Stats |
| Techniques | both | Combat, CursedEnergy |
| Injury / RCT | both | Combat, CursedEnergy |

## 4. Combat authority model (design decision, `GAME-ORIGINAL`)
Client sends **intent** (`M1`, `Block`, `Dodge`, `UseTechnique(id)`); server checks state, cooldown, resources, then runs hit detection and applies damage. Client plays prediction-only visuals. Latency compensation approach is an open question (see `docs/03-combat/`).

## 5. Remotes
Created on the server from one list; every handler goes through shared validation and rate-limit middleware.

## 6. Decision log
| Date | Decision | Reason |
|---|---|---|
| 2026-11-22 | Layout and two-phase bootstrap adopted | Predictable load order, one home per piece of code |
| 2026-11-22 | **Hybrid netcode**: classic server-validated intent remotes now; input layer (`Input -> Intent -> Net -> Server`) kept abstract so Roblox Server Authority can replace it later | Project owner decision; keeps first milestone on mature APIs while preserving migration path (see docs/09-roblox-handbook/04) |
| 2026-11-22 | **Presentation Profile abstraction**: server owns limb/injury state; visuals chosen by Tier 0/1/2 profile; Tier 2 assets and code only in a separate Restricted project | Roblox lists dismemberment under Restricted; keeps gameplay identical and main experience policy-safe (recommendation, not yet owner-ratified beyond the plan to add the feature) |

## Implementation notes
Scaffold exists in `src/` (empty placeholders). First exemplar system should be fully worked before copying its shape.

## Testing criteria
A new system is mergeable when: server validates all inputs, client cannot grant itself state, and test steps pass in a 2-player local server.

## Open questions
- Rojo + Wally + Selene + StyLua toolchain adoption timing?
- Hit detection: server raycast/overlap vs client-reported with server verification?
- Lag compensation strategy and acceptable PvP ping range?
- ~~Adopt Server Authority or start classic?~~ **Decided: hybrid (2026-11-22).** Remaining: run the spike in docs/09-roblox-handbook/04 before any migration.
