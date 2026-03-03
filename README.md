# TL;DR Dungeon Guide

**Version 3.0 — WoW: Midnight Season 1**

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
| Maisara Caverns | Muro'jin & Nekraxx, Vordaza, Rak'tul |
| Nexus Point Xenas | Chief Corewright Kasreth, Corewarden Nysarra, Lothraxion |
| Pit of Saron | Forgemaster Garfrost, Ick & Krick, Scourgelord Tyrannus |
| Skyreach | Ranjit, Araknath, Rukhran, High Sage Viryx |
| Seat of the Triumvirate | Zuraal, Saprish, Viceroy Nezhar, L'ura |
| Windrunner Spire | Emberdawn, Derelict Duo, Commander Kroluk, The Restless Heart |

### Preseason Dungeons (Right-click)
| Dungeon | Bosses |
|---|---|
| Den of Nalorakk | The Hoardmonger, Sentinel of Winter, Nalorakk |
| Magister's Terrace | Arcanotron Custos, Seranel Sunlash, Gemellus, Degentrius |
| Murder Row | Kystia Manaheart, Zaen Bladesorrow, Xathuux, Lithiel Cinderfury |
| Windrunner Spire | Emberdawn, Derelict Duo, Commander Kroluk, The Restless Heart |
| Maisara Caverns | Muro'jin & Nekraxx, Vordaza, Rak'tul |
| Nexus Point Xenas | Chief Corewright Kasreth, Corewarden Nysarra, Lothraxion |
| The Blinding Vale | Lightblossom Trinity, Ikuzz, Lightwarden Ruia, Ziekket |
| Voidscar Arena | Taz'Rah, Atroxus, Charonus |

---

## Usage

| Action | Result |
|---|---|
| **Left-click** bar | Opens Season 1 dungeon menu |
| **Right-click** bar | Opens Preseason dungeon menu |
| **Drag** bar title | Moves the bar |
| **Gear icon** | Opens Options panel |
| `/mpg` | Opens Season 1 dungeon menu |
| `/mpg hide` | Hides the bar |
| `/mpg show` | Restores the bar |
| `/mpg options` | Opens Options panel |

---

## Options Panel

Click the gear icon (⚙) on the right side of the bar to open settings.

### Output Mode
Choose whether boss guides are printed to your **chat window** or displayed in a **resizable popup window**. The popup can be dragged anywhere on screen and resized by dragging the bottom-right corner.

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
Five font options that preview their own name in the selected font:
- **Friz Quadrata** — Classic WoW default font
- **Arial Narrow** — Clean, compact, easy to read
- **Morpheus** — Fantasy style, used in quest text
- **Skurri** — Runic style
- **Expressway** — Modern clean font

### Text Colors
Three independent color pickers for guide text:
- **Number Color** — The `1.` `2.` `3.` bullet numbers
- **Ability Color** — Ability names (e.g., `>> DARK RIFT:`)
- **Info Color** — The description text after the ability name

All color changes apply live to any open guide window.

### Reset to Defaults
Resets all settings including colors, font, role filter, and output mode back to defaults.

---

## Tips

- **Role filter is the most useful setting** — set it to your role before a run and you only see what's relevant to you
- **Popup window mode** is recommended — it stays on screen while you play, doesn't flood your chat, and you can scroll back up if needed
- **Hover over the bar** to see a tooltip reminding you that left = Season 1, right = Preseason
- **Dragging**: click and hold the title text area to drag. The gear icon is a separate button — clicking that opens options instead

---

## Slash Commands

```
/mpg              Open Season 1 dungeon menu
/mpg hide         Hide the guide bar
/mpg show         Show the guide bar
/mpg options      Open the Options panel
/mpg opt          Shorthand for options
```

---

## Notes

- Settings are saved per account and persist across sessions and reloads
- The preseason dungeons that overlap with Season 1 (Magister's Terrace, Windrunner Spire, Maisara Caverns, Nexus Point Xenas) show full role-specific guides since they are relevant in both contexts
- Preseason-only dungeons that appear in Season 1 reference each other to avoid duplication

---

*Built for WoW: Midnight — guides reflect beta tuning and will be updated as the expansion releases.*
