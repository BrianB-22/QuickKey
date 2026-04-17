# QuickKey — Architecture & Design Notes

## File Map

| File | Role |
|---|---|
| `QuickKeyApp.swift` | `@main` entry point; `@NSApplicationDelegateAdaptor`; `Settings { EmptyView() }` scene (no windows) |
| `AppDelegate.swift` | Owns `NSStatusItem`, `NSPopover`, `SettingsStore`, `ShortcutsViewModel`, `HotkeyManager`; wires up notifications and trigger closure |
| `HotkeyManager.swift` | Carbon `RegisterEventHotKey` wrapper; fires `onActivate` closure on ⌥Space |
| `ContentView.swift` | Root SwiftUI view: header, search bar, tab strip, shortcut list, footer |
| `ShortcutsViewModel.swift` | `ObservableObject`; search + filter logic; active app state; trigger closure |
| `ShortcutsDatabase.swift` | Static shortcut data for all 13 apps |
| `Models.swift` | `Shortcut`, `ShortcutCategory`, `AppShortcuts` value types |
| `FavoritesStore.swift` | `ObservableObject`; UserDefaults-backed `Set<String>` of stable favorite keys |
| `SettingsStore.swift` | `ObservableObject`; all user preferences; `AppFontSize` enum |
| `SettingsView.swift` | Settings sheet SwiftUI view |
| `KeyEventSender.swift` | CGEvent keyboard synthesis; Accessibility permission check |

## State Flow

```
NSWorkspace notification
        │
        ▼
AppDelegate.frontmostAppChanged
        │  sets lastActiveApp
        ▼
ShortcutsViewModel.updateActiveApp
        │  @Published activeAppName, activeAppHasData, selectedAppId
        ▼
ContentView re-renders (header dot, active tab)
```

```
User clicks key combo
        │
        ▼
KeyComboView.onTapGesture → onTrigger?()
        │  (nil when allowKeyComboTrigger = false)
        ▼
ShortcutsViewModel.triggerShortcut closure
        │
        ▼
AppDelegate.performTrigger
        │  close popover, 250 ms delay
        ▼
lastActiveApp.activate()
        │  100 ms delay
        ▼
KeyEventSender.send(keys:)
```

## Key Design Decisions

### No Dock icon
`LSUIElement = YES` in `Info.plist` — standard pattern for menu bar utilities.

### `lazy var vm` in AppDelegate
`SettingsStore` is initialized first as a plain `let`. `ShortcutsViewModel` needs a
reference to it, so `vm` is `lazy var` to defer initialization until after `settings`
is ready.

### Stale active app fix
`activeAppName` / `activeAppHasData` are `@Published` on the ViewModel, updated only
via the workspace notification. Previously these were computed live from
`NSWorkspace.shared.frontmostApplication`, which returned QuickKey itself once the
popover had focus.

### Favorites stable key
`"\(appName)|\(shortcut.name)|\(shortcut.keys)"` — survives restarts because the
shortcut database is static. UUID-based keys would break across launches.

### Font sizes on macOS
`dynamicTypeSize` modifier is unreliable on macOS — it has no effect in practice.
`AppFontSize` defines explicit `CGFloat` values (`body`, `caption`, `subheadline`,
`tabLabel`) applied directly at each call site.

### Installed apps filter reactivity
`ShortcutsViewModel` subscribes to `settings.$showInstalledAppsOnly` via Combine and
calls `objectWillChange.send()` so the tab strip re-renders immediately when the
setting is toggled, without needing to restart.

### Trigger timing
Two-step delay (250 ms + 100 ms) is required:
1. Popover close is animated — target app hasn't regained focus yet
2. `activate()` is async — the app needs a moment before it can receive key events

## Shortcut Key Format
Keys are stored as `"⌘+⇧+Z"` — split on `"+"` to produce individual badge tokens.
`KeyEventSender` parses modifier symbols (`⌘ ⌥ ⌃ ⇧`) and maps key characters to
`CGKeyCode` via a hardcoded lookup table.

## Accessibility
`KeyEventSender.isAccessibilityEnabled()` wraps `AXIsProcessTrusted()`.
If not granted, `requestAccessibilityPermission()` prompts the system dialog and
`AppDelegate.showAccessibilityAlert()` guides the user to System Settings.

## UserDefaults Keys
| Key | Type | Default |
|---|---|---|
| `com.quickkey.favorites.v1` | `[String]` | `[]` |
| `com.quickkey.fontSize` | `String` | `"Medium"` |
| `com.quickkey.allowTrigger` | `Bool` | `false` |
| `com.quickkey.installedAppsOnly` | `Bool` | `true` |
| `com.quickkey.globalHotkey` | `Bool` | `true` |
