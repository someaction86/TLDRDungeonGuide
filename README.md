# TL;DR Dungeon Guide

**Version 1.5.0 — WoW: Midnight Season 1**

A compact, in-game boss guide for all Midnight dungeons. Get the essential mechanics for every boss broken down by role — no fluff, no walls of text.

---

## Installation

1. Download the `TLDRDungeonGuide` folder
2. Place it in: `World of Warcraft/_retail_/Interface/AddOns/`
3. Restart the game or use `/reload`
4. The guide bar appears on your screen automatically

---

## What It Does

TL;DR Dungeon Guide displays a small draggable bar on your screen. Left-clicking opens a dropdown for **Season 1 Mythic+ dungeons**. Right-clicking opens **Preseason dungeons**. Selecting any boss shows a concise guide broken into four sections:

- **TL;DR** — Everyone needs to know this regardless of role
- **Tank** — What the tank specifically needs to do
- **Healer** — Healer-specific priorities and cooldown windows
- **DPS** — DPS-specific positioning, targets, and responsibilities

You can filter the guide to show only your role's section using the **My Role** setting in Options — perfect for a quick pre-pull refresher without scrolling through info that doesn't apply to you.

---

## Dungeons Covered

### Season 1 Mythic+ (Left-click)
| Dungeon | Bosses |
|---|---|
| Algeth'ar Academy | Vexamus, Overgrown Ancient, Crawth, Echo of Doragosa |
| Magister's Terrace | Arcanotron Custos, Seranel Sunlash, Gemellus, Degentrius |
| Maisara Caverns | Muro'jin & Nekraxx, Vordaza, Rak'tul, Vessel of Souls |
| Nexus Point Xenas | Chief Corewright Kasreth, Corewarden Nysarra, Lothraxion |
| Pit of Saron | Forgemaster Garfrost, Ick & Krick, Scourgelord Tyrannus |
| Skyreach | Ranjit, Araknath, Rukhran, High Sage Viryx |
| Seat of the Triumvirate | Zuraal, Saprish, Viceroy Nezhar, L'ura |
| Windrunner Spire | Emberdawn, Derelict Duo, Commander Kroluk, The Restless Heart |

### Preseason Dungeons (Right-click)
| Dungeon | Bosses |
|---|---|
| Den of Nalorakk | The Hoardmonger, Sentinel of Winter, Nalorakk |
| Murder Row | Kystia Manaheart, Zaen Bladesorrow, Xathuux, Lithiel Cinderfury |
| The Blinding Vale | Lightblossom Trinity, Ikuzz, Lightwarden Ruia, Ziekket |
| Voidscar Arena | Taz'Rah, Atroxus, Charonus |

