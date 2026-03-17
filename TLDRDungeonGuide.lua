-- ============================================================
--  TLDRDungeonGuide.lua  v1.4.3
--  Midnight Season 1 – TL;DR Boss Guide with Role Breakdowns
--  ALL 16 DUNGEONS COMPLETE
-- ============================================================

-- ============================================================
--  SAVED VARIABLES (persisted across sessions via .toc)
-- ============================================================
MPG_Settings = MPG_Settings or {}

local defaults = {
    barWidth    = 220,
    barAlpha    = 1.0,
    outputMode  = "chat",   -- "chat" or "window"
    fontSize    = 12,
    titleColor  = { r=1.00, g=0.84, b=0.00 },
    bgColor     = { r=0.05, g=0.05, b=0.10 },
    popupWidth  = 420,
    popupHeight = 320,
    -- Guide text colors
    numColor    = { r=1.00, g=0.30, b=0.30 },  -- Red      (bullet numbers)
    abilColor   = { r=1.00, g=0.82, b=0.00 },  -- Gold     (ability names)
    infoColor   = { r=0.90, g=0.90, b=0.90 },  -- Off-white (description text)
    -- Popup font
    fontFace    = "Fonts/FRIZQT__.TTF",
    -- Role filter
    role        = "all",   -- "all" | "tank" | "healer" | "dps"
    -- Bar visibility
    barVisibility = "always",  -- "always" | "dungeon" | "hidden"
    -- Guide density
    density = "normal",  -- "normal" | "brief"
}

local function GetSetting(key)
    if MPG_Settings[key] ~= nil then return MPG_Settings[key] end
    return defaults[key]
end
local function SetSetting(key, value)
    MPG_Settings[key] = value
end

-- ============================================================
--  DUNGEON DATA
-- ============================================================

