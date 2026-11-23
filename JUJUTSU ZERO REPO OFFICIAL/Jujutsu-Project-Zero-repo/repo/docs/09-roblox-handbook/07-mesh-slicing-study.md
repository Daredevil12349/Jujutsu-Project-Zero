# 07: Mesh slicing study (EditableMesh and alternatives)

Status: RESEARCHED (EditableMesh reference page read; rest are design analysis); code partly original, **untested**
Purpose: Evaluate how to cut characters, props and environment meshes at runtime, for slash techniques and (future, Restricted) limb separation.
Last reviewed: 2026-11-22
Sources: E01 (EditableMesh reference, last_updated 2026-10-22), E02, E03
Related: [[06-ragdoll-physics-study]], ../04-damage-rct/dismemberment-restricted-track.md, ../01-reference-games/akayuki-steel-blossoms-red.md

## 1. Verified facts about `EditableMesh` (OBSERVED in official reference/announcement excerpts)
- Allows runtime creation and manipulation of meshes; changes are shown when linked to a `MeshPart`; queries like `RaycastLocal` work without displaying it. (E01)
- Create: `AssetService:CreateEditableMesh()` (empty) or `AssetService:CreateEditableMeshAsync()` from a mesh asset or a `MeshPart`'s mesh content; display via `AssetService:CreateMeshPartAsync()` or `MeshPart:ApplyMesh()`. Recalculating collision after edits means calling those again. (E01, E02)
- **Published experiences must enable** Experience Settings > Security > **Allow Mesh & Image APIs**, after reviewing the Terms of Use; the beta announcement also mentions ID verification. (E01, E02)
- **Permissions:** `CreateEditableMeshAsync` only loads meshes that are owned by or explicitly shared with the experience owner (or the owning group, or the Studio user if unpublished). (E01)
- Meshes created from existing assets are **fixed-size** by default (can change vertex attribute values but not add/delete vertices or triangles). To add/delete, pass `{FixedSize = false}` in options. (E01)
- **Limits: 60,000 vertices and 20,000 triangles** per EditableMesh. Exceeding raises an error. (E01)
- Faces are one-sided by default; `DoubleSided` can change that. (E01)
- Memory budgets and permission rules were described as subject to change in the beta announcement. **Current stage UNVERIFIED.** (E02)
- `EditableMesh` methods named in sources include `RaycastLocal`, `Triangulate`, `ResetNormal`, `RemoveUnused`, `FindClosestPointOnSurface`. I have **not** read the full method list; verify before coding.

### Implications (my inference; label INTERPRETATION)
1. You can probably **not** slice arbitrary Roblox user-avatar body or clothing meshes you do not own. Player characters should use **our own owned character meshes** (or pre-segmented limbs) if slicing is wanted.
2. 20k triangles per mesh bounds how detailed a sliceable character can be; segment bodies into several meshes.
3. Slicing creates new geometry and a collision rebuild each time; do it sparingly and with cooldowns.
4. Whether EditableMesh edits replicate from server to clients is **UNVERIFIED**; plan to test and, if not replicated, drive the cut deterministically on each client from a server event.

## 2. Approaches compared (RECOMMENDATION)
| Approach | How | Pros | Cons | Use for |
|---|---|---|---|---|
| A. Pre-segmented parts | Character built from separate limb meshes; "sever" = detach/hide and spawn a prop copy | Cheapest, robust, mobile-friendly, no special permissions | Cut plane is fixed to joints; looks less organic | Tier 0/1 effects (limb goes limp/glows), Tier 2 base |
| B. Plane slice of EditableMesh | Classify vertices vs. plane, split triangles, cap the cut, rebuild MeshPart | Arbitrary slash angles; closest to a "mesh slashing" feel | Needs owned meshes, geometry code, UV/cap handling, collision rebuild, perf budgets | Props, destructibles, environment cutting; hero feature if budgets allow |
| C. Skinned/rigged mesh cutting | Cut a skinned character mesh | Most flexible | Skinning data handling under EditableMesh is **UNVERIFIED** and likely complex | Research only |
| D. Effects-only cut | Slash VFX plus dissolve/fade, no geometry change | Cheap, policy-safe | Not a physical cut | Tier 0 default |
RECOMMENDATION: ship A and D first; prototype B on environment props; decide on B for characters after the permission and replication tests.