> **Note:** Preseason dungeons are the 4 Midnight-original dungeons not in the Season 1 M+ rotation. The 4 legacy/revisited dungeons (Windrunner Spire, Magister's Terrace, Maisara Caverns, Nexus Point Xenas) appear in Season 1 only — access them via left-click.

---

## Usage

| Action | Result |
|---|---|
| **Left-click** bar | Opens Season 1 dungeon menu |
| **Right-click** bar | Opens Preseason dungeon menu |
| **Drag** bar title | Moves the bar |
| **Gear icon** | Opens Options panel |
| `/tldr` | Opens Season 1 dungeon menu |
| `/tldr hide` | Hides the bar (sets visibility to Always Hide) |
| `/tldr show` | Restores the bar (sets visibility to Always Show) |
| `/tldr options` | Opens Options panel |

---

## Options Panel

Click the gear icon (⚙) on the right side of the bar to open settings.

### Output Mode
Choose whether boss guides are printed to your **chat window** or displayed in a **resizable popup window**. The popup can be dragged anywhere on screen and resized by dragging the bottom-right corner.

### Bar Visibility
Control when the guide bar is shown:
- **Always Show** — Bar is visible at all times (default)
- **Dungeons Only** — Bar automatically hides in the open world and reappears whenever you enter an instanced dungeon or raid. Reacts to every zone transition.
- **Always Hide** — Bar stays hidden until changed here or via `/tldr show`

### My Role
Filter guide content to only show sections relevant to your role:
- **All Roles** — Shows TL;DR + Tank + Healer + DPS sections
- **Tank** — Shows TL;DR + Tank section only
- **Healer** — Shows TL;DR + Healer section only
- **DPS** — Shows TL;DR + DPS section only

Changing your role instantly refreshes any open guide window.

### Bar Width
Adjust the width of the main bar from 160px to 400px.

### Bar Transparency
Control how transparent the bar and popup window background appear (10%–100%).

### Popup Font Size
Adjust the text size inside the popup guide window (9pt–20pt).

### Title / Heading Color
Seven color swatches for the heading and title color used in the guide output.

### Bar Background Color
Seven dark color options for the bar and popup window background.

### Popup Font
Four font options for the popup guide window:
- **Friz Quadrata** — Classic WoW default font
- **Arial Narrow** — Clean, compact, easy to read
- **Nimrod MT** — Elegant readable serif, distinct from Friz Quadrata
- **Expressway** — Clean modern font. Automatically detected if you have ElvUI, Details!, SharedMedia, or any other addon that ships it installed. If not found the button shows greyed out with a tooltip explaining where to place the file.

### Text Colors
Three independent color pickers for guide text:
- **Number Color** — The `1.` `2.` `3.` bullet numbers
- **Ability Color** — Ability names (e.g., `>> DARK RIFT:`)
- **Info Color** — The description text after the ability name

All color changes apply live to any open guide window.

### Reset to Defaults
Resets all settings including colors, font, role filter, visibility mode, and output mode back to defaults.

---

## Tips

- **Role filter is the most useful setting** — set it to your role before a run and you only see what's relevant to you
- **Dungeons Only visibility** is great if you want the bar out of the way while questing but ready the moment you zone in
- **Popup window mode** is recommended — it stays on screen while you play, doesn't flood your chat, and you can scroll back up if needed
- **Hover over the bar** to see a tooltip reminding you that left = Season 1, right = Preseason
- **Dragging**: click and hold the title text area to drag. The gear icon is a separate button — clicking that opens options instead

---

## Slash Commands

```
/tldr              Open Season 1 dungeon menu
/tldr hide         Hide the bar (sets visibility to Always Hide)
/tldr show         Show the bar (sets visibility to Always Show)
/tldr options      Open the Options panel
/tldr opt          Shorthand for options
```

---

## Notes

- Settings are saved per account and persist across sessions and reloads
- **Season 1 (left-click):** 8 dungeons in the M+ rotation — 4 new Midnight dungeons + 4 returning legacy dungeons
- **Preseason (right-click):** 4 Midnight-original dungeons not in the Season 1 M+ rotation (Murder Row, Den of Nalorakk, The Blinding Vale, Voidscar Arena)

---

## Changelog

### v1.5.0 — Raids + UI Overhaul
- **Raid guides added** — Full TL;DR/Tank/Healer/DPS boss guides for all currently available Season 1 raid bosses across The Voidspire (6 bosses) and The Dreamrift (1 boss). March on Quel'Danas (2 bosses) shows as coming March 31, 2026.
- **Heroic differences** — Each raid boss guide includes a red-highlighted "HEROIC DIFFERENCES" section at the bottom noting what changes on Heroic difficulty. Confirmed for Averzian, Vorasius, Salhadaar, Vaelgor & Ezzorak, and Crown of the Cosmos.
- **New bar layout** — Bar now has two rows. Top row: title + gear icon. Bottom row: `[ Dungeons ]` and `[ Raids ]` buttons styled to match the bar aesthetic. Buttons highlight white on hover.
- **Combined Dungeons menu** — Season 1 and Preseason dungeons are now in one dropdown under the Dungeons button, separated by a divider. No more left-click/right-click split.
- **Fixed all button click issues** — Root cause was a drag handle child frame intercepting all mouse events. Replaced with direct `RegisterForDrag` on the frame itself, which allows all child buttons to receive clicks correctly.

### v1.4.4 — Bug Fixes
- **Boss navigation tooltip** — Tooltip now updates immediately when clicking a nav arrow while already hovering, without requiring the mouse to move away and back.
- **Expressway detection** — Added ElvUI's current font path (`ElvUI/Game/Shared/Media/Fonts/Expressway.ttf`) and direct ElvUI internal table lookup. Backslash normalisation added for ElvUI path compatibility.
- **Nav arrow tooltip rendering** — Replaced Unicode arrow characters with plain text (`Prev:` / `Next:`) to avoid `[]` rendering in WoW's default fonts.

### v1.4.3
- **Fixed font picker** — Fonts now apply and persist correctly. Root cause was WoW resetting a FontString's font on every `SetText` call. Fixed by using a persistent named `Font` object (`CreateFont`) assigned via `SetFontObject`, which survives text updates.
- **Fixed Expressway detection** — Moved to `PLAYER_LOGIN` so all addons are fully loaded before probing. Now checks three sources in order: LibSharedMedia registry, ElvUI's internal font table (`ElvUI[1].Media.Fonts.Expressway`), then a list of known file paths. Correct ElvUI path added (`ElvUI/Game/Shared/Media/Fonts/Expressway.ttf`). Backslash normalisation added since ElvUI stores paths with backslashes. Hover tooltip on the not-found button now explains how to install Expressway.
- **Fixed Brief mode** — Lua 5.1 (WoW's version) does not support `\x` hex escape sequences — they were being treated as literal characters so the em dash pattern never matched. Fixed using decimal escapes (`\226\128\148`) which Lua 5.1 does support.
- **Fixed boss navigation arrows** — Unicode arrow characters (`◄` `►`) have no glyphs in WoW's default fonts and rendered as `[]`. Replaced with plain ASCII `<` `>`. Also fixed a dropdown closure bug where the source table reference was being lost — indexes are now packed as pure integers in `arg1`/`arg2` with no closure dependency. Navigation now stops at the first and last boss of the current dungeon. Tooltip Unicode arrows replaced with plain text to avoid `[]` rendering.
- **Fixed button overlap in Options panel** — Reset Position button re-anchored so it sits cleanly between Reset to Defaults and Done without overlapping.
- **Reverted font picker** — Removed SharedMedia scroll frame complexity and returned to the original simple flat button list. Expressway auto-detection retained.

### v1.4.1
- **Fixed font picker** — Fonts now apply correctly. Root cause was `ApplyFontSize()` being called before `SetText()` — WoW resets the font when text is set, overwriting the selection. Order corrected.
- **Fixed Brief mode** — Guide lines use an em dash (`—`) as the separator, not a double hyphen. The pattern never matched so nothing was trimmed. Fixed to match the correct character.
- **Fixed boss navigation arrows** — Previous texture path (`UI-SpellbookIcon-PrevPage`) does not exist in current WoW. Replaced with `UI-Panel-ScrollUpButton` textures, rotated to point left and right.
- **Fixed button overlap in Options panel** — Reset Position button was overlapping Reset to Defaults. All three buttons (Reset to Defaults, Reset Position, Done) are now laid out as a clean evenly-spaced row.

### v1.3.1
- **Boss navigation arrows** — Prev/Next buttons in the popup title bar let you scroll through every boss without reopening the dropdown. Steps across dungeon boundaries. Hovering shows the upcoming boss and dungeon in a tooltip. Arrows disable at the start/end of each source table.
- **SharedMedia font integration** — Font picker detects LibSharedMedia-3.0 at login and rebuilds with the full LSM list if found. The picker is now a scrollable frame. Without SharedMedia it falls back to the built-in four fonts. A status line confirms how many LSM fonts were detected.
- **Guide Density toggle** — New option: Normal (full detail) or Brief (key points only). Brief mode strips everything after the first ` — ` separator in each bullet. Changes apply live to any open popup.
- **Reset Position button** — New button in Options that snaps the bar to top-centre and the popup to screen-centre at default size. Rescues the popup if it goes off-screen or grows unexpectedly.
- **Boss data corrections** — Nalorakk: full rewrite (previous guide used TBC Classic mechanics). Kasreth: corrected REFLUX CHARGE and renamed 100-energy ability to CORESPARK DETONATION. Corewarden Nysarra: corrected UMBRAL LASH, NULL VANGUARD, and add names. Kystia Manaheart: corrected DESTABILIZED trigger.

### v1.1.0
- **Bar Visibility toggle** — Always Show / Dungeons Only / Always Hide. Auto-reacts to zone transitions.
- **Font picker overhauled** — Removed Morpheus and Skurri. Added Nimrod MT and Expressway (auto-detected across common addon locations). Fixed label rendering bug.
- **Maisara Caverns, Windrunner Spire, Magister's Terrace** — Full boss rewrites with verified mechanics.
- **Preseason menu corrected** — Removed duplicate Season 1 dungeons from Preseason dropdown.
- **Slash commands** changed from `/mpg` to `/tldr`.

### v1.0.0
- Initial release with all 8 Season 1 M+ dungeons and 4 Preseason dungeons
- Role-specific guide sections (TL;DR / Tank / Healer / DPS) for every boss
- Role filter, popup window and chat output modes
- Customisable bar width, transparency, fonts, and colors
- Draggable bar and popup window, slash command support (`/tldr`)