local dungeons = {
    {
        name = "Algeth'ar Academy",
        bosses = {
            {
                name = "Vexamus",
                tldr = {
                    "ARCANE ORBS fly toward the boss — soak them before they reach him or he gains energy and blasts the group.",
                    "MANA BOMBS: Run to the edge when targeted. Puddles last 1 minute — never stack them center.",
                    "At 100 energy ARCANE FISSURE hits the group and drops swirlies — dodge and pop a defensive.",
                },
                tank = {
                    "ARCANE EXPULSION: Point the frontal away from the group. Use a defensive every cast.",
                    "OVERSURGE stacks from orb soaks — you can handle more stacks than the group, so take extras if needed.",
                    "Reposition to keep the boss away from Mana Bomb puddles.",
                },
                healer = {
                    "ARCANE FISSURE at 100 energy is raid-wide unavoidable damage — cooldown here.",
                    "Dispel OVERSURGE stacks on players who soaked multiple orbs before they take another.",
                    "Watch for players who soaked a Mana Bomb and are out of position — they may take extra ticks.",
                },
                dps = {
                    "Priority 1: intercept ARCANE ORBS before they reach the boss.",
                    "MANA BOMBS: move to the edge immediately if targeted. Drop your puddle in the corner.",
                    "Dodge swirlies during ARCANE FISSURE — don't stand still after the 100-energy cast begins.",
                },
            },
            {
                name = "Overgrown Ancient",
                tldr = {
                    "Clear ALL Vile Lashers before the boss activates. Avoid Detonation Seeds.",
                    "GERMINATE: Stack and sidestep together. BURST FORTH at 100 energy — unavoidable hit, pop defensives.",
                    "BRANCH OUT: Dodge the swirly. Kill Ancient Branch add (interrupt it), then stand in Abundance circle.",
                },
                tank = {
                    "Grab loose adds immediately after BURST FORTH awakens dormant Lashers.",
                    "BRANCH OUT add: pick it up instantly, keep it faced away from the group.",
                    "Save a major defensive for BURST FORTH — it hits hard plus spawns adds.",
                },
                healer = {
                    "BURST FORTH is unavoidable group damage — this is your main cooldown window.",
                    "Bloodlust/Heroism recommended here. It is the hardest boss in the dungeon.",
                    "Watch Splinterbark debuffs — players need to step into Abundance circles to clear them.",
                },
                dps = {
                    "Clear ALL Lashers before engaging. Do not skip them — they will wipe the group during the boss.",
                    "After BRANCH OUT spawns the Ancient Branch add: interrupt it and burn it down before returning to boss.",
                    "Stand in the Abundance circle after killing Ancient Branch to clear your Splinterbark debuff.",
                },
            },
            {
                name = "Crawth",
                tldr = {
                    "Score 3 GOALS — coordinate who hits the puck. End the fight quickly.",
                    "PECK (Tank): Stacking bleed. Use interrupt CDs or a bleed cleanse. Interrupt anything interruptible.",
                },
                tank = {
                    "PECK applies a stacking bleed — use a defensive and call for a dispel if stacks get high.",
                    "Hold positioning near the goal so the group can coordinate puck hits without chasing the boss.",
                    "Interrupt rotation: establish one with the group before the pull.",
                },
                healer = {
                    "The bleed from PECK stacks fast. Prioritize the tank and dispel when possible.",
                    "This is a short fight if the puck mechanic goes smoothly — save major cooldowns for mistakes.",
                },
                dps = {
                    "Focus: hit the puck into the goal 3 times. Assign a dedicated puck-hitter before pulling.",
                    "Interrupt anything interruptible — run a rotation so nothing goes through.",
                    "Burn fast — the longer this drags the messier it gets.",
                },
            },
            {
                name = "Echo of Doragosa",
                tldr = {
                    "OVERWHELMING POWER: Max 3 stacks per player. At 3 stacks, ARCANE RIFT spawns at your location — stay mobile.",
                    "ASTRAL BREATH at 100 energy: lethal cone — watch the energy bar and get out of the cone.",
                    "On pull: move her away from start position immediately. First 2 Arcane Rifts spawn there — own that space.",
                },
                tank = {
                    "ASTRAL BREATH is a lethal cone at 100 energy — never have the boss facing the group at that point.",
                    "You will accumulate OVERWHELMING POWER stacks faster than others — manage your position to avoid dropping Arcane Rifts in the center.",
                    "ASTRAL BOMB can be interrupted — coordinate with the group.",
                },
                healer = {
                    "ASTRAL BREATH at 100 energy is the big healing check — ensure the group is topped before it lands.",
                    "Watch stack counts on everyone — 3 stacks triggers an Arcane Rift which adds sustained group damage.",
                    "ARCANE RIFTS pulse Uncontrolled Energy — the more alive, the harder the healing becomes.",
                },
                dps = {
                    "Manage your OVERWHELMING POWER stacks — never sit at 3. Drop Arcane Rifts in corners away from the group.",
                    "ASTRAL BOMB: interrupt or CC it. The explosion also damages the boss — you can angle it for bonus damage.",
                    "Don't stack on other players' Arcane Rifts — spread slightly throughout the fight.",
                },
            },
        },
    },
    {
        name = "Magister's Terrace",
        bosses = {
            {
                name = "Arcanotron Custos",
                tldr = {
                    "REFUELING PROTOCOL at 0 energy: Energy Spheres fly toward boss — intercept them. Each one he absorbs deals massive AoE damage and boosts his output by 20%. Soaking one gives YOU a 20% damage bonus.",
                    "ARCANE WAVE: knocks all players back and leaves a slowing damage puddle under each player — reposition boss away from puddles.",
                    "ETHEREAL BONDS: curse that roots several players and ticks damage every 3s for 15s — dispel immediately.",
                },
                tank = {
                    "REPELLING STRIKE: uninterruptible 2.5s cast knockback — position with a wall behind you and use a defensive.",
                    "Move boss continuously away from ARCANE WAVE puddles — they slow by 50% and deal sustained damage.",
                    "During REFUELING PROTOCOL hold position near likely orb paths so you can soak efficiently.",
                },
                healer = {
                    "ETHEREAL BONDS on multiple players is your top dispel priority — it ticks every 3 seconds.",
                    "ARCANE WAVE resets everyone's position — be ready to move and keep casting while players regroup.",
                    "Players soaking orbs gain a damage bonus but also take a hit — spot heal soakers.",
                },
                dps = {
                    "At 0 energy: intercept Energy Spheres before they reach the boss — each soak gives you 20% damage bonus.",
                    "Reposition after ARCANE WAVE knocks you into a puddle — do not stand in the slow zone.",
                    "Dispel ETHEREAL BONDS on rooted players if you have a magic dispel.",
                },
            },
            {
                name = "Seranel Sunlash",
                tldr = {
                    "HASTENING WARD: magic buff on Seranel that increases his attack speed and adds Arcane damage to his melees — purge it immediately.",
                    "RUNIC MARKS: players get marks that must be removed one at a time inside the Suppression Zone. Removing marks simultaneously causes a wipe — go in one by one.",
                    "OATH OF SILENCE at 100 energy: silences all players outside the Suppression Zone for 8s — everyone inside before it fires.",
                },
                tank = {
                    "HASTENING WARD spikes your incoming damage significantly — use a defensive if purge is slow.",
                    "Keep boss OUT of the Suppression Zone so the whole group can freely enter it.",
                    "After the boss dies, tank the Void adds from the Cynosure of Twilight — Void Gash adds extra shadow damage to melees.",
                },
                healer = {
                    "Pre-position inside the Suppression Zone before OATH OF SILENCE fires — you need to keep casting.",
                    "RUNIC MARK removal triggers arcane arrow volleys — heal through each one as players exit the dome.",
                    "HASTENING WARD increases tank damage intake — stay aggressive on tank heals during this debuff.",
                },
                dps = {
                    "Purger: remove HASTENING WARD every single time it goes up — assign this role before the pull.",
                    "RUNIC MARKS: enter the Suppression Zone one player at a time to remove your mark — never double up, it wipes.",
                    "Watch OATH OF SILENCE cast bar and be inside the Suppression Zone before it completes.",
                },
            },
            {
                name = "Gemellus",
                tldr = {
                    "TRIPLICATE at 90% and 50%: copies spawn — all share health via SYNAPTIC NEXUS, attack all simultaneously. Get close to as many copies as possible.",
                    "NEURAL LINK debuff: hug the correct copy of the boss to remove its shield and clear your debuff.",
                    "ASTRAL GRASP at 100 energy: pulls all players toward their respective Gemellus — use movement abilities to escape.",
                },
                tank = {
                    "After TRIPLICATE: group all copies together for maximum group cleave efficiency.",
                    "ASTRAL GRASP pulls you in — use a movement ability or immune to escape, then re-establish position.",
                    "COSMIC STING leaves VOID SECRETIONS pools — move boss away from these constantly.",
                },
                healer = {
                    "TRIPLICATE phases spike incoming damage — be ready with a cooldown at 90% and again at 50%.",
                    "NEURAL LINK debuffed players take damage until they clear it — keep them topped while they find their copy.",
                    "ASTRAL GRASP pulls are chaotic — instant heals and smart positioning are key during this phase.",
                },
                dps = {
                    "At 90% and 50%: move toward as many copies as possible — all share health, all damage counts.",
                    "NEURAL LINK: immediately move to the correct copy and hug it to remove its shield and clear your debuff.",
                    "ASTRAL GRASP at 100 energy — use a movement ability to break free and avoid the COSMIC RADIATION aura.",
                },
            },
            {
                name = "Degentrius",
                tldr = {
                    "UNSTABLE VOID ESSENCE: bounces to 4 marked floor zones — a player MUST stand in each zone when it lands or it explodes for massive group damage.",
                    "NULL BOMB: after the essence cycles all 4 zones, it becomes a bomb — tank must detonate it. Everyone else stay 3m+ away.",
                    "VOID TORRENT beams stun on contact — never walk through them. HULKING FRAGMENT: huge tank hit + 8yd knockback.",
                },
                tank = {
                    "NULL BOMB: your job is to detonate it — stand on it and use a major defensive. Everyone else gets out of 3m range.",
                    "HULKING FRAGMENT hits you and anyone within 8 yards — call out and move away from the group before it lands.",
                    "On Mythic: HULKING FRAGMENT leaves UMBRAL SPLINTERS DoT then STYGIAN ICHOR puddle — move away to drop it safely.",
                },
                healer = {
                    "DEVOURING ENTROPY: curse on several players ticking heavy shadow damage for 20s — when it expires, Entropy Orbs burst outward. Dispel strategically, one at a time, with the player away from the group.",
                    "NULL BOMB detonation on tank spikes hard — major heal or cooldown immediately after.",
                    "VOID TORRENT stuns anyone who touches it — players who walk into a beam need emergency healing.",
                },
                dps = {
                    "Pre-position to cover all 4 UNSTABLE VOID ESSENCE zones — assign players to zones before pull.",
                    "Never cross VOID TORRENT beams — 3-second stun in a dangerous position can be fatal.",
                    "When DEVOURING ENTROPY expires on you, move away from the group before the Entropy Orbs burst.",
                },
            },
        },
    },
    {
        name = "Maisara Caverns",
        bosses = {
            {
                name = "Muro'jin & Nekraxx",
                tldr = {
                    "Kill both bosses simultaneously — if Muro'jin dies first, Nekraxx casts BESTIAL WRATH. If Nekraxx dies first, Muro'jin REVIVES her.",
                    "CARRION SWOOP: if targeted, immediately enter a FREEZING TRAP to avoid the damage. Anyone in Nekraxx's flight path takes lethal damage.",
                    "Dodge FETID QUILLSTORM. Use a personal defensive if you have the INFECTED PINIONS disease debuff AND get hit by BARRAGE.",
                },
                tank = {
                    "FLANKING SPEAR: use active mitigation on every cast — it hits hard.",
                    "Stack both bosses together so the group can cleave them down evenly.",
                    "Watch both HP bars — you are responsible for calling out if damage is becoming uneven.",
                },
                healer = {
                    "INFECTED PINIONS disease debuff on players is your main healing check — ramp up during this window.",
                    "Use your major healing cooldown during INFECTED PINIONS, especially if it overlaps with BARRAGE.",
                    "Players entering Freezing Traps for CARRION SWOOP take zero damage — trust the mechanic.",
                },
                dps = {
                    "Damage both bosses evenly — they must die within seconds of each other.",
                    "CARRION SWOOP: if targeted, run to a Freezing Trap immediately. Do not stand in Nekraxx's flight path.",
                    "Dodge FETID QUILLSTORM — it is a telegraphed ground AoE.",
                },
            },
            {
                name = "Vordaza",
                tldr = {
                    "UNSTABLE PHANTOMS: do NOT attack them (99% damage reduction). Force them to COLLIDE with each other to destroy them — but limit stacks of LINGERING DREAD to 2 max.",
                    "NECROTIC CONVERGENCE phase: boss gains DEATHSHROUD shield — burn it down fast. Dodge COALESCED DEATH orbs during this phase.",
                    "Dodge the UNMAKE frontal cone at all times.",
                },
                tank = {
                    "DRAIN SOUL: major defensive every single cast — no exceptions.",
                    "Position boss so the UNMAKE frontal faces away from the group at all times.",
                    "During NECROTIC CONVERGENCE: stay on the boss and help burn the DEATHSHROUD shield.",
                },
                healer = {
                    "This is one of the hardest healer fights in the dungeon — constant ROT damage throughout.",
                    "Save major cooldowns for LINGERING DREAD debuff windows and NECROTIC CONVERGENCE phase.",
                    "VEILED PRESENCE pools left by colliding phantoms deal sustained AoE — position the group away from them.",
                },
                dps = {
                    "UNSTABLE PHANTOMS: never attack them. Maneuver to force them to run into each other — they die on collision.",
                    "Never let LINGERING DREAD exceed 2 stacks — each phantom collision adds a stack.",
                    "NECROTIC CONVERGENCE: drop everything and burn the DEATHSHROUD shield. The longer it lives, the more damage the group takes.",
                },
            },
            {
                name = "Rak'tul, Vessel of Souls",
                tldr = {
                    "CRUSH SOULS: 3 players are targeted — stack closer together near a Soulbind Totem so you can cleave the totem down efficiently.",
                    "SOULRENDING ROAR phase: interrupt/CC the MALIGNANT SOUL add to gain SPECTRAL RESIDUE stacks — this buff speeds up the fight.",
                    "Dodge VOLATILE ESSENCE ground puddles. Use defensives during DEATHGORGED VESSEL.",
                },
                tank = {
                    "SPIRITBREAKER: major defensive — be mindful of where it leaps so SPECTRAL DECAY ichor doesn't drop in bad positions.",
                    "Position Rak'tul near a Soulbind Totem so marked players can cleave it without running far.",
                    "Hold aggro through the SOULRENDING ROAR phase while DPS manage the Malignant Soul add.",
                },
                healer = {
                    "DEATHGORGED VESSEL: your main healing cooldown window — use it here every time.",
                    "During SOULRENDING ROAR you will likely gain SPECTRAL RESIDUE stacks — keep the group topped through this phase.",
                    "VOLATILE ESSENCE puddles add sustained ticking damage — remind players to move out immediately.",
                },
                dps = {
                    "CRUSH SOULS: stack near a Soulbind Totem with the other marked players and cleave it down.",
                    "SOULRENDING ROAR: interrupt or CC the MALIGNANT SOUL add every time — SPECTRAL RESIDUE stacks make the whole fight faster.",
                    "Sidestep VOLATILE ESSENCE puddles. Pop a personal defensive during DEATHGORGED VESSEL.",
                },
            },
        },
    },
    {
        name = "Nexus Point Xenas",
        bosses = {
            {
                name = "Chief Corewright Kasreth",
                tldr = {
                    "REFLUX CHARGE targets a player — that player must move to stand directly in the LEYLINE ARRAY laser intersection to clear it. Standing in the wrong spot does nothing.",
                    "CORESPARK DETONATION at 100 energy: massive ball thrown at a player — heavy knockback + healing absorb. Bait it into a safe corner away from active lasers.",
                    "FLUX COLLAPSE circles from broken pipes: move out as they spawn.",
                },
                tank = {
                    "CORESPARK DETONATION at 100 energy: major defensive — the hit itself plus the healing absorb make this your deadliest window.",
                    "Position boss away from active Leyline Array grids so REFLUX CHARGE players don't have to cross them to reach the intersection.",
                    "Keep construct adds picked up quickly — free constructs empower the boss.",
                },
                healer = {
                    "CORESPARK DETONATION healing absorb on the targeted player — burst heal through the absorb immediately after impact.",
                    "FLUX COLLAPSE puddles shrink safe space — reposition early so you're not scrambling during healing windows.",
                    "Communicate with the REFLUX CHARGE player — they may briefly move out of your healing range to reach the laser intersection.",
                },
                dps = {
                    "If targeted by REFLUX CHARGE: immediately move to the intersection of the LEYLINE ARRAY lasers and stand in it to clear them. Don't guess — wrong position does nothing.",
                    "Bait CORESPARK DETONATION into a corner — the knockback can throw players into active laser grids if baited poorly.",
                    "Kill construct adds quickly — they buff Kasreth while alive.",
                },
            },
            {
                name = "Corewarden Nysarra",
                tldr = {
                    "LIGHTSCAR FLARE: 18s stun window where boss takes 300% more damage — stack ALL cooldowns and Heroism here.",
                    "NULL VANGUARD: summons DREADFLAIL + GRAND NULLIFIER adds — kill them before LIGHTSCAR FLARE ends or adds survive into the damage window.",
                    "UMBRAL LASH (tank): cleaves nearby players and applies VOID SCAR — keep group well clear of the tank.",
                },
                tank = {
                    "UMBRAL LASH cleaves your nearby players with VOID SCAR — keep the group away from you during this cast.",
                    "During LIGHTSCAR FLARE: hold Dreadflail and Grand Nullifier adds so DPS can cleave boss + adds together.",
                    "ECLIPSING STEP repositions the boss — communicate immediately so the group adjusts.",
                },
                healer = {
                    "LIGHTSCAR FLARE: the whole group is in the boss' cone taking continuous damage while popping cooldowns — top everyone before the phase and be ready to sustain.",
                    "NULL VANGUARD adds must die before LIGHTSCAR FLARE ends — DEVOUR THE UNWORTHY if they survive is near-wipe damage.",
                    "Coordinate Heroism/Bloodlust with the LIGHTSCAR FLARE window — the 300% amp makes it the only correct timing.",
                },
                dps = {
                    "This fight is entirely built around LIGHTSCAR FLARE. Communicate all CD timings before the pull.",
                    "NULL VANGUARD priority: kill Dreadflail and Grand Nullifier immediately — they must be dead before LIGHTSCAR FLARE ends.",
                    "Use Heroism/Bloodlust during LIGHTSCAR FLARE — the 300% damage amp makes every other window irrelevant.",
                },
            },
            {
                name = "Lothraxion",
                tldr = {
                    "BRILLIANT DISPERSION: loosely spread, kill images without stacking them — they leave puddles.",
                    "DIVINE GUILE: find the clone WITHOUT horns of light and interrupt only him. Wrong interrupt = Core Exposure.",
                    "SEARING REND (Tank): permanent puddles — drop them on edges from the very first cast.",
                },
                tank = {
                    "SEARING REND drops permanent puddles — start placing them on the edges from pull one. The whole fight depends on keeping the center clear.",
                    "During DIVINE GUILE: maintain aggro but don't panic — wait for the group to identify the real boss.",
                    "BRILLIANT DISPERSION spawns images near you — don't stack the images when killing them.",
                },
                healer = {
                    "BRILLIANT DISPERSION AoE DoT on 3 players — heal them through it while they handle images.",
                    "During DIVINE GUILE the boss deals pulsing damage to the group — keep everyone above 50% before the phase.",
                    "Avoid puddles from dead Fracture Images — they add sustained group damage.",
                },
                dps = {
                    "DIVINE GUILE tip: use Hunter's Mark on the real boss before the phase — the marker stays visible among clones.",
                    "Only interrupt the clone WITHOUT horns of light — interrupting a clone triggers Core Exposure damage spike.",
                    "Spread loosely for BRILLIANT DISPERSION so images that spawn near you don't chain to other players.",
                },
            },
        },
    },
    {
        name = "Pit of Saron",
        bosses = {
            {
                name = "Forgemaster Garfrost",
                tldr = {
                    "PERMAFROST: constantly builds stacks in LoS. Use Saronite Boulders he throws as LoS tools to drop stacks.",
                    "Weapon upgrades at 66% and 33% — most dangerous moments. Cooldowns here.",
                },
                tank = {
                    "Rotate LoS breaks behind boulders when your Permafrost stacks get high — don't let them stack to max.",
                    "THROW SARONITE: the thrown boulder is your reset tool. Plan your LoS path after each throw.",
                    "Weapon upgrades at 66% and 33% massively spike incoming damage — major defensive at each upgrade.",
                },
                healer = {
                    "Watch tank Permafrost stacks — communicate when the tank needs to LoS to reset.",
                    "Weapon upgrades are the hardest heal checks in the fight — save cooldowns for those windows.",
                    "DEEP FREEZE: dispel the slow/healing reduction on affected players immediately.",
                },
                dps = {
                    "Use Saronite Boulders for LoS breaks when your own stacks get high — tanks aren't the only ones who stack.",
                    "CHILLING WAVE is a frontal cone — stay out of front of boss.",
                    "Burn hard at the weapon upgrade points — reducing his health faster limits time at each deadlier phase.",
                },
            },
            {
                name = "Ick and Krick",
                tldr = {
                    "Kill KRICK (the gnome) — Ick dies with him. Kite constantly to avoid Blight puddles.",
                    "PURSUIT: Ick fixates a player — kite around room edges, group DPS from behind.",
                },
                tank = {
                    "MIGHTY STOMP: major defensive every time — it hits hard.",
                    "During PURSUIT you are not the target — use this window to stack DPS cooldowns on Ick from behind.",
                    "Keep Ick moving constantly so Blight puddles don't cluster in one area.",
                },
                healer = {
                    "EXPLOSIVE BARRAGE drops slow-moving bombs — heal through early hits but remind players to dodge.",
                    "PURSUIT target takes no direct damage but needs top health — the group takes Blight tick damage throughout.",
                    "Keep everyone moving so nobody sits in a puddle.",
                },
                dps = {
                    "Focus Krick — Ick dies when Krick dies.",
                    "PURSUIT: if you are fixated, kite around room edges. Group follows Ick from behind and DPS freely.",
                    "Dodge EXPLOSIVE BARRAGE bombs — they leave fire patches that compound the puddle problem.",
                },
            },
            {
                name = "Scourgelord Tyrannus",
                tldr = {
                    "OVERLORD'S BRAND: damage to Tyrannus while branded reflects to the branded player — stop DPS, heal them up.",
                    "RIMEFANG: swoops and breathes frost — dodge the target location and avoid the patch left behind.",
                },
                tank = {
                    "FORCEFUL SMASH: pop a major defensive — it hits extremely hard.",
                    "MARK OF RIMEFANG slows and reduces your healing received — call for dispel and use a small defensive.",
                    "Watch the sky for Rimefang swoops — anticipate the frost breath path.",
                },
                healer = {
                    "OVERLORD'S BRAND: immediately top the branded player and alert DPS to stop attacking.",
                    "MARK OF RIMEFANG on tank reduces their healing received — prioritize tank during this debuff.",
                    "Rimefang phases are predictable — use the break in tank damage to top everyone.",
                },
                dps = {
                    "OVERLORD'S BRAND: when a player is branded, STOP attacking Tyrannus — all damage reflects to them.",
                    "Dodge Rimefang frost breath trajectory lines and avoid patches left behind.",
                    "FORCEFUL SMASH is the tank's problem but watch your positioning — don't be in the tank's face.",
                },
            },
        },
    },
    {
        name = "Skyreach",
        bosses = {
            {
                name = "Ranjit",
                tldr = {
                    "WINDWALLS: spinning blades rotate around the room — position between them in the safe gaps.",
                    "FOUR WINDS: stand between the four directional gusts. Watch cast bar — repositioning window is short.",
                },
                tank = {
                    "Anchor the boss position so the group can reliably predict windwall gaps.",
                    "FOUR WINDS: reposition early — if you react late the gust will knock you into blades.",
                    "Keep the boss near the center so the whole group has equal access to safe zones.",
                },
                healer = {
                    "Players hit by Windwalls take heavy damage — this is sustained throughput healing, not burst.",
                    "FOUR WINDS spike — pre-cast a big heal so it lands as the gust hits.",
                    "Keep everyone topped before Windwall rotations begin — you cannot react fast enough if someone is already low.",
                },
                dps = {
                    "Track the windwall rotation patterns before positioning — there is always a safe gap between blades.",
                    "FOUR WINDS: move to the safe zone between all four gust directions before the cast ends.",
                    "Don't chase the boss — stay in safe zones and let the boss come to you.",
                },
            },
            {
                name = "Araknath",
                tldr = {
                    "ENERGY ORBS: soak them with a defensive — they give a 150% damage buff post-soak (tuned in beta).",
                    "Constructs fixate players — kite and kill them quickly.",
                },
                tank = {
                    "Soak energy orbs — the 150% damage amp buff is worth the incoming damage hit.",
                    "Constructs fixate random players — peel them off if they fixate a DPS or healer.",
                    "Keep boss positioned away from where constructs are being kited.",
                },
                healer = {
                    "Orb soaks spike individual player health significantly — top them immediately after soaking.",
                    "Constructs hitting fixated players deal sustained damage — keep fixated targets topped.",
                    "The damage amp from orbs means the fight ends faster — let DPS soak when safe.",
                },
                dps = {
                    "Soak energy orbs proactively — the damage buff significantly speeds up the kill.",
                    "Use a personal defensive when soaking to survive the impact.",
                    "Constructs fixate players — kite them and kill them quickly so they don't stack.",
                },
            },
            {
                name = "Rukhran",
                tldr = {
                    "SOLAR EGGS: kill them immediately when they spawn — if they reach the boss he heals significantly.",
                    "QUILLS: spread slightly to reduce splash damage.",
                },
                tank = {
                    "Keep Rukhran turned away from DPS during QUILLS — the cone must face only you.",
                    "Call out when Solar Eggs spawn so DPS can pivot immediately.",
                    "Reposition Rukhran away from egg spawn points — reduces travel time to kill them.",
                },
                healer = {
                    "Solar Egg cleanup is a burst DPS phase — watch for heal drop-off while DPS is focused elsewhere.",
                    "QUILLS: small spread reduces splash hits — a moderate heal is usually sufficient.",
                    "If eggs reach the boss he heals — this extends fight length and makes healing harder.",
                },
                dps = {
                    "SOLAR EGGS are the highest priority target when they spawn — immediately switch off boss to kill them.",
                    "Do not let eggs reach the boss — his heal from consuming them is significant.",
                    "Spread slightly during QUILLS to reduce splash chain hits.",
                },
            },
            {
                name = "High Sage Viryx",
                tldr = {
                    "SKYREACH SKYTERROR: Viryx throws players off the edge — eagles patrol the boundary. Catch thrown players using the eagles before they fall.",
                    "CAST DOWN: grab eagle and intercept the thrown player. Timing matters — move early.",
                },
                tank = {
                    "LENS FLARE: move out of the targeting circle quickly — it disorients if it lands.",
                    "Maintain boss position centrally so throwers and catchers have maximum movement room.",
                    "During CAST DOWN: you may be the one thrown — use the eagle proactively if targeted.",
                },
                healer = {
                    "CAST DOWN removes a player from the fight briefly — watch for the moment they land and heal.",
                    "SOLAR SLASH is a tank buster — keep the tank topped before each cast.",
                    "The window when a player is being caught is your free healing moment — top everyone.",
                },
                dps = {
                    "When CAST DOWN targets a player, immediately run to an eagle at the platform edge and intercept.",
                    "Players who fall completely take fatal fall damage — prioritize the catch over DPS.",
                    "Coordinate who is catching vs. continuing DPS — assign roles before the pull.",
                },
            },
        },
    },
    {
        name = "Seat of the Triumvirate",
        bosses = {
            {
                name = "Zuraal the Ascended",
                tldr = {
                    "COALESCED VOID adds: CC or kill before they reach the boss — if they touch him he heals.",
                    "DECIMATE pools: stand in them to get the damage buff, but don't let them stack dangerously.",
                },
                tank = {
                    "VOID SLASH: major defensive — it hits extremely hard and applies a vulnerability.",
                    "Intercept Coalesced Void adds immediately — they cannot reach the boss.",
                    "Reposition boss near adds when they spawn so DPS can cleave efficiently.",
                },
                healer = {
                    "VOID ERUPTION hits the whole group — main cooldown window.",
                    "Coalesced Void adds healing the boss extends the fight — prioritize add-kill healing support.",
                    "DECIMATE pools give a damage buff — encourage DPS to use them but watch health bars closely.",
                },
                dps = {
                    "CC or instantly kill Coalesced Void adds when they spawn — do not let them reach the boss.",
                    "Stand in DECIMATE pools for the damage buff — just don't stack them on boss's current position.",
                    "Spread slightly to avoid chaining VOID ERUPTION splash.",
                },
            },
            {
                name = "Saprish",
                tldr = {
                    "Boss and 2 pets share health — priority interrupt DREAD SCREECH. Kill VOID BOMBS before UMBRAL NOVA.",
                    "All three targets die together — cleave them, don't single-target.",
                },
                tank = {
                    "SHADOW SLASH: heavy physical hit on tank — defensive every time.",
                    "Position all three targets (Saprish + 2 pets) together for efficient cleave.",
                    "Pets fixate players — peel them back to your cluster position.",
                },
                healer = {
                    "UMBRAL NOVA if Void Bombs survive: unavoidable raid nuke — this is your emergency cooldown.",
                    "DREAD SCREECH reduces healing received on affected players — dispel and prioritize them.",
                    "All three bosses sharing health means sustained group damage — steady throughput healing.",
                },
                dps = {
                    "Interrupt DREAD SCREECH — this is the top priority interrupt of the fight.",
                    "Kill Void Bombs before UMBRAL NOVA fires — failure means a near-wipe.",
                    "Cleave all three targets together — single-targeting any one is inefficient since health is shared.",
                },
            },
            {
                name = "Viceroy Nezhar",
                tldr = {
                    "COLLAPSING VOID: arena shrinks constantly — you will eventually be forced to the center.",
                    "UMBRAL TENTACLES: kill immediately. Interrupt the knockback cast.",
                },
                tank = {
                    "VOID CRUSH: major defensive — it hits very hard.",
                    "Reposition boss toward center as the arena shrinks. Anticipate losing edges early.",
                    "Umbral Tentacle add: pick it up immediately and face it away from the group.",
                },
                healer = {
                    "COLLAPSING VOID shrinks safe space — players taking unavoidable void damage ramps throughout the fight.",
                    "Umbral Tentacle knockbacks interrupt your casts — position away from them or use instant heals.",
                    "Save a cooldown for when the arena is at its smallest — sustained damage peaks there.",
                },
                dps = {
                    "Kill UMBRAL TENTACLES the moment they spawn — do not let them live.",
                    "Interrupt the Tentacle knockback cast — it disrupts the whole group's positioning.",
                    "Track the arena boundary constantly — getting caught in COLLAPSING VOID is instantly fatal.",
                },
            },
            {
                name = "L'ura",
                tldr = {
                    "PORTAL PHASES: enter portals and kill Greater Rift Wardens to stop NAARU'S LAMENT channel.",
                    "VOID TOUCH: DoT on random players — dispel quickly.",
                },
                tank = {
                    "SHADOW SMASH: heavy tank hit during main phase — defensive every cast.",
                    "In portal phases, grab the Greater Rift Warden aggro immediately — it cannot be allowed to channel.",
                    "Rotate out of portals with the group — do not stay in when the portal closes.",
                },
                healer = {
                    "NAARU'S LAMENT if channel completes: massive sustained raid damage. Prioritize killing Wardens in portals.",
                    "VOID TOUCH on multiple players compounds quickly — dispel priority targets and use a cooldown if 3+ players are afflicted simultaneously.",
                    "Portal phases give a brief breathing window — top everyone while the group handles the Warden.",
                },
                dps = {
                    "Enter portals when they open — kill the Greater Rift Warden before the portal closes.",
                    "If NAARU'S LAMENT channels because you failed to kill the Warden: pop a personal defensive immediately.",
                    "During main phase: interrupt VOID BLAST and help dispel VOID TOUCH.",
                },
            },
        },
    },
    {
        name = "Windrunner Spire",
        bosses = {
            {
                name = "Emberdawn",
                tldr = {
                    "FLAMING UPDRAFT debuff: targeted player immediately moves to a corner and drops the fire AoE there — never in the center.",
                    "BURNING GALE: pushes all players back — position near a wall or the center to reduce displacement.",
                    "SCORCHING DIVE: targets a random player with a fiery charge — sidestep the trajectory line.",
                },
                tank = {
                    "WING BUFFET: major defensive on every cast — hard tank hit.",
                    "Hold Emberdawn central so FLAMING UPDRAFT targets have clear paths to corners.",
                    "Reposition after BURNING GALE knockbacks — the boss may have drifted.",
                },
                healer = {
                    "BURNING GALE is your main raid healing window — group-wide chip damage from the push.",
                    "FLAMING UPDRAFT targets briefly leave melee — track their health while they run to a corner.",
                    "SCORCHING DIVE hit player takes a burst of damage — spot heal them immediately.",
                },
                dps = {
                    "FLAMING UPDRAFT on you: stop attacking, run to a corner, drop the AoE, then return.",
                    "Brace for BURNING GALE knockback near a wall to minimize displacement.",
                    "SCORCHING DIVE: watch for the targeting line and sidestep before it lands.",
                },
            },
            {
                name = "Derelict Duo (Kalis & Latch)",
                tldr = {
                    "LATCH SLAM: frontal chain attack — never stand in front of Latch.",
                    "BANSHEE WAIL from Kalis: interrupt it or the whole group is silenced for 6s.",
                    "Keep both bosses stacked together — all cleave damage counts on both.",
                },
                tank = {
                    "Stack Kalis and Latch together at all times — face them away from the group.",
                    "LATCH SLAM is a frontal — you will eat it, use a defensive and ensure the group is behind both bosses.",
                    "Track both HP pools — if one dies first, the other enrages.",
                },
                healer = {
                    "BANSHEE WAIL silence on the group means you cannot cast for 6s — use instants if it lands.",
                    "LATCH SLAM hits the tank hard — top the tank between each slam.",
                    "Keep the group stacked for efficient healing — the fight rewards tight positioning.",
                },
                dps = {
                    "Never stand in front of Latch — LATCH SLAM cleaves forward.",
                    "Interrupt BANSHEE WAIL from Kalis on cooldown — assign a rotation before pull.",
                    "Balance damage on both bosses — killing one early enrages the other.",
                },
            },
            {
                name = "Commander Kroluk",
                tldr = {
                    "RECKLESS LEAP: charges the furthest player and leaves a fire ring — designate one player to stay at max range.",
                    "INTIMIDATING SHOUT: fears all nearby players — stack together so fears land and break simultaneously.",
                    "RALLYING BELLOW at 66% and 33%: boss gains SHIELD WALL and summons adds — kill ALL adds to remove the shield.",
                    "BLADESTORM channel: everyone spread 6+ yards — deadly to anyone in melee.",
                },
                tank = {
                    "Designate yourself as the RECKLESS LEAP target — stay at max range and use a defensive when it fires.",
                    "At 66% and 33%: immediately pick up all adds. The boss's SHIELD WALL won't drop until they're dead.",
                    "During BLADESTORM: run out to 6+ yards — even tanks die standing in it.",
                },
                healer = {
                    "RECKLESS LEAP target takes burst damage and stands in a fire ring — top them fast.",
                    "INTIMIDATING SHOUT fears break on damage — use instant heals or AoE heals to break fears quickly.",
                    "Add phases at 66% and 33% extend the fight — save a cooldown for the second add phase when the group is lower.",
                },
                dps = {
                    "Assign the RECKLESS LEAP designated target before pull — that player stays max range with a personal defensive ready.",
                    "Stack before INTIMIDATING SHOUT so fear breaks are synchronized.",
                    "At each RALLYING BELLOW: immediately swap to adds — boss is immune until every add is dead.",
                    "BLADESTORM: spread 6+ yards immediately — do not stay in melee.",
                },
            },
            {
                name = "The Restless Heart",
                tldr = {
                    "SQUALL LEAP DoT: the only way to remove it is by running through a TURBULENT ARROWS puddle — always know where the nearest one is.",
                    "BOLT GALE volleys: keep moving throughout — stationary players take full stacks.",
                    "BULLSEYE WINDBLAST: expanding ring outward from targeted player — jump over the ring as it reaches you.",
                    "GUST SHOT: targeted projectile that creates a TURBULENT ARROWS puddle on impact — useful for clearing SQUALL LEAP.",
                },
                tank = {
                    "SQUALL LEAP applies a stacking DoT on you — immediately move through a TURBULENT ARROWS puddle to cleanse it.",
                    "Keep boss repositioned so BOLT GALE volleys don't corner the group.",
                    "Use a defensive when SQUALL LEAP stacks are high and no puddle is immediately available.",
                },
                healer = {
                    "SQUALL LEAP stacks quickly become fatal — immediately call out puddle locations for affected players.",
                    "BOLT GALE ramps up group damage over time — keep everyone topped between volleys.",
                    "BULLSEYE WINDBLAST jumps are predictable — pre-heal the targeted player before their ring arrives.",
                },
                dps = {
                    "SQUALL LEAP DoT: run through TURBULENT ARROWS puddle immediately — do not wait.",
                    "Keep moving constantly during BOLT GALE volleys — stopping guarantees multiple hits.",
                    "BULLSEYE WINDBLAST: time your jump to clear the expanding ring as it reaches you.",
                },
            },
        },
    },
}

