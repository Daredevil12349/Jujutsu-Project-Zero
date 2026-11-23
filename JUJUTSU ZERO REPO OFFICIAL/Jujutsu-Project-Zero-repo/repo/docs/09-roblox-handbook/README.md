# Roblox technical handbook

Status: DRAFT (Part 9 in progress)
Purpose: Verified Roblox API guidance with working code. Anything not checked against current docs is marked UNVERIFIED.
Last reviewed: 2026-11-22
Sources: see ../../RESEARCH_SOURCES.md

## Files
| File | Status | Notes |
|---|---|---|
| 01-remote-validation-and-rate-limiting.md | RESEARCHED | Validation layers, NaN, token bucket, gatekeeper pattern; code untested |
| 02-hit-detection.md | RESEARCHED | Spatial queries and casts; OverlapParams current API; code untested |
| 03-remotes-and-networking.md | RESEARCHED (partial) | Unreliable remotes; rate figure UNVERIFIED |
| 04-network-ownership-and-server-authority.md | RESEARCHED, decision made (hybrid) | Server Authority model; spike pending |
| 05-animation-events.md | RESEARCHED + tests pending | Markers; server behavior UNVERIFIED |
| 06-ragdoll-physics-study.md | RESEARCHED-SECONDARY (future-feature study) | Avatar Joint Upgrade, constraints, ragdoll patterns |
| 07-mesh-slicing-study.md | RESEARCHED (EditableMesh) | Limits, permissions, plane-slice math |

## Not yet researched (queued)
DataStores and session locking (limits, UpdateAsync, budgets), ModuleScript/architecture details, Humanoid vs controller alternatives, constraints and physics for knockback, ParticleEmitter/Beam/Trail properties, Sound and SoundService, camera systems, StreamingEnabled, mobile and controller input, optimization and profiling, Actors/parallel Luau.

## Open questions
- Server Authority spike (see 04). Ragdoll and slicing spikes (06, 07).
