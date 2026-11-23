# Animation entry: RCT limb regrowth

Status: STUB (future phase; spec only)
Purpose: Animation design for restoring an injured/severed limb via Reverse Cursed Technique, at Tier 0/1 (main game) and Tier 2 (Restricted build only).
Last reviewed: 2026-11-22
Related: [[../04-damage-rct/dismemberment-restricted-track]], ../../templates/animation.md

| Field | Spec (placeholders; no asset IDs) |
|---|---|
| Purpose | Communicate a vulnerable, costly channel that ends in restored function |
| Starting pose | Guarded crouch or one-knee stance, affected limb held close |
| Motion | Hand-sign or palm-press, CE inflow pulse, limb reconstitution beat, test-flex |
| Duration target | 2.0 to 4.0 s total (tune; scales with limb) |
| Phases/markers | `RCT_Start`, `RCT_Stabilize`, `RCT_Rebuild`, `RCT_Complete`, `RCT_Interrupt` |
| Recovery | 0.4 s test-flex; limb at reduced integrity afterward |
| Transitions | Enter from Idle/Block/Kneel; exit to Idle; any hit or guard break plays `RCT_Interrupt` |
| SFX sync | Low pulse at Start, rising tone through Rebuild, resolve chime at Complete (original audio only) |
| VFX sync | Tier 0/1: energy threads knit a luminous limb. Tier 2: staged regrowth, separate assets |
| Gameplay interaction | CE drain per second; cancelled by damage; server owns state, client only plays visuals |
Testing criteria: interrupt at each marker leaves no stuck state; server/client timers agree within tolerance.
Open questions: do markers fire for server-played tracks (see ../09-roblox-handbook/05-animation-events.md).
