# 01: Remote validation and rate limiting

Status: RESEARCHED (security guidance); code examples are original and **untested in Studio** (UNVERIFIED until run, see Testing criteria)
Purpose: Mandatory rules for every client-to-server entry point in the game.
Last reviewed: 2026-11-22
Sources: R01, R02, R03 (see ../../RESEARCH_SOURCES.md)
Related: [[02-hit-detection]], [[03-remotes-and-networking]], ../../PROJECT_RULES.md

## 1. Facts from official docs (OBSERVED in Creator Hub, 2026-11-22)
- Every value a client sends must be validated by the server before use. Roblox names three layers: **context/permission** (distance, alive, owns the ability), **type/structure**, and **value** (range, sanity). (R01)
- Exploiters can send tables that mimic Instances, oversized strings, and NaN/inf. `typeof(NaN) == "number"` and NaN fails every comparison, so range checks silently pass it. Use `math.isfinite()` to reject NaN and +/-inf. (R01)
- Remotes are not the only entry point: ProximityPrompt, ClickDetector, and DragDetector events can be fired by an exploiter from any distance and are not checked server-side the way their properties suggest. Treat them like remotes. (R01)
- For combat, Roblox recommends the client **not** tell the server who to damage. For hit-scan, send origin and claimed hit; the server checks origin is near the server-side character (with latency tolerance), claimed hit is near the claimed part's server position, and that **static** geometry does not block the shot. Also track fire rate, resources, team, alive state, and blocking actions on the server. (R01)
- When relaying effects to other clients, the server must be a **gatekeeper, not a relay**: validate, rate-limit per player, then broadcast. (R01)
- Rate limiting: Roblox documents the token-bucket algorithm and recommends server-side limits for anything a client can trigger; clean up per-player state on leave. (R01)
- Never ban from client-side detections; detect and respond on the server; prevent harm first, then consequence. (R03)

## 2. Game design decisions (GAME-ORIGINAL / RECOMMENDATION)
| Rule | Reason |
|---|---|
| Client sends **intent** only: `M1`, `Block`, `Dodge`, `UseTechnique(techniqueId, aimDirection)` | Server owns state, cooldowns, CE, damage |
| No remote ever carries a damage number, a target to damage, or a cooldown | Those are server outputs |
| Technique IDs are strings checked against a server-side allow-set **and** the player's unlocked set | Prevents using unowned techniques |
| Aim direction is a unit Vector3, normalized server-side | Prevents NaN/inf and zero vectors |
| One remote folder, created by the server from one list | Single audit point |
| Every handler = `Net.on(name, schema, handler)` going through middleware | Validation cannot be forgotten |

## 3. Reference implementation (original code; test before trusting)

### 3.1 Validators: `ServerScriptService/Server/Net/Validate.luau`
```lua
--!strict
-- Pure helper functions. Each returns the cleaned value or nil when invalid.
local Validate = {}

function Validate.number(v: unknown, min: number?, max: number?): number?
	if typeof(v) ~= "number" or not math.isfinite(v) then
		return nil
	end
	if min ~= nil and v < min then return nil end
	if max ~= nil and v > max then return nil end
	return v
end

function Validate.integer(v: unknown, min: number?, max: number?): number?
	local n = Validate.number(v, min, max)
	if n == nil or n % 1 ~= 0 then
		return nil
	end
	return n
end

function Validate.vector3(v: unknown): Vector3?
	if typeof(v) ~= "Vector3" then return nil end
	if not (math.isfinite(v.X) and math.isfinite(v.Y) and math.isfinite(v.Z)) then
		return nil
	end
	return v
end

-- Returns a unit vector, or nil if the input is invalid or near-zero length.
function Validate.direction(v: unknown): Vector3?
	local vec = Validate.vector3(v)
	if vec == nil or vec.Magnitude < 1e-3 then return nil end
	return vec.Unit
end

-- Accepts only strings that are members of an allow-set, with a hard length cap.
function Validate.enumString(v: unknown, allowed: { [string]: true }): string?
	if typeof(v) ~= "string" or #v > 64 then return nil end
	if allowed[v] then return v end
	return nil
end

-- Accepts only a real Instance of the expected class living under the expected container.
function Validate.instanceUnder(v: unknown, className: string, container: Instance): Instance?
	if typeof(v) ~= "Instance" then return nil end
	if not v:IsA(className) or not v:IsDescendantOf(container) then return nil end
	return v
end

return Validate
```

