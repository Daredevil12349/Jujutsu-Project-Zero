# 05: Animation events (markers) for combat timing

Status: RESEARCHED (editor/API behavior); server-side behavior UNVERIFIED
Purpose: How to mark hit frames and effect timing inside animations and read them in code.
Last reviewed: 2026-11-22
Sources: R07
Related: [[02-hit-detection]], ../05-animation/, ../03-combat/

## 1. Verified facts (OBSERVED in official docs, last_updated 2026-10-16)
- Event markers are created on the **Animation Editor** timeline (enable "Show Animation Events", add an event with a name and an optional **parameter string**).
- In code, connect with `AnimationTrack:GetMarkerReachedSignal("EventName"):Connect(function(paramString) ... end)`.
- Event markers, once created, are available for the whole animation (reusable at multiple times; e.g. one `FootStep` for both feet). They can be duplicated, and a duplicate can carry a different parameter.
- The official example connects in a **LocalScript** after `animator:LoadAnimation(animation)`.
- Parameter strings are free-form (single value, comma-separated, etc.).

## 2. Naming convention proposed for this project (GAME-ORIGINAL)
| Marker | Meaning |
|---|---|
| `Windup` | Startup begins (attack committed) |
| `HitStart` / `HitEnd` | Active hit-detection window |
| `Release` | Projectile or technique effect spawns |
| `CancelOpen` / `CancelClose` | Window in which a follow-up input may cancel recovery |
| `Recovery` | Vulnerable end-lag begins |
| `VFX:<id>` / `SFX:<id>` | Presentation cues (param holds our own effect key, never a raw asset ID) |

## 3. Design guidance (RECOMMENDATION)
- The **client** may use markers to time VFX/SFX for responsiveness.
- The **server must not trust client-reported marker times** for damage. The server should derive active frames from its own data (per-attack timing in config: startup, active, recovery in seconds) and run hit detection on that schedule. Markers then act as a **source of truth for authoring**, exported into config, rather than a runtime authority. This avoids dependence on whether markers fire on server-played tracks.
- Keep attack timing data in one table per move so designers tune numbers without re-authoring animations.

## 4. UNVERIFIED (test in Studio before relying on it)
- Whether `GetMarkerReachedSignal` fires reliably for tracks played on the **server**-side Animator (and at what timing precision under load).
- Marker behavior when an animation is stopped early, looped, or adjusted with `AdjustSpeed`.
- Marker behavior under the Server Authority model's new animation system ([[04-network-ownership-and-server-authority]]).

## 5. Test plan
1. Author a 1-second test animation with `HitStart` at 0.3 s and `HitEnd` at 0.5 s.
2. Play it on the server and on the client; log `os.clock()` at each marker; compare to expected times over 20 runs; record results here.
3. Stop the track at 0.4 s; record which signals fire.
4. Play with `AdjustSpeed(1.5)`; record shifted times.

## Implementation notes
Do not store animation IDs in docs until verified in Studio; use keys (`M1_1`) mapped in a config module.

## Testing criteria
- [ ] Test plan above completed and results recorded.
- [ ] Server timing table matches authored markers to within a documented tolerance.

## Open questions
- Server-driven schedule vs server-played animation markers: pick one after the test plan.
