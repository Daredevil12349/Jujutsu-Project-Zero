# RESEARCH_SOURCES.md

Status: IN PROGRESS (Part 9 slice and Part 1 Roblox JJK games logged; Parts 2 to 8 and non-Roblox Part 1 have no research logged yet)
Purpose: Registry of every source used, with reliability and what it supports.

Types: `OFFICIAL-ROBLOX` (Creator Hub docs), `OFFICIAL-ANNOUNCEMENT` (Roblox staff DevForum posts), `COMMUNITY`, `SECONDARY-MIRROR`, `PRIMARY-MEDIA`, `GAME-OBSERVED`, `WIKI-SECONDARY`.
Rules: community/wiki sources are `REPORTED`; never cite a source you have not opened; note when only a search snippet was seen.

## Source log
| ID | Source | Type | URL | Accessed | Access depth | Supports |
|---|---|---|---|---|---|---|
| R01 | Securing the client-server boundary (page last_updated 2026-11-20) | OFFICIAL-ROBLOX | https://create.roblox.com/docs/scripting/security/client-server-boundary | 2026-11-22 | full page | Remote validation, NaN, rate limiting, weapon targeting, gatekeeper pattern |
| R02 | Security and cheat mitigation tactics (2026-10-20) | OFFICIAL-ROBLOX | https://create.roblox.com/docs/scripting/security/security-tactics | 2026-11-22 | search excerpts | Server as source of truth; client untrusted; device trust note |
| R03 | Server-side detection and consequencing | OFFICIAL-ROBLOX | https://create.roblox.com/docs/en-us/scripting/security/server-side-detection | 2026-11-22 | search excerpts | Heuristics, honeypots, detection principles |
| R04 | Network ownership, movement validation, and physics (2026-07-10) | OFFICIAL-ROBLOX | https://create.roblox.com/docs/scripting/security/network-ownership | 2026-11-22 | search excerpts (partly localized text) | Ownership security, movement validation, Server Authority mention |
| R05 | WorldRoot class reference (2026-11-20) | OFFICIAL-ROBLOX | https://create.roblox.com/docs/en-us/reference/engine/classes/WorldRoot.md | 2026-11-22 | full page | Spatial queries, casts, deprecations, limits |
| R06 | OverlapParams (2026-11-06) | OFFICIAL-ROBLOX | https://create.roblox.com/docs/reference/engine/datatypes/OverlapParams.md | 2026-11-22 | full page | Include/ExcludeInstances supersede FilterDescendantsInstances |
| R07 | Animation events (2026-10-16) | OFFICIAL-ROBLOX | https://create.roblox.com/docs/en-us/animation/events | 2026-11-22 | search excerpts | Event markers, GetMarkerReachedSignal |
| R08 | UnreliableRemoteEvent reference | OFFICIAL-ROBLOX | https://create.roblox.com/docs/reference/engine/classes/UnreliableRemoteEvent | 2026-11-22 | search excerpt | 900-byte limit, unordered/unreliable semantics |
| R09 | robloxapi.github.io UnreliableRemoteEvent reference | SECONDARY-MIRROR | https://robloxapi.github.io/ref/class/UnreliableRemoteEvent.html | 2026-11-22 | search excerpt | ~500 req/s per client claim (UNVERIFIED) |
| R10 | Server authority model | OFFICIAL-ROBLOX | https://create.roblox.com/docs/projects/server-authority | 2026-11-22 | search excerpts | Prediction/rollback model, setup, limitations |
| R11 | Server Authority DevForum announcements (Studio Beta; Studio Beta Updates; Client Beta) | OFFICIAL-ANNOUNCEMENT | https://devforum.roblox.com/t/client-beta-publish-test-your-server-authoritative-experiences/4606949 and related | 2026-11-22 | search excerpts | Beta stage, animation limit (early access), Team Test notes (may be outdated) |
| R12 | Introducing OverlapParams (DevForum) | COMMUNITY/ANNOUNCEMENT | https://devforum.roblox.com/t/introducing-overlapparams-new-spatial-query-api/1435720 | 2026-11-22 | search excerpts | Historical context; anecdotal performance posts (REPORTED) |
| R13 | "Incorrect size of data being sent limit... UnreliableRemoteEvent" (DevForum bug-report thread) | COMMUNITY | https://devforum.roblox.com/t/incorrect-size-of-data-being-sent-limit-specified-when-using-unreliableremoteevent/3048788 | 2026-11-22 | search excerpt | Buffers compressed before the 900-byte limit applies (REPORTED) |

