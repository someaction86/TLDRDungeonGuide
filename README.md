TL;DR Dungeon Guide
Version 1.3.1 — WoW: Midnight Season 1
A compact, in-game boss guide for all Midnight dungeons. Get the essential mechanics for every boss broken down by role — no fluff, no walls of text.
---
Installation
Download the `TLDRDungeonGuide` folder
Place it in: `World of Warcraft/_retail_/Interface/AddOns/`
Restart the game or use `/reload`
The guide bar appears on your screen automatically
---
What It Does
TL;DR Dungeon Guide displays a small draggable bar on your screen. Left-clicking opens a dropdown for Season 1 Mythic+ dungeons. Right-clicking opens Preseason dungeons. Selecting any boss shows a concise guide broken into four sections:
TL;DR — Everyone needs to know this regardless of role
Tank — What the tank specifically needs to do
Healer — Healer-specific priorities and cooldown windows
DPS — DPS-specific positioning, targets, and responsibilities
You can filter the guide to show only your role's section using the My Role setting in Options — perfect for a quick pre-pull refresher without scrolling through info that doesn't apply to you.
---
Dungeons Covered
Season 1 Mythic+ (Left-click)
Dungeon	Bosses
Algeth'ar Academy	Vexamus, Overgrown Ancient, Crawth, Echo of Doragosa
Magister's Terrace	Arcanotron Custos, Seranel Sunlash, Gemellus, Degentrius
Maisara Caverns	Muro'jin & Nekraxx, Vordaza, Rak'tul, Vessel of Souls
Nexus Point Xenas	Chief Corewright Kasreth, Corewarden Nysarra, Lothraxion
Pit of Saron	Forgemaster Garfrost, Ick & Krick, Scourgelord Tyrannus
Skyreach	Ranjit, Araknath, Rukhran, High Sage Viryx
Seat of the Triumvirate	Zuraal, Saprish, Viceroy Nezhar, L'ura
Windrunner Spire	Emberdawn, Derelict Duo, Commander Kroluk, The Restless Heart
Preseason Dungeons (Right-click)
Dungeon	Bosses
Den of Nalorakk	The Hoardmonger, Sentinel of Winter, Nalorakk
Murder Row	Kystia Manaheart, Zaen Bladesorrow, Xathuux, Lithiel Cinderfury
The Blinding Vale	Lightblossom Trinity, Ikuzz, Lightwarden Ruia, Ziekket
Voidscar Arena	Taz'Rah, Atroxus, Charonus
> **Note:** Preseason dungeons are the 4 Midnight-original dungeons not in the Season 1 M+ rotation. The 4 legacy/revisited dungeons (Windrunner Spire, Magister's Terrace, Maisara Caverns, Nexus Point Xenas) appear in Season 1 only — access them via left-click.
---
Usage
Action	Result
Left-click bar	Opens Season 1 dungeon menu
Right-click bar	Opens Preseason dungeon menu
Drag bar title	Moves the bar
Gear icon	Opens Options panel
`/tldr`	Opens Season 1 dungeon menu
`/tldr hide`	Hides the bar (sets visibility to Always Hide)
`/tldr show`	Restores the bar (sets visibility to Always Show)
`/tldr options`	Opens Options panel
---
Options Panel
Click the gear icon (⚙) on the right side of the bar to open settings.
Output Mode
Choose whether boss guides are printed to your chat window or displayed in a resizable popup window. The popup can be dragged anywhere on screen and resized by dragging the bottom-right corner.
Bar Visibility
Control when the guide bar is shown:
Always Show — Bar is visible at all times (default)
Dungeons Only — Bar automatically hides in the open world and reappears whenever you enter an instanced dungeon or raid. Reacts to every zone transition.
Always Hide — Bar stays hidden until changed here or via `/tldr show`
My Role
Filter guide content to only show sections relevant to your role:
All Roles — Shows TL;DR + Tank + Healer + DPS sections
Tank — Shows TL;DR + Tank section only
Healer — Shows TL;DR + Healer section only
DPS — Shows TL;DR + DPS section only
Changing your role instantly refreshes any open guide window.
Bar Width
Adjust the width of the main bar from 160px to 400px.
Bar Transparency
Control how transparent the bar and popup window background appear (10%–100%).
Popup Font Size
Adjust the text size inside the popup guide window (9pt–20pt).
Title / Heading Color
Seven color swatches for the heading and title color used in the guide output.
Bar Background Color
Seven dark color options for the bar and popup window background.
Popup Font
Four font options for the popup guide window:
Friz Quadrata — Classic WoW default font
Arial Narrow — Clean, compact, easy to read
Nimrod MT — Elegant readable serif, distinct from Friz Quadrata
Expressway — Clean modern font. Automatically detected if you have ElvUI, Details!, SharedMedia, or any other addon that ships it installed. If not found the button shows greyed out with a tooltip explaining where to place the file.
Text Colors
Three independent color pickers for guide text:
Number Color — The `1.` `2.` `3.` bullet numbers
Ability Color — Ability names (e.g., `>> DARK RIFT:`)
Info Color — The description text after the ability name
All color changes apply live to any open guide window.
Reset to Defaults
Resets all settings including colors, font, role filter, visibility mode, and output mode back to defaults.
---
Tips
Role filter is the most useful setting — set it to your role before a run and you only see what's relevant to you
Dungeons Only visibility is great if you want the bar out of the way while questing but ready the moment you zone in
Popup window mode is recommended — it stays on screen while you play, doesn't flood your chat, and you can scroll back up if needed
Hover over the bar to see a tooltip reminding you that left = Season 1, right = Preseason
Dragging: click and hold the title text area to drag. The gear icon is a separate button — clicking that opens options instead
---
Slash Commands
```
/tldr              Open Season 1 dungeon menu
/tldr hide         Hide the bar (sets visibility to Always Hide)
/tldr show         Show the bar (sets visibility to Always Show)
/tldr options      Open the Options panel
/tldr opt          Shorthand for options
```
---
Notes
Settings are saved per account and persist across sessions and reloads
Season 1 (left-click): 8 dungeons in the M+ rotation — 4 new Midnight dungeons + 4 returning legacy dungeons
Preseason (right-click): 4 Midnight-original dungeons not in the Season 1 M+ rotation (Murder Row, Den of Nalorakk, The Blinding Vale, Voidscar Arena)
---
Changelog
v1.3.1
Boss navigation arrows — Prev/Next buttons in the popup title bar let you scroll through every boss without reopening the dropdown. Steps across dungeon boundaries. Hovering shows the upcoming boss and dungeon in a tooltip. Arrows disable at the start/end of each source table.
SharedMedia font integration — Font picker detects LibSharedMedia-3.0 at login and rebuilds with the full LSM list if found. The picker is now a scrollable frame. Without SharedMedia it falls back to the built-in four fonts. A status line confirms how many LSM fonts were detected.
Guide Density toggle — New option: Normal (full detail) or Brief (key points only). Brief mode strips everything after the first `—` separator in each bullet. Changes apply live to any open popup.
Reset Position button — New button in Options that snaps the bar to top-centre and the popup to screen-centre at default size. Rescues the popup if it goes off-screen or grows unexpectedly.
Boss data corrections — Nalorakk: full rewrite (previous guide used TBC Classic mechanics). Kasreth: corrected REFLUX CHARGE and renamed 100-energy ability to CORESPARK DETONATION. Corewarden Nysarra: corrected UMBRAL LASH, NULL VANGUARD, and add names. Kystia Manaheart: corrected DESTABILIZED trigger.
v1.1.0
Bar Visibility toggle — Always Show / Dungeons Only / Always Hide. Auto-reacts to zone transitions.
Font picker overhauled — Removed Morpheus and Skurri. Added Nimrod MT and Expressway (auto-detected across common addon locations). Fixed label rendering bug.
Maisara Caverns, Windrunner Spire, Magister's Terrace — Full boss rewrites with verified mechanics.
Preseason menu corrected — Removed duplicate Season 1 dungeons from Preseason dropdown.
Slash commands changed from `/mpg` to `/tldr`.
v1.0.0
Initial release with all 8 Season 1 M+ dungeons and 4 Preseason dungeons
Role-specific guide sections (TL;DR / Tank / Healer / DPS) for every boss
Role filter, popup window and chat output modes
Customisable bar width, transparency, fonts, and colors
Draggable bar and popup window, slash command support (`/tldr`)