-- ============================================================
--  PRESEASON DUNGEON DATA  (right-click menu)
-- ============================================================

local preseasonDungeons = {
    {
        name = "Den of Nalorakk",
        bosses = {
            {
                name = "The Hoardmonger",
                tldr = {
                    "RESOURCEFUL MEASURES at 90/60/30%: empowers an ability. SPOILED SUPPLIES at 100 energy: kills Rotten Mushrooms fast.",
                    "EARTHSHATTER SLAM frontal — never stand in front. SAVAGE ROAR: unavoidable group hit.",
                },
                tank = {
                    "Never stand in front — EARTHSHATTER SLAM is a massive frontal cone aimed at you.",
                    "At each RESOURCEFUL MEASURES threshold follow the boss to the resource pile and re-establish position.",
                    "Use a defensive during SAVAGE ROAR if it overlaps with Mushroom pressure.",
                },
                healer = {
                    "SAVAGE ROAR is unavoidable group damage — your main cooldown window.",
                    "Rotten Mushrooms pulse AoE damage until killed — the longer they live the harder you work.",
                    "RESOURCEFUL MEASURES empowers abilities — watch what gets buffed and adjust cooldown timing.",
                },
                dps = {
                    "Kill ROTTEN MUSHROOMS immediately — they pulse group AoE until destroyed.",
                    "Stay out of EARTHSHATTER SLAM frontal — watch boss facing at all times.",
                    "Track HP thresholds 90/60/30% — empowered abilities after each one are notably more dangerous.",
                },
            },
            {
                name = "Sentinel of Winter",
                tldr = {
                    "RAGING SQUALLS: wandering tornadoes — keep moving, learn patrol paths.",
                    "ETERNAL WINTER at 100 energy: heavy raid damage + knockback — defensive and healer cooldown.",
                    "FRACTURED SHIVERCORES: kill before they apply WINTER'S SHROUD. Their death leaves SNOWDRIFT patches.",
                },
                tank = {
                    "Kite the boss along tornado-free paths — staying still guarantees a Squall hit.",
                    "ETERNAL WINTER knockback: face a wall or brace — it will reposition you significantly.",
                    "Grab FRACTURED SHIVERCORES as they spawn so they don't freely apply shroud stacks to the group.",
                },
                healer = {
                    "ETERNAL WINTER is your main healing cooldown — save it for every 100-energy cast.",
                    "GLACIAL TORMENT is a ramping debuff — dispel it and prioritize affected players.",
                    "This is a sustained movement fight — throughput over burst, keep everyone from sitting in Snowdrift patches.",
                },
                dps = {
                    "Keep moving at all times — Raging Squalls patrol and hit stationary players repeatedly.",
                    "Kill FRACTURED SHIVERCORES before they apply shroud. They leave Snowdrift patches when they die — avoid those spots.",
                    "Use a personal defensive during ETERNAL WINTER if the healer cooldown is already committed.",
                },
            },
            {
                name = "Nalorakk",
                tldr = {
                    "ECHOING MAUL marks you for 4 sec — immediately move away from your group before it expires or the Echo spawns on top of everyone.",
                    "FURY OF THE WAR GOD at 100 energy: Echoes of Nalorakk charge toward Zul'jarra — intercept them before they reach her. Any Echo that gets through triggers DEMORALIZING SCREAM (10% damage taken stacking debuff).",
                    "FORCEFUL ROAR pushes all players back — position with your back to a wall to minimise displacement.",
                },
                tank = {
                    "OVERWHELMING ONSLAUGHT is a devastating channelled attack — major defensive every single cast. Damage taken increases by 100% per tick so it escalates extremely fast.",
                    "Zul'jarra's DEFENSIVE STANCE reduces your Overwhelming Onslaught damage taken by 50% — stay near her during the channel so she can protect you.",
                    "FURY OF THE WAR GOD: help control Echo positioning. Echoes attack Zul'jarra and Concussive Shock removes her protection — this is your most dangerous window.",
                },
                healer = {
                    "OVERWHELMING ONSLAUGHT on tank is your biggest healing check — major cooldown ready for every cast.",
                    "FURY OF THE WAR GOD: if any Echo reaches Zul'jarra it triggers DEMORALIZING SCREAM — 10% damage taken debuff that stacks every time. Multiple stacks escalate group damage rapidly — emergency heal if Echoes get through.",
                    "ECHOING MAUL hits all players within 8 yards when any Echo triggers — healing spike on the group each cast.",
                },
                dps = {
                    "ECHOING MAUL: when marked, immediately walk away from the group — 4 seconds before the Echo spawns at your position. If you stay in the group every existing Echo also fires simultaneously.",
                    "FURY OF THE WAR GOD: intercept Echoes of Nalorakk before they reach Zul'jarra — stand between the Echoes and her position. Each Echo that gets through adds a stacking damage debuff on the entire group.",
                    "FORCEFUL ROAR pushes you back — reposition against the room edge to reduce lost uptime.",
                },
            },
        },
    },
    {
        name = "Murder Row",
        bosses = {
            {
                name = "Kystia Manaheart",
                tldr = {
                    "ILLICIT INFUSION: purge/dispel off Nibbles immediately — when freed, Nibbles reverts to Light form and buffs your group. Kystia then enters DESTABILIZED (stunned, takes 100% more damage).",
                    "MIRROR IMAGES: interrupt every cast — this is a separate ability from the Nibbles mechanic.",
                },
                tank = {
                    "Hold aggro on both Kystia and hostile Nibbles simultaneously until Nibbles is freed.",
                    "DESTABILIZED is triggered by freeing Nibbles — brace for group AoE ticks (Chaos damage every 1 sec for 15 sec) and pour damage into the stunned boss.",
                    "Avoid Nibbles' FEL SPRAY while she is still hostile.",
                },
                healer = {
                    "DESTABILIZED: Kystia pulses Chaos damage to the whole group every 1 sec for 15 sec — sustained healing required during this window.",
                    "Once Nibbles is freed her LIGHT INFUSION helps your healing output — prioritise the dispel early.",
                    "FEL SPRAY from hostile Nibbles adds group pressure — coordinate a fast dispel to end that phase.",
                },
                dps = {
                    "Purge ILLICIT INFUSION off Nibbles immediately — this is the first action on every pull.",
                    "Interrupt MIRROR IMAGES every single cast — it's a separate priority from the Nibbles mechanic.",
                    "After Nibbles is freed Kystia is stunned and takes 100% more damage — burn her during DESTABILIZED.",
                },
            },
            {
                name = "Zaen Bladesorrow",
                tldr = {
                    "MURDER IN A ROW at 100 energy: get behind cover BEFORE he fires — anyone in the open takes lethal damage.",
                    "SAME-DAY DELIVERY and FIRE BOMB: dodge impact zones.",
                },
                tank = {
                    "ENVENOM: major defensive and call for healer attention — the poison DoT is severe.",
                    "Watch the energy bar constantly — at 100 you need to be at cover before the barrage starts.",
                    "Position boss near cover objects so your movement to cover is minimal.",
                },
                healer = {
                    "ENVENOM on tank is a high-damage poison DoT — prioritize tank and dispel if possible.",
                    "MURDER IN A ROW if anyone doesn't make cover: emergency heal — the damage is extreme.",
                    "Track the energy bar for yourself — you also need to be behind cover.",
                },
                dps = {
                    "Watch the energy bar — when it hits 100, immediately stop DPS and get behind a crate or pillar.",
                    "SAME-DAY DELIVERY crates leave fire patches — dodge impact and avoid the persistent fire.",
                    "FIRE BOMB: move out of the marked area immediately.",
                },
            },
            {
                name = "Xathuux the Annihilator",
                tldr = {
                    "DEMONIC RAGE at full rage: BURNING STEPS cover the floor permanently. Burn him fast before the room fills.",
                    "LEGION STRIKE: heavy physical hit + healing reduction on tank. AXE TOSS: dodge the spinning axe.",
                },
                tank = {
                    "LEGION STRIKE: defensive + call for extra healer attention — the healing reduction stacks with incoming damage.",
                    "During DEMONIC RAGE: kite his movement pattern carefully to keep fire patches away from the center.",
                    "This is a race — any time wasted on bad positioning extends fire coverage and makes survival harder.",
                },
                healer = {
                    "LEGION STRIKE healing reduction on tank: be aggressive with heals during this debuff.",
                    "DEMONIC RAGE phases: the longer he stays in rage, the harder healing becomes — cooldowns to sustain.",
                    "Save your largest cooldown for the final DEMONIC RAGE phase when floor coverage is highest.",
                },
                dps = {
                    "This is a pure DPS race — kill him before DEMONIC RAGE phases cover the entire arena.",
                    "Use personal defensives during DEMONIC RAGE phases when fire coverage forces the group into tight spaces.",
                    "AXE TOSS: sidestep the spinning axe — losing uptime hurts but taking it hurts more.",
                },
            },
            {
                name = "Lithiel Cinderfury",
                tldr = {
                    "FINGERS OF GUL'DAN: kill Wild Imps immediately — Imps alive during MALEFIC WAVE get empowered.",
                    "MALEFIC WAVE: use Lithiel's DEMONIC GATEWAY to pass through safely. Know the gateway location before pull.",
                    "CHAOS BOLT: interrupt every cast.",
                },
                tank = {
                    "Maintain aggro on Lithiel and any surviving imps simultaneously.",
                    "Know the DEMONIC GATEWAY location — you need to move through it during MALEFIC WAVE without losing boss control.",
                    "Pop a defensive during MALEFIC WAVE if you can't reach the gateway in time.",
                },
                healer = {
                    "MALEFIC WAVE without gateway use: unavoidable heavy DoT — emergency cooldown.",
                    "Imps alive during MALEFIC WAVE get empowered and dramatically increase your work — remind DPS to kill them.",
                    "After the gateway phase top everyone before Lithiel resumes casting.",
                },
                dps = {
                    "FINGERS OF GUL'DAN: instantly kill all Wild Imps before MALEFIC WAVE arrives.",
                    "MALEFIC WAVE: everyone uses Lithiel's Demonic Gateway — mark it before the pull so nobody misses it.",
                    "CHAOS BOLT: interrupt on cooldown — assign a rotation.",
                },
            },
        },
    },
    {
        name = "The Blinding Vale",
        bosses = {
            {
                name = "Lightblossom Trinity",
                tldr = {
                    "THREE shared-health targets — cleave all evenly. Block LIGHTBLOSSOM BEAM with your body.",
                    "FERTILE LOAM + LIGHTSOWER DASH: interrupt Lekshi or kill Lightblossoms before beams hit them.",
                },
                tank = {
                    "Keep all three Rutaani stacked for group cleave.",
                    "BEDROCK SLAM drops Fertile Loam near your position — tank away from the center so soil patches don't block beam-blocking positions.",
                    "Establish aggro on all three simultaneously — losing one lets it freely apply debuffs.",
                },
                healer = {
                    "THORNBLADE bleeds on random players — maintain top-up and dispel when available.",
                    "LIGHTBLOOM OVERGROWTH damage scales with Light-Gorged stacks — the more beams that land unblocked, the harder this hits.",
                    "All three targets share health — sustained cleave damage means sustained healing demand.",
                },
                dps = {
                    "Block LIGHTBLOSSOM BEAM by standing between Kezkitt and a Lightblossom.",
                    "Interrupt Lekshi's LIGHTSOWER DASH or kill planted Lightblossoms before Kezkitt beams them.",
                    "Cleave all three targets evenly — they share health but can individually enrage if one dies first.",
                },
            },
            {
                name = "Ikuzz the Light Hunter",
                tldr = {
                    "BLOODTHORN ROOTS: immediately destroy roots to free trapped players — a rooted player during BLOODTHIRSTY GAZE is a wipe.",
                    "BLOODTHIRSTY GAZE at 100 energy: targeted player must MOVE — being reached means a massive bleed.",
                },
                tank = {
                    "BLOODTHIRSTY GAZE does not fixate tanks exclusively — be ready to peel if it targets a DPS.",
                    "Destroy BLOODTHORN ROOTS on any player immediately — free them before the Gaze hits.",
                    "Kite during Gaze fixation: lead Ikuzz away from the group so his path doesn't clip others.",
                },
                healer = {
                    "THORNCALLER ROAR: channeled nature damage on all — defensive cooldown here.",
                    "Rooted + Gaze targeted player: this is a life-or-death heal — top priority.",
                    "Keep everyone above 70% before each 100-energy window — the Gaze + root combo can one-shot low players.",
                },
                dps = {
                    "When BLOODTHORN ROOTS trap a player: stop DPS and destroy the roots immediately.",
                    "BLOODTHIRSTY GAZE target: move constantly until the fixation ends. Do not stop.",
                    "Dodge Ikuzz's path during Gaze — anyone he runs through takes splash bleed damage.",
                },
            },
            {
                name = "Lightwarden Ruia",
                tldr = {
                    "MOONKIN/BEAR form shifts — track which form he's in for correct mechanics.",
                    "GRIEVOUS THRASH: everyone must reach full health between applications or the debuff stacks.",
                    "At 33% CONVOKE THE SPIRITS: rapid-fire all abilities — major cooldowns here.",
                },
                tank = {
                    "BEAR FORM: face boss away from group for PULVERIZING STRIKES cone.",
                    "MOONKIN FORM: WARDEN'S WRATH replaces melee — ranged positioning is viable here.",
                    "At 33% CONVOKE: everything comes fast — pop a major defensive immediately.",
                },
                healer = {
                    "GRIEVOUS THRASH: your primary concern — everyone needs to hit full health before the next application. Never let anyone sit below max.",
                    "CONVOKE THE SPIRITS at 33%: save your biggest raid cooldown for this.",
                    "LIGHTFALL delayed impacts add movement — track who is dodging vs. who needs heals.",
                },
                dps = {
                    "PULVERIZING STRIKES cone in BEAR FORM — stay out of the frontal.",
                    "LIGHTFALL: watch ground markers and step out of the delayed impacts.",
                    "At 33% CONVOKE: pop personal defensives — everything fires at once.",
                },
            },
            {
                name = "Ziekket",
                tldr = {
                    "AWAKEN THE LIGHTBLOOM: kill Lightspawn Lashers fast. CONCENTRATED LIGHTBEAM: dodge the beam path.",
                    "LIGHTBLOOM'S ESSENCE globules: touching them gives a damage/healing buff at cost of some health.",
                    "THORNSPIKE (tank): major defensive. OOZING XYLEM: constant raid DoT throughout.",
                },
                tank = {
                    "THORNSPIKE: major defensive every time — consider a tank swap if CDs run dry.",
                    "Pick up Lightspawn Lashers as they spawn — free Lashers threaten the whole group.",
                    "Position boss so CONCENTRATED LIGHTBEAM paths are predictable and avoidable.",
                },
                healer = {
                    "OOZING XYLEM is a constant Holy DoT on the whole group — sustained healing throughout the fight.",
                    "THORNSPIKE on tank: extra heals immediately after each cast.",
                    "LIGHTBLOOM'S ESSENCE absorption helps your healing output — grab globules when health allows.",
                },
                dps = {
                    "Kill LIGHTSPAWN LASHERS immediately as they spawn — too many alive makes the room unmanageable.",
                    "Dodge CONCENTRATED LIGHTBEAM path entirely — it vaporizes dormant Lashers and hits players for extreme damage.",
                    "Absorb LIGHTBLOOM'S ESSENCE globules for a damage buff — the health cost is worth it.",
                },
            },
        },
    },
    {
        name = "Voidscar Arena",
        bosses = {
            {
                name = "Taz'Rah",
                tldr = {
                    "DARK RIFT: pulls nearby players to center for massive damage — move to far side immediately when it spawns.",
                    "ETHEREAL SHADES: sidestep their NETHER DASH linear bolt. COSMIC SPIKE (tank): defensive every time.",
                },
                tank = {
                    "COSMIC SPIKE: defensive every single cast — it hits hard.",
                    "Position boss on the opposite side of the arena from DARK RIFT — never let the group be between them.",
                    "When ASTRAL RECALL fires, briefly reposition boss so Shades spawn in predictable locations.",
                },
                healer = {
                    "DARK RIFT: anyone pulled in takes extreme damage — be ready for emergency heals.",
                    "NETHER DASH DoT ticks on hit players — top them quickly.",
                    "Mark the DARK RIFT location clearly so no one walks toward it accidentally.",
                },
                dps = {
                    "When DARK RIFT appears: immediately move to the far side of the arena.",
                    "ETHEREAL SHADES cast NETHER DASH — step to the side of each shade so the bolt misses you.",
                    "Don't stand between DARK RIFT and the group — the pull effect hits anyone in the cone.",
                },
            },
            {
                name = "Atroxus",
                tldr = {
                    "NOXIOUS BREATH: tank faces boss away — never let the cone hit the group.",
                    "SICKENING ROAR: heavy poison DoT on tank + AoE splash — ranged step back. POISON SPLASH: move out of puddles.",
                },
                tank = {
                    "Keep boss faced AWAY from the group at all times — NOXIOUS BREATH is lethal to non-tanks.",
                    "SICKENING ROAR: major defensive and call for healer attention.",
                    "Move boss out of POISON SPLASH puddles continuously — standing in them compounds incoming damage.",
                },
                healer = {
                    "SICKENING ROAR: high-damage poison DoT on tank — dispel and aggressive heals immediately.",
                    "Ranged players stepping back during ROAR is the biggest help you can ask for — remind them.",
                    "POISON SPLASH puddles persist — players standing in them add constant ticking damage to your throughput.",
                },
                dps = {
                    "Stay behind the boss — NOXIOUS BREATH is always aimed in a fixed direction at the tank.",
                    "Step back from the tank during SICKENING ROAR to avoid splash range.",
                    "Move out of POISON SPLASH puddles immediately — they stack ticking poison.",
                },
            },
            {
                name = "Charonus",
                tldr = {
                    "UNSTABLE SINGULARITY: pulls players within 12yds — stay outside and drop singularities in assigned sectors.",
                    "GRAVITIC ORBS: lead homing orbs into a Singularity to destroy them. COSMIC BLAST: defensive + top off before it fires.",
                },
                tank = {
                    "Hold Charonus centrally so Singularity drops can be assigned to sectors around the perimeter.",
                    "COSMIC BLAST: major defensive — knockback + raid damage + 20s DoT.",
                    "VOID CASCADE knockbacks: use the direction to reposition toward a safe zone.",
                },
                healer = {
                    "COSMIC BLAST: top everyone before it fires, then immediately cooldown for the 20s DoT aftermath.",
                    "Singularity placement discipline is key — if they pile up in one area, players get pulled and you face burst damage.",
                    "GRAVITIC ORB detonations on players spike hard — keep everyone above 60% during orb chases.",
                },
                dps = {
                    "Assign sectors for Singularity drops before the pull — the arena gets crowded fast.",
                    "GRAVITIC ORBS: lead your homing orb into a Singularity — do not let it detonate on you.",
                    "COSMIC BLAST: pop a personal defensive immediately and be ready for the long DoT.",
                },
            },
        },
    },
}
-- ============================================================
--  COLOR UTILS
-- ============================================================

