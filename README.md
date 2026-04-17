# QuickKey

<p align="center">
  <img src="QuickKeyIcon.png" width="128" alt="QuickKey icon">
</p>

**Stop mousing around.**

A macOS menu bar app that surfaces keyboard shortcuts for whatever app you're currently using. Search, browse, favorite, and trigger shortcuts without leaving the keyboard.

<table align="center"><tr>
  <td><img src="Screenshot.png" width="340" alt="QuickKey screenshot"></td>
  <td><img src="Screenshot2.png" width="340" alt="QuickKey favorites screenshot"></td>
</tr></table>

## Download

<p align="center">
  <a href="https://github.com/BrianB-22/QuickKey/raw/main/Builds/QuickKey%20Build%20041726.dmg">
    ⬇️ Download QuickKey v1.0 (macOS)
  </a>
</p>

> Not signed with an Apple Developer certificate — see the [install instructions](Builds/README.md) to bypass the Gatekeeper warning on first launch.

## Features

- **Menu bar utility** — lives in the menu bar with no Dock icon
- **Auto-detects active app** — opens to the right app's shortcuts automatically
- **Search** — filter by command name, key combo, or description
- **Favorites** — pin shortcuts across any app, persisted between launches
- **Trigger shortcuts** — click a key combo to fire it in the target app (requires Accessibility permission)
- **Global hotkey** — ⌥Space opens/closes QuickKey from anywhere
- **Installed apps filter** — only shows tabs for apps actually on your Mac
- **Persistent settings** — launch at login, font size, global hotkey, and trigger behavior all saved across restarts

## Supported Apps

System, Finder, Safari, Chrome, Firefox, Brave, Arc, VS Code, Cursor, Terminal, Xcode, Slack, Figma, Notion, Obsidian, Photoshop, Lightroom Classic, Illustrator, Premiere Pro, Final Cut Pro, Excel, Discord, Zoom, Microsoft Teams, Keynote, Pages, Numbers, Spotify, Raycast, IntelliJ / WebStorm, Vim / Neovim, nano, GitHub Desktop, Things 3, Superhuman, Linear, Telegram

## Requirements

- macOS 13 Ventura or later
- Xcode 15+ to build from source
- Accessibility permission (for shortcut triggering only)

## Installation

### Option 1 — Pre-compiled (easiest)

Download the latest `.dmg` from the [Builds folder](Builds/) — no Xcode required. See the [install instructions](Builds/README.md) for how to bypass the macOS Gatekeeper warning on first launch.

### Option 2 — Build from source

Clone the repo and open the Xcode project:

```bash
git clone https://github.com/BrianB-22/QuickKey.git
cd QuickKey
open QuickKey.xcodeproj
```

Build and run with ⌘R. QuickKey will appear as a keyboard icon in your menu bar.

## Usage

1. Click the keyboard icon in the menu bar to open the popover
2. The app tab for your current app is selected automatically
3. Use the search bar to filter shortcuts
4. Right-click any shortcut to trigger it, copy the key combo, or add it to Favorites
5. Open Settings (gear icon) to configure launch at login, font size, and trigger behavior

## Settings

| Setting | Default | Description |
|---|---|---|
| Launch at Login | Off | Start QuickKey automatically on login |
| Show Help for Installed Apps Only | On | Hides tabs for apps not on your Mac |
| Allow Key Combo Clicks to Activate | Off | Click a key combo badge to fire it in the active app |
| Font Size | Medium | Small / Medium / Large |

## Architecture

The app is built with SwiftUI + AppKit. Key files:

| File | Role |
|---|---|
| `AppDelegate.swift` | Owns the status item, popover, and app lifecycle |
| `ContentView.swift` | Root SwiftUI view (header, search, tabs, shortcut list) |
| `ShortcutsViewModel.swift` | Search/filter logic and active app state |
| `ShortcutsDatabase.swift` | Static shortcut data for all 13 apps |
| `FavoritesStore.swift` | UserDefaults-backed favorites |
| `HotkeyManager.swift` | Global hotkey via Carbon `RegisterEventHotKey` |
| `KeyEventSender.swift` | CGEvent keyboard synthesis for shortcut triggering |

## License

MIT

## Disclaimer

QuickKey is provided as-is, without warranties of any kind. The keyboard shortcuts listed are believed to be accurate at the time of writing, but app updates may change them at any time. No guarantee is made regarding the completeness or correctness of any shortcut data. Use at your own discretion.
