# QuickKey

A macOS menu bar app that surfaces keyboard shortcuts for whatever app you're currently using. Search, browse, favorite, and trigger shortcuts without leaving the keyboard.

## Features

- **Menu bar utility** — lives in the menu bar with no Dock icon
- **Auto-detects active app** — opens to the right app's shortcuts automatically
- **Search** — filter by command name, key combo, or description
- **Favorites** — pin shortcuts across any app, persisted between launches
- **Trigger shortcuts** — click a key combo to fire it in the target app (requires Accessibility permission)
- **Global hotkey** — ⌥Space opens/closes QuickKey from anywhere
- **Installed apps filter** — only shows tabs for apps actually on your Mac

## Supported Apps

System, Finder, Safari, Chrome, Arc, VS Code, Cursor, Terminal, Xcode, Slack, Figma, Notion, Obsidian, Photoshop, Final Cut Pro, Excel, Discord

## Requirements

- macOS 13 Ventura or later
- Xcode 15+ to build from source
- Accessibility permission (for shortcut triggering only)

## Installation

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