local COLOR = {
    TITLE  = "|cFFFFD700",
    DUNGEON= "|cFF00CFFF",
    BOSS   = "|cFFFF8C00",
    WARN   = "|cFFFF4444",
    RESET  = "|r",
}
local ADDON_NAME = "TL;DR Dungeon Guide"

-- Role filter: "all", "tank", "healer", "dps"
local function GetRoleSetting() return GetSetting("role") or "all" end

local function RGBToHex(r,g,b)
    return string.format("%02X%02X%02X",
        math.floor(r*255), math.floor(g*255), math.floor(b*255))
end
local function TitleColorCode()
    local c = GetSetting("titleColor")
    return "|cFF"..RGBToHex(c.r,c.g,c.b)
end
local function NumColorCode()
    local c = GetSetting("numColor")
    return "|cFF"..RGBToHex(c.r,c.g,c.b)
end
local function AbilColorCode()
    local c = GetSetting("abilColor")
    return "|cFF"..RGBToHex(c.r,c.g,c.b)
end
local function InfoColorCode()
    local c = GetSetting("infoColor")
    return "|cFF"..RGBToHex(c.r,c.g,c.b)
end

-- Track last shown boss so we can refresh the popup live when colors change
local lastShownDungeon = nil
local lastShownBoss    = nil
local lastShownDungeonIndex = nil  -- index into whichever table
local lastShownBossIndex    = nil
local lastShownTable        = nil  -- reference to dungeons or preseasonDungeons
local popupWindow, popupText, popupContent, popupTitleBar  -- forward declared; created below
local ShowBossInPopup  -- forward declared; defined after popup window creation