### 3.2 Token bucket: `ServerScriptService/Server/Net/RateLimiter.luau`
```lua
--!strict
-- Per-key token bucket. capacity = max burst; refillPerSecond = sustained rate.
export type Limiter = {
	allow: (self: Limiter, key: number) -> boolean,
	forget: (self: Limiter, key: number) -> (),
}

type Bucket = { tokens: number, last: number }

local RateLimiter = {}
RateLimiter.__index = RateLimiter

function RateLimiter.new(capacity: number, refillPerSecond: number): Limiter
	assert(capacity >= 1 and refillPerSecond > 0, "invalid limiter config")
	local self = {
		_capacity = capacity,
		_rate = refillPerSecond,
		_buckets = {} :: { [number]: Bucket },
	}
	return setmetatable(self, RateLimiter) :: any
end

function RateLimiter:allow(key: number): boolean
	local now = os.clock()
	local bucket: Bucket? = self._buckets[key]
	if bucket == nil then
		bucket = { tokens = self._capacity, last = now }
		self._buckets[key] = bucket
	end
	local b = bucket :: Bucket
	b.tokens = math.min(self._capacity, b.tokens + (now - b.last) * self._rate)
	b.last = now
	if b.tokens >= 1 then
		b.tokens -= 1
		return true
	end
	return false
end

function RateLimiter:forget(key: number)
	self._buckets[key] = nil
end

return RateLimiter
```
Call `limiter:forget(player.UserId)` in `Players.PlayerRemoving` to avoid leaks.

### 3.3 Example handler: combat intent
```lua
--!strict
-- Server-side. `m1Remote` is a RemoteEvent created by the server bootstrap.
local Players = game:GetService("Players")
local Validate = require(script.Parent.Net.Validate)
local RateLimiter = require(script.Parent.Net.RateLimiter)

local limiter = RateLimiter.new(6, 4) -- burst 6, sustained 4 M1 requests/sec (placeholder; tune in playtest)

local function onM1(player: Player, aim: unknown)
	if not limiter:allow(player.UserId) then return end
	local dir = Validate.direction(aim)
	if dir == nil then return end

	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if humanoid == nil or humanoid.Health <= 0 then return end
	-- TODO (combat state machine): reject if state ~= Idle/Recovering-cancelable.
	-- Server then starts the attack itself; the client never reports hits for M1.
end

-- m1Remote.OnServerEvent:Connect(onM1)
Players.PlayerRemoving:Connect(function(p) limiter:forget(p.UserId) end)
```

## 4. Honeypots and heuristics (optional hardening; R03)
Roblox describes honeypot remotes (look real, never used by legitimate clients) and cadence/heuristic checks as supplements, never replacements, for validation. Defer until after the combat prototype; log-only first, never auto-ban from a single signal.

## Implementation notes
- Build `Net` (create remotes from one list, wrap handlers with limiter + validators) before any combat remote exists.
- Keep placeholder numbers in `shared/Config.luau`/server config, not inline.

## Testing criteria
- [ ] Send NaN, inf, -inf, huge strings, wrong types, tables-in-place-of-Instances to every remote from a test client: server never errors and never changes state.
- [ ] Spam each remote at >100/s from a test client: server drops excess and stays at normal frame time.
- [ ] Leave and rejoin: no limiter memory growth (`forget` called).
- [ ] Confirm ProximityPrompt/ClickDetector-based interactions re-validate distance/state server-side.

## Open questions
- Exact burst/sustained limits per action (needs playtesting).
- Whether to use a typed-schema library or the hand-rolled validators above.
