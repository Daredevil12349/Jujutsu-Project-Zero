# 03: Remotes and networking

Status: RESEARCHED (partial): official docs checked for security; UnreliableRemoteEvent limits are from a reference snippet, not a full page read
Purpose: Choosing RemoteEvent vs UnreliableRemoteEvent, and keeping traffic small.
Last reviewed: 2026-11-22
Sources: R08, R09, R10, R13, R01
Related: [[01-remote-validation-and-rate-limiting]], [[04-network-ownership-and-server-authority]]

## 1. Facts
- **UnreliableRemoteEvent** is a variant of RemoteEvent for asynchronous, **unordered, unreliable**, one-way communication; senders do not yield. Roblox's description says it suits ephemeral events (short-lived effects) and continuously changing data, and that you should use a RemoteEvent when ordering and reliability matter. (R08, OBSERVED in search snippet of the official reference page)
- Payload limit: **900 bytes**; larger payloads are dropped. Events can also be dropped to prioritize bandwidth or CPU. (R08)
- A DevForum thread reports buffers are compressed before the limit is applied, so the effective limit is not a simple byte count of your data. (R13, REPORTED)
- A secondary reference mirror (R09, robloxapi.github.io) states RemoteEvents and UnreliableRemoteEvents have a limit of roughly **500 requests per second per client**, shared among remotes of the same type. **UNVERIFIED**: not confirmed on the current official page; re-check before relying on it.
- Gatekeeper rule for relaying effects to other clients: validate and rate-limit before `FireAllClients`/`FireClient` (R01).

## 2. Design guidance (RECOMMENDATION)
| Traffic | Remote type | Reason |
|---|---|---|
| Player intent (M1, block, dodge, technique use) | Reliable `RemoteEvent` | Dropped or reordered inputs break combos and parries |
| State changes that must be consistent (hit confirmed, knockdown, death, CE spent) | Reliable | Must arrive |
| Cosmetic VFX triggers (impact sparks, ambient aura) | Unreliable acceptable | Missing one is harmless |
| High-frequency aim/camera hints | Unreliable | Superseded by the next packet |
| Anything granting rewards or changing saved data | Reliable, server-initiated only | Integrity |

Keep per-player remote traffic low: send intent and state transitions, not per-frame positions. The server is the only source of damage and state.

## 3. Implementation notes
- Create remotes on the server from a single list (`shared/Remotes.luau`); clients wait for the folder once.
- Never create remotes from client code.
- Keep any `FireAllClients` payload small and relevance-filter (only players near the event) once player counts grow.

## Testing criteria
- [ ] Measure real outbound bytes/sec per player during a 2-player duel in Studio's network stats and record the number here.
- [ ] Verify the 900-byte unreliable limit empirically in Studio (oversized payload logs a warning per the announcement).
- [ ] Verify the ~500/s figure or delete it from this doc.

## Open questions
- Will we adopt the server-authority model (which changes how input is sent)? See [[04-network-ownership-and-server-authority]].