-- ============================================================
--  SHAREDMEDIA FONT DETECTION
-- ============================================================
-- Populated at PLAYER_LOGIN once LibSharedMedia is known to be loaded.
-- Before that it stays nil and the font picker uses the built-in list.
local sharedMediaFonts = nil  -- will be set to a table of {name, file} if LSM found

local function DetectSharedMediaFonts()
    local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
    if not LSM then return end
    local list = LSM:List("font")
    if not list then return end
    sharedMediaFonts = {}
    for _, name in ipairs(list) do
        local path = LSM:Fetch("font", name)
        if path then
            table.insert(sharedMediaFonts, {name=name, file=path})
        end
    end
    -- Sort alphabetically
    table.sort(sharedMediaFonts, function(a,b) return a.name < b.name end)
end

-- Bold font path available in WoW
local BOLD_FONT = "Fonts/FRIZQT__.TTF"

-- Build a colored+bold ability name using WoW's |cFF + font escape trick:
-- We can't inline bold mid-FontString, so we mark ability names with a
-- visually distinct color AND wrap them in |H...|h tags which renders
-- as a clickable link style (bold underline) without needing an actual link.
-- Simplest reliable method: color + ALL CAPS already reads as "bold" visually.
-- We'll also prepend a filled square glyph using texture coords.
local function FormatTldrLine(i, line)
    local nc = NumColorCode()
    local ac = AbilColorCode()
    local ic = InfoColorCode()
    local prefix = nc..i..". "..COLOR.RESET
    local abil, rest = line:match("^([A-Z][A-Z'%s%-]+[A-Z']%s*%b()*):%s*(.+)$")
    if not abil then abil, rest = line:match("^([A-Z][A-Z'%s%-]+[A-Z']):%s*(.+)$") end
    if not abil then abil, rest = line:match("^([A-Z][A-Z]+):%s*(.+)$") end
    if abil and rest then
        return prefix..ac..">> "..abil..":"..COLOR.RESET.." "..ic..rest..COLOR.RESET
    else
        return prefix..ic..line..COLOR.RESET
    end
end

-- Role header colors
local ROLE_COLORS = {
    tank   = "|cFF4FC3F7",  -- light blue
    healer = "|cFF81C784",  -- green
    dps    = "|cFFEF9A9A",  -- soft red
}
local ROLE_LABELS = {
    tank   = "TANK",
    healer = "HEALER",
    dps    = "DPS",
}

local function TrimBrief(line)
    -- Guide lines use " — " (em dash, U+2014) as the separator.
    -- Use decimal escapes \226\128\148 since WoW runs Lua 5.1 which has no \x hex escapes.
    local emdash = "\226\128\148"
    local brief = line:match("^(.-) " .. emdash .. " .+$")
    if brief and #brief > 10 then
        if not brief:match("[%.%!%?]$") then brief = brief .. "." end
        return brief
    end
    return line
end

local function BuildBossLines(dungeon, boss)
    local tc = TitleColorCode()
    local lines = {}
    local brief = (GetSetting("density") == "brief")
    table.insert(lines, tc..ADDON_NAME..COLOR.RESET)
    table.insert(lines, COLOR.DUNGEON.."["..dungeon.name.."]"..COLOR.RESET
                        .."  "..COLOR.BOSS..boss.name..COLOR.RESET)
    table.insert(lines, tc.."- - - - - - - - - - - - - - -"..COLOR.RESET)

    local role = GetRoleSetting()

    -- TL;DR section always shown (or when role == "all")
    if role == "all" or boss.tldr then
        if boss.tldr and #boss.tldr > 0 then
            table.insert(lines, tc..">> TL;DR (Everyone)"..COLOR.RESET)
            for i, line in ipairs(boss.tldr) do
                local l = brief and TrimBrief(line) or line
                table.insert(lines, FormatTldrLine(i, l))
            end
        end
    end

    -- Role-specific sections
    local rolesToShow = {}
    if role == "all" then
        rolesToShow = {"tank","healer","dps"}
    elseif role == "tank" or role == "healer" or role == "dps" then
        rolesToShow = {role}
    end

    for _, r in ipairs(rolesToShow) do
        local section = boss[r]
        if section and #section > 0 then
            table.insert(lines, "")
            table.insert(lines, ROLE_COLORS[r]..">> "..ROLE_LABELS[r]..COLOR.RESET)
            for i, line in ipairs(section) do
                local l = brief and TrimBrief(line) or line
                table.insert(lines, FormatTldrLine(i, l))
            end
        end
    end

    return lines
end

-- Rebuild popup content using last known dungeon/boss — called when colors/role changes
local function RefreshPopupIfOpen()
    if popupWindow and popupWindow:IsShown() and lastShownDungeon and lastShownBoss then
        local lines = BuildBossLines(lastShownDungeon, lastShownBoss)
        popupText:SetText(table.concat(lines,"\n"))
        popupContent:SetHeight(popupText:GetStringHeight()+16)
    end
end

-- ============================================================
--  POPUP OUTPUT WINDOW
-- ============================================================

popupWindow = CreateFrame("Frame","MPGPopupWindow",UIParent,"BackdropTemplate")
popupWindow:SetSize(GetSetting("popupWidth"), GetSetting("popupHeight"))
popupWindow:SetPoint("CENTER",UIParent,"CENTER",0,0)
popupWindow:SetMovable(true)
popupWindow:SetResizable(true)
popupWindow:SetResizeBounds(280, 200)
popupWindow:EnableMouse(true)
popupWindow:RegisterForDrag("LeftButton")
popupWindow:SetScript("OnDragStart", popupWindow.StartMoving)
popupWindow:SetScript("OnDragStop",  popupWindow.StopMovingOrSizing)
popupWindow:SetClampedToScreen(true)
popupWindow:SetBackdrop({
    bgFile="Interface/Tooltips/UI-Tooltip-Background",
    tile=true,tileSize=16,edgeSize=0,
    insets={left=4,right=4,top=4,bottom=4},
})
popupWindow:SetBackdropColor(0.05,0.05,0.10,0.95)
popupWindow:Hide()

-- Title bar (drag handle)
popupTitleBar = CreateFrame("Frame",nil,popupWindow,"BackdropTemplate")
popupTitleBar:SetHeight(28)
popupTitleBar:SetPoint("TOPLEFT",  popupWindow,"TOPLEFT",  0, 0)
popupTitleBar:SetPoint("TOPRIGHT", popupWindow,"TOPRIGHT", 0, 0)
popupTitleBar:SetBackdrop({
    bgFile="Interface/Tooltips/UI-Tooltip-Background",
    tile=true,tileSize=16,edgeSize=0,
    insets={left=3,right=3,top=3,bottom=3},
})
popupTitleBar:SetBackdropColor(0.10,0.08,0.20,1)

local popupTitleTxt = popupTitleBar:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
popupTitleTxt:SetPoint("LEFT",popupTitleBar,"LEFT",10,0)
popupTitleTxt:SetPoint("RIGHT",popupTitleBar,"RIGHT",-80,0)
popupTitleTxt:SetWordWrap(false)
popupTitleTxt:SetText(COLOR.TITLE.."TL;DR Dungeon Guide"..COLOR.RESET)

-- ── Boss nav arrows ──────────────────────────────────────────
local navPrev = CreateFrame("Button",nil,popupTitleBar,"UIPanelButtonTemplate")
navPrev:SetSize(28,18)
navPrev:SetPoint("RIGHT",popupTitleBar,"RIGHT",-56,0)
navPrev:SetText("< ")
navPrev:GetFontString():SetTextColor(1,0.84,0)

local navNext = CreateFrame("Button",nil,popupTitleBar,"UIPanelButtonTemplate")
navNext:SetSize(28,18)
navNext:SetPoint("RIGHT",popupTitleBar,"RIGHT",-26,0)
navNext:SetText(" >")
navNext:GetFontString():SetTextColor(1,0.84,0)

