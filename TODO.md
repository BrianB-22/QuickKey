# QuickKey — To-Do & Ideas

## Bugs / Polish
- [ ] When `allowKeyComboTrigger` is off, hover still shows pointer cursor — arguably
      correct (badge is still interactive via context menu) but worth revisiting
- [ ] Popover doesn't reopen on the same screen if the user moves it between displays
- [ ] No keyboard navigation between tabs (arrow keys, Tab key)

## Near-Term Features
- [ ] **Global hotkey** to open/close the popover without clicking the menu bar icon
- [ ] **"Copy as text"** — copy the full shortcut row (name + keys) as a formatted string
- [ ] **Shortcut search across all apps** — a mode that searches every app at once
- [ ] **Recently used** — track last N triggered shortcuts for quick re-access
- [ ] **Custom shortcuts** — let users add their own entries to any app

## Feature Ideas

**Discovery & Learning**
- [ ] "Shortcut of the day" in the header — surfaces one you might not know
- [ ] Usage tracking — shows which shortcuts you've triggered, highlights ones never used
- [ ] "Did you know?" tooltip when you search something you could do faster with a shortcut

**Workflow Efficiency**
- [x] Global hotkey to open the popover from anywhere (⌥Space, toggled in Settings)
- [ ] Sequences — multi-step shortcut flows saved as a single favorite
- [ ] Quick copy mode — press a number key (1–9) to instantly copy the Nth visible shortcut

**Personalization**
- [ ] Custom shortcuts — add your own entries to any app
- [ ] Notes on shortcuts — annotate any entry with a personal reminder
- [ ] Hide shortcuts you already know well to keep the list focused

**Content**
- [ ] User-submitted shortcut corrections/additions from a community source
- [ ] Import shortcuts from app keybinding files (VS Code `keybindings.json`, Xcode key bindings)
- [ ] Web app support — shortcuts for Gmail, Notion web, Linear, GitHub

**Polish**
- [ ] Onboarding flow — first launch walks you through adding your first favorite
- [ ] Cheat sheet export — generate a printable PDF or image for a given app
- [ ] Menu bar icon badge showing the active app's icon instead of the keyboard glyph

## App Coverage
Apps to consider adding:
- [x] Microsoft Word
- [x] Microsoft PowerPoint
- [ ] 1Password
- [ ] Tower / SourceTree (Git clients)
- [ ] Sketch
- [ ] Alfred
- [ ] Bear

## Settings Ideas
- [ ] Popover position preference (left / center / right of menu bar icon)
- [ ] Accent color picker
- [ ] Hide/show specific categories within an app
- [ ] Export favorites to JSON

## Technical Debt
- [ ] `ShortcutsDatabase` is a single massive file — consider splitting into
      one file per app or loading from bundled JSON
- [ ] `KeyEventSender` key code map is hardcoded — missing some special characters
      and international keyboard variants
- [ ] No unit tests — `FavoritesStore`, `KeyEventSender` parsing, and
      `filteredCategories` logic are all good candidates

## Done ✓
- [x] Menu bar icon + popover
- [x] Searchable shortcuts (name, keys, description)
- [x] App tab strip with scroll arrows
- [x] Favorites tab (right-click add/remove, UserDefaults persistence)
- [x] Hover blow-up animation on key combos
- [x] Click-to-trigger via CGEvent (Accessibility permission)
- [x] Copy shortcut to clipboard
- [x] Active app indicator dot (green/red)
- [x] Settings: Launch at Login
- [x] Settings: Font Size (Small/Medium/Large)
- [x] Settings: Allow Key Combo Clicks to Activate (default off)
- [x] Settings: Show Help for Installed Apps Only (default on)
- [x] Default to Favorites tab when active app has no shortcut data
- [x] 13 apps: System, Finder, Safari, Chrome, Arc, VS Code, Cursor, Terminal, Xcode, Slack, Figma, Notion, Obsidian
