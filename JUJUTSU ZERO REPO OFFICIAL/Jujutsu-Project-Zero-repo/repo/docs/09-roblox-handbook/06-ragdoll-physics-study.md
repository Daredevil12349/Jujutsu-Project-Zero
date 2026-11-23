# 06: Ragdoll and physically simulated characters (study)

Status: RESEARCHED-SECONDARY (official announcement threads + community reports); code **untested**
Purpose: Approaches for knockdowns, hit reactions, death, and limb-loss poses using Roblox physics.
Last reviewed: 2026-11-22
Sources: Q01 to Q04 (DevForum), R04 (network ownership)
Related: [[04-network-ownership-and-server-authority]], ../04-damage-rct/dismemberment-restricted-track.md

## 1. Facts found
- **Avatar Joint Upgrade** (Roblox Physics Team): replaces Motor6D joints in spawned avatars with several constraints including a `BallSocketConstraint` (cone limits) and force/torque-limited `AnimationConstraint`s, intended to make ragdolls and "powered ragdolls" easier; joints default to human-like limits and can be customized or disabled. For ragdoll on death, set `Humanoid.BreakJointsOnDeath = false` (shown in their example). A DevForum announcement titled "now live" carries a January 26, 2026 FAQ update. (Q01, Q02)
  - **UNVERIFIED**: exact current rollout, opt-in/default state, and how it interacts with custom rigs. Read the current docs before relying on it.
- Community ragdoll practice (pre- and post-upgrade): swap each `Motor6D` for a `BallSocketConstraint` using the rig's attachments, disable the Motor6D, and set Humanoid states appropriately; modules for R6/R15/custom rigs exist (Q04). These are third-party; vet licensing and quality before use.
- A community report (Q03) says R15 ragdolls twitched ("seizures") until `BallSocketConstraint.MaxFrictionTorque` and `UpperAngle` were tuned (the poster used 100 and 30). One data point, REPORTED, not a recommendation.
- Authority/ownership: physics on a client-owned character is client-simulated (R04). For PvP, **hit reactions that matter (knockdown timing, who is stunned) must be server-decided**, with ragdoll physics as a presentation layer.

## 2. Design guidance (RECOMMENDATION)
| Use | Approach |
|---|---|
| Knockdown / stun | Server sets a `Stunned`/`Knockdown` state with a duration; clients ragdoll (or play a knockdown animation) locally. Gameplay never depends on the physical pose |
| Death | Full ragdoll after the server marks death; short lifetime then fade/cleanup |
| Limb "disabled" (Tier 0/1) | Limb joint goes limp (low torque limit) rather than separating |
| Limb separation (Tier 2 only) | See [[07-mesh-slicing-study]]; ragdoll the remaining body, spawn the limb as a separate physics part |
| Network ownership | Document and test who owns the ragdoll; avoid ownership flips mid-fight (jitter) |
| Performance | Cap simultaneous ragdolls; use a pooled cleanup queue |

## 3. Pattern sketch (original; UNTESTED in Studio; may conflict with the Avatar Joint Upgrade)
```lua
--!strict
-- Converts a rig's Motor6Ds into BallSocketConstraints. Assumes R15-style "<JointName>RigAttachment" pairs.
local Ragdoll = {}

local function sockets(character: Model, enable: boolean)
	for _, desc in character:GetDescendants() do
		if desc:IsA("Motor6D") then
			local joint = desc :: Motor6D
			if enable then
				local part0, part1 = joint.Part0, joint.Part1
				local a0 = part0 and part0:FindFirstChild(joint.Name .. "RigAttachment")
				local a1 = part1 and part1:FindFirstChild(joint.Name .. "RigAttachment")
				if a0 and a1 and a0:IsA("Attachment") and a1:IsA("Attachment") then
					local socket = Instance.new("BallSocketConstraint")
					socket.Name = "RagdollSocket"
					socket.Attachment0 = a0
					socket.Attachment1 = a1
					socket.LimitsEnabled = true
					socket.UpperAngle = 45 -- placeholder; tune per joint
					socket.Parent = joint.Parent
					joint.Enabled = false
				end
			else
				joint.Enabled = true
			end
		elseif not enable and desc.Name == "RagdollSocket" then
			desc:Destroy()
		end
	end
end

function Ragdoll.enable(character: Model)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.BreakJointsOnDeath = false
	end
	sockets(character, true)
end

function Ragdoll.disable(character: Model)
	sockets(character, false)
end

return Ragdoll
```
Note: iterating while destroying descendants is acceptable here only because `GetDescendants()` returns a snapshot array.

## 4. Spike plan
- [ ] Check the current Avatar Joint Upgrade documentation and whether it is on by default in a new place.
- [ ] Ragdoll a default R15 and a custom rig; record jitter, joint limits, and network ownership behavior.
- [ ] Measure frame time with 10, 20, 30 ragdolls on a mid-range device (record numbers; none are known today).
- [ ] Validate that stun/knockdown remain server-authoritative while ragdoll is cosmetic.

## Testing criteria
- [ ] No stuck ragdoll after death/respawn/disable; no leaked constraints (count descendants before/after).
- [ ] Ragdoll toggling under lag does not desync the stun state.

## Open questions
- Custom character rigs vs Roblox avatars (see mesh-slicing study: permissions affect slicing avatar meshes).