-- UpdateNavArrows: enable/disable arrows and set tooltips based on current position
UpdateNavArrows = function()
    if not lastShownTable or not lastShownDungeonIndex or not lastShownBossIndex then
        navPrev:Disable(); navNext:Disable(); return
    end
    local t = lastShownTable
    local di, bi = lastShownDungeonIndex, lastShownBossIndex
    local dungeon = t[di]

    -- Prev/Next only within the current dungeon
    local hasPrev = (bi > 1)
    local hasNext = (bi < #dungeon.bosses)
    if hasPrev then navPrev:Enable() else navPrev:Disable() end
    if hasNext then navNext:Enable() else navNext:Disable() end

    -- Tooltips
    navPrev:SetScript("OnEnter", function(self)
        if bi > 1 then
            GameTooltip:SetOwner(self,"ANCHOR_BOTTOM")
            GameTooltip:SetText("Prev: "..dungeon.bosses[bi-1].name,1,1,1)
            GameTooltip:Show()
        end
    end)
    navNext:SetScript("OnEnter", function(self)
        if bi < #dungeon.bosses then
            GameTooltip:SetOwner(self,"ANCHOR_BOTTOM")
            GameTooltip:SetText("Next: "..dungeon.bosses[bi+1].name,1,1,1)
            GameTooltip:Show()
        end
    end)
end

navPrev:SetScript("OnLeave", function() GameTooltip:Hide() end)
navNext:SetScript("OnLeave", function() GameTooltip:Hide() end)

navPrev:SetScript("OnClick", function()
    if not lastShownTable or not lastShownDungeonIndex or not lastShownBossIndex then return end
    local t, di, bi = lastShownTable, lastShownDungeonIndex, lastShownBossIndex
    if bi > 1 then
        ShowBossInPopup(t[di], t[di].bosses[bi-1], di, bi-1, t)
    end
end)

navNext:SetScript("OnClick", function()
    if not lastShownTable or not lastShownDungeonIndex or not lastShownBossIndex then return end
    local t, di, bi = lastShownTable, lastShownDungeonIndex, lastShownBossIndex
    local dungeon = t[di]
    if bi < #dungeon.bosses then
        ShowBossInPopup(t[di], t[di].bosses[bi+1], di, bi+1, t)
    end
end)

navPrev:Disable()
navNext:Disable()

local popupClose = CreateFrame("Button",nil,popupWindow,"UIPanelCloseButton")
popupClose:SetSize(22,22)
popupClose:SetPoint("TOPRIGHT",popupWindow,"TOPRIGHT",-2,-2)
popupClose:SetScript("OnClick", function() popupWindow:Hide() end)

-- Scroll area
local popupScroll = CreateFrame("ScrollFrame","MPGPopupScroll",popupWindow,"UIPanelScrollFrameTemplate")
popupScroll:SetPoint("TOPLEFT",     popupWindow,"TOPLEFT",   8,-32)
popupScroll:SetPoint("BOTTOMRIGHT", popupWindow,"BOTTOMRIGHT",-28,10)

popupContent = CreateFrame("Frame",nil,popupScroll)
popupContent:SetWidth(popupScroll:GetWidth())
popupContent:SetHeight(1)
popupScroll:SetScrollChild(popupContent)

popupText = popupContent:CreateFontString(nil,"OVERLAY","GameFontNormal")
popupText:SetPoint("TOPLEFT",popupContent,"TOPLEFT",4,-4)
popupText:SetWidth(popupScroll:GetWidth()-10)
popupText:SetJustifyH("LEFT")
popupText:SetJustifyV("TOP")
popupText:SetSpacing(4)
popupText:SetFontObject(popupFontObj)

-- Resize grip
local resizeGrip = CreateFrame("Button",nil,popupWindow)
resizeGrip:SetSize(16,16)
resizeGrip:SetPoint("BOTTOMRIGHT",popupWindow,"BOTTOMRIGHT",-2,2)
resizeGrip:SetNormalTexture("Interface/ChatFrame/UI-ChatIM-SizeGrabber-Up")
resizeGrip:SetHighlightTexture("Interface/ChatFrame/UI-ChatIM-SizeGrabber-Highlight")
resizeGrip:SetPushedTexture("Interface/ChatFrame/UI-ChatIM-SizeGrabber-Down")
resizeGrip:SetScript("OnMouseDown", function() popupWindow:StartSizing("BOTTOMRIGHT") end)
resizeGrip:SetScript("OnMouseUp", function()
    popupWindow:StopMovingOrSizing()
    SetSetting("popupWidth",  math.floor(popupWindow:GetWidth()))
    SetSetting("popupHeight", math.floor(popupWindow:GetHeight()))
    popupText:SetWidth(popupScroll:GetWidth()-10)
    popupContent:SetHeight(popupText:GetStringHeight()+16)
end)

-- ============================================================
--  APPLY FONT SIZE
-- ============================================================

-- Create a named Font object. Updating this object updates every
-- FontString that uses it, regardless of SetText order.
local popupFontObj = CreateFont("MPGPopupFont")
popupFontObj:SetFont("Fonts/FRIZQT__.TTF", 12, "")

local function ApplyFontSize()
    local size = GetSetting("fontSize")
    local face = GetSetting("fontFace")
    popupFontObj:SetFont(face or "Fonts/FRIZQT__.TTF", size, "")
    if popupText then
        popupText:SetFontObject(popupFontObj)
    end
end

-- ============================================================
--  OUTPUT: CHAT OR POPUP
-- ============================================================

ShowBossInPopup = function(dungeon, boss, dungeonIdx, bossIdx, sourceTable)
    lastShownDungeon      = dungeon
    lastShownBoss         = boss
    lastShownDungeonIndex = dungeonIdx
    lastShownBossIndex    = bossIdx
    lastShownTable        = sourceTable or dungeons
    local lines = BuildBossLines(dungeon, boss)
    popupText:SetText(table.concat(lines,"\n"))
    ApplyFontSize()  -- must be AFTER SetText or WoW resets the font
    popupContent:SetHeight(popupText:GetStringHeight()+16)
    popupWindow:Show()
    popupWindow:Raise()
    if UpdateNavArrows then UpdateNavArrows() end
end

local function PrintBossToChat(dungeon, boss)
    local tc = TitleColorCode()
    local role = GetRoleSetting()
    print(" ")
    print(tc.."=== "..ADDON_NAME.." ==="..COLOR.RESET)
    print(COLOR.DUNGEON.."["..dungeon.name.."]"..COLOR.RESET
          .."  "..COLOR.BOSS..boss.name..COLOR.RESET)
    if boss.tldr and #boss.tldr > 0 then
        print(tc..">> TL;DR"..COLOR.RESET)
        for i, line in ipairs(boss.tldr) do print("  "..FormatTldrLine(i,line)) end
    end
    local rolesToShow = {}
    if role == "all" then rolesToShow = {"tank","healer","dps"}
    elseif role == "tank" or role == "healer" or role == "dps" then rolesToShow = {role} end
    for _, r in ipairs(rolesToShow) do
        local section = boss[r]
        if section and #section > 0 then
            print(ROLE_COLORS[r]..">> "..ROLE_LABELS[r]..COLOR.RESET)
            for i, line in ipairs(section) do print("  "..FormatTldrLine(i,line)) end
        end
    end
    print(" ")
end

local function ShowBossGuide(dungeon, boss, dungeonIdx, bossIdx, sourceTable)
    if GetSetting("outputMode") == "window" then
        ShowBossInPopup(dungeon, boss, dungeonIdx, bossIdx, sourceTable)
    else
        PrintBossToChat(dungeon, boss)
    end
end

-- ============================================================
--  MAIN BAR FRAME
-- ============================================================

local frame = CreateFrame("Frame","MPGFrame",UIParent,"BackdropTemplate")
frame:SetSize(GetSetting("barWidth"), 36)
frame:SetPoint("CENTER",UIParent,"CENTER",0,300)
frame:SetMovable(true)
frame:SetClampedToScreen(true)

local function ApplyBarAppearance()
    local bg = GetSetting("bgColor")
    local alpha = GetSetting("barAlpha")
    local backdrop = {
        bgFile="Interface/Tooltips/UI-Tooltip-Background",
        tile=true,tileSize=16,edgeSize=0,
        insets={left=4,right=4,top=4,bottom=4},
    }
    -- Main bar
    frame:SetBackdrop(backdrop)
    frame:SetBackdropColor(bg.r, bg.g, bg.b, alpha)
    frame:SetWidth(GetSetting("barWidth"))
    -- Popup window (only if it exists yet)
    if popupWindow then
        popupWindow:SetBackdrop(backdrop)
        popupWindow:SetBackdropColor(bg.r, bg.g, bg.b, alpha)
        if popupTitleBar then
            popupTitleBar:SetBackdropColor(
                math.min(bg.r + 0.05, 1),
                math.min(bg.g + 0.03, 1),
                math.min(bg.b + 0.10, 1),
                alpha)
        end
    end
end

-- Draggable title button (left side, leaves room for gear icon)
local titleBtn = CreateFrame("Button",nil,frame)
titleBtn:SetPoint("TOPLEFT",    frame,"TOPLEFT",  0, 0)
titleBtn:SetPoint("BOTTOMRIGHT",frame,"BOTTOMRIGHT",-30, 0)
titleBtn:RegisterForDrag("LeftButton")

local titleText = frame:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
titleText:SetPoint("LEFT", titleBtn,"LEFT", 6, 0)
titleText:SetPoint("RIGHT",titleBtn,"RIGHT",-6, 0)
titleText:SetJustifyH("CENTER")
titleText:SetWordWrap(false)
titleText:SetNonSpaceWrap(false)

local function RefreshTitleText()
    titleText:SetText(TitleColorCode().."TL;DR Dungeon Guide"..COLOR.RESET)
end

local isDragging = false
titleBtn:SetScript("OnDragStart", function()
    isDragging = true
    frame:StartMoving()
end)
titleBtn:SetScript("OnDragStop", function()
    frame:StopMovingOrSizing()
    C_Timer.After(0.05, function() isDragging = false end)
end)
titleBtn:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self,"ANCHOR_BOTTOM")
    GameTooltip:SetText("TL;DR Dungeon Guide",1,0.84,0)
    GameTooltip:AddLine("Left-click: Season 1 Dungeons",0.8,0.8,0.8)
    GameTooltip:AddLine("Right-click: Preseason Dungeons",0.8,0.8,0.8)
    GameTooltip:Show()
end)
titleBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

-- Gear / options button (right side of bar)
local optionsBtn = CreateFrame("Button",nil,frame)
optionsBtn:SetSize(18,18)
optionsBtn:SetPoint("RIGHT",frame,"RIGHT",-3,0)
optionsBtn:SetNormalTexture("Interface/Buttons/UI-OptionsButton")
optionsBtn:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square","ADD")
optionsBtn:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self,"ANCHOR_TOP")
    GameTooltip:SetText("Options",1,1,1)
    GameTooltip:Show()
end)
optionsBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

-- ============================================================
--  OPTIONS PANEL
-- ============================================================

local optPanel = CreateFrame("Frame","MPGOptionsPanel",UIParent,"BackdropTemplate")
optPanel:SetSize(330,924)
optPanel:SetPoint("CENTER",UIParent,"CENTER",0,0)
optPanel:SetMovable(true)
optPanel:SetClampedToScreen(true)
optPanel:EnableMouse(true)
optPanel:RegisterForDrag("LeftButton")
optPanel:SetScript("OnDragStart", optPanel.StartMoving)
optPanel:SetScript("OnDragStop",  optPanel.StopMovingOrSizing)
optPanel:SetBackdrop({
    bgFile="Interface/Tooltips/UI-Tooltip-Background",
    tile=true,tileSize=16,edgeSize=0,
    insets={left=5,right=5,top=5,bottom=5},
})
optPanel:SetBackdropColor(0.05,0.05,0.12,0.98)
optPanel:Hide()

-- Panel title
local optTitle = optPanel:CreateFontString(nil,"OVERLAY","GameFontNormalLarge")
optTitle:SetPoint("TOP",optPanel,"TOP",0,-14)
optTitle:SetText(COLOR.TITLE.."TL;DR Guide - Options"..COLOR.RESET)

-- Close X
local optClose = CreateFrame("Button",nil,optPanel,"UIPanelCloseButton")
optClose:SetSize(22,22)
optClose:SetPoint("TOPRIGHT",optPanel,"TOPRIGHT",-2,-2)
optClose:SetScript("OnClick", function() optPanel:Hide() end)

-- ── Helpers ──────────────────────────────────────────────────

local function SectionLabel(yOff, text)
    local lbl = optPanel:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
    lbl:SetPoint("TOPLEFT",optPanel,"TOPLEFT",16,yOff)
    lbl:SetText(COLOR.DUNGEON..text..COLOR.RESET)
    return lbl
end

local function HRule(yOff)
    local r = optPanel:CreateTexture(nil,"ARTWORK")
    r:SetHeight(1)
    r:SetPoint("TOPLEFT",  optPanel,"TOPLEFT",  14,yOff)
    r:SetPoint("TOPRIGHT", optPanel,"TOPRIGHT",-14,yOff)
    r:SetColorTexture(0.4,0.4,0.4,0.5)
end

local function ValueLabel(yOff, text)
    local lbl = optPanel:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
    lbl:SetPoint("TOPRIGHT",optPanel,"TOPRIGHT",-16,yOff)
    lbl:SetText(text)
    return lbl
end

local function MakeSlider(name, yOff, min, max, step, curVal, lowTxt, highTxt)
    local s = CreateFrame("Slider","MPG"..name.."Slider",optPanel,"OptionsSliderTemplate")
    s:SetSize(282,16)
    s:SetPoint("TOPLEFT",optPanel,"TOPLEFT",16,yOff)
    s:SetMinMaxValues(min,max)
    s:SetValueStep(step)
    s:SetValue(curVal)
    _G[s:GetName().."Low"]:SetText(lowTxt)
    _G[s:GetName().."High"]:SetText(highTxt)
    _G[s:GetName().."Text"]:SetText("")
    return s
end

-- ── OUTPUT MODE ───────────────────────────────────────────────
SectionLabel(-46, "Output Mode")

local chatRadio = CreateFrame("CheckButton",nil,optPanel,"UIRadioButtonTemplate")
chatRadio:SetSize(20,20)
chatRadio:SetPoint("TOPLEFT",optPanel,"TOPLEFT",18,-64)
local chatLbl = optPanel:CreateFontString(nil,"OVERLAY","GameFontNormal")
chatLbl:SetPoint("LEFT",chatRadio,"RIGHT",4,0)
chatLbl:SetText("Print to Chat")

local winRadio = CreateFrame("CheckButton",nil,optPanel,"UIRadioButtonTemplate")
winRadio:SetSize(20,20)
winRadio:SetPoint("TOPLEFT",optPanel,"TOPLEFT",170,-64)
local winLbl = optPanel:CreateFontString(nil,"OVERLAY","GameFontNormal")
winLbl:SetPoint("LEFT",winRadio,"RIGHT",4,0)
winLbl:SetText("Popup Window")

local function RefreshRadios()
    local m = GetSetting("outputMode")
    chatRadio:SetChecked(m=="chat")
    winRadio:SetChecked(m=="window")
end
chatRadio:SetScript("OnClick", function() SetSetting("outputMode","chat");   RefreshRadios() end)
winRadio:SetScript("OnClick",  function() SetSetting("outputMode","window"); RefreshRadios() end)