## 3. Algorithm outline for plane slicing (B)
1. Choose cut plane from the slash (point + normal), expressed in the mesh's local space.
2. For every triangle compute signed distance of each vertex to the plane; classify front / back / straddling.
3. Straddling triangles are split along the plane (below), producing new vertices at the intersections.
4. Build two meshes (front and back); interpolate UV, color and normals at new vertices.
5. **Cap** each side: collect cut-edge points, order them into loops, triangulate loops (needs a consistent winding and a cap material/UV).
6. Create two `MeshPart`s (`CreateMeshPartAsync`), assign physics (mass from volume estimate), apply impulses.
7. Enforce budgets: reject cuts that would exceed 20k triangles/60k vertices; cap total live fragments.

### Triangle split (original, pure math, unit-testable)
```lua
--!strict
-- PlaneSlice.luau: engine-agnostic triangle/plane split. No EditableMesh calls.
export type Tri = { Vector3 }

local PlaneSlice = {}

local function fan(poly: { Vector3 }, out: { Tri })
	for k = 2, #poly - 1 do
		table.insert(out, { poly[1], poly[k], poly[k + 1] })
	end
end

-- Splits one triangle by a plane. Returns front triangles, back triangles, and the points where edges cross the plane.
function PlaneSlice.splitTriangle(tri: Tri, planePoint: Vector3, normal: Vector3, eps: number): ({ Tri }, { Tri }, { Vector3 })
	local d = {}
	for i = 1, 3 do
		d[i] = (tri[i] - planePoint):Dot(normal)
	end

	local frontPoly: { Vector3 } = {}
	local backPoly: { Vector3 } = {}
	local cut: { Vector3 } = {}

	for i = 1, 3 do
		local j = i % 3 + 1
		local a, b = tri[i], tri[j]
		local da, db = d[i], d[j]

		if da > eps then
			table.insert(frontPoly, a)
		elseif da < -eps then
			table.insert(backPoly, a)
		else -- on the plane: belongs to both sides
			table.insert(frontPoly, a)
			table.insert(backPoly, a)
		end

		if (da > eps and db < -eps) or (da < -eps and db > eps) then
			local p = a:Lerp(b, da / (da - db))
			table.insert(frontPoly, p)
			table.insert(backPoly, p)
			table.insert(cut, p)
		end
	end

	local front: { Tri } = {}
	local back: { Tri } = {}
	if #frontPoly >= 3 then fan(frontPoly, front) end
	if #backPoly >= 3 then fan(backPoly, back) end
	return front, back, cut
end

return PlaneSlice
```
Expected unit-test results:
- Triangle entirely in front: 1 front tri, 0 back, 0 cut points.
- One vertex front, two back: 1 front tri, 2 back tris, 2 cut points.
- One vertex on the plane, others on opposite sides: both sides get triangles, 1 cut point.
Logic check (2026-11-22): a Python mirror of this algorithm produced the expected counts for the three cases above and conserved total triangle area. **The Luau file itself has not been run.**
Limitations: does not preserve per-vertex attributes (UV, normals, colors) yet; does not build caps.

## 4. Test plan
1. Enable Allow Mesh & Image APIs in a test place (owner account, ID-verified if required) and slice one owned prop mesh with the outline above.
2. Try slicing a Roblox-catalog mesh not owned by the test owner: record the error (expected permissions failure; verify).
3. Test replication: do the cut on the server only, then on a client only; record what other clients see.
4. Measure creation/collision rebuild time and memory for 1, 5, 20 cuts on a mid-range device; record numbers (none are known today).
5. Verify fragment cleanup and pooling.

## Implementation notes
Put pure geometry in `src/shared/Util/PlaneSlice.luau` with unit tests in `tests/`; keep Roblox-API calls in a thin server/client wrapper.

## Testing criteria
- [ ] Unit tests for splitTriangle cases above pass.
- [ ] Cuts at 20 random angles on a test mesh produce watertight halves (no holes) once capping exists.
- [ ] Budget guards prevent exceeding vertex/triangle limits.

## Open questions
- Which approach for characters: owned segmented meshes (A) vs plane slicing (B)?
- Are EditableMesh edits replicated, and what are current memory budgets?
- How does AKAYUKI achieve its look? (needs observation)
