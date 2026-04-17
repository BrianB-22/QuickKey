# QuickKey — Product Spec

## Overview
QuickKey is a macOS menu bar app that surfaces keyboard shortcuts for the active app.
It lives in the menu bar (no Dock icon), opens as a popover on click, and lets you
search, browse, favorite, and trigger shortcuts without leaving the keyboard.

## Core Requirements
- Keyboard icon in the menu bar; click to open/close popover
- Popover shows shortcuts for the currently active app
- Searchable by command name, key combo, or description
- No Dock icon (`LSUIElement = YES`)

## Feature List

### App Tabs
- Tab strip showing all supported apps
- Left/right arrow buttons for mouse-friendly horizontal scrolling
- Animated scroll via `ScrollViewReader`
- Auto-selects the tab for the frontmost app when popover opens
- "Favorites" tab pinned to the left

### Shortcuts List
- Grouped by category with bold section headers (accent color left bar)
- Each row: shortcut name + optional description subtitle + key combo badges
- Search highlights matching text in yellow
- Right-click context menu on any row:
  - Trigger shortcut in active app
  - Copy key combo to clipboard
  - Add / Remove from Favorites

### Favorites
- Persisted across launches via `UserDefaults` (`com.quickkey.favorites.v1`)
- Stable key: `"appName|shortcutName|keys"` — survives app restarts
- Favorites tab groups shortcuts by source app
- Star badge shown on favorited rows when browsing other tabs

### Active App Indicator
- Header shows current app name with a green (data available) or red (no data) dot
- Updated via `NSWorkspace.didActivateApplicationNotification` — never stale

### Key Combo Hover / Trigger
- Hover blows up the key combo 1.65× with spring animation (anchored trailing)
- Pointer cursor on hover
- Click fires the shortcut in the previously active app (requires Accessibility permission)
- ⌥Space — open/close QuickKey from anywhere (toggleable in Settings)
- ⌥⌘F — open QuickKey directly on the Favorites tab (toggleable in Settings)
- Trigger: closes popover → 250 ms → activates target app → 100 ms → sends CGEvent
- Gated behind "Allow Key Combo Clicks to Activate" setting (default off)

### Settings
| Setting | Default | Persistence |
|---|---|---|
| Launch at Login | off | `SMAppService` |
| Show Help for Installed Apps Only | on | UserDefaults |
| Allow Key Combo Clicks to Activate | off | UserDefaults |
| Font Size (Small / Medium / Large) | Medium | UserDefaults |

### Installed Apps Filter
- When enabled (default), tab strip only shows apps found on the current Mac
  via `NSWorkspace.urlForApplication(withBundleIdentifier:)`
- "System" always shown (no bundle ID)
- Re-renders instantly when toggled in Settings

## Supported Apps (13)
System, Finder, Safari, Chrome, Arc, VS Code, Cursor, Terminal, Xcode, Slack, Figma, Notion, Obsidian

## Window / Layout
- Popover size: 560 × 660 pt
- Settings sheet: 380 × 420 pt
- Popover behavior: `.transient` (closes on click outside)