HRule(-88)

-- ── BAR VISIBILITY ────────────────────────────────────────────
SectionLabel(-96, "Bar Visibility")

local visOptions = {
    { key="always",  label="Always Show" },
    { key="dungeon", label="Dungeons Only" },
    { key="hidden",  label="Always Hide" },
}
local visRadios = {}

local function ApplyBarVisibility()
    local v = GetSetting("barVisibility")
    if v == "hidden" then
        frame:Hide()
    elseif v == "dungeon" then
        local inInstance, instanceType = IsInInstance()
        if inInstance and (instanceType == "party" or instanceType == "raid") then
            frame:Show()
        else
            frame:Hide()
        end
    else -- "always"
        frame:Show()
    end
end

local function RefreshVisRadios()
    local cur = GetSetting("barVisibility")
    for _, vr in ipairs(visRadios) do
        vr.radio:SetChecked(vr.key == cur)
    end
end

for i, vo in ipairs(visOptions) do
    local radio = CreateFrame("CheckButton",nil,optPanel,"UIRadioButtonTemplate")
    radio:SetSize(20,20)
    radio:SetPoint("TOPLEFT",optPanel,"TOPLEFT",14,-112-(i-1)*22)
    local lbl = optPanel:CreateFontString(nil,"OVERLAY","GameFontNormal")
    lbl:SetPoint("LEFT",radio,"RIGHT",2,0)
    lbl:SetText(vo.label)
    radio:SetScript("OnClick", function()
        SetSetting("barVisibility", vo.key)
        RefreshVisRadios()
        ApplyBarVisibility()
    end)
    visRadios[i] = {radio=radio, key=vo.key}
end
RefreshVisRadios()

HRule(-180)

-- ── GUIDE DENSITY ─────────────────────────────────────────────
SectionLabel(-188, "Guide Density")

local densityOptions = {
    { key="normal", label="Normal — Full detail" },
    { key="brief",  label="Brief — Key points only" },
}
local densityRadios = {}

local function RefreshDensityRadios()
    local cur = GetSetting("density")
    for _, dr in ipairs(densityRadios) do
        dr.radio:SetChecked(dr.key == cur)
    end
end

for i, do_ in ipairs(densityOptions) do
    local radio = CreateFrame("CheckButton",nil,optPanel,"UIRadioButtonTemplate")
    radio:SetSize(20,20)
    radio:SetPoint("TOPLEFT",optPanel,"TOPLEFT",14,-206-(i-1)*22)
    local lbl = optPanel:CreateFontString(nil,"OVERLAY","GameFontNormal")
    lbl:SetPoint("LEFT",radio,"RIGHT",2,0)
    lbl:SetText(do_.label)
    radio:SetScript("OnClick", function()
        SetSetting("density", do_.key)
        RefreshDensityRadios()
        RefreshPopupIfOpen()
    end)
    densityRadios[i] = {radio=radio, key=do_.key}
end
RefreshDensityRadios()

HRule(-254)

-- ── BAR WIDTH ─────────────────────────────────────────────────
SectionLabel(-262, "Bar Width")
local bwLbl = ValueLabel(-262, GetSetting("barWidth").." px")
local bwSlider = MakeSlider("BarWidth",-280, 160,400,10, GetSetting("barWidth"), "160","400")
bwSlider:SetScript("OnValueChanged", function(self,val)
    val = math.floor(val/10+0.5)*10
    SetSetting("barWidth",val)
    bwLbl:SetText(val.." px")
    frame:SetWidth(val)
end)

HRule(-300)

-- ── BAR TRANSPARENCY ──────────────────────────────────────────
SectionLabel(-308, "Bar Transparency")
local alphaLbl = ValueLabel(-308, math.floor(GetSetting("barAlpha")*100).."%")
local alphaSlider = MakeSlider("Alpha",-326, 10,100,5, math.floor(GetSetting("barAlpha")*100), "10%","100%")
alphaSlider:SetScript("OnValueChanged", function(self,val)
    val = math.floor(val/5+0.5)*5
    SetSetting("barAlpha", val/100)
    alphaLbl:SetText(val.."%")
    ApplyBarAppearance()
end)

HRule(-346)

-- ── FONT SIZE ─────────────────────────────────────────────────
SectionLabel(-354, "Popup Font Size")
local fontLbl = ValueLabel(-354, GetSetting("fontSize").."pt")
local fontSlider = MakeSlider("Font",-372, 9,20,1, GetSetting("fontSize"), "9pt","20pt")
fontSlider:SetScript("OnValueChanged", function(self,val)
    val = math.floor(val+0.5)
    SetSetting("fontSize",val)
    fontLbl:SetText(val.."pt")
    ApplyFontSize()
end)

HRule(-392)

-- ── TITLE COLOR SWATCHES ──────────────────────────────────────
SectionLabel(-400, "Title / Heading Color")

local titlePresets = {
    {name="Gold",   r=1.00,g=0.84,b=0.00},
    {name="Cyan",   r=0.00,g=0.80,b=1.00},
    {name="Green",  r=0.20,g=1.00,b=0.40},
    {name="Purple", r=0.80,g=0.40,b=1.00},
    {name="White",  r=1.00,g=1.00,b=1.00},
    {name="Orange", r=1.00,g=0.55,b=0.00},
    {name="Pink",   r=1.00,g=0.40,b=0.70},
}

local titleSwatches = {}
for i, p in ipairs(titlePresets) do
    local sw = CreateFrame("Button",nil,optPanel)
    sw:SetSize(32,22)
    sw:SetPoint("TOPLEFT",optPanel,"TOPLEFT",14+(i-1)*43,-418)
    local bg = sw:CreateTexture(nil,"BACKGROUND")
    bg:SetAllPoints(); bg:SetColorTexture(p.r,p.g,p.b,1)
    local hl = sw:CreateTexture(nil,"OVERLAY")
    hl:SetAllPoints(); hl:SetColorTexture(1,1,1,0)
    titleSwatches[i] = {btn=sw, hl=hl}
    sw:SetScript("OnClick", function()
        SetSetting("titleColor",{r=p.r,g=p.g,b=p.b})
        RefreshTitleText()
        for j,s in ipairs(titleSwatches) do
            s.hl:SetColorTexture(1,1,1, j==i and 0.7 or 0)
        end
    end)
    sw:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self,"ANCHOR_TOP")
        GameTooltip:SetText(p.name,p.r,p.g,p.b); GameTooltip:Show()
    end)
    sw:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

HRule(-448)

-- ── BACKGROUND COLOR SWATCHES ─────────────────────────────────
SectionLabel(-456, "Bar Background Color")

local bgPresets = {
    {name="Dark Navy",  r=0.05,g=0.05,b=0.15},
    {name="Dark Green", r=0.03,g=0.12,b=0.05},
    {name="Dark Red",   r=0.15,g=0.03,b=0.03},
    {name="Dark Purple",r=0.10,g=0.03,b=0.15},
    {name="Black",      r=0.02,g=0.02,b=0.02},
    {name="Charcoal",   r=0.15,g=0.15,b=0.15},
    {name="Dark Teal",  r=0.03,g=0.12,b=0.12},
}

for i, p in ipairs(bgPresets) do
    local sw = CreateFrame("Button",nil,optPanel)
    sw:SetSize(32,22)
    sw:SetPoint("TOPLEFT",optPanel,"TOPLEFT",14+(i-1)*43,-474)
    local bg = sw:CreateTexture(nil,"BACKGROUND")
    bg:SetAllPoints(); bg:SetColorTexture(p.r,p.g,p.b,1)
    -- White border so dark colors are visible
    local border = sw:CreateTexture(nil,"OVERLAY")
    border:SetAllPoints(); border:SetColorTexture(1,1,1,0.15)
    sw:SetScript("OnClick", function()
        SetSetting("bgColor",{r=p.r,g=p.g,b=p.b})
        ApplyBarAppearance()
    end)
    sw:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self,"ANCHOR_TOP")
        GameTooltip:SetText(p.name,1,1,1); GameTooltip:Show()
    end)
    sw:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

-- ── ROLE FILTER ───────────────────────────────────────────────
SectionLabel(-512, "My Role (filters guide content)")

local roleOptions = {
    {key="all",    label="All Roles"},
    {key="tank",   label="Tank",   color=ROLE_COLORS and ROLE_COLORS.tank   or "|cFF4FC3F7"},
    {key="healer", label="Healer", color=ROLE_COLORS and ROLE_COLORS.healer or "|cFF81C784"},
    {key="dps",    label="DPS",    color=ROLE_COLORS and ROLE_COLORS.dps    or "|cFFEF9A9A"},
}

local roleRadios = {}
local function RefreshRoleRadios()
    local cur = GetRoleSetting()
    for _, rb in ipairs(roleRadios) do
        rb.radio:SetChecked(rb.key == cur)
    end
end

for i, ro in ipairs(roleOptions) do
    local xOff = 14 + (i-1)*74
    local radio = CreateFrame("CheckButton",nil,optPanel,"UIRadioButtonTemplate")
    radio:SetSize(20,20)
    radio:SetPoint("TOPLEFT",optPanel,"TOPLEFT",xOff,-530)
    local lbl = optPanel:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
    lbl:SetPoint("LEFT",radio,"RIGHT",2,0)
    local displayLabel = ro.label
    if ro.color then displayLabel = ro.color..ro.label..COLOR.RESET end
    lbl:SetText(displayLabel)
    radio:SetScript("OnClick", function()
        SetSetting("role", ro.key)
        RefreshRoleRadios()
        RefreshPopupIfOpen()
    end)
    roleRadios[i] = {radio=radio, key=ro.key}
end
RefreshRoleRadios()

HRule(-556)

-- ── FONT PICKER ───────────────────────────────────────────────
SectionLabel(-564, "Popup Font")

-- Probe common addon locations for Expressway.ttf
local function FindExpresswayFont()
    -- First: ask LibSharedMedia directly — most reliable since it knows exact paths
    local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
    if LSM then
        -- Try common name variations registered in LSM
        local names = { "Expressway", "expressway", "Expressway MonoNum" }
        for _, n in ipairs(names) do
            local path = LSM:Fetch("font", n)
            if path then return path end
        end
        -- Scan all LSM fonts for anything with "expressway" in the name
        local list = LSM:List("font")
        if list then
            for _, name in ipairs(list) do
                if name:lower():find("expressway") then
                    local path = LSM:Fetch("font", name)
                    if path then return path end
                end
            end
        end
    end
    -- Second: check ElvUI's internal font table directly
    if ElvUI and ElvUI[1] and ElvUI[1].Media and ElvUI[1].Media.Fonts then
        local elvFonts = ElvUI[1].Media.Fonts
        if elvFonts.Expressway then
            -- ElvUI uses backslashes, normalise to forward slashes
            return elvFonts.Expressway:gsub("\\", "/")
        end
    end

    -- Fallback: probe known file locations directly
    local candidates = {
        "Interface/AddOns/TLDRDungeonGuide/Fonts/Expressway.ttf",
        "Interface/AddOns/ElvUI/Game/Shared/Media/Fonts/Expressway.ttf",
        "Interface/AddOns/ElvUI/Core/Media/Fonts/Expressway.ttf",
        "Interface/AddOns/ElvUI_MerathilisUI/Core/Media/Fonts/Expressway.ttf",
        "Interface/AddOns/ElvUI_BenikUI/Media/Fonts/Expressway.ttf",
        "Interface/AddOns/SharedMedia/fonts/Expressway.ttf",
        "Interface/AddOns/SharedMedia/Fonts/Expressway.ttf",
        "Interface/AddOns/LSMedia/Fonts/Expressway.ttf",
        "Interface/AddOns/Details/Fonts/Expressway.ttf",
        "Interface/AddOns/Tukui/Media/Fonts/Expressway.ttf",
        "Interface/AddOns/ShestakUI/Media/Fonts/Expressway.ttf",
        "Interface/AddOns/KkthnxUI/Media/Fonts/Expressway.ttf",
    }
    local tester = UIParent:CreateFontString(nil, "ARTWORK")
    for _, path in ipairs(candidates) do
        tester:SetFont(path, 12, "")
        local found = tester:GetFont()
        if found and found == path then
            tester:Hide()
            return path
        end
    end
    tester:Hide()
    return nil
end

local expresswayPath = nil  -- resolved at PLAYER_LOGIN once all addons are loaded

local fontOptions = {
    { name="Friz Quadrata (Default)", file="Fonts/FRIZQT__.TTF", available=true },
    { name="Arial Narrow",            file="Fonts/ARIALN.TTF",   available=true },
    { name="Nimrod MT",               file="Fonts/NIM_____.ttf", available=true },
    { name="Expressway",              file="",                    available=false },  -- updated at login
}

local fontBtns = {}

local function RefreshFontButtons()
    local cur = GetSetting("fontFace")
    for _, fb in ipairs(fontBtns) do
        if fb.file == cur then
            fb.btn:SetBackdropColor(0.30,0.25,0.05,1)
        else
            fb.btn:SetBackdropColor(0.10,0.10,0.10,1)
        end
    end
end