### Reference-game sources (G-series)
All secondary: nothing here is first-hand OBSERVED. `OFFICIAL-LISTING` = description text on the game's own Roblox page.

| ID | Source | Type | URL | Accessed | Access depth | Supports |
|---|---|---|---|---|---|---|
| G01 | Jujutsu Infinite PvE and PvP tier lists (Sportskeeda; opinion) | WIKI-SECONDARY | https://sportskeeda.com/roblox-news/jujutsu-infinite-pve-tier-list-best-innates | 2026-11-22 | search excerpts | Rarity tiers, technique count 17 |
| G02 | JJI Soul Manipulation guide (Sportskeeda) | WIKI-SECONDARY | https://sportskeeda.com/roblox-news/jujutsu-infinite-soul-manipulation-guide | 2026-11-22 | search excerpts | Special Grade 0.25% cumulative (seven techniques), guard-break identity |
| G03 | JJI Innate Technique guide (ProGameGuides) | WIKI-SECONDARY | https://progameguides.com/roblox/jujutsu-infinite-innate-technique-guide | 2026-11-22 | search excerpts | Spin sources, mastery, domain rules, no trading |
| G04 | JJI Innate Techniques guide (Sportskeeda) | WIKI-SECONDARY | https://sportskeeda.com/roblox-news/jujutsu-infinite-innate-techniques-guide | 2026-11-22 | search excerpts | Mastery kept on reroll; multiple domains |
| G05 | JJI spins and rerolls explainer (iTechGuides, relaying a community wiki) | WIKI-SECONDARY | https://www.itechguides.com/jujutsu-infinite-spins-and-rerolls-how-they-work/ | 2026-11-22 | search excerpt | Reported odds 70/20/7/2.75, explicitly unconfirmed by developer |
| G06 | JJI best innates (Deltia's Gaming) | WIKI-SECONDARY | https://deltiasgaming.com/?p=112906 | 2026-11-22 | search excerpt | Special Grade pity meter |
| G07 | JJI Star Rage guide (Sportskeeda) | WIKI-SECONDARY | https://sportskeeda.com/roblox-news/jujutsu-infinite-star-rage-guide-how-get-moveset | 2026-11-22 | search excerpt | 0.25% claim (conflicts with G02) |
| G08 | JJI Blazing Courage guide (Sportskeeda) | WIKI-SECONDARY | https://www.sportskeeda.com/roblox-news/jujutsu-infinite-blazing-courage-guide | 2026-11-22 | search excerpt | 10% claim |
| G09 | JJI controls (Destructoid; ProGameGuides) | WIKI-SECONDARY | https://www.destructoid.com/?p=985311 ; https://progameguides.com/?p=925944 | 2026-11-22 | search excerpts | Keybinds, controller support |
| G10 | JJI Black Flash and chanting guides (Destructoid, Beebom, Gamezebo, ProGameGuides) | WIKI-SECONDARY | https://beebom.com/jujutsu-infinite-black-flash-guide/ ; https://www.gamezebo.com/walkthroughs/jujutsu-infinite-black-flash-guide/ | 2026-11-22 | search excerpts | Black Flash unlock, prompt, tokens vs bar (conflict), awakening bonus |
| G11 | JJI technique counts and opacity (Sportskeeda 19, Power Up Gaming 23, Beebom) | WIKI-SECONDARY | https://powerupgaming.co.uk/?p=74577 ; https://beebom.com/jujutsu-infinite-innate-techniques/ | 2026-11-22 | search excerpts | Count varies; effects unknown until activation |
| G12 | Jujutsu: RETRO Roblox listing | OFFICIAL-LISTING | https://www.roblox.com/games/130476702934550/Jujutsu-RETRO | 2026-11-22 | search excerpt of listing text | Modes, features, developer |
| G13 | Jujutsu RETRO fan wiki (independent) | WIKI-SECONDARY | https://jujutsuretro.wiki/ | 2026-11-22 | search excerpts of several pages | Record dates, kits, blessings, sandbox switch |
| G14 | Sorcery guides (Destructoid beginner's guide; allroblox; ProGameGuides controls; Mejoress controls 2024) | WIKI-SECONDARY | https://www.destructoid.com/beginners-guide-sorcery-roblox/ ; https://allroblox.com/en/game/sorcery/ | 2026-11-22 | search excerpts | Controls, mission types, identity |
| G15 | Sorcery technique tier list (Sportskeeda) and technique guide (Gamezebo) | WIKI-SECONDARY | https://sportskeeda.com/roblox-news/sorcery-cursed-technique-tier-list | 2026-11-22 | search excerpts | 11 techniques; Rika, Blood Reinforce |
| G16 | Sorcery weapons guide (DroidGamers) | WIKI-SECONDARY | https://www.droidgamers.com/guides/sorcery-weapons/ | 2026-11-22 | search excerpt | Weapon classes |
| G17 | Shibuya Roblox listing | OFFICIAL-LISTING | https://roblox.com/games/92832059482592 | 2026-11-22 | search excerpt | Setting 1000 years after original story |
| G18 | Shibuya tier list (ProGameGuides, Nov 2026) | WIKI-SECONDARY | https://progameguides.com/roblox/roblox-shibuya-tier-list/ | 2026-11-22 | search excerpts | Races, clans, bonuses |
| G19 | Jujutsu Shenanigans beginner guide (games.gg) | WIKI-SECONDARY | https://games.gg/roblox/guides/jujutsu-shenanigans-beginners-guide/ | 2026-11-22 | search excerpts | Physics, 20 players, awakening, minigames |
| G20 | Jujutsu Zero technique guide (allthings.how) | WIKI-SECONDARY | https://allthings.how/projection-sorcery-in-jujutsu-zero-skills-damage-and-raid-performance/ | 2026-11-22 | search excerpts | Banner, dual techniques, vows, raid mode |
| G21 | Jujutsu Beatdown characters (Sportskeeda) | WIKI-SECONDARY | https://www.sportskeeda.com/roblox-news/jujutsu-beatdown-all-characters | 2026-11-22 | search excerpt | 4 characters |
| G22 | Jujutsu Unbound Roblox listing | OFFICIAL-LISTING | https://www.roblox.com/games/99813204829559 | 2026-11-22 | search excerpt | Advertised features only |
| G23 | Jujutsu Odyssey Cursed Techniques (ProGameGuides) | WIKI-SECONDARY | https://progameguides.com/roblox/how-to-get-cursed-techniques-in-jujutsu-odyssey/ | 2026-11-22 | search excerpt | Cursed Wombs acquisition |
| G24 | Sorcerer Battlegrounds guide (Sportskeeda) | WIKI-SECONDARY | https://www.sportskeeda.com/roblox-news/roblox-sorcerer-battlegrounds-how-play-features | 2026-11-22 | search excerpt | Roster, awakening key |
| G25 | Heian beginner guide (ItemLevel) | WIKI-SECONDARY | https://itemlevel.net/ultimate-heian-beginners-guide/ | 2026-11-22 | search excerpt | Parry-miss cooldown, backstab, air dash |

Discarded as unreliable (not cited): an incoherent "Yuta Black Flash JJS" page on a siemens.com subdomain that appeared in search results, which reads as auto-spun spam.

### Policy, mesh, ragdoll and AKAYUKI sources (P/E/Q/A-series)

| ID | Source | Type | URL | Accessed | Access depth | Supports |
|---|---|---|---|---|---|---|
| P01 | Roblox Community Standards (about.roblox.com) | OFFICIAL-ROBLOX | https://about.roblox.com/en-au/community-standards | 2026-11-22 | search excerpts | Extreme violence / realistic extreme gore not allowed outside Restricted policy |
| P02 | Content maturity and compliance (Creator Docs) | OFFICIAL-ROBLOX | https://create.roblox.com/docs/en-us/production/promotion/content-maturity | 2026-11-22 | search excerpt | Restricted tier examples include dismemberment; Moderate = non-graphic |
| P03 | Experience guidelines (Creator Docs) | OFFICIAL-ROBLOX | https://create.roblox.com/docs/en-us/production/promotion/experience-guidelines | 2026-11-22 | search excerpt | Disclose violence/blood in any asset type; Restricted label restarts servers to age-verified 18+ |
| P04 | Strengthening Our Safety Policies and Tools (Aug 2025) | OFFICIAL-ANNOUNCEMENT | https://devforum.roblox.com/t/strengthening-our-safety-policies-and-tools/3882864 | 2026-11-22 | search excerpt | Restricted/unrated visibility limited to ID-verified 17+ (threshold conflicts with P05) |
| P05 | Content Maturity Labels (Help Center) | OFFICIAL-ROBLOX | https://en.help.roblox.com/hc/articles/8862768451604 | 2026-11-22 | search excerpt | Restricted available only to 18+ age-checked users |
| P06 | Upcoming Changes to Experience Guidelines (DevForum, 2024) | OFFICIAL-ANNOUNCEMENT | https://devforum.roblox.com/t/3070343 | 2026-11-22 | search excerpt | Label naming; Moderate vs consequence realism |
| E01 | EditableMesh class reference (last_updated 2026-10-22) | OFFICIAL-ROBLOX | https://create.roblox.com/docs/reference/engine/classes/EditableMesh.md | 2026-11-22 | search excerpts of reference | Limits 60k verts/20k tris, permissions, fixed-size, API toggle |
| E02 | In-experience Mesh & Image APIs [Client Beta] (DevForum) | OFFICIAL-ANNOUNCEMENT | https://devforum.roblox.com/t/client-beta-in-experience-mesh-image-apis-now-available-in-published-experiences/3267293 | 2026-11-22 | search excerpt | Beta caveats, ID verification, API list |
| E03 | EditableImage class reference | OFFICIAL-ROBLOX | https://create.roblox.com/docs/reference/engine/classes/EditableImage.md | 2026-11-22 | search excerpt | Related image API |
| Q01 | Avatar Joint Upgrade [Studio Beta] (DevForum) | OFFICIAL-ANNOUNCEMENT | https://devforum.roblox.com/t/studio-beta-avatar-joint-upgrade-enabling-physically-simulated-characters/3266099 | 2026-11-22 | search excerpt | BallSocket/AnimationConstraint avatar joints, ragdoll on death |
| Q02 | Avatar Joint Upgrade is now live (DevForum, FAQ updated 2026-01-26) | OFFICIAL-ANNOUNCEMENT | https://devforum.roblox.com/t/avatar-joint-upgrade-for-physically-simulated-character-movement-is-now-live/4298561 | 2026-11-22 | search excerpt | Release status (details UNVERIFIED) |
| Q03 | R15 ragdoll jitter thread (DevForum) | COMMUNITY | https://devforum.roblox.com/t/r6-ragdolls-work-fine-but-r15-ragdolls-have-seizures-and-panick-attacks/3114467 | 2026-11-22 | search excerpt | One reported fix (REPORTED) |
| Q04 | RagdollService community module (DevForum) | COMMUNITY | https://devforum.roblox.com/t/ragdollservice-all-in-one-high-quality-ragdoll-solution/4255978 | 2026-11-22 | search excerpt | Existence of community ragdoll modules (licensing unvetted) |
| A01 | AKAYUKI: Steel Blossoms Red official community page | OFFICIAL-LISTING | https://www.roblox.com/communities/549473894/Akayuki-Steel-Blossoms-Red | 2026-11-22 | search excerpt | Description, 1.4.1 announcement |
| A02 | AKAYUKI fan wiki (independent) | WIKI-SECONDARY | https://akayuki-steel-blossoms-red.wiki/ | 2026-11-22 | search excerpt | Poise, Iai, duel format |
| A03 | Rival Ducks stats page for AKAYUKI | COMMUNITY | https://rivalducks.com/apps/radar/games/10771760061-akayuki-steel-blossoms-red | 2026-11-22 | search excerpt | Creation date Oct 2026, version string (stats snapshot is dated) |
| A04 | AKAYUKI guides (ProGameGuides codes; OfZenAndComputing guide) | WIKI-SECONDARY | https://www.ofzenandcomputing.com/akayuki-steel-blossoms-red-roblox-guide-fast-leveling/ | 2026-11-22 | search excerpt | Level cap 50, forge milestones |

## Research queue
| Part | Topic | Preferred sources |
|---|---|---|
| 1 | Jujutsu Infinite, Jujutsu: RETRO, Sorcery, Shibuya, other Roblox JJK games | Game pages, developer notes/updates, wikis (REPORTED) |
| 1 | Action RPG and fighting-game references | Developer talks, official documentation |
| 2 | JJK lore | Manga/anime primary; wikis only as secondary |
| 3 to 6 | Combat, injury, animation, VFX/SFX | Roblox Creator Hub, developer talks |
| 9 | Remaining Roblox APIs (see handbook README "Not yet researched") | create.roblox.com/docs |


## Part 2 sources: JJK encyclopedia (J-series)
All secondary. **No primary manga chapter or anime episode was read.** "Chapter N" statements are what these pages attribute to the work. Most were seen only as search excerpts (2026-11-22). Reliability: wiki/news = medium; TV Tropes/blogs/fan translations = low.

| ID | Source | Type | URL | Supports |
|---|---|---|---|---|
| J01 | JJK Wiki "Cursed Energy" (**old revision** oldid=3702) | WIKI-SECONDARY | https://jujutsu-kaisen.fandom.com/wiki/Cursed_Energy?oldid=3702 | CE origin, Toji |
| J02 | JJK Wiki "Cursed Technique" (**old revision** oldid=3716) | WIKI-SECONDARY | https://jujutsu-kaisen.fandom.com/wiki/Cursed_Technique?oldid=3716 | Technique definition |
| J03 | Sportskeeda: cursed energy explained | WIKI-SECONDARY | https://www.sportskeeda.com/anime/jujutsu-kaisen-what-cursed-energy-explained | CE, reinforcement |
| J04 | JJK Wiki Chapter 71 | WIKI-SECONDARY | https://jujutsu-kaisen.fandom.com/wiki/Chapter_71 | Maximum output: Blue |
| J05 | JJK Wiki Chapter 227 | WIKI-SECONDARY | https://jujutsu-kaisen.fandom.com/wiki/Chapter_227 | Exhausted technique, RCT healing |
| J06 | JJK Wiki "Limitless" | WIKI-SECONDARY | https://jujutsu-kaisen.fandom.com/wiki/Limitless | Inherited technique, Red/Blue, technique lists |
| J07 | Sportskeeda: 8 complex cursed techniques | WIKI-SECONDARY | https://www.sportskeeda.com/anime/8-complex-cursed-techniques-jujutsu-kaisen-blew-people-s-minds-ranked | Mimicry, Projection Sorcery, extensions |
| J08 | Sportskeeda: anti-domain techniques | WIKI-SECONDARY | https://sportskeeda.com/anime/what-anti-domain-techniques-jujutsu-kaisen | Simple Domain, incomplete domains |
| J09 | Sportskeeda: Hollow Wicker Basket | WIKI-SECONDARY | https://sportskeeda.com/anime/what-hollow-wicker-basket-jujutsu-kaisen-sukuna-s-counter-yuta-s-domain-explained | HWB description, ch.171/249 |
| J10 | AnimeExplained: barrier techniques | WIKI-SECONDARY | https://www.animeexplained.com/?p=6954 | Barrier technique list, Falling Blossom Emotion |
| J11 | AnimeExplained: Simple Domain | WIKI-SECONDARY | https://animeexplained.com/?p=6909 | Simple Domain origin |
| J12 | JJK Wiki Chapter 266 | WIKI-SECONDARY | https://jujutsu-kaisen.fandom.com/wiki/Chapter_266 | HWB, soul strikes vs RCT |
| J13 | Deltia's Gaming: anti-domain techniques | WIKI-SECONDARY | https://deltiasgaming.com/?p=83419 | HWB limits, users |
| J14 | JJK Wiki "Self-Embodiment of Perfection" | WIKI-SECONDARY | https://jujutsu-kaisen.fandom.com/wiki/Self-Embodiment_of_Perfection | Mahito's domain, concept links |
| J15 | JJK Wiki file page (Reggie) | WIKI-SECONDARY | https://jujutsu-kaisen.fandom.com/wiki/File:Reggie_says_sorcerers_are_con_artists.png | Incomplete barrier |
| J16 | GameRant: abilities that aren't domains | WIKI-SECONDARY | https://gamerant.com/jujutsu-kaisen-strongest-abilities-not-domain-expansions/ | Domain definition |
| J17 | Sportskeeda: RCT targets the soul (author interpretation) | WIKI-SECONDARY | https://www.sportskeeda.com/anime/jujutsu-kaisen-s-shinjuku-showdown-arc-may-redefined-reverse-cursed-technique-works-nobody-noticed | RCT/soul interpretation |
| J18 | Wikipedia: List of JJK chapters | WIKI-SECONDARY | https://www.wikipedia.org/wiki/List_of_Jujutsu_Kaisen_chapters | Black Flash introduction |
| J19 | Sportskeeda: ch.263 binding vows | WIKI-SECONDARY | https://sportskeeda.com/anime/jujutsu-kaisen-gets-yet-another-binding-vow-sukuna-time | Vows (ch.263) |
| J20 | Twinfinite: Itadori and Sukuna's vow | WIKI-SECONDARY | https://twinfinite.net/guides/what-was-itadori-sukunas-binding-vow-in-jujutsu-kaisen-explained/ | Ch.11 vow (terms unverified) |
| J21 | Sportskeeda: vow vs Heavenly Restriction | WIKI-SECONDARY | https://sportskeeda.com/anime/can-binding-vow-used-create-heavenly-restriction-jujutsu-kaisen-explored | Vows, Heavenly Restriction |
| J22 | Sportskeeda: Yuji's powers / second technique (ch.257) | WIKI-SECONDARY | https://www.sportskeeda.com/anime/all-7-yuji-itadori-s-current-powers-jujutsu-kaisen-explained | Awakening after Black Flashes |
| J23 | Sportskeeda: every Black Flash | WIKI-SECONDARY | https://sportskeeda.com/anime/complete-list-every-black-flash-shown-jujutsu-kaisen-far | Black Flash facts |
| J24 | Sportskeeda: every RCT user | WIKI-SECONDARY | https://sportskeeda.com/anime/every-reverse-cursed-technique-user-jujutsu-kaisen | Yuta revival, ch.175 |
| J25 | Sportskeeda: ch.178 | WIKI-SECONDARY | https://www.sportskeeda.com/anime/everything-jujutsu-kaisen-chapter-178-reveals-yuta-s-cursed-technique | Yuta's Rika technique |
| J26 | Scribd fan translation (narrator summary) | COMMUNITY (low) | https://www.scribd.com/document/847655808/Untitled-document | Unverified spoilers only |
| J27 | Sportskeeda: special-grade sorcerers | WIKI-SECONDARY | https://www.sportskeeda.com/anime/jujutsu-kaisen-every-special-grade-sorcerer-cursed-technique-explained | Special-grade traits |
| J-TV | TV Tropes: Jujutsu High characters | COMMUNITY (low) | https://www.tvtropes.org/pmwiki/pmwiki.php/Characters/JujutsuKaisenTokyoPrefecturalJujutsuHighSchool | Reinforcement summary |
| J-DT | DocumentaryTube blog: Yuji's domain | COMMUNITY (low) | https://www.documentarytube.com/?p=258901 | Unverified; Dismantle on soul boundary |

Discarded as unreliable (not cited): a WorldAnvil fan-universe "Domains Explained" page, D&D/Minecraft/game-mod pages, and unrelated results.


## Part 1 supplemental reference: VV: Ultimatum (2026-11-23)
These are secondary sources used to identify questions for first-hand observation. They do not establish exact current-patch mechanics or balance values.

| ID | Source | Type | URL | Accessed | Access depth | Supports |
|---|---|---|---|---|---|---|
| V01 | AllThingsHow, VV Ultimatum factions, combat, leveling overview | WIKI-SECONDARY | https://allthings.how/vv-ultimatum-on-roblox-factions-combat-and-leveling-explained/ | 2026-11-23 | web search / secondary overview | Broad combat and progression reference; verify in game |
| V02 | VV Ultimatum community reference hub | COMMUNITY | https://vvultimatum.net/ | 2026-11-23 | landing page / secondary | Leads for mechanics and progression; reliability varies |
| V03 | Games.gg, Z-Step guide | WIKI-SECONDARY | https://games.gg/roblox/guides/vv-ultimatum-how-to-master-z-step/ | 2026-11-23 | web search / secondary guide | Movement-tech reference; exact behavior UNVERIFIED |
| V04 | Nitrogenic, "VV: Ultimatum Is Parry SLOP (literally)" | COMMUNITY / OPINION | https://www.youtube.com/watch?v=GQ7QTZRpiAc | 2026-11-23 | creator opinion reference | Criticism to investigate, not community consensus |

Research note: The project adaptation document [[docs/01-reference-games/vv-ultimatum-design-takeaways]] explicitly labels these claims REPORTED and the design conclusions RECOMMENDATION. Owner first-hand clips are still needed before recording OBSERVED mechanics.
