# 02: Server-side hit detection (spatial queries and casts)

Status: RESEARCHED (API behavior); code is original and **untested** (UNVERIFIED until run)
Purpose: Which engine APIs to use for melee/slash hitboxes, and their verified limits.
Last reviewed: 2026-11-22
Sources: R05 (WorldRoot reference), R06 (OverlapParams), R01
Related: [[01-remote-validation-and-rate-limiting]], ../03-combat/, ../04-damage-rct/

## 1. Verified API facts (OBSERVED in Creator Hub reference, 2026-11-22)
| API | Verified behavior |
|---|---|
| `WorldRoot:GetPartBoundsInBox(cframe, size, overlapParams?)` | Returns parts whose **bounding boxes** overlap the box. Not exact for cylinders, spheres, unions, MeshParts. Thread safety: Safe. |
| `WorldRoot:GetPartBoundsInRadius(position, radius, overlapParams?)` | Same bounding-box caveat, sphere volume. Safe. |
| `WorldRoot:GetPartsInPart(part, overlapParams?)` | **Exact** occupied volume via full geometric collision check; the query part must exist in the same WorldRoot. Docs say it is generally a better choice than `BasePart:GetTouchingParts()`. Slower than bounds queries. Safe. |
| `WorldRoot:Blockcast(cframe, size, direction, params?)` | Sweeps a box; returns first hit (RaycastResult). Does **not** detect parts that *initially* intersect. Max size 512 studs, max distance 1024. Safe. |
| `WorldRoot:Spherecast(position, radius, direction, params?)` | Sweeps a sphere; same initial-intersection caveat. Max radius 256, max distance 1024. Safe. |
| `WorldRoot:Shapecast(part, direction, params?, ...)` | Sweeps the actual geometry of a part; same caveat. Marked **Unsafe** for thread safety. |
| `WorldRoot:Raycast(origin, direction, params?)` | Max direction length 15,000 studs. Safe. |
| Region3 query methods (`FindPartsInRegion3*`, `IsRegion3Empty*`) | **Deprecated**; use `GetPartBoundsInBox` with `OverlapParams`. |
| `FindPartOnRay*` | **Deprecated**; use `Raycast`. |

### OverlapParams (R06, last_updated 2026-11-06)
- Prefer `ExcludeInstances` / `IncludeInstances`. `FilterDescendantsInstances`, `FilterType`, and `AddToFilter` are documented as **superseded** "for new work".
- If an instance matches both, exclusion wins.
- `IncludeInstances = nil` includes everything; `IncludeInstances = {}` includes **nothing** (opposite effect, easy bug).
- `MaxParts` (0 = unlimited), `CollisionGroup`, `Tolerance` (clamped 0 to 0.05 studs), `RespectCanCollide`, `BruteForceAllSlow` (docs: do not use in live experiences).
- The object is reusable; members can be changed without creating a new one.

## 2. Design guidance (RECOMMENDATION)
| Attack shape | Recommended query | Why |
|---|---|---|
| Straight M1 swing | `GetPartBoundsInBox` oriented in front of attacker | Cheap; bounding-box error is small against humanoid limbs |
| Wide slash arc | Several box queries over the swing's active frames, or one wide box | Matches "active frames" in `docs/03-combat/` |
| Radial burst | `GetPartBoundsInRadius` | Direct match |
| Thrust/projectile with travel | `Blockcast`/`Spherecast` per step | Catches fast movers; remember initial overlaps are not reported, so do an overlap query at cast start too |
| Exact hitbox shapes (wedge, cone) | `GetPartsInPart` with a server-side invisible query part | Exact; more expensive; use sparingly |
| Line-of-sight / anti-wall-hit | `Raycast` against static geometry only | Matches R01 guidance to check static geometry only to avoid latency false-rejects |

Group results **per character**, not per part, so one swing cannot register once per limb.

## 3. Reference implementation (original; untested)
```lua
--!strict
-- ServerScriptService/Server/Combat/HitboxQuery.luau
local Workspace = game:GetService("Workspace")

local HitboxQuery = {}

-- Reused to avoid per-call allocation. Safe because queries run synchronously.
local overlap = OverlapParams.new()
overlap.MaxParts = 0

-- Returns unique character Models (having a Humanoid) overlapped by the box, excluding `ignore`.
function HitboxQuery.boxCharacters(cframe: CFrame, size: Vector3, ignore: { Instance }): { Model }
	overlap.ExcludeInstances = ignore
	local parts = Workspace:GetPartBoundsInBox(cframe, size, overlap)

	local seen: { [Model]: boolean } = {}
	local found: { Model } = {}
	for _, part in parts do
		local model = part:FindFirstAncestorWhichIsA("Model")
		if model and not seen[model] and model:FindFirstChildOfClass("Humanoid") then
			seen[model] = true
			table.insert(found, model)
		end
	end
	return found
end

-- True if static geometry blocks the line between two points.
-- `staticFilter` should contain characters/effects to ignore so only world geometry blocks.
function HitboxQuery.lineBlocked(from: Vector3, to: Vector3, ignore: { Instance }): boolean
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = ignore
	return Workspace:Raycast(from, to - from, params) ~= nil
end

return HitboxQuery
```
Caveat: `FindFirstAncestorWhichIsA("Model")` assumes the character is the nearest Model ancestor of its parts. Nested sub-models inside a character would break this; keep character rigs flat or tag the root.

## 4. UNVERIFIED / to check in Studio
- Whether `RaycastParams` also has newer `ExcludeInstances`/`IncludeInstances` (the Overlap page says so for OverlapParams; I did not open the RaycastParams page). Check before finalizing.
- Real cost of box queries in a dense map (the DevForum thread R12 shows one developer reporting ~0.2 s for a 1000-stud box in a heavy place; anecdotal, REPORTED, not a benchmark).
- Hit-detection timing relative to animation (see [[05-animation-events]]).

## Implementation notes
Hit queries run **only on the server**. The client may run the same shapes for prediction VFX only.

## Testing criteria
- [ ] Visualize every hitbox with a debug part in Studio for each attack.
- [ ] One swing hits each character at most once.
- [ ] Hits do not register through walls (static raycast).
- [ ] Target standing exactly on the box edge: behavior documented and consistent.
- [ ] 12 dummies in one box: query time measured and logged in this doc (do not guess).

## Open questions
- Active-frame sampling interval for wide slashes.
- Do we need exact shapes (GetPartsInPart) for any signature technique, or are boxes/spheres enough?