local function BuildFontButtons()
    for i, fo in ipairs(fontOptions) do
        local available = fo.available
        if not fontBtns[i] then
            -- First call: create the button frame
            local btn = CreateFrame("Button", nil, optPanel, "BackdropTemplate")
            btn:SetSize(290, 20)
            btn:SetPoint("TOPLEFT", optPanel, "TOPLEFT", 14, -580-(i-1)*24)
            btn:SetBackdrop({bgFile="Interface/Tooltips/UI-Tooltip-Background",tile=true,tileSize=8,edgeSize=0})
            btn:SetBackdropColor(0.10,0.10,0.10,1)
            local lbl = btn:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
            lbl:SetPoint("LEFT", btn, "LEFT", 6, 0)
            lbl:SetJustifyH("LEFT")
            fontBtns[i] = {btn=btn, lbl=lbl, file=fo.file}
        end

        -- Always update label and handlers (covers both first build and login rebuild)
        local fb = fontBtns[i]
        fb.file = fo.file
        fb.lbl:SetFont("Fonts/ARIALN.TTF", 11, "")
        if available then
            fb.lbl:SetText(fo.name)
            fb.lbl:SetTextColor(0.9,0.9,0.9,1)
        else
            fb.lbl:SetText(fo.name .. " |cFF666666(not found)|r")
            fb.lbl:SetTextColor(0.5,0.5,0.5,1)
        end
        fb.btn:SetScript("OnClick", function()
            if not available then return end
            SetSetting("fontFace", fo.file)
            RefreshFontButtons()
            ApplyFontSize()
            RefreshPopupIfOpen()
        end)
        fb.btn:SetScript("OnEnter", function(self)
            if available then
                self:SetBackdropColor(0.20,0.18,0.05,1)
            else
                GameTooltip:SetOwner(self,"ANCHOR_TOP")
                GameTooltip:SetText("Expressway not found",1,0.3,0.3)
                GameTooltip:AddLine("To enable: install ElvUI (even disabled),",0.8,0.8,0.8)
                GameTooltip:AddLine("or copy Expressway.ttf from ElvUI into:",0.8,0.8,0.8)
                GameTooltip:AddLine("AddOns/TLDRDungeonGuide/Fonts/",1,1,0.5)
                GameTooltip:AddLine("Then /reload",0.6,0.6,0.6)
                GameTooltip:Show()
            end
        end)
        fb.btn:SetScript("OnLeave", function(self) RefreshFontButtons(); GameTooltip:Hide() end)
    end
    RefreshFontButtons()
end

BuildFontButtons()


-- ── GUIDE TEXT COLORS ────────────────────────────────────────

local textColorPresets = {
    {name="Red",     r=1.00,g=0.30,b=0.30},
    {name="Gold",    r=1.00,g=0.82,b=0.00},
    {name="Orange",  r=1.00,g=0.55,b=0.00},
    {name="Cyan",    r=0.00,g=0.80,b=1.00},
    {name="Green",   r=0.20,g=1.00,b=0.40},
    {name="Purple",  r=0.80,g=0.40,b=1.00},
    {name="White",   r=1.00,g=1.00,b=1.00},
}

local function MakeTextColorRow(labelText, settingKey, yOff)
    SectionLabel(yOff, labelText)
    -- Preview swatch showing current color
    local preview = optPanel:CreateTexture(nil,"ARTWORK")
    preview:SetSize(14,14)
    preview:SetPoint("TOPLEFT",optPanel,"TOPLEFT",154,yOff-3)
    local function RefreshPreview()
        local c = GetSetting(settingKey)
        preview:SetColorTexture(c.r,c.g,c.b,1)
    end
    RefreshPreview()

    for i, p in ipairs(textColorPresets) do
        local sw = CreateFrame("Button",nil,optPanel)
        sw:SetSize(32,20)
        sw:SetPoint("TOPLEFT",optPanel,"TOPLEFT",14+(i-1)*43, yOff-18)
        local bg = sw:CreateTexture(nil,"BACKGROUND")
        bg:SetAllPoints(); bg:SetColorTexture(p.r,p.g,p.b,1)
        local hl = sw:CreateTexture(nil,"OVERLAY")
        hl:SetAllPoints(); hl:SetColorTexture(1,1,1,0.15)
        sw:SetScript("OnClick", function()
            SetSetting(settingKey,{r=p.r,g=p.g,b=p.b})
            RefreshPreview()
            RefreshPopupIfOpen()
        end)
        sw:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self,"ANCHOR_TOP")
            GameTooltip:SetText(p.name,p.r,p.g,p.b); GameTooltip:Show()
        end)
        sw:SetScript("OnLeave", function() GameTooltip:Hide() end)
    end
end

HRule(-724)
MakeTextColorRow("Number Color",  "numColor",  -732)
HRule(-764)
MakeTextColorRow("Ability Color", "abilColor", -772)
HRule(-804)
MakeTextColorRow("Info Text Color","infoColor", -812)
HRule(-844)

-- ── BUTTONS ─────────────────────────────────────────────────
-- Three buttons in a row: [Reset to Defaults] [Reset Position] [Done]
local resetBtn = CreateFrame("Button",nil,optPanel,"UIPanelButtonTemplate")
resetBtn:SetSize(130,26)
resetBtn:SetPoint("BOTTOMLEFT",optPanel,"BOTTOMLEFT",10,14)
resetBtn:SetText("Reset to Defaults")
resetBtn:SetScript("OnClick", function()
    for k in pairs(defaults) do MPG_Settings[k] = nil end
    bwSlider:SetValue(defaults.barWidth)
    alphaSlider:SetValue(math.floor(defaults.barAlpha*100))
    fontSlider:SetValue(defaults.fontSize)
    SetSetting("titleColor",    defaults.titleColor)
    SetSetting("bgColor",       defaults.bgColor)
    SetSetting("outputMode",    defaults.outputMode)
    SetSetting("fontFace",      defaults.fontFace)
    SetSetting("numColor",      defaults.numColor)
    SetSetting("abilColor",     defaults.abilColor)
    SetSetting("infoColor",     defaults.infoColor)
    SetSetting("role",          defaults.role)
    SetSetting("barVisibility", defaults.barVisibility)
    SetSetting("density",       defaults.density)
    ApplyBarAppearance()
    RefreshTitleText()
    RefreshRadios()
    RefreshRoleRadios()
    RefreshVisRadios()
    RefreshDensityRadios()
    ApplyBarVisibility()
    ApplyFontSize()
    RefreshFontButtons()
    RefreshPopupIfOpen()
    print(COLOR.TITLE.."[TL;DR Guide]"..COLOR.RESET.." Settings reset to defaults.")
end)

-- Reset Position: snaps bar and popup back to safe on-screen positions and
-- resets saved popup size — solves "popup went off-screen" situations.
local resetPosBtn = CreateFrame("Button",nil,optPanel,"UIPanelButtonTemplate")
resetPosBtn:SetSize(100,26)
resetPosBtn:SetPoint("BOTTOMRIGHT",optPanel,"BOTTOMRIGHT",-86,14)
resetPosBtn:SetText("Reset Position")
resetPosBtn:SetScript("OnClick", function()
    -- Bar: back to top-center
    frame:ClearAllPoints()
    frame:SetPoint("TOP", UIParent, "TOP", 0, -100)
    -- Popup: back to center, default size
    popupWindow:ClearAllPoints()
    popupWindow:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    popupWindow:SetSize(defaults.popupWidth, defaults.popupHeight)
    SetSetting("popupWidth",  defaults.popupWidth)
    SetSetting("popupHeight", defaults.popupHeight)
    popupText:SetWidth(popupWindow:GetWidth() - 38)
    if lastShownDungeon and lastShownBoss then
        popupContent:SetHeight(popupText:GetStringHeight()+16)
    end
    print(COLOR.TITLE.."[TL;DR Guide]"..COLOR.RESET.." Positions reset.")
end)

local doneBtn = CreateFrame("Button",nil,optPanel,"UIPanelButtonTemplate")
doneBtn:SetSize(70,26)
doneBtn:SetPoint("BOTTOMRIGHT",optPanel,"BOTTOMRIGHT",-10,14)
doneBtn:SetText("Done")
doneBtn:SetScript("OnClick", function() optPanel:Hide() end)

-- Wire up gear button
optionsBtn:SetScript("OnClick", function()
    if optPanel:IsShown() then optPanel:Hide()
    else optPanel:Show(); optPanel:Raise() end
end)

-- ============================================================
--  DUNGEON DROPDOWN
-- ============================================================

local dungeonMenu = CreateFrame("Frame","MPGDungeonMenu",UIParent,"UIDropDownMenuTemplate")
local preseasonMenu = CreateFrame("Frame","MPGPreseasonMenu",UIParent,"UIDropDownMenuTemplate")

local function BuildBossSubmenu(sourceTable, isPreseason, level, menuList)
    local dungeon = sourceTable[menuList]
    if not dungeon then return end
    local hdr = UIDropDownMenu_CreateInfo()
    hdr.text=dungeon.name.." Bosses"; hdr.isTitle=true; hdr.notCheckable=true
    UIDropDownMenu_AddButton(hdr,level)
    for bi, boss in ipairs(dungeon.bosses) do
        local info = UIDropDownMenu_CreateInfo()
        info.text=boss.name; info.notCheckable=true
        -- Pack dungeonIdx, bossIdx, and which table into arg1/arg2
        -- arg1 = dungeonIdx * 100 + bossIdx (max 99 bosses per dungeon, safe)
        -- arg2 = 1 if preseason, 0 if season1
        info.arg1 = menuList * 100 + bi
        info.arg2 = isPreseason and 1 or 0
        info.func = function(_, packed, tableFlag)
            CloseDropDownMenus()
            local di = math.floor(packed / 100)
            local bossIdx = packed % 100
            local src = (tableFlag == 1) and preseasonDungeons or dungeons
            ShowBossGuide(src[di], src[di].bosses[bossIdx], di, bossIdx, src)
        end
        UIDropDownMenu_AddButton(info,level)
    end
end

local function OpenDungeonMenu()
    UIDropDownMenu_Initialize(dungeonMenu, function(self, level, menuList)
        if level == 1 then
            local hdr = UIDropDownMenu_CreateInfo()
            hdr.text="Season 1 Dungeons"; hdr.isTitle=true; hdr.notCheckable=true
            UIDropDownMenu_AddButton(hdr,level)

            for di, dungeon in ipairs(dungeons) do
                local info = UIDropDownMenu_CreateInfo()
                info.text=dungeon.name; info.notCheckable=true
                info.hasArrow=true; info.menuList=di
                UIDropDownMenu_AddButton(info,level)
            end

            local sep = UIDropDownMenu_CreateInfo()
            sep.text=""; sep.disabled=true; sep.notCheckable=true
            UIDropDownMenu_AddButton(sep,level)

            local opts = UIDropDownMenu_CreateInfo()
            opts.text="[Options]"; opts.notCheckable=true
            opts.func=function()
                CloseDropDownMenus()
                if optPanel:IsShown() then optPanel:Hide()
                else optPanel:Show(); optPanel:Raise() end
            end
            UIDropDownMenu_AddButton(opts,level)

            local close = UIDropDownMenu_CreateInfo()
            close.text="Close"; close.notCheckable=true
            close.func=function() CloseDropDownMenus() end
            UIDropDownMenu_AddButton(close,level)

        elseif level == 2 then
            BuildBossSubmenu(dungeons, false, level, menuList)
        end
    end, "MENU")
    ToggleDropDownMenu(1,nil,dungeonMenu,frame,0,-4)
end

local function OpenPreseasonMenu()
    UIDropDownMenu_Initialize(preseasonMenu, function(self, level, menuList)
        if level == 1 then
            local hdr = UIDropDownMenu_CreateInfo()
            hdr.text="Preseason Dungeons"; hdr.isTitle=true; hdr.notCheckable=true
            UIDropDownMenu_AddButton(hdr,level)

            for di, dungeon in ipairs(preseasonDungeons) do
                local info = UIDropDownMenu_CreateInfo()
                info.text=dungeon.name; info.notCheckable=true
                info.hasArrow=true; info.menuList=di
                UIDropDownMenu_AddButton(info,level)
            end

            local sep = UIDropDownMenu_CreateInfo()
            sep.text=""; sep.disabled=true; sep.notCheckable=true
            UIDropDownMenu_AddButton(sep,level)

            local close = UIDropDownMenu_CreateInfo()
            close.text="Close"; close.notCheckable=true
            close.func=function() CloseDropDownMenus() end
            UIDropDownMenu_AddButton(close,level)

        elseif level == 2 then
            BuildBossSubmenu(preseasonDungeons, true, level, menuList)
        end
    end, "MENU")
    ToggleDropDownMenu(1,nil,preseasonMenu,frame,0,-4)
end

titleBtn:RegisterForClicks("LeftButtonUp","RightButtonUp")
titleBtn:SetScript("OnClick", function(self, btn)
    if isDragging then return end
    if btn == "RightButton" then
        OpenPreseasonMenu()
    else
        OpenDungeonMenu()
    end
end)

-- ============================================================
--  SLASH COMMANDS
-- ============================================================

SLASH_TLDR1 = "/tldr"
SlashCmdList["TLDR"] = function(msg)
    msg = string.lower(string.trim(msg or ""))
    if     msg=="hide"              then SetSetting("barVisibility","hidden"); RefreshVisRadios(); frame:Hide(); print(COLOR.TITLE.."[TL;DR Guide]"..COLOR.RESET.." Hidden. /tldr show to restore.")
    elseif msg=="show"              then SetSetting("barVisibility","always"); RefreshVisRadios(); frame:Show()
    elseif msg=="options" or msg=="opt" then optPanel:Show(); optPanel:Raise()
    elseif msg==""                  then OpenDungeonMenu()
    else print(COLOR.TITLE.."[TL;DR Guide]"..COLOR.RESET.." Commands: /tldr | /tldr hide | /tldr show | /tldr options")
    end
end

-- ============================================================
--  LOGIN + ZONE CHANGE — apply saved settings and visibility
-- ============================================================

local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
initFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
initFrame:SetScript("OnEvent", function(self, event)
    ApplyBarAppearance()
    RefreshTitleText()
    ApplyFontSize()
    RefreshRadios()
    RefreshVisRadios()
    RefreshDensityRadios()
    ApplyBarVisibility()
    if event == "PLAYER_LOGIN" then
        -- Detect Expressway now that all addons (ElvUI, SharedMedia etc) are fully loaded
        expresswayPath = FindExpresswayFont()
        if expresswayPath then
            fontOptions[4].file      = expresswayPath
            fontOptions[4].available = true
        end
        BuildFontButtons()  -- rebuild with correct Expressway state
        print(COLOR.TITLE.."[TL;DR Guide]"..COLOR.RESET
              .." Midnight S1 loaded!  Click the bar to browse  |  Gear icon for options  |  /tldr")
    end
end)
