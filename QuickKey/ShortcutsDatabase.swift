import Foundation

final class ShortcutsDatabase {
    static let shared = ShortcutsDatabase()

    let allApps: [AppShortcuts]

    private init() {
        allApps = [
            ShortcutsDatabase.system,
            ShortcutsDatabase.finder,
            ShortcutsDatabase.safari,
            ShortcutsDatabase.chrome,
            ShortcutsDatabase.arc,
            ShortcutsDatabase.vscode,
            ShortcutsDatabase.cursor,
            ShortcutsDatabase.terminal,
            ShortcutsDatabase.xcode,
            ShortcutsDatabase.slack,
            ShortcutsDatabase.figma,
            ShortcutsDatabase.notion,
            ShortcutsDatabase.obsidian,
            ShortcutsDatabase.photoshop,
            ShortcutsDatabase.finalCutPro,
            ShortcutsDatabase.excel,
            ShortcutsDatabase.discord,
            ShortcutsDatabase.zoom,
            ShortcutsDatabase.microsoftTeams,
            ShortcutsDatabase.keynote,
            ShortcutsDatabase.pages,
            ShortcutsDatabase.numbers,
            ShortcutsDatabase.spotify,
            ShortcutsDatabase.raycast,
            ShortcutsDatabase.illustrator,
            ShortcutsDatabase.premierePro,
            ShortcutsDatabase.lightroomClassic,
            ShortcutsDatabase.intellij,
            ShortcutsDatabase.vim,
            ShortcutsDatabase.nano,
            ShortcutsDatabase.githubDesktop,
            ShortcutsDatabase.things3,
            ShortcutsDatabase.superhuman,
            ShortcutsDatabase.linear,
            ShortcutsDatabase.telegram,
        ]
    }

    func shortcuts(for appName: String) -> AppShortcuts? {
        allApps.first { $0.appName == appName }
    }

    func appName(forBundleId bundleId: String) -> String? {
        allApps.first { $0.bundleIdentifiers.contains(bundleId) }?.appName
    }

    // MARK: - System

    static let system = AppShortcuts(
        id: "System",
        appName: "System",
        icon: "applelogo",
        bundleIdentifiers: [],
        categories: [
            ShortcutCategory(name: "Application", shortcuts: [
                Shortcut(name: "Quit app",               keys: "⌘+Q",         description: "Completely quits the active application, closing all its windows."),
                Shortcut(name: "Hide app",               keys: "⌘+H",         description: "Hides the active app's windows without quitting it; click the Dock icon to show them again."),
                Shortcut(name: "Hide others",            keys: "⌘+⌥+H",       description: "Hides all applications except the currently active one, clearing visual clutter."),
                Shortcut(name: "Minimize window",        keys: "⌘+M",         description: "Sends the current window to the Dock as a thumbnail; click it in the Dock to restore."),
                Shortcut(name: "Close window",           keys: "⌘+W",         description: "Closes the frontmost window. The app keeps running unless all windows are closed."),
                Shortcut(name: "Close all windows",      keys: "⌘+⌥+W",       description: "Closes every open window for the active app at once."),
                Shortcut(name: "Open preferences",       keys: "⌘+,",         description: "Opens the active app's Settings / Preferences window."),
                Shortcut(name: "Force Quit",             keys: "⌘+⌥+⎋",       description: "Opens the Force Quit dialog to terminate an unresponsive application immediately."),
                Shortcut(name: "Switch app",             keys: "⌘+Tab",       description: "Cycles forward through open apps. Hold ⌘ and press Tab repeatedly; release to switch."),
                Shortcut(name: "Cycle app windows",      keys: "⌘+`",         description: "Cycles through multiple windows of the same app. Press repeatedly to walk through them."),
            ]),
            ShortcutCategory(name: "Text Editing", shortcuts: [
                Shortcut(name: "Copy",                   keys: "⌘+C",         description: "Copies the selected text, file, or object to the clipboard without removing it."),
                Shortcut(name: "Paste",                  keys: "⌘+V",         description: "Inserts the clipboard contents at the cursor, preserving original formatting."),
                Shortcut(name: "Cut",                    keys: "⌘+X",         description: "Removes the selected content and places it on the clipboard."),
                Shortcut(name: "Undo",                   keys: "⌘+Z",         description: "Reverses the last action. Can be pressed repeatedly to step back through history."),
                Shortcut(name: "Redo",                   keys: "⌘+⇧+Z",       description: "Re-applies an action that was undone. Only works after using Undo."),
                Shortcut(name: "Select all",             keys: "⌘+A",         description: "Selects all content in the current field, document, or view."),
                Shortcut(name: "Find",                   keys: "⌘+F",         description: "Opens the in-app Find bar to search for text in the current document or page."),
                Shortcut(name: "Find next",              keys: "⌘+G",         description: "Jumps to the next match after a Find operation without reopening the Find bar."),
                Shortcut(name: "Find previous",          keys: "⌘+⇧+G",       description: "Jumps to the previous match in the search results."),
                Shortcut(name: "Paste and match style",  keys: "⌘+⌥+⇧+V",     description: "Pastes plain text, stripping the source formatting to match the destination style."),
                Shortcut(name: "Bold",                   keys: "⌘+B",         description: "Toggles bold formatting on the selected text."),
                Shortcut(name: "Italic",                 keys: "⌘+I",         description: "Toggles italic formatting on the selected text."),
                Shortcut(name: "Underline",              keys: "⌘+U",         description: "Toggles underline formatting on the selected text."),
                Shortcut(name: "Jump to beginning",      keys: "⌘+↑",         description: "Moves the cursor to the very start of the document or text field."),
                Shortcut(name: "Jump to end",            keys: "⌘+↓",         description: "Moves the cursor to the very end of the document or text field."),
                Shortcut(name: "Jump to line start",     keys: "⌘+←",         description: "Moves the cursor to the first character of the current line."),
                Shortcut(name: "Jump to line end",       keys: "⌘+→",         description: "Moves the cursor to the last character of the current line."),
                Shortcut(name: "Delete word back",       keys: "⌥+⌫",         description: "Deletes the entire word immediately to the left of the cursor."),
                Shortcut(name: "Delete to start of line",keys: "⌘+⌫",         description: "Deletes all text from the cursor back to the beginning of the current line."),
                Shortcut(name: "Select word",            keys: "⌥+⇧+→",       description: "Extends the selection one word to the right. Combine with ← to go back."),
            ]),
            ShortcutCategory(name: "Screenshots", shortcuts: [
                Shortcut(name: "Full screenshot",        keys: "⌘+⇧+3",       description: "Captures the entire screen and saves it as a PNG on the Desktop."),
                Shortcut(name: "Area screenshot",        keys: "⌘+⇧+4",       description: "Lets you drag a rectangle to capture a specific part of the screen."),
                Shortcut(name: "Screenshot toolbar",     keys: "⌘+⇧+5",       description: "Opens the Screenshot toolbar with options for window, area, full-screen, or screen recording."),
                Shortcut(name: "Screenshot window",      keys: "⌘+⇧+4  Space", description: "After pressing Space, click any window to capture just that window with a drop shadow."),
                Shortcut(name: "Screenshot to clipboard",keys: "⌘+⌃+⇧+3",     description: "Captures the full screen directly to the clipboard instead of saving a file."),
            ]),
            ShortcutCategory(name: "System & Window", shortcuts: [
                Shortcut(name: "Spotlight",              keys: "⌘+Space",     description: "Opens Spotlight Search to find files, apps, emails, calculations, and web results."),
                Shortcut(name: "Mission Control",        keys: "⌃+↑",         description: "Shows all open windows, Spaces, and full-screen apps in a bird's-eye overview."),
                Shortcut(name: "App Exposé",             keys: "⌃+↓",         description: "Shows all windows of the currently active app spread out for easy selection."),
                Shortcut(name: "Show Desktop",           keys: "F11",          description: "Temporarily moves all windows aside to reveal the Desktop; press again to restore."),
                Shortcut(name: "Next Space",             keys: "⌃+→",         description: "Switches to the Space (virtual desktop) to the right."),
                Shortcut(name: "Previous Space",         keys: "⌃+←",         description: "Switches to the Space (virtual desktop) to the left."),
                Shortcut(name: "Lock screen",            keys: "⌘+⌃+Q",       description: "Immediately locks the screen and requires your password to log back in."),
                Shortcut(name: "Emoji & Symbols",        keys: "⌘+⌃+Space",   description: "Opens the Character Viewer floating palette to browse and insert emoji or special symbols."),
            ]),
        ]
    )

    // MARK: - Finder

    static let finder = AppShortcuts(
        id: "Finder",
        appName: "Finder",
        icon: "folder.fill",
        bundleIdentifiers: ["com.apple.finder"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Go to Home",             keys: "⌘+⇧+H",       description: "Jumps directly to your Home folder (/Users/yourname)."),
                Shortcut(name: "Go to Desktop",          keys: "⌘+⇧+D",       description: "Navigates to the Desktop folder in the current Finder window."),
                Shortcut(name: "Go to Downloads",        keys: "⌘+⌥+L",       description: "Opens the Downloads folder directly."),
                Shortcut(name: "Go to Applications",     keys: "⌘+⇧+A",       description: "Navigates to the /Applications folder."),
                Shortcut(name: "Go to Utilities",        keys: "⌘+⇧+U",       description: "Opens /Applications/Utilities, where tools like Terminal and Disk Utility live."),
                Shortcut(name: "Go to folder…",          keys: "⌘+⇧+G",       description: "Shows a text field where you can type any absolute path to navigate there immediately."),
                Shortcut(name: "Connect to Server",      keys: "⌘+K",         description: "Opens the Connect to Server dialog for mounting network shares (SMB, AFP, NFS, etc.)."),
                Shortcut(name: "Back",                   keys: "⌘+[",         description: "Goes back to the previously viewed folder in the current window's history."),
                Shortcut(name: "Forward",                keys: "⌘+]",         description: "Goes forward after navigating back."),
                Shortcut(name: "Open parent folder",     keys: "⌘+↑",         description: "Navigates up one level to the enclosing folder."),
                Shortcut(name: "Open selected item",     keys: "⌘+↓",         description: "Opens the selected file or folder, same as double-clicking."),
                Shortcut(name: "iCloud Drive",           keys: "⌘+⇧+I",       description: "Takes you directly to your iCloud Drive folder."),
            ]),
            ShortcutCategory(name: "File Operations", shortcuts: [
                Shortcut(name: "New Finder window",      keys: "⌘+N",         description: "Opens a new Finder window at the default location (usually your Home folder)."),
                Shortcut(name: "New folder",             keys: "⌘+⇧+N",       description: "Creates a new untitled folder in the current directory, ready to be named."),
                Shortcut(name: "New folder from selection", keys: "⌘+⌃+N",    description: "Creates a new folder and automatically moves all selected files into it."),
                Shortcut(name: "Open",                   keys: "⌘+O",         description: "Opens the selected file with its default application, same as double-clicking."),
                Shortcut(name: "Get Info",               keys: "⌘+I",         description: "Opens the Info panel showing size, dates, permissions, and metadata for selected items."),
                Shortcut(name: "Duplicate",              keys: "⌘+D",         description: "Creates a copy of the selected file in the same folder, named with 'copy' appended."),
                Shortcut(name: "Make Alias",             keys: "⌘+L",         description: "Creates a shortcut (alias) that points to the original file; moving the alias won't break the link."),
                Shortcut(name: "Move to Trash",          keys: "⌘+⌫",         description: "Sends selected items to the Trash. They're not deleted until you empty the Trash."),
                Shortcut(name: "Empty Trash",            keys: "⌘+⇧+⌫",       description: "Permanently deletes all items in the Trash. This cannot be undone."),
                Shortcut(name: "Copy path to clipboard", keys: "⌘+⌥+C",       description: "Copies the full file path of the selected item to the clipboard as plain text."),
                Shortcut(name: "Move (after copy)",      keys: "⌘+⌥+V",       description: "After copying a file (⌘C), this pastes it at the destination and removes the original — effectively a move."),
                Shortcut(name: "Rename",                 keys: "Return",       description: "Puts the selected item's filename into edit mode so you can type a new name."),
                Shortcut(name: "Quick Look",             keys: "Space",        description: "Opens a full-size preview of the selected file without launching an app. Press Space again to close."),
            ]),
            ShortcutCategory(name: "View", shortcuts: [
                Shortcut(name: "Icon view",              keys: "⌘+1",         description: "Switches the current Finder window to icon (grid) view."),
                Shortcut(name: "List view",              keys: "⌘+2",         description: "Shows files as a sortable list with columns for name, size, date, etc."),
                Shortcut(name: "Column view",            keys: "⌘+3",         description: "Shows a multi-column browser where selecting a folder reveals its contents to the right."),
                Shortcut(name: "Gallery view",           keys: "⌘+4",         description: "Shows a large preview of the selected file at the top with thumbnails below."),
                Shortcut(name: "View options",           keys: "⌘+J",         description: "Opens a floating panel to configure icon size, grid spacing, text size, and sort order for this view."),
                Shortcut(name: "Show/hide toolbar",      keys: "⌘+⌥+T",       description: "Toggles the toolbar (with Back/Forward, view buttons, etc.) at the top of the Finder window."),
                Shortcut(name: "Show/hide sidebar",      keys: "⌘+⌥+S",       description: "Hides or shows the left sidebar with favorites, iCloud, and device shortcuts."),
                Shortcut(name: "Show/hide path bar",     keys: "⌘+⌥+P",       description: "Toggles the path bar at the bottom of the window showing the full folder hierarchy."),
                Shortcut(name: "Show hidden files",      keys: "⌘+⇧+.",       description: "Toggles visibility of hidden files and folders (those starting with a dot, like .DS_Store)."),
                Shortcut(name: "Show/hide status bar",   keys: "⌘+/",         description: "Toggles the status bar at the bottom showing item count and available disk space."),
            ]),
        ]
    )

    // MARK: - Safari

    static let safari = AppShortcuts(
        id: "Safari",
        appName: "Safari",
        icon: "safari.fill",
        bundleIdentifiers: ["com.apple.Safari"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Back",                   keys: "⌘+[",         description: "Goes to the previous page in the tab's browsing history."),
                Shortcut(name: "Forward",                keys: "⌘+]",         description: "Goes forward after navigating back."),
                Shortcut(name: "Reload page",            keys: "⌘+R",         description: "Reloads the current page, using cached resources where possible."),
                Shortcut(name: "Reload without cache",   keys: "⌘+⌥+R",       description: "Forces a full reload, bypassing all cached content to get the latest version of the page."),
                Shortcut(name: "Stop loading",           keys: "⌘+.",         description: "Cancels the current page load."),
                Shortcut(name: "Focus address bar",      keys: "⌘+L",         description: "Moves focus to the Smart Search field so you can type a URL or search query immediately."),
                Shortcut(name: "Find on page",           keys: "⌘+F",         description: "Opens the in-page search bar to find and highlight text on the current page."),
                Shortcut(name: "Scroll to top",          keys: "⌘+↑",         description: "Instantly scrolls the page back to the very top."),
                Shortcut(name: "Scroll to bottom",       keys: "⌘+↓",         description: "Instantly scrolls the page to the very bottom."),
            ]),
            ShortcutCategory(name: "Tabs", shortcuts: [
                Shortcut(name: "New tab",                keys: "⌘+T",         description: "Opens a new blank tab and focuses the address bar so you can start typing immediately."),
                Shortcut(name: "Close tab",              keys: "⌘+W",         description: "Closes the current tab. If it's the last tab, it closes the window."),
                Shortcut(name: "Reopen closed tab",      keys: "⌘+⇧+T",       description: "Reopens the most recently closed tab, restoring its page and history."),
                Shortcut(name: "Next tab",               keys: "⌘+⇧+]",       description: "Moves focus to the tab immediately to the right."),
                Shortcut(name: "Previous tab",           keys: "⌘+⇧+[",       description: "Moves focus to the tab immediately to the left."),
                Shortcut(name: "Tab by number",          keys: "⌘+1–9",       description: "Jumps directly to a tab by its position. ⌘1 = first tab, ⌘9 = last tab."),
                Shortcut(name: "Show tab overview",      keys: "⌘+⇧+\\",      description: "Opens the visual tab overview grid, showing all open tabs as thumbnails."),
                Shortcut(name: "Mute/unmute tab",        keys: "⌘+⌥+M",       description: "Silences or restores audio for the current tab."),
            ]),
            ShortcutCategory(name: "Bookmarks & Reading", shortcuts: [
                Shortcut(name: "Add bookmark",           keys: "⌘+D",         description: "Saves the current page as a bookmark. A dialog lets you choose the folder."),
                Shortcut(name: "Add to Reading List",    keys: "⌘+⇧+D",       description: "Saves the current page to your Reading List for offline reading later."),
                Shortcut(name: "Show Bookmarks",         keys: "⌘+⌥+1",       description: "Opens the Bookmarks sidebar on the left."),
                Shortcut(name: "Show Reading List",      keys: "⌘+⇧+L",       description: "Opens the Reading List sidebar showing saved articles."),
                Shortcut(name: "Show History",           keys: "⌘+Y",         description: "Opens the full browsing history list."),
                Shortcut(name: "Reader View",            keys: "⌘+⇧+R",       description: "Strips ads and clutter from the current article, showing just the text and images."),
                Shortcut(name: "Email page link",        keys: "⌘+I",         description: "Composes a new email with the current page's URL pre-filled in the body."),
            ]),
            ShortcutCategory(name: "View", shortcuts: [
                Shortcut(name: "Zoom in",                keys: "⌘++",         description: "Increases the page text and content size. Images scale proportionally."),
                Shortcut(name: "Zoom out",               keys: "⌘+-",         description: "Decreases the page text and content size."),
                Shortcut(name: "Actual size",            keys: "⌘+0",         description: "Resets zoom to 100%, the default display size."),
                Shortcut(name: "Show Web Inspector",     keys: "⌘+⌥+I",       description: "Opens Safari's built-in developer tools for inspecting HTML, CSS, and network requests."),
                Shortcut(name: "Show JavaScript Console",keys: "⌘+⌥+C",       description: "Opens the JavaScript console to view errors, warnings, and run JS commands."),
                Shortcut(name: "Enter Full Screen",      keys: "⌃+⌘+F",       description: "Expands Safari to fill the entire display, hiding the menu bar."),
            ]),
        ]
    )

    // MARK: - Chrome

    static let chrome = AppShortcuts(
        id: "Chrome",
        appName: "Chrome",
        icon: "globe",
        bundleIdentifiers: ["com.google.Chrome", "com.google.Chrome.canary", "com.brave.Browser", "com.brave.Browser.beta", "com.brave.Browser.nightly", "org.mozilla.firefox"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Back",                   keys: "⌘+[",         description: "Navigates to the previous page in the current tab's history."),
                Shortcut(name: "Forward",                keys: "⌘+]",         description: "Goes forward after navigating back."),
                Shortcut(name: "Reload",                 keys: "⌘+R",         description: "Reloads the current page using the browser cache."),
                Shortcut(name: "Hard reload",            keys: "⌘+⇧+R",       description: "Bypasses all cache and forces a complete fresh download of the page."),
                Shortcut(name: "Focus address bar",      keys: "⌘+L",         description: "Jumps focus to the Omnibox so you can type a URL or search query."),
                Shortcut(name: "Find on page",           keys: "⌘+F",         description: "Opens the Find toolbar to search and highlight text on the current page."),
                Shortcut(name: "Find next",              keys: "⌘+G",         description: "Jumps to the next occurrence of the search term."),
                Shortcut(name: "Scroll to top",          keys: "⌘+↑",         description: "Instantly scrolls to the top of the page."),
                Shortcut(name: "Scroll to bottom",       keys: "⌘+↓",         description: "Instantly scrolls to the bottom of the page."),
                Shortcut(name: "Open file",              keys: "⌘+O",         description: "Opens a file picker to load a local HTML, PDF, or image file in the browser."),
            ]),
            ShortcutCategory(name: "Tabs & Windows", shortcuts: [
                Shortcut(name: "New tab",                keys: "⌘+T",         description: "Opens a new tab and focuses the Omnibox."),
                Shortcut(name: "Close tab",              keys: "⌘+W",         description: "Closes the active tab. Closes the window if it's the last tab."),
                Shortcut(name: "Reopen closed tab",      keys: "⌘+⇧+T",       description: "Restores the most recently closed tab with its full history intact."),
                Shortcut(name: "Next tab",               keys: "⌃+Tab",       description: "Shifts focus one tab to the right."),
                Shortcut(name: "Previous tab",           keys: "⌃+⇧+Tab",     description: "Shifts focus one tab to the left."),
                Shortcut(name: "Tab by number",          keys: "⌘+1–8",       description: "Jumps directly to a specific tab by position (1 = leftmost)."),
                Shortcut(name: "Last tab",               keys: "⌘+9",         description: "Jumps to the rightmost open tab regardless of how many there are."),
                Shortcut(name: "New window",             keys: "⌘+N",         description: "Opens a new Chrome window."),
                Shortcut(name: "New Incognito window",   keys: "⌘+⇧+N",       description: "Opens a private browsing window that doesn't save history, cookies, or form data."),
                Shortcut(name: "Close window",           keys: "⌘+⇧+W",       description: "Closes the current Chrome window and all its tabs."),
            ]),
            ShortcutCategory(name: "Developer Tools", shortcuts: [
                Shortcut(name: "Open DevTools",          keys: "⌘+⌥+I",       description: "Opens Chrome DevTools, the built-in suite for inspecting and debugging web pages."),
                Shortcut(name: "Open Console",           keys: "⌘+⌥+J",       description: "Opens DevTools directly to the Console panel for JavaScript interaction and error viewing."),
                Shortcut(name: "Inspect element",        keys: "⌘+⌥+C",       description: "Activates the element picker so you can click any part of the page to inspect its HTML/CSS."),
                Shortcut(name: "View page source",       keys: "⌘+U",         description: "Opens the raw HTML source code of the current page in a new tab."),
            ]),
            ShortcutCategory(name: "Browser", shortcuts: [
                Shortcut(name: "History",                keys: "⌘+Y",         description: "Opens the full browsing history page."),
                Shortcut(name: "Downloads",              keys: "⌘+⇧+J",       description: "Opens the Downloads page listing all downloaded files."),
                Shortcut(name: "Bookmarks bar",          keys: "⌘+⇧+B",       description: "Toggles the bookmarks bar visible beneath the address bar."),
                Shortcut(name: "Bookmark manager",       keys: "⌘+⌥+B",       description: "Opens the Bookmark Manager page to organize, rename, and delete bookmarks."),
                Shortcut(name: "Settings",               keys: "⌘+,",         description: "Opens Chrome Settings."),
                Shortcut(name: "Print",                  keys: "⌘+P",         description: "Opens the Print dialog for the current page."),
                Shortcut(name: "Zoom in",                keys: "⌘++",         description: "Increases the page zoom level by 10%."),
                Shortcut(name: "Zoom out",               keys: "⌘+-",         description: "Decreases the page zoom level by 10%."),
                Shortcut(name: "Reset zoom",             keys: "⌘+0",         description: "Resets page zoom back to 100%."),
            ]),
        ]
    )

    // MARK: - VS Code

    static let vscode = AppShortcuts(
        id: "VS Code",
        appName: "VS Code",
        icon: "curlybraces",
        bundleIdentifiers: ["com.microsoft.VSCode", "com.microsoft.VSCodeInsiders"],
        categories: [
            ShortcutCategory(name: "General", shortcuts: [
                Shortcut(name: "Command Palette",        keys: "⌘+⇧+P",       description: "Opens the Command Palette — the fastest way to run any VS Code command by typing its name."),
                Shortcut(name: "Quick open file",        keys: "⌘+P",         description: "Opens the Quick Open file picker. Type a filename to jump to it instantly."),
                Shortcut(name: "Open settings",          keys: "⌘+,",         description: "Opens the Settings editor UI. Hold ⌘ and press , (comma)."),
                Shortcut(name: "Keyboard shortcuts",     keys: "⌘+K  ⌘+S",   description: "Opens the Keyboard Shortcuts editor to view and rebind any command."),
                Shortcut(name: "Open new window",        keys: "⌘+⇧+N",       description: "Launches a new VS Code window, independent of the current one."),
                Shortcut(name: "Close window",           keys: "⌘+⇧+W",       description: "Closes the active VS Code window."),
                Shortcut(name: "Zoom in",                keys: "⌘+=",         description: "Increases the editor font size and UI zoom level."),
                Shortcut(name: "Zoom out",               keys: "⌘+-",         description: "Decreases the editor font size and UI zoom level."),
            ]),
            ShortcutCategory(name: "Editing", shortcuts: [
                Shortcut(name: "Select next occurrence", keys: "⌘+D",         description: "Selects the word at cursor; each subsequent press adds the next matching word to a multi-cursor selection."),
                Shortcut(name: "Select all occurrences", keys: "⌘+⇧+L",       description: "Immediately selects every occurrence of the current selection as a multi-cursor, letting you edit them all at once."),
                Shortcut(name: "Toggle comment",         keys: "⌘+/",         description: "Comments or uncomments the selected lines using the language's line-comment syntax."),
                Shortcut(name: "Block comment",          keys: "⌘+⌥+/",       description: "Wraps the selection in a block comment (e.g. /* ... */ in JS)."),
                Shortcut(name: "Move line up",           keys: "⌥+↑",         description: "Moves the current line (or selected lines) up by one line without cut/paste."),
                Shortcut(name: "Move line down",         keys: "⌥+↓",         description: "Moves the current line (or selected lines) down by one line."),
                Shortcut(name: "Copy line up",           keys: "⌥+⇧+↑",       description: "Duplicates the current line(s) and inserts the copy above."),
                Shortcut(name: "Copy line down",         keys: "⌥+⇧+↓",       description: "Duplicates the current line(s) and inserts the copy below."),
                Shortcut(name: "Delete line",            keys: "⌘+⇧+K",       description: "Deletes the entire current line without leaving an empty line behind."),
                Shortcut(name: "Insert line below",      keys: "⌘+Return",    description: "Inserts a new blank line below the current line and moves the cursor there, regardless of cursor position."),
                Shortcut(name: "Insert line above",      keys: "⌘+⇧+Return",  description: "Inserts a new blank line above the current line and moves the cursor there."),
                Shortcut(name: "Format document",        keys: "⌥+⇧+F",       description: "Runs the configured code formatter on the entire document."),
                Shortcut(name: "Fold region",            keys: "⌘+⌥+[",       description: "Collapses the code block at the cursor (function, class, etc.) into a single line."),
                Shortcut(name: "Unfold region",          keys: "⌘+⌥+]",       description: "Expands a previously folded code region."),
                Shortcut(name: "Add cursor above",       keys: "⌘+⌥+↑",       description: "Adds an additional cursor on the line above, enabling simultaneous editing on multiple lines."),
                Shortcut(name: "Add cursor below",       keys: "⌘+⌥+↓",       description: "Adds an additional cursor on the line below for multi-line simultaneous editing."),
                Shortcut(name: "Rename symbol",          keys: "F2",           description: "Renames the symbol under the cursor across all files in the workspace."),
            ]),
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Go to line",             keys: "⌃+G",         description: "Opens a prompt where you type a line number to jump directly to it."),
                Shortcut(name: "Go to symbol in file",   keys: "⌘+⇧+O",       description: "Opens a fuzzy-search list of all symbols (functions, classes, etc.) in the current file."),
                Shortcut(name: "Go to definition",       keys: "F12",          description: "Jumps to where the symbol under the cursor is defined, even across files."),
                Shortcut(name: "Peek definition",        keys: "⌥+F12",        description: "Shows the definition in an inline peek window without leaving the current file."),
                Shortcut(name: "Go to implementation",   keys: "⌘+F12",        description: "Navigates to the concrete implementation of an interface or abstract method."),
                Shortcut(name: "Back",                   keys: "⌃+-",         description: "Goes back to your previous cursor location, like a browser back button for code."),
                Shortcut(name: "Forward",                keys: "⌃+⇧+-",       description: "Goes forward in cursor location history after navigating back."),
                Shortcut(name: "Go to matching bracket", keys: "⌘+⇧+\\",      description: "Jumps the cursor to the matching opening or closing bracket/brace/parenthesis."),
                Shortcut(name: "Next editor",            keys: "⌘+⌥+→",       description: "Moves focus to the next open editor tab."),
                Shortcut(name: "Previous editor",        keys: "⌘+⌥+←",       description: "Moves focus to the previous open editor tab."),
            ]),
            ShortcutCategory(name: "Search", shortcuts: [
                Shortcut(name: "Find",                   keys: "⌘+F",         description: "Opens the in-file search bar to find text in the current editor."),
                Shortcut(name: "Replace",                keys: "⌘+H",         description: "Opens the find-and-replace bar to substitute text in the current file."),
                Shortcut(name: "Find in files",          keys: "⌘+⇧+F",       description: "Opens the global Search panel to find text across all files in the workspace."),
                Shortcut(name: "Replace in files",       keys: "⌘+⇧+H",       description: "Opens global search-and-replace across all files in the workspace."),
                Shortcut(name: "Find next",              keys: "⌘+G",         description: "Jumps to the next search match."),
                Shortcut(name: "Find previous",          keys: "⌘+⇧+G",       description: "Jumps to the previous search match."),
            ]),
            ShortcutCategory(name: "View & Panels", shortcuts: [
                Shortcut(name: "Toggle sidebar",         keys: "⌘+B",         description: "Shows or hides the Activity Bar sidebar (Explorer, Git, Extensions, etc.)."),
                Shortcut(name: "Toggle panel",           keys: "⌘+J",         description: "Shows or hides the bottom panel containing Terminal, Output, Problems, and Debug Console."),
                Shortcut(name: "Explorer",               keys: "⌘+⇧+E",       description: "Opens the Explorer sidebar showing your file tree."),
                Shortcut(name: "Source control",         keys: "⌘+⇧+G",       description: "Opens the Source Control sidebar showing Git changes, staged files, and commit controls."),
                Shortcut(name: "Extensions",             keys: "⌘+⇧+X",       description: "Opens the Extensions marketplace sidebar to browse, install, and manage extensions."),
                Shortcut(name: "Run & Debug",            keys: "⌘+⇧+D",       description: "Opens the Run and Debug sidebar for managing launch configurations."),
                Shortcut(name: "Toggle terminal",        keys: "⌃+`",         description: "Shows or hides the integrated terminal panel. Opens a new one if none exists."),
                Shortcut(name: "New terminal",           keys: "⌃+⇧+`",       description: "Creates a new integrated terminal instance alongside any existing ones."),
                Shortcut(name: "Split editor",           keys: "⌘+\\",        description: "Splits the current editor pane vertically, opening the same or a different file side-by-side."),
            ]),
            ShortcutCategory(name: "Debug", shortcuts: [
                Shortcut(name: "Start / Continue",       keys: "F5",           description: "Starts the debugger using the current launch configuration, or resumes from a breakpoint."),
                Shortcut(name: "Stop",                   keys: "⇧+F5",         description: "Terminates the current debug session."),
                Shortcut(name: "Toggle breakpoint",      keys: "F9",           description: "Adds or removes a breakpoint on the current line."),
                Shortcut(name: "Step over",              keys: "F10",          description: "Executes the current line and pauses on the next one, stepping over function calls."),
                Shortcut(name: "Step into",              keys: "F11",          description: "Steps into the function call on the current line to debug inside it."),
                Shortcut(name: "Step out",               keys: "⇧+F11",        description: "Finishes executing the current function and pauses back in the caller."),
                Shortcut(name: "Restart",                keys: "⌘+⇧+F5",       description: "Restarts the debug session from the beginning without reconfiguring."),
            ]),
        ]
    )

    // MARK: - Terminal

    static let terminal = AppShortcuts(
        id: "Terminal",
        appName: "Terminal",
        icon: "terminal.fill",
        bundleIdentifiers: ["com.apple.Terminal"],
        categories: [
            ShortcutCategory(name: "Window & Tabs", shortcuts: [
                Shortcut(name: "New window",             keys: "⌘+N",         description: "Opens a new Terminal window with a fresh shell session."),
                Shortcut(name: "New tab",                keys: "⌘+T",         description: "Opens a new tab inside the current Terminal window."),
                Shortcut(name: "Close tab",              keys: "⌘+W",         description: "Closes the current tab. If a process is running, Terminal prompts before closing."),
                Shortcut(name: "Next tab",               keys: "⌘+⇧+]",       description: "Moves to the tab to the right."),
                Shortcut(name: "Previous tab",           keys: "⌘+⇧+[",       description: "Moves to the tab to the left."),
                Shortcut(name: "Clear screen",           keys: "⌘+K",         description: "Clears the entire terminal scrollback buffer, giving you a clean blank screen."),
                Shortcut(name: "Find",                   keys: "⌘+F",         description: "Opens a find bar to search the terminal's scrollback buffer."),
                Shortcut(name: "Zoom",                   keys: "⌘+⌥+Return",  description: "Toggles the terminal window between its normal size and full screen."),
            ]),
            ShortcutCategory(name: "Shell Control", shortcuts: [
                Shortcut(name: "Interrupt (SIGINT)",     keys: "⌃+C",         description: "Sends SIGINT to the foreground process, stopping it immediately. The most common way to cancel a running command."),
                Shortcut(name: "Suspend (SIGTSTP)",      keys: "⌃+Z",         description: "Pauses (suspends) the current process and returns you to the shell prompt. Use 'fg' to resume it."),
                Shortcut(name: "EOF / Exit",             keys: "⌃+D",         description: "Sends an end-of-file signal. Exits the current shell or closes an interactive program reading from stdin."),
                Shortcut(name: "Clear screen",           keys: "⌃+L",         description: "Clears visible screen output (like running 'clear'), but scrollback history is preserved."),
                Shortcut(name: "Previous command",       keys: "⌃+P",         description: "Scrolls up through command history (same as pressing the Up arrow)."),
                Shortcut(name: "Next command",           keys: "⌃+N",         description: "Scrolls down through command history (same as pressing the Down arrow)."),
                Shortcut(name: "Search history",         keys: "⌃+R",         description: "Opens reverse-interactive search through command history. Type to filter; press ⌃R again for the next match."),
            ]),
            ShortcutCategory(name: "Line Editing", shortcuts: [
                Shortcut(name: "Beginning of line",      keys: "⌃+A",         description: "Moves the cursor to the start of the current input line."),
                Shortcut(name: "End of line",            keys: "⌃+E",         description: "Moves the cursor to the end of the current input line."),
                Shortcut(name: "Move back one word",     keys: "⌥+←",         description: "Moves the cursor back one word at a time."),
                Shortcut(name: "Move forward one word",  keys: "⌥+→",         description: "Moves the cursor forward one word at a time."),
                Shortcut(name: "Delete to start of line",keys: "⌃+U",         description: "Deletes all text from the cursor back to the beginning of the line (stored in the kill ring)."),
                Shortcut(name: "Delete to end of line",  keys: "⌃+K",         description: "Deletes all text from the cursor to the end of the line (stored in the kill ring)."),
                Shortcut(name: "Delete word back",       keys: "⌃+W",         description: "Deletes the word immediately before the cursor."),
                Shortcut(name: "Paste last deleted",     keys: "⌃+Y",         description: "Pastes (yanks) the most recently killed text back at the cursor — useful after ⌃U or ⌃K."),
                Shortcut(name: "Transpose chars",        keys: "⌃+T",         description: "Swaps the character before the cursor with the one under it — handy for fixing typos."),
            ]),
        ]
    )

    // MARK: - Xcode

    static let xcode = AppShortcuts(
        id: "Xcode",
        appName: "Xcode",
        icon: "hammer.fill",
        bundleIdentifiers: ["com.apple.dt.Xcode"],
        categories: [
            ShortcutCategory(name: "Build & Run", shortcuts: [
                Shortcut(name: "Build",                  keys: "⌘+B",         description: "Compiles the current scheme's target(s). Errors and warnings appear in the Issue Navigator."),
                Shortcut(name: "Run",                    keys: "⌘+R",         description: "Builds and launches the app in the selected simulator or connected device."),
                Shortcut(name: "Test",                   keys: "⌘+U",         description: "Runs all unit and UI tests for the current scheme."),
                Shortcut(name: "Stop",                   keys: "⌘+.",         description: "Terminates the running app or cancels an in-progress build."),
                Shortcut(name: "Clean build folder",     keys: "⌘+⇧+K",       description: "Deletes all derived data for the project, forcing a full rebuild next time. Useful for resolving mysterious build errors."),
                Shortcut(name: "Build for testing",      keys: "⌘+⇧+U",       description: "Compiles the test target without running tests — useful for CI pre-build steps."),
                Shortcut(name: "Analyze",                keys: "⌘+⇧+B",       description: "Runs the Clang static analyzer to detect potential bugs like memory leaks and nil dereferences."),
                Shortcut(name: "Profile",                keys: "⌘+I",         description: "Builds and launches the app in Instruments for performance, memory, and energy profiling."),
            ]),
            ShortcutCategory(name: "Editing", shortcuts: [
                Shortcut(name: "Toggle comment",         keys: "⌘+/",         description: "Comments or uncomments the selected lines."),
                Shortcut(name: "Re-indent",              keys: "⌃+I",         description: "Reformats the indentation of the selected code according to Xcode's style settings."),
                Shortcut(name: "Move line up",           keys: "⌘+⌥+[",       description: "Moves the current line up by one line."),
                Shortcut(name: "Move line down",         keys: "⌘+⌥+]",       description: "Moves the current line down by one line."),
                Shortcut(name: "Show completions",       keys: "⌃+Space",     description: "Manually triggers the autocomplete suggestions popup at the current cursor position."),
                Shortcut(name: "Fold method/function",   keys: "⌘+⌥+←",       description: "Collapses the function or block at the cursor into a single line."),
                Shortcut(name: "Unfold method/function", keys: "⌘+⌥+→",       description: "Expands a collapsed function or block."),
                Shortcut(name: "Fold all methods",       keys: "⌘+⌥+⇧+←",     description: "Collapses every function and method in the current file simultaneously."),
                Shortcut(name: "Show callers",           keys: "⌃+1",         description: "Shows a popup menu with all call sites for the symbol under the cursor."),
            ]),
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Open quickly",           keys: "⌘+⇧+O",       description: "Opens the Quick Open dialog — type any file, symbol, or class name to jump to it instantly."),
                Shortcut(name: "Jump to definition",     keys: "⌃+⌘+J",       description: "Navigates to the declaration of the symbol under the cursor."),
                Shortcut(name: "Back",                   keys: "⌃+⌘+←",       description: "Goes back to the previous location in your navigation history."),
                Shortcut(name: "Forward",                keys: "⌃+⌘+→",       description: "Goes forward in navigation history after going back."),
                Shortcut(name: "Go to line",             keys: "⌘+L",         description: "Shows a prompt to jump to a specific line number in the current file."),
                Shortcut(name: "Find in file",           keys: "⌘+F",         description: "Opens the in-file search bar."),
                Shortcut(name: "Find in project",        keys: "⌘+⇧+F",       description: "Opens the Find Navigator to search across all files in the project."),
                Shortcut(name: "Navigator: Project",     keys: "⌘+1",         description: "Switches the left Navigator to the Project file tree."),
                Shortcut(name: "Navigator: Source Control",keys: "⌘+2",       description: "Switches to the Source Control Navigator showing Git changes."),
                Shortcut(name: "Navigator: Issues",      keys: "⌘+5",         description: "Switches to the Issue Navigator listing all errors and warnings."),
                Shortcut(name: "Navigator: Debug",       keys: "⌘+7",         description: "Switches to the Debug Navigator showing thread and queue state during a debug session."),
            ]),
            ShortcutCategory(name: "Debug", shortcuts: [
                Shortcut(name: "Continue",               keys: "⌃+⌘+Y",       description: "Resumes program execution after being paused at a breakpoint."),
                Shortcut(name: "Step over",              keys: "F6",           description: "Executes the current line and stops at the next one, treating function calls as single steps."),
                Shortcut(name: "Step into",              keys: "F7",           description: "Steps inside a function call on the current line to debug it line by line."),
                Shortcut(name: "Step out",               keys: "F8",           description: "Runs the rest of the current function and pauses at the next line of the caller."),
                Shortcut(name: "Toggle breakpoint",      keys: "⌘+\\",        description: "Adds a breakpoint at the current line, or removes one if it already exists there."),
                Shortcut(name: "Activate breakpoints",   keys: "⌘+Y",         description: "Globally enables or disables all breakpoints at once without deleting them."),
                Shortcut(name: "Show debug area",        keys: "⌘+⇧+Y",       description: "Shows or hides the debug area at the bottom with the console and variable inspector."),
            ]),
        ]
    )

    // MARK: - Slack

    static let slack = AppShortcuts(
        id: "Slack",
        appName: "Slack",
        icon: "bubble.left.and.bubble.right.fill",
        bundleIdentifiers: ["com.tinyspeck.slackmacgap"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Quick switcher",         keys: "⌘+K",         description: "Opens the Quick Switcher to jump to any channel, DM, or workspace by typing its name."),
                Shortcut(name: "Search",                 keys: "⌘+G",         description: "Focuses the global search box to find messages, files, and people across all workspaces."),
                Shortcut(name: "All unreads",            keys: "⌘+⇧+A",       description: "Opens the All Unreads view showing every unread message from all channels in one feed."),
                Shortcut(name: "Direct messages",        keys: "⌘+⇧+K",       description: "Opens the Direct Messages list."),
                Shortcut(name: "Threads",                keys: "⌘+⇧+T",       description: "Opens the Threads view showing all threads you're following or participating in."),
                Shortcut(name: "Next unread",            keys: "⌥+⇧+↓",       description: "Jumps to the next channel or DM that has unread messages."),
                Shortcut(name: "Previous channel/DM",    keys: "⌥+↑",         description: "Navigates to the previous channel or DM in the sidebar list."),
                Shortcut(name: "Next channel/DM",        keys: "⌥+↓",         description: "Navigates to the next channel or DM in the sidebar list."),
                Shortcut(name: "Back",                   keys: "⌘+[",         description: "Goes back to the previously viewed channel or conversation."),
                Shortcut(name: "Forward",                keys: "⌘+]",         description: "Goes forward after navigating back."),
                Shortcut(name: "Preferences",            keys: "⌘+,",         description: "Opens Slack Preferences."),
            ]),
            ShortcutCategory(name: "Messaging", shortcuts: [
                Shortcut(name: "New message",            keys: "⌘+N",         description: "Opens the New Message composer to start a DM or message in any channel."),
                Shortcut(name: "Edit last message",      keys: "↑",           description: "When the compose box is empty, pressing Up edits your most recent sent message."),
                Shortcut(name: "Add reaction (last msg)",keys: "⌘+⇧+\\",      description: "Opens the emoji picker to add a reaction to the most recent message in the channel."),
                Shortcut(name: "Mark as unread",         keys: "⌘+⌥+M",       description: "Marks the current channel as unread from the selected message so you remember to come back."),
                Shortcut(name: "Create snippet",         keys: "⌘+⇧+Return",  description: "Opens the code snippet composer for sharing formatted, syntax-highlighted code blocks."),
            ]),
            ShortcutCategory(name: "Formatting", shortcuts: [
                Shortcut(name: "Bold",                   keys: "⌘+B",         description: "Wraps selected text in *asterisks* to make it bold."),
                Shortcut(name: "Italic",                 keys: "⌘+I",         description: "Wraps selected text in _underscores_ to make it italic."),
                Shortcut(name: "Strikethrough",          keys: "⌘+⇧+X",       description: "Wraps selected text in ~tildes~ to render it with a strikethrough."),
                Shortcut(name: "Inline code",            keys: "⌘+⇧+C",       description: "Wraps selected text in backticks to format it as inline monospace code."),
                Shortcut(name: "Code block",             keys: "⌘+⌥+⇧+C",     description: "Wraps selected text in triple backticks to format it as a multi-line code block."),
                Shortcut(name: "Block quote",            keys: "⌘+⇧+9",       description: "Formats the selected text as a block quote with a vertical bar on the left."),
                Shortcut(name: "Ordered list",           keys: "⌘+⇧+7",       description: "Formats selected lines as a numbered list."),
                Shortcut(name: "Bulleted list",          keys: "⌘+⇧+8",       description: "Formats selected lines as a bulleted list."),
            ]),
            ShortcutCategory(name: "Calls", shortcuts: [
                Shortcut(name: "Toggle mute",            keys: "⌘+D",         description: "Mutes or unmutes your microphone during an active Slack call."),
                Shortcut(name: "Toggle video",           keys: "⌘+⇧+V",       description: "Turns your camera on or off during an active Slack call."),
                Shortcut(name: "Share screen",           keys: "⌘+⇧+S",       description: "Starts or stops screen sharing during an active call."),
                Shortcut(name: "Invite to call",         keys: "⌘+⇧+P",       description: "Opens the invite panel to add more people to the current call."),
                Shortcut(name: "End call",               keys: "⌘+⇧+H",       description: "Hangs up and ends the current Slack call."),
            ]),
        ]
    )

    // MARK: - Arc

    static let arc = AppShortcuts(
        id: "Arc",
        appName: "Arc",
        icon: "theatermask.and.paintbrush",
        bundleIdentifiers: ["company.thebrowser.Browser"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Focus address bar",      keys: "⌘+L",         description: "Focuses the address bar so you can type a URL or search."),
                Shortcut(name: "Back",                   keys: "⌘+[",         description: "Navigates to the previous page in history."),
                Shortcut(name: "Forward",                keys: "⌘+]",         description: "Navigates forward after going back."),
                Shortcut(name: "Reload",                 keys: "⌘+R",         description: "Reloads the current page."),
                Shortcut(name: "Find on page",           keys: "⌘+F",         description: "Opens the in-page search bar."),
            ]),
            ShortcutCategory(name: "Tabs & Spaces", shortcuts: [
                Shortcut(name: "New tab",                keys: "⌘+T",         description: "Opens a new tab in the current Space."),
                Shortcut(name: "Close tab",              keys: "⌘+W",         description: "Closes the active tab."),
                Shortcut(name: "Reopen closed tab",      keys: "⌘+⇧+T",       description: "Restores the most recently closed tab."),
                Shortcut(name: "Command Bar",            keys: "⌘+⇧+C",       description: "Opens Arc's Command Bar — search tabs, history, and run commands."),
                Shortcut(name: "Switch to Space 1–5",    keys: "⌃+1–5",       description: "Jumps directly to a numbered Space."),
                Shortcut(name: "Previous Space",         keys: "⌘+⌥+←",       description: "Moves to the Space to the left."),
                Shortcut(name: "Next Space",             keys: "⌘+⌥+→",       description: "Moves to the Space to the right."),
                Shortcut(name: "Move tab to Space",      keys: "⌘+⇧+M",       description: "Opens a picker to move the current tab to a different Space."),
            ]),
            ShortcutCategory(name: "Sidebar & View", shortcuts: [
                Shortcut(name: "Toggle sidebar",         keys: "⌘+S",         description: "Shows or hides the Arc sidebar."),
                Shortcut(name: "Library",                keys: "⌘+⇧+L",       description: "Opens the Library panel showing Easels, Notes, and downloads."),
                Shortcut(name: "New Easel",              keys: "⌘+⇧+E",       description: "Creates a new Easel (visual canvas) in the current Space."),
                Shortcut(name: "New Note",               keys: "⌘+⇧+N",       description: "Creates a new Arc Note."),
                Shortcut(name: "Split view",             keys: "⌃+⇧+→",       description: "Opens the current page alongside another tab in a split view."),
                Shortcut(name: "Zoom in",                keys: "⌘++",         description: "Increases page zoom."),
                Shortcut(name: "Zoom out",               keys: "⌘+-",         description: "Decreases page zoom."),
                Shortcut(name: "Reset zoom",             keys: "⌘+0",         description: "Resets page zoom to 100%."),
            ]),
        ]
    )

    // MARK: - Cursor

    static let cursor = AppShortcuts(
        id: "Cursor",
        appName: "Cursor",
        icon: "sparkles",
        bundleIdentifiers: ["com.todesktop.230313mzl4w4u92"],
        categories: [
            ShortcutCategory(name: "AI Features", shortcuts: [
                Shortcut(name: "AI Edit (Cmd K)",        keys: "⌘+K",         description: "Opens an inline AI prompt to generate or edit code at the cursor position."),
                Shortcut(name: "AI Chat",                keys: "⌘+L",         description: "Opens the AI Chat panel to ask questions about your code or get suggestions."),
                Shortcut(name: "Chat with selection",    keys: "⌘+⇧+L",       description: "Opens AI Chat with the current selection pre-quoted as context."),
                Shortcut(name: "Inline AI edit",         keys: "⌘+I",         description: "Triggers an inline AI edit of the selected code block."),
                Shortcut(name: "Agent mode",             keys: "⌘+⇧+I",       description: "Enables Composer Agent mode — AI autonomously edits across multiple files."),
                Shortcut(name: "Accept suggestion",      keys: "Tab",          description: "Accepts the current AI inline suggestion."),
                Shortcut(name: "Dismiss suggestion",     keys: "⎋",           description: "Dismisses the current AI inline suggestion."),
            ]),
            ShortcutCategory(name: "General", shortcuts: [
                Shortcut(name: "Command Palette",        keys: "⌘+⇧+P",       description: "Opens the Command Palette to run any editor command."),
                Shortcut(name: "Quick open file",        keys: "⌘+P",         description: "Opens the Quick Open picker to jump to any file."),
                Shortcut(name: "Toggle terminal",        keys: "⌃+`",         description: "Shows or hides the integrated terminal."),
                Shortcut(name: "Toggle sidebar",         keys: "⌘+B",         description: "Shows or hides the activity bar sidebar."),
                Shortcut(name: "Find in files",          keys: "⌘+⇧+F",       description: "Opens the global search panel across all files."),
            ]),
            ShortcutCategory(name: "Editing", shortcuts: [
                Shortcut(name: "Toggle comment",         keys: "⌘+/",         description: "Comments or uncomments the selected lines."),
                Shortcut(name: "Move line up",           keys: "⌥+↑",         description: "Moves the current line up."),
                Shortcut(name: "Move line down",         keys: "⌥+↓",         description: "Moves the current line down."),
                Shortcut(name: "Select next occurrence", keys: "⌘+D",         description: "Adds the next matching word to the multi-cursor selection."),
                Shortcut(name: "Format document",        keys: "⌥+⇧+F",       description: "Formats the entire document with the configured formatter."),
                Shortcut(name: "Go to definition",       keys: "F12",          description: "Jumps to where the symbol under the cursor is defined."),
                Shortcut(name: "Rename symbol",          keys: "F2",           description: "Renames the symbol under the cursor across the entire workspace."),
            ]),
        ]
    )

    // MARK: - Figma

    static let figma = AppShortcuts(
        id: "Figma",
        appName: "Figma",
        icon: "square.on.circle",
        bundleIdentifiers: ["com.figma.Desktop"],
        categories: [
            ShortcutCategory(name: "Tools", shortcuts: [
                Shortcut(name: "Select / Move",          keys: "V",            description: "Activates the Move tool to select and reposition elements."),
                Shortcut(name: "Scale",                  keys: "K",            description: "Activates the Scale tool to resize elements proportionally."),
                Shortcut(name: "Frame",                  keys: "F",            description: "Draws a Frame — the primary container for components and screens."),
                Shortcut(name: "Rectangle",              keys: "R",            description: "Draws a rectangle shape."),
                Shortcut(name: "Ellipse",                keys: "E",            description: "Draws an ellipse or circle (hold Shift for perfect circle)."),
                Shortcut(name: "Line",                   keys: "L",            description: "Draws a straight line."),
                Shortcut(name: "Pen",                    keys: "P",            description: "Activates the Pen tool for drawing custom vector paths."),
                Shortcut(name: "Text",                   keys: "T",            description: "Activates the Text tool. Click to create a text layer."),
                Shortcut(name: "Hand / Pan",             keys: "H",            description: "Activates the Hand tool for panning the canvas without selecting anything."),
                Shortcut(name: "Comment",                keys: "C",            description: "Activates the Comment tool to add annotations to the design."),
            ]),
            ShortcutCategory(name: "Edit", shortcuts: [
                Shortcut(name: "Undo",                   keys: "⌘+Z",         description: "Reverses the last action."),
                Shortcut(name: "Redo",                   keys: "⌘+⇧+Z",       description: "Re-applies the last undone action."),
                Shortcut(name: "Duplicate",              keys: "⌘+D",         description: "Creates a duplicate of the selection and offsets it slightly."),
                Shortcut(name: "Copy",                   keys: "⌘+C",         description: "Copies selected layers."),
                Shortcut(name: "Paste",                  keys: "⌘+V",         description: "Pastes copied layers."),
                Shortcut(name: "Paste in place",         keys: "⌘+⇧+V",       description: "Pastes layers at their original position."),
                Shortcut(name: "Group selection",        keys: "⌘+G",         description: "Groups all selected layers into a new Group layer."),
                Shortcut(name: "Ungroup",                keys: "⌘+⇧+G",       description: "Ungroups the selected Group, releasing its children."),
                Shortcut(name: "Create component",       keys: "⌘+⌥+K",       description: "Turns the selected layers into a reusable Component."),
                Shortcut(name: "Detach instance",        keys: "⌘+⌥+B",       description: "Detaches a component instance so it can be edited independently."),
            ]),
            ShortcutCategory(name: "Arrange", shortcuts: [
                Shortcut(name: "Send to back",           keys: "⌘+[",         description: "Sends the selected layer to the very back of the stack."),
                Shortcut(name: "Bring to front",         keys: "⌘+]",         description: "Brings the selected layer to the very front."),
                Shortcut(name: "Send backward",          keys: "⌘+⌥+[",       description: "Moves the selected layer one step backward in the stack."),
                Shortcut(name: "Bring forward",          keys: "⌘+⌥+]",       description: "Moves the selected layer one step forward in the stack."),
                Shortcut(name: "Flip horizontal",        keys: "⇧+H",         description: "Flips the selected layer horizontally."),
                Shortcut(name: "Flip vertical",          keys: "⇧+V",         description: "Flips the selected layer vertically."),
            ]),
            ShortcutCategory(name: "View", shortcuts: [
                Shortcut(name: "Zoom in",                keys: "⌘++",         description: "Zooms the canvas in."),
                Shortcut(name: "Zoom out",               keys: "⌘+-",         description: "Zooms the canvas out."),
                Shortcut(name: "Fit selection",          keys: "⌘+⇧+H",       description: "Zooms to fit the current selection in the viewport."),
                Shortcut(name: "Zoom to 100%",           keys: "⌘+0",         description: "Resets canvas zoom to 100%."),
                Shortcut(name: "Toggle UI chrome",       keys: "⌘+\\",        description: "Hides or shows all Figma panels and toolbars for a clean canvas view."),
                Shortcut(name: "Toggle layers panel",    keys: "⌘+⌥+1",       description: "Shows or hides the Layers panel on the left."),
                Shortcut(name: "Toggle assets panel",    keys: "⌘+⌥+2",       description: "Shows or hides the Assets panel (components, styles, etc.)."),
                Shortcut(name: "Toggle rulers",          keys: "⌘+⇧+R",       description: "Shows or hides the rulers along the canvas edges."),
                Shortcut(name: "Toggle grid",            keys: "⌘+'",         description: "Shows or hides the layout grid on selected frames."),
            ]),
        ]
    )

    // MARK: - Notion

    static let notion = AppShortcuts(
        id: "Notion",
        appName: "Notion",
        icon: "note.text",
        bundleIdentifiers: ["notion.id"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Quick search",           keys: "⌘+P",         description: "Opens the Quick Find dialog to jump to any page in your workspace."),
                Shortcut(name: "Back",                   keys: "⌘+[",         description: "Navigates to the previous page."),
                Shortcut(name: "Forward",                keys: "⌘+]",         description: "Navigates forward after going back."),
                Shortcut(name: "New page",               keys: "⌘+N",         description: "Creates a new page in the current location."),
                Shortcut(name: "Toggle dark mode",       keys: "⌘+⇧+L",       description: "Switches between light and dark mode."),
                Shortcut(name: "Toggle sidebar",         keys: "⌘+\\",        description: "Shows or hides the left sidebar."),
            ]),
            ShortcutCategory(name: "Formatting", shortcuts: [
                Shortcut(name: "Bold",                   keys: "⌘+B",         description: "Makes the selected text bold."),
                Shortcut(name: "Italic",                 keys: "⌘+I",         description: "Makes the selected text italic."),
                Shortcut(name: "Underline",              keys: "⌘+U",         description: "Underlines the selected text."),
                Shortcut(name: "Strikethrough",          keys: "⌘+⇧+S",       description: "Adds a strikethrough to the selected text."),
                Shortcut(name: "Inline code",            keys: "⌘+E",         description: "Formats the selected text as inline code."),
                Shortcut(name: "Link",                   keys: "⌘+K",         description: "Opens the link dialog to add or edit a hyperlink on selected text."),
                Shortcut(name: "Comment",                keys: "⌘+⇧+M",       description: "Adds a comment to the selected text."),
            ]),
            ShortcutCategory(name: "Blocks", shortcuts: [
                Shortcut(name: "Block menu",             keys: "/",            description: "Opens the slash command menu to insert any type of block."),
                Shortcut(name: "Heading 1",              keys: "⌘+⌥+1",       description: "Converts the current block to a large Heading 1."),
                Shortcut(name: "Heading 2",              keys: "⌘+⌥+2",       description: "Converts the current block to a medium Heading 2."),
                Shortcut(name: "Heading 3",              keys: "⌘+⌥+3",       description: "Converts the current block to a small Heading 3."),
                Shortcut(name: "Bulleted list",          keys: "⌘+⇧+8",       description: "Converts the current block to a bulleted list item."),
                Shortcut(name: "Numbered list",          keys: "⌘+⇧+7",       description: "Converts the current block to a numbered list item."),
                Shortcut(name: "To-do",                  keys: "⌘+⇧+9",       description: "Converts the current block to a checkbox to-do item."),
                Shortcut(name: "Toggle block",           keys: "⌘+⇧+Return",  description: "Converts the current block to a collapsible toggle."),
                Shortcut(name: "Duplicate block",        keys: "⌘+D",         description: "Duplicates the selected block."),
                Shortcut(name: "Move block up",          keys: "⌘+⇧+↑",       description: "Moves the selected block up above the previous one."),
                Shortcut(name: "Move block down",        keys: "⌘+⇧+↓",       description: "Moves the selected block down below the next one."),
            ]),
        ]
    )

    // MARK: - Photoshop

    static let photoshop = AppShortcuts(
        id: "Photoshop",
        appName: "Photoshop",
        icon: "paintbrush.fill",
        bundleIdentifiers: ["com.adobe.Photoshop"],
        categories: [
            ShortcutCategory(name: "Tools", shortcuts: [
                Shortcut(name: "Move tool",              keys: "V",            description: "Selects the Move tool to reposition layers, selections, and guides."),
                Shortcut(name: "Marquee selection",      keys: "M",            description: "Activates the Marquee selection tools. Press M again to cycle between rectangular and elliptical."),
                Shortcut(name: "Lasso tools",            keys: "L",            description: "Activates the Lasso selection tools. Press L again to cycle through Lasso, Polygonal, and Magnetic."),
                Shortcut(name: "Quick Selection / Wand", keys: "W",            description: "Activates Quick Selection or Magic Wand for selecting by color and edge."),
                Shortcut(name: "Crop tool",              keys: "C",            description: "Activates the Crop tool to trim or expand the canvas."),
                Shortcut(name: "Eyedropper",             keys: "I",            description: "Samples a color from anywhere on the canvas and sets it as the foreground color."),
                Shortcut(name: "Brush tool",             keys: "B",            description: "Activates the Brush tool for painting with the foreground color."),
                Shortcut(name: "Eraser tool",            keys: "E",            description: "Erases pixels on the current layer, revealing transparency or the background."),
                Shortcut(name: "Gradient / Paint Bucket",keys: "G",            description: "Activates the Gradient or Paint Bucket fill tool."),
                Shortcut(name: "Type tool",              keys: "T",            description: "Activates the Type tool to add and edit text layers."),
                Shortcut(name: "Pen tool",               keys: "P",            description: "Activates the Pen tool for drawing precise bezier vector paths."),
                Shortcut(name: "Hand tool",              keys: "H",            description: "Pans the canvas without selecting or modifying anything."),
                Shortcut(name: "Zoom tool",              keys: "Z",            description: "Click to zoom in, Option+click to zoom out."),
                Shortcut(name: "Decrease brush size",    keys: "[",            description: "Decreases the active brush diameter."),
                Shortcut(name: "Increase brush size",    keys: "]",            description: "Increases the active brush diameter."),
                Shortcut(name: "Default colors",         keys: "D",            description: "Resets the foreground to black and background to white."),
                Shortcut(name: "Swap colors",            keys: "X",            description: "Swaps the foreground and background colors."),
            ]),
            ShortcutCategory(name: "Selection", shortcuts: [
                Shortcut(name: "Deselect",               keys: "⌘+D",         description: "Removes the active selection."),
                Shortcut(name: "Reselect",               keys: "⌘+⇧+D",       description: "Restores the most recently removed selection."),
                Shortcut(name: "Invert selection",       keys: "⌘+⇧+I",       description: "Inverts the selection — what was unselected becomes selected and vice versa."),
                Shortcut(name: "Select all",             keys: "⌘+A",         description: "Selects the entire canvas area."),
                Shortcut(name: "Feather selection",      keys: "⌘+⌥+D",       description: "Opens the Feather dialog to soften the edges of the current selection."),
            ]),
            ShortcutCategory(name: "Layers", shortcuts: [
                Shortcut(name: "New layer",              keys: "⌘+⇧+N",       description: "Creates a new blank layer above the current layer."),
                Shortcut(name: "Layer via copy",         keys: "⌘+J",         description: "Duplicates the selected layer (or selection contents) onto a new layer above it."),
                Shortcut(name: "Layer via cut",          keys: "⌘+⇧+J",       description: "Cuts the selected area to a new layer, leaving transparency behind."),
                Shortcut(name: "Group layers",           keys: "⌘+G",         description: "Groups all selected layers into a new Group."),
                Shortcut(name: "Ungroup layers",         keys: "⌘+⇧+G",       description: "Dissolves the selected Group, releasing its layers."),
                Shortcut(name: "Merge down",             keys: "⌘+E",         description: "Merges the selected layer into the layer directly below it."),
                Shortcut(name: "Merge visible",          keys: "⌘+⇧+E",       description: "Merges all visible layers into a single flattened layer."),
                Shortcut(name: "Bring to front",         keys: "⌘+⇧+]",       description: "Moves the selected layer to the top of the layer stack."),
                Shortcut(name: "Bring forward",          keys: "⌘+]",         description: "Moves the selected layer one position up in the stack."),
                Shortcut(name: "Send backward",          keys: "⌘+[",         description: "Moves the selected layer one position down in the stack."),
                Shortcut(name: "Send to back",           keys: "⌘+⇧+[",       description: "Moves the selected layer to the bottom of the stack."),
            ]),
            ShortcutCategory(name: "Transform & Edit", shortcuts: [
                Shortcut(name: "Free Transform",         keys: "⌘+T",         description: "Places transform handles around the layer/selection to scale, rotate, and skew freely."),
                Shortcut(name: "Transform again",        keys: "⌘+⇧+T",       description: "Re-applies the exact same transform as the previous operation."),
                Shortcut(name: "Step backward",          keys: "⌘+⌥+Z",       description: "Steps back through the History panel one state at a time."),
                Shortcut(name: "Step forward",           keys: "⌘+⇧+Z",       description: "Steps forward through History after stepping back."),
                Shortcut(name: "Fill with foreground",   keys: "⌥+⌫",         description: "Fills the selection or layer with the current foreground color."),
                Shortcut(name: "Fill with background",   keys: "⌘+⌫",         description: "Fills the selection or layer with the current background color."),
                Shortcut(name: "Fill dialog",            keys: "⇧+F5",         description: "Opens the Fill dialog for content-aware fill, pattern fill, or color fill with blending options."),
            ]),
            ShortcutCategory(name: "View", shortcuts: [
                Shortcut(name: "Zoom in",                keys: "⌘++",         description: "Zooms into the canvas."),
                Shortcut(name: "Zoom out",               keys: "⌘+-",         description: "Zooms out of the canvas."),
                Shortcut(name: "Fit on screen",          keys: "⌘+0",         description: "Zooms to fit the entire image in the window."),
                Shortcut(name: "100% view",              keys: "⌘+1",         description: "Shows the image at 100% zoom — one screen pixel per image pixel."),
                Shortcut(name: "Hide extras",            keys: "⌘+H",         description: "Toggles visibility of guides, grids, selection edges, and other non-printing extras."),
                Shortcut(name: "Hide all panels",        keys: "Tab",          description: "Hides all panels for a clean canvas view. Press Tab again to restore them."),
                Shortcut(name: "Cycle screen modes",     keys: "F",            description: "Cycles through Standard Screen, Full Screen with Menu Bar, and Full Screen modes."),
            ]),
        ]
    )

    // MARK: - Final Cut Pro

    static let finalCutPro = AppShortcuts(
        id: "Final Cut Pro",
        appName: "Final Cut Pro",
        icon: "film.fill",
        bundleIdentifiers: ["com.apple.FinalCut"],
        categories: [
            ShortcutCategory(name: "Playback", shortcuts: [
                Shortcut(name: "Play / Pause",           keys: "Space",        description: "Toggles playback at the playhead position."),
                Shortcut(name: "Play backward",          keys: "J",            description: "Plays in reverse. Press J multiple times to increase reverse speed (2×, 4×, 8×…)."),
                Shortcut(name: "Pause",                  keys: "K",            description: "Stops playback and holds the playhead in place."),
                Shortcut(name: "Play forward",           keys: "L",            description: "Plays forward. Press L multiple times to increase speed (2×, 4×, 8×…)."),
                Shortcut(name: "Play selection",         keys: "/",            description: "Plays only the marked in/out range."),
                Shortcut(name: "Previous edit point",    keys: "↑",            description: "Moves the playhead to the nearest edit point to the left."),
                Shortcut(name: "Next edit point",        keys: "↓",            description: "Moves the playhead to the nearest edit point to the right."),
                Shortcut(name: "Go to beginning",        keys: "⇧+↩",          description: "Moves the playhead to the very start of the timeline."),
            ]),
            ShortcutCategory(name: "Tools", shortcuts: [
                Shortcut(name: "Select tool",            keys: "A",            description: "Activates the standard Select tool for clicking and selecting clips."),
                Shortcut(name: "Blade tool",             keys: "B",            description: "Activates the Blade tool — click a clip to cut it at that point."),
                Shortcut(name: "Trim tool",              keys: "T",            description: "Activates the Trim tool for ripple, roll, slip, and slide edits."),
                Shortcut(name: "Position tool",          keys: "P",            description: "Activates the Position tool, which moves clips without rippling the timeline."),
                Shortcut(name: "Range Selection",        keys: "R",            description: "Activates the Range Selection tool to select a custom range within or across clips."),
            ]),
            ShortcutCategory(name: "Editing", shortcuts: [
                Shortcut(name: "Blade at playhead",      keys: "⌘+B",         description: "Cuts the clip under the playhead into two parts at that exact frame."),
                Shortcut(name: "Blade all at playhead",  keys: "⌘+⌥+B",       description: "Cuts every clip across all lanes at the playhead position simultaneously."),
                Shortcut(name: "Ripple delete",          keys: "⌫",            description: "Deletes the selected clip and closes the gap, pulling later clips left."),
                Shortcut(name: "Delete and leave gap",   keys: "⌘+⌫",         description: "Deletes the selected clip but leaves an empty gap in its place."),
                Shortcut(name: "Append to timeline",     keys: "E",            description: "Appends the selected browser clip to the end of the primary storyline."),
                Shortcut(name: "Insert at playhead",     keys: "W",            description: "Inserts the selected clip at the playhead, pushing later clips right."),
                Shortcut(name: "Overwrite at playhead",  keys: "D",            description: "Overwrites the timeline at the playhead with the selected browser clip."),
                Shortcut(name: "Connect to storyline",   keys: "Q",            description: "Connects the selected clip to the primary storyline at the playhead position."),
                Shortcut(name: "Undo",                   keys: "⌘+Z",         description: "Undoes the last edit."),
                Shortcut(name: "Redo",                   keys: "⌘+⇧+Z",       description: "Re-applies the last undone edit."),
            ]),
            ShortcutCategory(name: "Marking", shortcuts: [
                Shortcut(name: "Set range start",        keys: "I",            description: "Sets the in point of the selection range at the playhead."),
                Shortcut(name: "Set range end",          keys: "O",            description: "Sets the out point of the selection range at the playhead."),
                Shortcut(name: "Clear range",            keys: "⌥+X",         description: "Removes both the in and out points, clearing the range selection."),
                Shortcut(name: "Add marker",             keys: "M",            description: "Adds a to-do marker at the playhead position."),
                Shortcut(name: "Add chapter marker",     keys: "⌘+M",         description: "Adds a chapter marker at the playhead — useful for DVD/web chapter navigation."),
                Shortcut(name: "Mark as favorite",       keys: "F",            description: "Tags the selected range or clip as a favorite in the browser."),
            ]),
            ShortcutCategory(name: "Timeline & View", shortcuts: [
                Shortcut(name: "Zoom in timeline",       keys: "⌘+=",         description: "Expands the timeline horizontally to show finer detail."),
                Shortcut(name: "Zoom out timeline",      keys: "⌘+-",         description: "Compresses the timeline to see more of the edit at once."),
                Shortcut(name: "Zoom to fit",            keys: "⇧+Z",         description: "Zooms the timeline to fit the entire project in the visible window."),
                Shortcut(name: "Toggle snapping",        keys: "N",            description: "Toggles magnetic snapping — when on, clips snap to edit points and markers."),
                Shortcut(name: "Show Inspector",         keys: "⌘+4",         description: "Shows or hides the Inspector panel for adjusting clip properties."),
                Shortcut(name: "Show Video Scopes",      keys: "⌃+`",         description: "Opens the video scopes (waveform, vectorscope, histogram) for color evaluation."),
                Shortcut(name: "Full screen playback",   keys: "⌃+⌘+F",       description: "Plays the project in full-screen mode."),
            ]),
        ]
    )

    // MARK: - Excel

    static let excel = AppShortcuts(
        id: "Excel",
        appName: "Excel",
        icon: "tablecells.fill",
        bundleIdentifiers: ["com.microsoft.Excel"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Move to next cell",      keys: "Tab",          description: "Confirms the current entry and moves one cell to the right."),
                Shortcut(name: "Move to previous cell",  keys: "⇧+Tab",        description: "Moves one cell to the left."),
                Shortcut(name: "Confirm & move down",    keys: "Return",        description: "Confirms the entry and moves the selection down one row."),
                Shortcut(name: "Confirm & move up",      keys: "⇧+Return",     description: "Confirms the entry and moves the selection up one row."),
                Shortcut(name: "Jump to data edge",      keys: "⌘+Arrow",      description: "Jumps to the last cell in the current data region in the arrow direction — like Ctrl+Arrow on Windows."),
                Shortcut(name: "Go To cell",             keys: "⌃+G",         description: "Opens the Go To dialog to navigate to a specific cell address or named range."),
                Shortcut(name: "Find & Replace",         keys: "⌘+H",         description: "Opens the Find & Replace dialog to search and substitute cell values."),
                Shortcut(name: "Find",                   keys: "⌘+F",         description: "Opens the Find dialog to locate cells by content."),
            ]),
            ShortcutCategory(name: "Selection", shortcuts: [
                Shortcut(name: "Select all",             keys: "⌘+A",         description: "Selects all cells in the sheet. Press again to select the entire sheet."),
                Shortcut(name: "Select entire column",   keys: "⌃+Space",     description: "Selects the entire column of the active cell."),
                Shortcut(name: "Select entire row",      keys: "⇧+Space",     description: "Selects the entire row of the active cell."),
                Shortcut(name: "Extend selection",       keys: "⇧+Arrow",     description: "Extends the current selection one cell at a time in the arrow direction."),
                Shortcut(name: "Extend to data edge",    keys: "⌘+⇧+Arrow",   description: "Extends the selection to the last non-empty cell in the arrow direction."),
            ]),
            ShortcutCategory(name: "Editing", shortcuts: [
                Shortcut(name: "Edit active cell",       keys: "F2",           description: "Puts the active cell into edit mode with the cursor at the end of the content."),
                Shortcut(name: "New line in cell",       keys: "⌥+Return",    description: "Inserts a line break within a cell so you can type on multiple lines."),
                Shortcut(name: "Fill down",              keys: "⌘+D",         description: "Copies the content of the top cell in a selection down to all selected cells below."),
                Shortcut(name: "Fill right",             keys: "⌘+R",         description: "Copies the content of the leftmost cell in a selection across to the right."),
                Shortcut(name: "Insert current date",    keys: "⌘+;",         description: "Inserts today's date as a static value in the active cell."),
                Shortcut(name: "Toggle show formulas",   keys: "⌃+`",         description: "Switches the sheet view between showing cell values and showing raw formulas."),
                Shortcut(name: "Toggle absolute ref",    keys: "⌘+T",         description: "While editing a formula, cycles the selected cell reference between relative (A1), absolute ($A$1), and mixed ($A1, A$1)."),
                Shortcut(name: "Undo",                   keys: "⌘+Z",         description: "Undoes the last action."),
                Shortcut(name: "Redo",                   keys: "⌘+Y",         description: "Re-applies the last undone action."),
            ]),
            ShortcutCategory(name: "Formatting", shortcuts: [
                Shortcut(name: "Format Cells dialog",    keys: "⌘+1",         description: "Opens the Format Cells dialog with tabs for number, alignment, font, border, and fill."),
                Shortcut(name: "Bold",                   keys: "⌘+B",         description: "Toggles bold formatting on the selected cells."),
                Shortcut(name: "Italic",                 keys: "⌘+I",         description: "Toggles italic formatting."),
                Shortcut(name: "Underline",              keys: "⌘+U",         description: "Toggles underline formatting."),
                Shortcut(name: "Currency format",        keys: "⌘+⇧+$",       description: "Applies currency format with two decimal places to the selected cells."),
                Shortcut(name: "Percentage format",      keys: "⌘+⇧+%",       description: "Applies percentage format (multiplies value by 100 and adds %) to selected cells."),
                Shortcut(name: "Number format",          keys: "⌘+⇧+!",       description: "Applies number format with two decimal places and thousands separator."),
                Shortcut(name: "Date format",            keys: "⌘+⇧+#",       description: "Applies the default short date format to selected cells."),
                Shortcut(name: "General format",         keys: "⌘+⇧+~",       description: "Removes all number formatting and returns cells to General format."),
            ]),
            ShortcutCategory(name: "Rows & Columns", shortcuts: [
                Shortcut(name: "Insert row/column",      keys: "⌘+⇧+=",       description: "Inserts a row above (if a row is selected) or a column to the left (if a column is selected)."),
                Shortcut(name: "Delete row/column",      keys: "⌘+-",         description: "Deletes the selected row(s) or column(s)."),
                Shortcut(name: "Group rows/columns",     keys: "⌘+⇧+K",       description: "Groups the selected rows or columns for outlining — adds a collapse/expand toggle."),
                Shortcut(name: "Ungroup",                keys: "⌘+⇧+J",       description: "Removes grouping from the selected rows or columns."),
            ]),
        ]
    )

    // MARK: - Discord

    static let discord = AppShortcuts(
        id: "Discord",
        appName: "Discord",
        icon: "message.fill",
        bundleIdentifiers: ["com.hnc.Discord"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Quick Switcher",         keys: "⌘+K",         description: "Opens the Quick Switcher to jump to any server, channel, or DM by typing its name."),
                Shortcut(name: "Back",                   keys: "⌘+[",         description: "Navigates to the previously viewed channel or DM."),
                Shortcut(name: "Forward",                keys: "⌘+]",         description: "Goes forward after navigating back."),
                Shortcut(name: "Previous channel",       keys: "⌥+↑",         description: "Moves up to the previous channel or DM in the sidebar."),
                Shortcut(name: "Next channel",           keys: "⌥+↓",         description: "Moves down to the next channel or DM in the sidebar."),
                Shortcut(name: "Previous unread",        keys: "⌥+⇧+↑",       description: "Jumps to the previous channel or DM with unread messages."),
                Shortcut(name: "Next unread",            keys: "⌥+⇧+↓",       description: "Jumps to the next channel or DM with unread messages."),
                Shortcut(name: "Mark as read",           keys: "⎋",           description: "Marks the current channel as read, clearing the unread indicator."),
                Shortcut(name: "Preferences",            keys: "⌘+,",         description: "Opens Discord User Settings."),
            ]),
            ShortcutCategory(name: "Messaging", shortcuts: [
                Shortcut(name: "Send message",           keys: "Return",       description: "Sends the typed message."),
                Shortcut(name: "New line",               keys: "⇧+Return",    description: "Inserts a line break in the message without sending it."),
                Shortcut(name: "Edit last message",      keys: "↑",           description: "When the message input is empty, pressing Up opens your most recent message for editing."),
                Shortcut(name: "Reply to message",       keys: "R",           description: "When hovering over a message, starts a reply to it."),
                Shortcut(name: "React to message",       keys: "+",           description: "When hovering over a message, opens the emoji picker to add a reaction."),
                Shortcut(name: "Delete message",         keys: "⌫",           description: "When hovering over your own message, deletes it after confirmation."),
                Shortcut(name: "Pin message",            keys: "P",           description: "When hovering over a message (with permissions), pins it to the channel."),
                Shortcut(name: "Cancel edit / close DM", keys: "⎋",          description: "Cancels the current message edit, or closes the DM panel."),
            ]),
            ShortcutCategory(name: "Voice & Video", shortcuts: [
                Shortcut(name: "Toggle mute",            keys: "⌘+⇧+M",       description: "Mutes or unmutes your microphone while in a voice channel or call."),
                Shortcut(name: "Toggle deafen",          keys: "⌘+⇧+D",       description: "Deafens or undeafens yourself — mutes both incoming audio and your microphone."),
                Shortcut(name: "Toggle camera",          keys: "⌘+⇧+H",       description: "Turns your camera on or off during a video call."),
                Shortcut(name: "Disconnect from voice",  keys: "⌘+⇧+E",       description: "Disconnects you from the current voice channel."),
            ]),
            ShortcutCategory(name: "Misc", shortcuts: [
                Shortcut(name: "Upload file",            keys: "⌘+U",         description: "Opens a file picker to upload a file to the current channel."),
                Shortcut(name: "Emoji picker",           keys: "⌘+E",         description: "Opens the emoji picker in the message input."),
                Shortcut(name: "GIF picker",             keys: "⌘+G",         description: "Opens the GIF search panel in the message input."),
                Shortcut(name: "Mention someone",        keys: "@",            description: "Types @ in the message box to start a user or role mention."),
                Shortcut(name: "Mention channel",        keys: "#",            description: "Types # in the message box to insert a channel link."),
            ]),
        ]
    )

    // MARK: - Obsidian

    // MARK: - Zoom

    static let zoom = AppShortcuts(
        id: "Zoom",
        appName: "Zoom",
        icon: "video.fill",
        bundleIdentifiers: ["us.zoom.xos"],
        categories: [
            ShortcutCategory(name: "Meeting Controls", shortcuts: [
                Shortcut(name: "Mute / unmute",          keys: "⌘+⇧+A",       description: "Toggles your microphone on or off during a meeting."),
                Shortcut(name: "Start / stop video",     keys: "⌘+⇧+V",       description: "Turns your camera on or off."),
                Shortcut(name: "Share screen",           keys: "⌘+⇧+S",       description: "Opens the screen share picker."),
                Shortcut(name: "Pause / resume share",   keys: "⌘+⇧+T",       description: "Pauses or resumes an active screen share."),
                Shortcut(name: "Stop screen share",      keys: "⌘+⇧+E",       description: "Ends the current screen share."),
                Shortcut(name: "Raise / lower hand",     keys: "⌥+Y",         description: "Raises your hand to signal the host, or lowers it."),
                Shortcut(name: "Reaction",               keys: "⌥+R",         description: "Opens the reactions menu (thumbs up, clap, etc.)."),
                Shortcut(name: "Start / stop recording", keys: "⌘+⇧+R",       description: "Begins or stops local recording of the meeting."),
                Shortcut(name: "Leave / end meeting",    keys: "⌘+W",         description: "Opens the leave or end meeting dialog."),
            ]),
            ShortcutCategory(name: "Panels", shortcuts: [
                Shortcut(name: "Participants panel",     keys: "⌘+U",         description: "Shows or hides the Participants panel."),
                Shortcut(name: "Chat panel",             keys: "⌘+⇧+H",       description: "Opens or closes the in-meeting Chat panel."),
                Shortcut(name: "Invite participants",    keys: "⌘+I",         description: "Opens the Invite dialog to add people to the meeting."),
            ]),
            ShortcutCategory(name: "General", shortcuts: [
                Shortcut(name: "New meeting",            keys: "⌘+⌃+V",       description: "Starts a new instant meeting."),
                Shortcut(name: "Join meeting",           keys: "⌘+J",         description: "Opens the Join a Meeting dialog."),
                Shortcut(name: "Schedule meeting",       keys: "⌘+⇧+J",       description: "Opens the Schedule Meeting window."),
                Shortcut(name: "Settings",               keys: "⌘+,",         description: "Opens Zoom Preferences."),
            ]),
        ]
    )

    // MARK: - Microsoft Teams

    static let microsoftTeams = AppShortcuts(
        id: "Microsoft Teams",
        appName: "Microsoft Teams",
        icon: "person.3.fill",
        bundleIdentifiers: ["com.microsoft.teams2", "com.microsoft.teams"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Search",                 keys: "⌘+E",         description: "Focuses the search bar to find messages, people, or files."),
                Shortcut(name: "Activity",               keys: "⌘+1",         description: "Switches to the Activity feed."),
                Shortcut(name: "Chat",                   keys: "⌘+2",         description: "Switches to the Chat section."),
                Shortcut(name: "Teams",                  keys: "⌘+3",         description: "Switches to the Teams section."),
                Shortcut(name: "Calendar",               keys: "⌘+4",         description: "Switches to the Calendar view."),
                Shortcut(name: "Files",                  keys: "⌘+5",         description: "Switches to the Files section."),
                Shortcut(name: "Settings",               keys: "⌘+,",         description: "Opens Teams Settings."),
            ]),
            ShortcutCategory(name: "Messaging", shortcuts: [
                Shortcut(name: "New chat",               keys: "⌘+N",         description: "Starts a new one-on-one or group chat."),
                Shortcut(name: "Reply to thread",        keys: "⌘+R",         description: "Starts a reply to the selected message thread."),
                Shortcut(name: "Expand compose box",     keys: "⌘+⇧+X",       description: "Expands the message compose area for longer messages."),
                Shortcut(name: "Send message",           keys: "⌘+Return",    description: "Sends the composed message."),
                Shortcut(name: "Attach file",            keys: "⌘+O",         description: "Opens a file picker to attach a file to your message."),
            ]),
            ShortcutCategory(name: "Meetings", shortcuts: [
                Shortcut(name: "Mute / unmute",          keys: "⌘+⇧+M",       description: "Toggles your microphone on or off in a meeting."),
                Shortcut(name: "Toggle video",           keys: "⌘+⇧+O",       description: "Turns your camera on or off."),
                Shortcut(name: "Share screen",           keys: "⌘+⇧+E",       description: "Opens the screen share options."),
                Shortcut(name: "Raise hand",             keys: "⌘+⇧+K",       description: "Raises or lowers your hand during a meeting."),
                Shortcut(name: "Leave meeting",          keys: "⌘+⇧+H",       description: "Leaves the current meeting."),
                Shortcut(name: "Accept video call",      keys: "⌘+⇧+A",       description: "Accepts an incoming video call."),
                Shortcut(name: "Decline call",           keys: "⌘+⇧+D",       description: "Declines an incoming call."),
            ]),
        ]
    )

    // MARK: - Keynote

    static let keynote = AppShortcuts(
        id: "Keynote",
        appName: "Keynote",
        icon: "presentation.fill",
        bundleIdentifiers: ["com.apple.iWork.Keynote"],
        categories: [
            ShortcutCategory(name: "Presentation", shortcuts: [
                Shortcut(name: "Play slideshow",         keys: "⌘+Return",    description: "Starts the slideshow from the first slide."),
                Shortcut(name: "Play from current slide",keys: "⌥+⌘+Return",  description: "Starts the slideshow from the currently selected slide."),
                Shortcut(name: "Exit slideshow",         keys: "⎋",           description: "Stops the slideshow and returns to the editor."),
                Shortcut(name: "Next slide",             keys: "→",           description: "Advances to the next slide during the presentation."),
                Shortcut(name: "Previous slide",         keys: "←",           description: "Goes back to the previous slide during the presentation."),
                Shortcut(name: "Pause slideshow",        keys: "F",           description: "Freezes the display on the current slide without exiting."),
            ]),
            ShortcutCategory(name: "Slides", shortcuts: [
                Shortcut(name: "New slide",              keys: "⌘+⇧+N",       description: "Adds a new slide after the currently selected slide."),
                Shortcut(name: "Duplicate slide",        keys: "⌘+D",         description: "Creates a copy of the selected slide."),
                Shortcut(name: "Delete slide",           keys: "⌫",           description: "Deletes the selected slide."),
                Shortcut(name: "Skip slide",             keys: "⇧+⌘+H",       description: "Marks the slide as skipped so it won't appear during the slideshow."),
                Shortcut(name: "Move slide up",          keys: "⌘+⌥+↑",       description: "Moves the selected slide up in the slide order."),
                Shortcut(name: "Move slide down",        keys: "⌘+⌥+↓",       description: "Moves the selected slide down in the slide order."),
            ]),
            ShortcutCategory(name: "Objects", shortcuts: [
                Shortcut(name: "Group",                  keys: "⌘+⌥+G",       description: "Groups the selected objects so they move and resize together."),
                Shortcut(name: "Ungroup",                keys: "⌘+⌥+⇧+G",     description: "Ungroups a previously grouped set of objects."),
                Shortcut(name: "Bring to front",         keys: "⌘+⌥+⇧+F",     description: "Moves the selected object to the front of the layer stack."),
                Shortcut(name: "Send to back",           keys: "⌘+⌥+⇧+B",     description: "Moves the selected object to the back of the layer stack."),
                Shortcut(name: "Lock object",            keys: "⌘+L",         description: "Locks the selected object in place so it can't be accidentally moved."),
            ]),
            ShortcutCategory(name: "Formatting", shortcuts: [
                Shortcut(name: "Bold",                   keys: "⌘+B",         description: "Makes the selected text bold."),
                Shortcut(name: "Italic",                 keys: "⌘+I",         description: "Makes the selected text italic."),
                Shortcut(name: "Underline",              keys: "⌘+U",         description: "Underlines the selected text."),
                Shortcut(name: "Format panel",           keys: "⌘+⌥+I",       description: "Opens the Format inspector panel on the right."),
            ]),
        ]
    )

    // MARK: - Pages

    static let pages = AppShortcuts(
        id: "Pages",
        appName: "Pages",
        icon: "doc.richtext.fill",
        bundleIdentifiers: ["com.apple.iWork.Pages"],
        categories: [
            ShortcutCategory(name: "Document", shortcuts: [
                Shortcut(name: "Word count",             keys: "⌘+⇧+W",       description: "Shows the word, character, and page count for the document."),
                Shortcut(name: "Find",                   keys: "⌘+F",         description: "Opens the Find toolbar to search for text in the document."),
                Shortcut(name: "Find & replace",         keys: "⌘+⌥+F",       description: "Opens Find & Replace to find and substitute text."),
                Shortcut(name: "Insert page break",      keys: "⌘+Return",    description: "Inserts a page break at the cursor position."),
                Shortcut(name: "Track changes",          keys: "⌘+⇧+T",       description: "Turns change tracking on or off."),
                Shortcut(name: "Add comment",            keys: "⌘+⇧+K",       description: "Adds a comment at the current cursor position or selection."),
                Shortcut(name: "Spelling & grammar",     keys: "⌘+;",         description: "Checks spelling and grammar in the document."),
            ]),
            ShortcutCategory(name: "Formatting", shortcuts: [
                Shortcut(name: "Bold",                   keys: "⌘+B",         description: "Makes the selected text bold."),
                Shortcut(name: "Italic",                 keys: "⌘+I",         description: "Makes the selected text italic."),
                Shortcut(name: "Underline",              keys: "⌘+U",         description: "Underlines the selected text."),
                Shortcut(name: "Increase font size",     keys: "⌘++",         description: "Makes the selected text larger."),
                Shortcut(name: "Decrease font size",     keys: "⌘+-",         description: "Makes the selected text smaller."),
                Shortcut(name: "Align left",             keys: "⌘+{",         description: "Left-aligns the selected paragraph."),
                Shortcut(name: "Align right",            keys: "⌘+}",         description: "Right-aligns the selected paragraph."),
                Shortcut(name: "Center",                 keys: "⌘+|",         description: "Centers the selected paragraph."),
                Shortcut(name: "Justify",                keys: "⌘+⌥+|",       description: "Justifies the selected paragraph to both margins."),
            ]),
        ]
    )

    // MARK: - Numbers

    static let numbers = AppShortcuts(
        id: "Numbers",
        appName: "Numbers",
        icon: "tablecells.fill",
        bundleIdentifiers: ["com.apple.iWork.Numbers"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Go to cell",             keys: "⌘+G",         description: "Jumps to a specific cell by address (e.g. B4)."),
                Shortcut(name: "Find",                   keys: "⌘+F",         description: "Opens the Find toolbar to search for content in the spreadsheet."),
                Shortcut(name: "Find & replace",         keys: "⌘+⌥+F",       description: "Opens Find & Replace to find and substitute cell content."),
                Shortcut(name: "Next sheet",             keys: "⌘+⌥+→",       description: "Switches to the next sheet tab."),
                Shortcut(name: "Previous sheet",         keys: "⌘+⌥+←",       description: "Switches to the previous sheet tab."),
            ]),
            ShortcutCategory(name: "Editing", shortcuts: [
                Shortcut(name: "Sum formula",            keys: "⌘+⇧+T",       description: "Inserts a SUM formula for the selected cells."),
                Shortcut(name: "Fill down",              keys: "⌘+D",         description: "Copies the content of the top cell into all selected cells below."),
                Shortcut(name: "Fill right",             keys: "⌘+R",         description: "Copies the content of the leftmost cell into all selected cells to the right."),
                Shortcut(name: "Insert row above",       keys: "⌘+⌥+↑",       description: "Inserts a new row above the current row."),
                Shortcut(name: "Insert row below",       keys: "⌘+⌥+↓",       description: "Inserts a new row below the current row."),
                Shortcut(name: "Delete row",             keys: "⌘+K",         description: "Deletes the selected row(s)."),
                Shortcut(name: "Insert column",          keys: "⌘+⌥+→",       description: "Inserts a new column to the right of the current column."),
            ]),
            ShortcutCategory(name: "Formatting", shortcuts: [
                Shortcut(name: "Bold",                   keys: "⌘+B",         description: "Makes the selected cell content bold."),
                Shortcut(name: "Italic",                 keys: "⌘+I",         description: "Makes the selected cell content italic."),
                Shortcut(name: "Underline",              keys: "⌘+U",         description: "Underlines the selected cell content."),
                Shortcut(name: "Format panel",           keys: "⌘+⌥+I",       description: "Opens the Format inspector panel."),
            ]),
        ]
    )

    // MARK: - Spotify

    static let spotify = AppShortcuts(
        id: "Spotify",
        appName: "Spotify",
        icon: "music.note",
        bundleIdentifiers: ["com.spotify.client"],
        categories: [
            ShortcutCategory(name: "Playback", shortcuts: [
                Shortcut(name: "Play / pause",           keys: "Space",        description: "Starts or pauses playback."),
                Shortcut(name: "Next track",             keys: "⌘+→",         description: "Skips to the next track."),
                Shortcut(name: "Previous track",         keys: "⌘+←",         description: "Goes back to the previous track or restarts the current one."),
                Shortcut(name: "Volume up",              keys: "⌘+↑",         description: "Increases the playback volume."),
                Shortcut(name: "Volume down",            keys: "⌘+↓",         description: "Decreases the playback volume."),
                Shortcut(name: "Mute",                   keys: "⌘+⇧+↓",       description: "Mutes the volume without stopping playback."),
                Shortcut(name: "Shuffle",                keys: "⌘+S",         description: "Toggles shuffle mode on or off."),
                Shortcut(name: "Repeat",                 keys: "⌘+R",         description: "Cycles through repeat modes: off, repeat all, repeat one."),
                Shortcut(name: "Like song",              keys: "⌘+⌥+B",       description: "Adds the current track to your Liked Songs."),
            ]),
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Search",                 keys: "⌘+L",         description: "Focuses the search bar."),
                Shortcut(name: "New playlist",           keys: "⌘+N",         description: "Creates a new empty playlist."),
                Shortcut(name: "Settings",               keys: "⌘+,",         description: "Opens Spotify Settings."),
                Shortcut(name: "Queue",                  keys: "⌘+U",         description: "Opens the playback queue panel."),
                Shortcut(name: "Filter in library",      keys: "⌘+F",         description: "Filters your library list by name."),
            ]),
        ]
    )

    // MARK: - Raycast

    static let raycast = AppShortcuts(
        id: "Raycast",
        appName: "Raycast",
        icon: "rays",
        bundleIdentifiers: ["com.raycast.macos"],
        categories: [
            ShortcutCategory(name: "General", shortcuts: [
                Shortcut(name: "Open Raycast",           keys: "⌥+Space",      description: "Opens the Raycast launcher (default hotkey — may be customized in preferences)."),
                Shortcut(name: "Open actions panel",     keys: "⌘+K",         description: "Opens the Actions panel for the currently selected result."),
                Shortcut(name: "Select next result",     keys: "⌘+↓",         description: "Moves selection down to the next result in the list."),
                Shortcut(name: "Select previous result", keys: "⌘+↑",         description: "Moves selection up to the previous result in the list."),
                Shortcut(name: "Copy to clipboard",      keys: "⌘+⇧+C",       description: "Copies the selected result to the clipboard."),
                Shortcut(name: "Show in Finder",         keys: "⌘+Return",    description: "Reveals the selected file or folder in Finder."),
                Shortcut(name: "Preferences",            keys: "⌘+,",         description: "Opens Raycast Preferences."),
                Shortcut(name: "Close / dismiss",        keys: "⎋",           description: "Closes the Raycast window."),
            ]),
            ShortcutCategory(name: "Extensions & AI", shortcuts: [
                Shortcut(name: "AI Chat",                keys: "⌥+Space",      description: "Open Raycast then type 'AI' to start an AI Chat session."),
                Shortcut(name: "Quicklinks",             keys: "⌘+⇧+Q",       description: "Opens the Quicklinks browser to jump to saved URLs."),
                Shortcut(name: "Snippets",               keys: "⌘+⇧+S",       description: "Opens the Snippets browser to find and paste saved text."),
                Shortcut(name: "Clipboard history",      keys: "⌘+⇧+V",       description: "Opens the Clipboard History to paste a previous copy."),
                Shortcut(name: "Floating notes",         keys: "⌘+⇧+N",       description: "Opens Floating Notes for quick scratch-pad text."),
            ]),
        ]
    )

    // MARK: - Illustrator

    static let illustrator = AppShortcuts(
        id: "Illustrator",
        appName: "Illustrator",
        icon: "pencil.tip.crop.circle.fill",
        bundleIdentifiers: ["com.adobe.illustrator"],
        categories: [
            ShortcutCategory(name: "Tools", shortcuts: [
                Shortcut(name: "Selection tool",         keys: "V",            description: "Activates the Selection tool for selecting and moving whole objects."),
                Shortcut(name: "Direct Selection tool",  keys: "A",            description: "Activates the Direct Selection tool for editing individual anchor points and path segments."),
                Shortcut(name: "Pen tool",               keys: "P",            description: "Activates the Pen tool for drawing precise paths and bezier curves."),
                Shortcut(name: "Type tool",              keys: "T",            description: "Activates the Type tool for adding and editing text."),
                Shortcut(name: "Rectangle tool",         keys: "M",            description: "Activates the Rectangle tool for drawing rectangles and squares."),
                Shortcut(name: "Ellipse tool",           keys: "L",            description: "Activates the Ellipse tool for drawing ovals and circles."),
                Shortcut(name: "Brush tool",             keys: "B",            description: "Activates the Brush tool for freehand painting strokes."),
                Shortcut(name: "Pencil tool",            keys: "N",            description: "Activates the Pencil tool for drawing freehand paths."),
                Shortcut(name: "Scissors tool",          keys: "C",            description: "Activates the Scissors tool to cut paths at anchor points or segments."),
                Shortcut(name: "Zoom tool",              keys: "Z",            description: "Activates the Zoom tool; click to zoom in, hold ⌥ and click to zoom out."),
                Shortcut(name: "Hand tool",              keys: "H",            description: "Activates the Hand tool for panning the canvas without moving objects."),
                Shortcut(name: "Eyedropper tool",        keys: "I",            description: "Activates the Eyedropper tool to sample and apply colors from artwork."),
            ]),
            ShortcutCategory(name: "Edit", shortcuts: [
                Shortcut(name: "Undo",                   keys: "⌘+Z",         description: "Reverses the last action."),
                Shortcut(name: "Redo",                   keys: "⌘+⇧+Z",       description: "Re-applies the last undone action."),
                Shortcut(name: "Copy",                   keys: "⌘+C",         description: "Copies the selected objects to the clipboard."),
                Shortcut(name: "Cut",                    keys: "⌘+X",         description: "Cuts the selected objects to the clipboard."),
                Shortcut(name: "Paste in Place",         keys: "⌘+⇧+V",       description: "Pastes clipboard contents at the exact same position they were copied from."),
                Shortcut(name: "Paste in Front",         keys: "⌘+F",         description: "Pastes clipboard contents directly in front of the selected object in the stacking order."),
                Shortcut(name: "Paste in Back",          keys: "⌘+B",         description: "Pastes clipboard contents directly behind the selected object in the stacking order."),
            ]),
            ShortcutCategory(name: "Object", shortcuts: [
                Shortcut(name: "Group",                  keys: "⌘+G",         description: "Groups selected objects together so they can be moved and transformed as one unit."),
                Shortcut(name: "Ungroup",                keys: "⌘+⇧+G",       description: "Breaks a group apart into individual objects."),
                Shortcut(name: "Lock",                   keys: "⌘+2",         description: "Locks selected objects so they cannot be accidentally moved or edited."),
                Shortcut(name: "Unlock All",             keys: "⌘+⌥+2",       description: "Unlocks all locked objects on the current artboard."),
                Shortcut(name: "Hide",                   keys: "⌘+3",         description: "Hides selected objects from view without deleting them."),
                Shortcut(name: "Show All",               keys: "⌘+⌥+3",       description: "Makes all hidden objects visible again."),
                Shortcut(name: "Bring to Front",         keys: "⌘+⇧+]",       description: "Moves selected objects to the very top of the stacking order."),
                Shortcut(name: "Send to Back",           keys: "⌘+⇧+[",       description: "Moves selected objects to the very bottom of the stacking order."),
                Shortcut(name: "Bring Forward",          keys: "⌘+]",         description: "Moves selected objects one step up in the stacking order."),
                Shortcut(name: "Send Backward",          keys: "⌘+[",         description: "Moves selected objects one step down in the stacking order."),
                Shortcut(name: "Join paths",             keys: "⌘+J",         description: "Joins two or more open path endpoints to close or connect them."),
                Shortcut(name: "Make Clipping Mask",     keys: "⌘+7",         description: "Uses the top object as a clipping mask to hide portions of objects below it."),
            ]),
            ShortcutCategory(name: "View", shortcuts: [
                Shortcut(name: "Zoom in",                keys: "⌘++",         description: "Increases the view magnification."),
                Shortcut(name: "Zoom out",               keys: "⌘+-",         description: "Decreases the view magnification."),
                Shortcut(name: "Fit to window",          keys: "⌘+0",         description: "Scales the view so the entire artboard fits in the window."),
                Shortcut(name: "Actual size",            keys: "⌘+1",         description: "Resets the view to 100% zoom."),
                Shortcut(name: "Preview/Outline toggle", keys: "⌘+Y",         description: "Toggles between Preview mode (showing fills and strokes) and Outline mode (showing just paths)."),
                Shortcut(name: "Show/Hide Grid",         keys: "⌘+\"",        description: "Toggles the pixel grid overlay on and off."),
                Shortcut(name: "Show/Hide Guides",       keys: "⌘+;",         description: "Toggles visibility of all guide lines on the artboard."),
                Shortcut(name: "Show/Hide Rulers",       keys: "⌘+R",         description: "Toggles the horizontal and vertical rulers along the edges of the canvas."),
            ]),
            ShortcutCategory(name: "Type", shortcuts: [
                Shortcut(name: "Show Character panel",   keys: "⌘+T",         description: "Opens the Character panel for controlling font, size, leading, and tracking."),
                Shortcut(name: "Show Paragraph panel",   keys: "⌘+⌥+T",       description: "Opens the Paragraph panel for alignment, indentation, and spacing settings."),
                Shortcut(name: "Increase font size",     keys: "⌘+⇧+>",       description: "Increases the font size of selected text by the increment set in preferences."),
                Shortcut(name: "Decrease font size",     keys: "⌘+⇧+<",       description: "Decreases the font size of selected text by the increment set in preferences."),
            ]),
        ]
    )

    // MARK: - Premiere Pro

    static let premierePro = AppShortcuts(
        id: "Premiere Pro",
        appName: "Premiere Pro",
        icon: "film.stack.fill",
        bundleIdentifiers: ["com.adobe.PremierePro"],
        categories: [
            ShortcutCategory(name: "Playback", shortcuts: [
                Shortcut(name: "Play/Pause",             keys: "Space",        description: "Starts or pauses playback of the sequence."),
                Shortcut(name: "Shuttle Left",           keys: "J",            description: "Plays the sequence in reverse; press multiple times to increase reverse speed."),
                Shortcut(name: "Stop",                   keys: "K",            description: "Stops playback and holds the current position."),
                Shortcut(name: "Shuttle Right",          keys: "L",            description: "Plays the sequence forward; press multiple times to increase speed."),
                Shortcut(name: "Step Forward",           keys: "→",            description: "Advances the playhead one frame forward."),
                Shortcut(name: "Step Back",              keys: "←",            description: "Moves the playhead one frame backward."),
                Shortcut(name: "Play In to Out",         keys: "⌃+⇧+Space",   description: "Plays only the portion of the sequence between the In and Out points."),
            ]),
            ShortcutCategory(name: "Editing", shortcuts: [
                Shortcut(name: "Razor tool",             keys: "C",            description: "Activates the Razor tool to cut a clip at the playhead position."),
                Shortcut(name: "Selection tool",         keys: "V",            description: "Switches back to the Selection tool for moving and trimming clips."),
                Shortcut(name: "Ripple Edit tool",       keys: "B",            description: "Activates the Ripple Edit tool, which trims clips and closes the resulting gap automatically."),
                Shortcut(name: "Set In Point",           keys: "I",            description: "Marks the current playhead position as the In Point for the source clip or sequence."),
                Shortcut(name: "Set Out Point",          keys: "O",            description: "Marks the current playhead position as the Out Point for the source clip or sequence."),
                Shortcut(name: "Clear In Point",         keys: "⌃+⇧+I",       description: "Removes the previously set In Point."),
                Shortcut(name: "Clear Out Point",        keys: "⌃+⇧+O",       description: "Removes the previously set Out Point."),
                Shortcut(name: "Add Edit",               keys: "⌘+K",         description: "Cuts all tracks at the current playhead position, like applying the Razor to all."),
                Shortcut(name: "Ripple Delete",          keys: "⌥+⌫",         description: "Deletes selected clips and automatically closes the gap by pulling subsequent clips left."),
                Shortcut(name: "Lift",                   keys: ";",            description: "Removes the In-to-Out range from the sequence, leaving a gap."),
                Shortcut(name: "Extract",                keys: "'",            description: "Removes the In-to-Out range and closes the gap by rippling downstream clips."),
            ]),
            ShortcutCategory(name: "Timeline", shortcuts: [
                Shortcut(name: "Zoom in",                keys: "=",            description: "Zooms in on the timeline to show clips at a finer time scale."),
                Shortcut(name: "Zoom out",               keys: "-",            description: "Zooms out on the timeline to show more of the sequence."),
                Shortcut(name: "Fit Timeline",           keys: "⇧+\\",        description: "Zooms the timeline so the entire sequence fits in the visible area."),
                Shortcut(name: "New Sequence",           keys: "⌘+N",         description: "Creates a new sequence in the current project."),
                Shortcut(name: "Snap",                   keys: "S",            description: "Toggles snapping on or off, controlling whether clips snap to playhead and other clips."),
                Shortcut(name: "Linked Selection",       keys: "⇧+L",         description: "Toggles whether video and audio are selected together when clicking a linked clip."),
            ]),
            ShortcutCategory(name: "Panels", shortcuts: [
                Shortcut(name: "Project panel",          keys: "⇧+1",         description: "Brings the Project panel to focus."),
                Shortcut(name: "Source Monitor",         keys: "⇧+2",         description: "Brings the Source Monitor panel to focus."),
                Shortcut(name: "Timeline panel",         keys: "⇧+3",         description: "Brings the Timeline panel to focus."),
                Shortcut(name: "Program Monitor",        keys: "⇧+4",         description: "Brings the Program Monitor panel to focus."),
                Shortcut(name: "Audio Track Mixer",      keys: "⇧+6",         description: "Brings the Audio Track Mixer panel to focus."),
                Shortcut(name: "Effects panel",          keys: "⇧+7",         description: "Brings the Effects panel to focus for browsing and applying video/audio effects."),
            ]),
            ShortcutCategory(name: "File", shortcuts: [
                Shortcut(name: "Import",                 keys: "⌘+I",         description: "Opens the Import dialog to bring media files into the project."),
                Shortcut(name: "Export Media",           keys: "⌘+M",         description: "Opens the Export Media dialog to render and export the sequence."),
                Shortcut(name: "Save",                   keys: "⌘+S",         description: "Saves the current project."),
            ]),
        ]
    )

    // MARK: - Lightroom Classic

    static let lightroomClassic = AppShortcuts(
        id: "Lightroom Classic",
        appName: "Lightroom Classic",
        icon: "camera.filters",
        bundleIdentifiers: ["com.adobe.Lightroom"],
        categories: [
            ShortcutCategory(name: "Modules", shortcuts: [
                Shortcut(name: "Library (Grid view)",    keys: "G",            description: "Switches to the Library module and opens the Grid view of your photo collection."),
                Shortcut(name: "Library (Loupe view)",   keys: "E",            description: "Switches to the Library module and opens the Loupe view for a single photo."),
                Shortcut(name: "Develop module",         keys: "D",            description: "Switches to the Develop module for non-destructive editing of the selected photo."),
                Shortcut(name: "Map module",             keys: "⌘+⌥+3",       description: "Switches to the Map module to view and assign GPS locations."),
                Shortcut(name: "Book module",            keys: "⌘+⌥+4",       description: "Switches to the Book module for creating photo books."),
                Shortcut(name: "Slideshow module",       keys: "⌘+⌥+5",       description: "Switches to the Slideshow module for building presentations."),
                Shortcut(name: "Print module",           keys: "⌘+⌥+6",       description: "Switches to the Print module for setting up print layouts."),
            ]),
            ShortcutCategory(name: "Library", shortcuts: [
                Shortcut(name: "Grid view",              keys: "G",            description: "Shows all photos as a grid of thumbnails."),
                Shortcut(name: "Loupe view",             keys: "E",            description: "Shows the selected photo enlarged for a detailed look."),
                Shortcut(name: "Compare view",           keys: "C",            description: "Shows two photos side-by-side for direct comparison."),
                Shortcut(name: "Survey view",            keys: "N",            description: "Shows multiple selected photos together to help narrow down a selection."),
                Shortcut(name: "Pick flag",              keys: "P",            description: "Flags the selected photo as a Pick, marking it as a keeper."),
                Shortcut(name: "Reject flag",            keys: "X",            description: "Flags the selected photo as Rejected for easy batch deletion."),
                Shortcut(name: "Remove flag",            keys: "U",            description: "Removes any flag (Pick or Reject) from the selected photo."),
                Shortcut(name: "Rate 1 star",            keys: "1",            description: "Assigns a 1-star rating to the selected photo."),
                Shortcut(name: "Rate 2 stars",           keys: "2",            description: "Assigns a 2-star rating to the selected photo."),
                Shortcut(name: "Rate 3 stars",           keys: "3",            description: "Assigns a 3-star rating to the selected photo."),
                Shortcut(name: "Rate 4 stars",           keys: "4",            description: "Assigns a 4-star rating to the selected photo."),
                Shortcut(name: "Rate 5 stars",           keys: "5",            description: "Assigns a 5-star rating to the selected photo."),
                Shortcut(name: "Add to Quick Collection", keys: "B",           description: "Adds the selected photo to the Quick Collection for temporary gathering."),
            ]),
            ShortcutCategory(name: "Develop", shortcuts: [
                Shortcut(name: "Crop tool",              keys: "R",            description: "Activates the Crop Overlay tool for cropping and straightening photos."),
                Shortcut(name: "Spot Removal tool",      keys: "Q",            description: "Activates the Spot Removal tool for healing blemishes or removing unwanted objects."),
                Shortcut(name: "Graduated Filter",       keys: "M",            description: "Activates the Graduated Filter for applying adjustments that fade across the photo."),
                Shortcut(name: "Adjustment Brush",       keys: "K",            description: "Activates the Adjustment Brush for painting localized edits onto specific areas."),
                Shortcut(name: "Auto Tone",              keys: "⌘+U",         description: "Automatically sets exposure, contrast, and other tone adjustments based on image analysis."),
                Shortcut(name: "Reset all settings",     keys: "⌘+⇧+R",       description: "Resets all Develop module adjustments to the defaults, removing all edits."),
                Shortcut(name: "Copy settings",          keys: "⌘+⇧+C",       description: "Opens the Copy Settings dialog to choose which adjustments to copy from this photo."),
                Shortcut(name: "Paste settings",         keys: "⌘+⇧+V",       description: "Pastes previously copied settings onto the selected photo."),
                Shortcut(name: "Sync settings",          keys: "⌘+⇧+S",       description: "Opens the Sync Settings dialog to apply adjustments from this photo to multiple selected photos."),
                Shortcut(name: "Before/After view",      keys: "Y",            description: "Toggles a split view showing the photo before and after your Develop edits."),
            ]),
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Next photo",             keys: "→",            description: "Moves to the next photo in the current collection or filmstrip."),
                Shortcut(name: "Previous photo",         keys: "←",            description: "Moves to the previous photo in the current collection or filmstrip."),
                Shortcut(name: "Zoom in",                keys: "⌘++",         description: "Zooms in on the photo in Loupe or Develop view."),
                Shortcut(name: "Zoom out",               keys: "⌘+-",         description: "Zooms out on the photo in Loupe or Develop view."),
                Shortcut(name: "Fit in window",          keys: "⌘+0",         description: "Fits the entire photo within the current view area."),
            ]),
        ]
    )

    // MARK: - IntelliJ

    static let intellij = AppShortcuts(
        id: "IntelliJ / WebStorm",
        appName: "IntelliJ / WebStorm",
        icon: "brain.head.profile",
        bundleIdentifiers: ["com.jetbrains.intellij", "com.jetbrains.intellij.ce", "com.jetbrains.WebStorm", "com.jetbrains.goland", "com.jetbrains.pycharm", "com.jetbrains.rubymine", "com.jetbrains.rider"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Search Everywhere",      keys: "⇧⇧",          description: "Press Shift twice to open Search Everywhere and find classes, files, actions, and symbols."),
                Shortcut(name: "Find File",              keys: "⌘+⇧+O",       description: "Opens a fuzzy file finder to quickly navigate to any file in the project."),
                Shortcut(name: "Find Action",            keys: "⌘+⇧+A",       description: "Opens the action search to run any IDE command by name without menus."),
                Shortcut(name: "Go to Class",            keys: "⌘+O",         description: "Opens a dialog to quickly navigate to any class in the project by typing its name."),
                Shortcut(name: "Go to Line",             keys: "⌘+L",         description: "Prompts for a line number and jumps the cursor directly to that line."),
                Shortcut(name: "Recent Files",           keys: "⌘+E",         description: "Shows a popup of recently opened files for quick re-navigation."),
                Shortcut(name: "Recent Locations",       keys: "⌘+⇧+E",       description: "Shows a popup of recent editing locations with code snippets for context."),
                Shortcut(name: "Back",                   keys: "⌘+[",         description: "Navigates back to the previous cursor location in the navigation history."),
                Shortcut(name: "Forward",                keys: "⌘+]",         description: "Navigates forward in the navigation history after going back."),
                Shortcut(name: "Go to Declaration",      keys: "⌘+B",         description: "Jumps to the declaration of the symbol under the cursor."),
                Shortcut(name: "Find Usages",            keys: "⌥+F7",        description: "Finds all places in the project where the symbol under the cursor is used."),
            ]),
            ShortcutCategory(name: "Editing", shortcuts: [
                Shortcut(name: "Reformat Code",          keys: "⌘+⌥+L",       description: "Applies the project's code style formatting rules to the current file or selection."),
                Shortcut(name: "Duplicate Line",         keys: "⌘+D",         description: "Duplicates the current line or selection and inserts the copy below."),
                Shortcut(name: "Delete Line",            keys: "⌘+Y",         description: "Deletes the entire current line without leaving an empty line."),
                Shortcut(name: "Comment Line",           keys: "⌘+/",         description: "Toggles a line comment on the current line or selected lines."),
                Shortcut(name: "Block Comment",          keys: "⌘+⌥+/",       description: "Wraps the selected code in a block comment."),
                Shortcut(name: "Move Line Up",           keys: "⌘+⇧+↑",       description: "Moves the current line or selection up by one line."),
                Shortcut(name: "Move Line Down",         keys: "⌘+⇧+↓",       description: "Moves the current line or selection down by one line."),
                Shortcut(name: "Extend Selection",       keys: "⌥+↑",         description: "Incrementally expands the selection to the next enclosing code construct."),
                Shortcut(name: "Shrink Selection",       keys: "⌥+↓",         description: "Shrinks the selection back to the previous, smaller code construct."),
                Shortcut(name: "Quick Fix",              keys: "⌥+Return",    description: "Shows a list of available quick fixes and intention actions for the code at the cursor."),
            ]),
            ShortcutCategory(name: "Refactor", shortcuts: [
                Shortcut(name: "Rename",                 keys: "⇧+F6",        description: "Renames the symbol under the cursor and updates all references throughout the project."),
                Shortcut(name: "Extract Method",         keys: "⌘+⌥+M",       description: "Extracts the selected code block into a new method, replacing the original with a call."),
                Shortcut(name: "Extract Variable",       keys: "⌘+⌥+V",       description: "Extracts the selected expression into a local variable."),
                Shortcut(name: "Inline",                 keys: "⌘+⌥+N",       description: "Inlines a variable, method, or constant by replacing all usages with its definition."),
                Shortcut(name: "Move",                   keys: "F6",           description: "Moves the selected class or method to a different file or scope."),
                Shortcut(name: "Refactor This",          keys: "⌃+T",         description: "Opens a menu of all available refactoring options for the symbol under the cursor."),
            ]),
            ShortcutCategory(name: "Run & Debug", shortcuts: [
                Shortcut(name: "Run",                    keys: "⌃+R",         description: "Runs the current run configuration."),
                Shortcut(name: "Debug",                  keys: "⌃+D",         description: "Starts the current run configuration in debug mode."),
                Shortcut(name: "Stop",                   keys: "⌘+F2",        description: "Stops the currently running process."),
                Shortcut(name: "Toggle Breakpoint",      keys: "⌘+F8",        description: "Adds or removes a breakpoint on the current line."),
                Shortcut(name: "Step Over",              keys: "F8",           description: "Executes the current line and moves to the next, stepping over method calls."),
                Shortcut(name: "Step Into",              keys: "F7",           description: "Steps into the method call on the current line."),
                Shortcut(name: "Resume",                 keys: "⌥+⌘+R",       description: "Continues execution until the next breakpoint or the program ends."),
            ]),
            ShortcutCategory(name: "Search", shortcuts: [
                Shortcut(name: "Find",                   keys: "⌘+F",         description: "Opens the in-file search bar to find text in the current file."),
                Shortcut(name: "Replace",                keys: "⌘+R",         description: "Opens the find and replace bar in the current file."),
                Shortcut(name: "Find in Files",          keys: "⌘+⇧+F",       description: "Searches across all files in the project for the specified text or pattern."),
                Shortcut(name: "Replace in Files",       keys: "⌘+⇧+R",       description: "Searches and replaces text across all files in the project."),
                Shortcut(name: "Parameter Info",         keys: "⌘+P",         description: "Shows the parameter types and names for the method call at the cursor."),
                Shortcut(name: "Quick Documentation",    keys: "F1",           description: "Shows inline documentation for the symbol under the cursor."),
            ]),
        ]
    )

    // MARK: - Vim

    static let vim = AppShortcuts(
        id: "Vim / Neovim",
        appName: "Vim / Neovim",
        icon: "terminal",
        bundleIdentifiers: ["org.vim.MacVim", "com.neovim.nvim"],
        hostBundleIdentifiers: ["com.apple.Terminal", "com.googlecode.iterm2", "net.kovidgoyal.kitty", "com.github.wez.wezterm"],
        categories: [
            ShortcutCategory(name: "Normal Mode – Motion", shortcuts: [
                Shortcut(name: "Move left",              keys: "h",            description: "Moves the cursor one character to the left."),
                Shortcut(name: "Move down",              keys: "j",            description: "Moves the cursor one line down."),
                Shortcut(name: "Move up",                keys: "k",            description: "Moves the cursor one line up."),
                Shortcut(name: "Move right",             keys: "l",            description: "Moves the cursor one character to the right."),
                Shortcut(name: "Next word",              keys: "w",            description: "Jumps forward to the start of the next word."),
                Shortcut(name: "Previous word",          keys: "b",            description: "Jumps backward to the start of the previous word."),
                Shortcut(name: "End of word",            keys: "e",            description: "Jumps forward to the end of the current or next word."),
                Shortcut(name: "Line start",             keys: "0",            description: "Moves the cursor to the very first character of the current line."),
                Shortcut(name: "First non-blank",        keys: "^",            description: "Moves the cursor to the first non-whitespace character of the current line."),
                Shortcut(name: "Line end",               keys: "$",            description: "Moves the cursor to the last character of the current line."),
                Shortcut(name: "File start",             keys: "gg",           description: "Jumps to the very first line of the file."),
                Shortcut(name: "File end",               keys: "G",            description: "Jumps to the very last line of the file."),
                Shortcut(name: "Go to line N",           keys: "NG",           description: "Jumps to a specific line number, e.g. type 42 then G to go to line 42."),
            ]),
            ShortcutCategory(name: "Normal Mode – Editing", shortcuts: [
                Shortcut(name: "Delete character",       keys: "x",            description: "Deletes the character under the cursor."),
                Shortcut(name: "Delete line",            keys: "dd",           description: "Deletes the entire current line and places it in the register."),
                Shortcut(name: "Change line",            keys: "cc",           description: "Deletes the current line and enters Insert mode to replace it."),
                Shortcut(name: "Yank line",              keys: "yy",           description: "Copies (yanks) the entire current line into the register."),
                Shortcut(name: "Paste after",            keys: "p",            description: "Pastes the register contents after the cursor position."),
                Shortcut(name: "Paste before",           keys: "P",            description: "Pastes the register contents before the cursor position."),
                Shortcut(name: "Undo",                   keys: "u",            description: "Undoes the last change."),
                Shortcut(name: "Redo",                   keys: "⌃+R",         description: "Re-applies the last undone change."),
                Shortcut(name: "Join lines",             keys: "J",            description: "Joins the current line with the line below it, removing the line break."),
                Shortcut(name: "Repeat last",            keys: ".",            description: "Repeats the last editing command, making repetitive edits fast."),
                Shortcut(name: "Replace character",      keys: "r",            description: "Replaces the character under the cursor with the next key you type, staying in Normal mode."),
            ]),
            ShortcutCategory(name: "Normal Mode – Visual", shortcuts: [
                Shortcut(name: "Visual mode",            keys: "v",            description: "Enters Visual mode to select characters; move the cursor to extend the selection."),
                Shortcut(name: "Visual line mode",       keys: "V",            description: "Enters Visual Line mode to select whole lines at a time."),
                Shortcut(name: "Visual block mode",      keys: "⌃+V",         description: "Enters Visual Block mode to select a rectangular block of text across multiple lines."),
                Shortcut(name: "Indent",                 keys: ">",            description: "Indents the selected lines by one level."),
                Shortcut(name: "Dedent",                 keys: "<",            description: "Removes one level of indentation from the selected lines."),
            ]),
            ShortcutCategory(name: "Insert Mode", shortcuts: [
                Shortcut(name: "Insert before cursor",   keys: "i",            description: "Enters Insert mode, placing the cursor before the current character."),
                Shortcut(name: "Insert after cursor",    keys: "a",            description: "Enters Insert mode, placing the cursor after the current character."),
                Shortcut(name: "New line below",         keys: "o",            description: "Opens a new line below the current line and enters Insert mode."),
                Shortcut(name: "New line above",         keys: "O",            description: "Opens a new line above the current line and enters Insert mode."),
                Shortcut(name: "Exit insert mode",       keys: "Esc",          description: "Returns to Normal mode from Insert mode."),
            ]),
            ShortcutCategory(name: "Command Mode", shortcuts: [
                Shortcut(name: "Save",                   keys: ":w",           description: "Writes (saves) the current buffer to disk."),
                Shortcut(name: "Quit",                   keys: ":q",           description: "Quits Vim if no unsaved changes exist."),
                Shortcut(name: "Save & quit",            keys: ":wq",          description: "Saves the file and then quits Vim."),
                Shortcut(name: "Force quit",             keys: ":q!",          description: "Quits without saving, discarding all unsaved changes."),
                Shortcut(name: "Search",                 keys: "/pattern",     description: "Enters search mode; type a pattern and press Enter to find the first match."),
                Shortcut(name: "Next match",             keys: "n",            description: "Jumps to the next occurrence of the current search pattern."),
                Shortcut(name: "Previous match",         keys: "N",            description: "Jumps to the previous occurrence of the current search pattern."),
                Shortcut(name: "Global substitute",      keys: ":%s/old/new/g", description: "Replaces every occurrence of 'old' with 'new' throughout the entire file."),
                Shortcut(name: "Open file",              keys: ":e filename",  description: "Opens a file by path in the current buffer."),
            ]),
            ShortcutCategory(name: "Windows & Tabs", shortcuts: [
                Shortcut(name: "Split horizontal",       keys: "⌃+W S",       description: "Splits the current window horizontally into two panes."),
                Shortcut(name: "Split vertical",         keys: "⌃+W V",       description: "Splits the current window vertically into two panes."),
                Shortcut(name: "Navigate panes",         keys: "⌃+W hjkl",    description: "Moves focus between splits using h (left), j (down), k (up), or l (right)."),
                Shortcut(name: "Close pane",             keys: "⌃+W Q",       description: "Closes the currently focused split pane."),
                Shortcut(name: "New tab",                keys: ":tabnew",      description: "Opens a new empty tab."),
                Shortcut(name: "Next tab",               keys: "gt",           description: "Moves focus to the next tab to the right."),
                Shortcut(name: "Previous tab",           keys: "gT",           description: "Moves focus to the previous tab to the left."),
            ]),
        ]
    )

    // MARK: - Nano

    static let nano = AppShortcuts(
        id: "nano",
        appName: "nano",
        icon: "terminal.fill",
        bundleIdentifiers: [],
        hostBundleIdentifiers: ["com.apple.Terminal", "com.googlecode.iterm2", "net.kovidgoyal.kitty", "com.github.wez.wezterm"],
        categories: [
            ShortcutCategory(name: "File", shortcuts: [
                Shortcut(name: "Save (Write Out)",       keys: "⌃+O",         description: "Prompts for a filename and writes the current buffer to disk."),
                Shortcut(name: "Exit",                   keys: "⌃+X",         description: "Exits nano. If there are unsaved changes, you will be prompted to save or discard them."),
                Shortcut(name: "Read file",              keys: "⌃+R",         description: "Inserts the contents of another file at the current cursor position."),
            ]),
            ShortcutCategory(name: "Edit", shortcuts: [
                Shortcut(name: "Cut line",               keys: "⌃+K",         description: "Cuts the current line (or marked region) into the cut buffer."),
                Shortcut(name: "Paste",                  keys: "⌃+U",         description: "Pastes the contents of the cut buffer at the cursor position."),
                Shortcut(name: "Copy",                   keys: "⌥+6",         description: "Copies the current line or marked region without deleting it."),
                Shortcut(name: "Replace",                keys: "⌃+\\",        description: "Opens the find and replace prompt to substitute text throughout the buffer."),
                Shortcut(name: "Justify paragraph",      keys: "⌃+J",         description: "Justifies the current paragraph to fit within the wrap width."),
                Shortcut(name: "Undo",                   keys: "⌥+U",         description: "Undoes the last editing action."),
                Shortcut(name: "Redo",                   keys: "⌥+E",         description: "Re-applies the last undone action."),
            ]),
            ShortcutCategory(name: "Text Selection", shortcuts: [
                Shortcut(name: "Set mark",               keys: "⌃+^",         description: "Sets a mark at the cursor to start selecting text. Move the cursor to extend the selection, then Cut or Copy."),
                Shortcut(name: "Cut selection",          keys: "⌃+K",         description: "After setting a mark and moving the cursor, cuts the selected region into the cut buffer."),
                Shortcut(name: "Copy selection",         keys: "⌥+6",         description: "After setting a mark, copies the selected region without deleting it."),
                Shortcut(name: "Select all",             keys: "⌃+^+then+⌥+\\", description: "Set mark at start (⌃+^), then jump to end of file (⌥+\\) to select the entire buffer."),
            ]),
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Search",                 keys: "⌃+W",         description: "Opens the search prompt; type a string and press Enter to find it."),
                Shortcut(name: "Search next",            keys: "⌥+W",         description: "Repeats the last search and jumps to the next match."),
                Shortcut(name: "Go to line",             keys: "⌃+_",         description: "Prompts for a line number and column, then jumps directly there."),
                Shortcut(name: "Beginning of line",      keys: "⌃+A",         description: "Moves the cursor to the first character of the current line."),
                Shortcut(name: "End of line",            keys: "⌃+E",         description: "Moves the cursor to the last character of the current line."),
                Shortcut(name: "Next word",              keys: "⌃+→",         description: "Jumps forward to the start of the next word."),
                Shortcut(name: "Previous word",          keys: "⌃+←",         description: "Jumps backward to the start of the previous word."),
                Shortcut(name: "Beginning of file",      keys: "⌥+\\",        description: "Jumps to the very first line of the file."),
                Shortcut(name: "End of file",            keys: "⌥+/",         description: "Jumps to the very last line of the file."),
                Shortcut(name: "Page down",              keys: "⌃+V",         description: "Scrolls the view down by one page."),
                Shortcut(name: "Page up",                keys: "⌃+Y",         description: "Scrolls the view up by one page."),
            ]),
            ShortcutCategory(name: "Misc", shortcuts: [
                Shortcut(name: "Help",                   keys: "⌃+G",         description: "Opens the built-in help text listing all available shortcuts."),
                Shortcut(name: "Where is cursor",        keys: "⌃+C",         description: "Shows the current line number, column, and character offset in the status bar."),
                Shortcut(name: "Spell check",            keys: "⌃+T",         description: "Runs the spell checker on the buffer."),
                Shortcut(name: "Toggle line numbers",    keys: "⌥+N",         description: "Shows or hides line numbers in the left margin."),
                Shortcut(name: "Toggle soft wrap",       keys: "⌥+S",         description: "Toggles soft-wrapping of long lines at the edge of the screen."),
                Shortcut(name: "Toggle autoindent",      keys: "⌥+I",         description: "Turns autoindent on or off for new lines."),
                Shortcut(name: "Suspend",                keys: "⌃+Z",         description: "Suspends nano and returns to the shell. Type 'fg' to resume."),
            ]),
        ]
    )

    // MARK: - GitHub Desktop

    static let githubDesktop = AppShortcuts(
        id: "GitHub Desktop",
        appName: "GitHub Desktop",
        icon: "arrow.triangle.branch",
        bundleIdentifiers: ["com.github.GitHubClient"],
        categories: [
            ShortcutCategory(name: "Repository", shortcuts: [
                Shortcut(name: "Fetch origin",           keys: "⌘+⇧+F",       description: "Fetches the latest changes from the remote without merging, updating remote-tracking branches."),
                Shortcut(name: "Push",                   keys: "⌘+P",         description: "Pushes your committed local changes to the remote repository."),
                Shortcut(name: "Pull",                   keys: "⌘+⇧+P",       description: "Pulls the latest commits from the remote and merges them into the current branch."),
                Shortcut(name: "New repository",         keys: "⌘+N",         description: "Creates a new local Git repository."),
                Shortcut(name: "Add local repository",   keys: "⌘+O",         description: "Opens a file picker to add an existing local Git repository to GitHub Desktop."),
                Shortcut(name: "Clone repository",       keys: "⌘+⇧+O",       description: "Clones a remote repository from GitHub to a local directory."),
                Shortcut(name: "Repository settings",    keys: "⌘+I",         description: "Opens the settings for the current repository, including remote and ignored files."),
                Shortcut(name: "Open in terminal",       keys: "⌘+`",         description: "Opens the current repository in the default terminal at the repo root."),
                Shortcut(name: "Open in editor",         keys: "⌘+⇧+A",       description: "Opens the current repository in the configured external code editor."),
            ]),
            ShortcutCategory(name: "Branches", shortcuts: [
                Shortcut(name: "New branch",             keys: "⌘+⇧+N",       description: "Creates a new branch off the current branch."),
                Shortcut(name: "Rename branch",          keys: "F2",           description: "Renames the currently checked-out branch."),
                Shortcut(name: "Delete branch",          keys: "⌘+⌫",         description: "Deletes the selected branch after confirmation."),
                Shortcut(name: "Merge into current",     keys: "⌘+⇧+M",       description: "Opens the merge dialog to merge another branch into the current branch."),
                Shortcut(name: "Compare on GitHub",      keys: "⌘+⇧+C",       description: "Opens a comparison between the current branch and the default branch on GitHub.com."),
                Shortcut(name: "Switch to previous branch", keys: "⌃+Tab",    description: "Switches back to the branch you were on before the current one."),
            ]),
            ShortcutCategory(name: "Changes", shortcuts: [
                Shortcut(name: "Commit",                 keys: "⌘+Return",    description: "Creates a commit with the staged changes and the message typed in the summary field."),
                Shortcut(name: "Discard all changes",    keys: "⌘+⇧+⌫",       description: "Permanently discards all uncommitted changes in the working directory."),
                Shortcut(name: "Open file",              keys: "⌘+⌥+O",       description: "Opens the currently selected changed file in the default editor."),
            ]),
            ShortcutCategory(name: "View", shortcuts: [
                Shortcut(name: "Changes tab",            keys: "⌘+1",         description: "Switches to the Changes tab showing modified, added, and deleted files."),
                Shortcut(name: "History tab",            keys: "⌘+2",         description: "Switches to the History tab showing the commit log for the current branch."),
                Shortcut(name: "Toggle sidebar",         keys: "⌘+⇧+K",       description: "Shows or hides the left sidebar with repository and branch navigation."),
                Shortcut(name: "Expand/collapse diff",   keys: "⌘+⇧+D",       description: "Expands or collapses the diff view for the selected changed file."),
            ]),
        ]
    )

    // MARK: - Things 3

    static let things3 = AppShortcuts(
        id: "Things 3",
        appName: "Things 3",
        icon: "checkmark.circle.fill",
        bundleIdentifiers: ["com.culturedcode.ThingsMac"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Inbox",                  keys: "⌘+1",         description: "Jumps to the Inbox, where new uncategorized tasks land."),
                Shortcut(name: "Today",                  keys: "⌘+2",         description: "Jumps to Today, showing tasks scheduled or due today."),
                Shortcut(name: "Upcoming",               keys: "⌘+3",         description: "Jumps to Upcoming, showing tasks scheduled for future dates."),
                Shortcut(name: "Anytime",                keys: "⌘+4",         description: "Jumps to Anytime, showing all tasks not yet scheduled."),
                Shortcut(name: "Someday",                keys: "⌘+5",         description: "Jumps to Someday, for tasks you want to do eventually with no fixed date."),
                Shortcut(name: "Logbook",                keys: "⌘+6",         description: "Opens the Logbook showing all completed and cancelled tasks."),
                Shortcut(name: "Find",                   keys: "⌘+F",         description: "Opens the search bar to find tasks by keyword across all lists."),
            ]),
            ShortcutCategory(name: "Tasks", shortcuts: [
                Shortcut(name: "New to-do",              keys: "⌘+N",         description: "Creates a new task in the currently viewed list."),
                Shortcut(name: "New project",            keys: "⌘+⌥+N",       description: "Creates a new project for grouping related tasks."),
                Shortcut(name: "New heading",            keys: "⌘+⇧+N",       description: "Adds a heading to organize tasks within a project or list."),
                Shortcut(name: "Quick Entry",            keys: "⌃+Space",     description: "Opens the Quick Entry panel to capture a new task from anywhere on your Mac."),
                Shortcut(name: "Complete task",          keys: "⌘+K",         description: "Marks the selected task as complete and moves it to the Logbook."),
                Shortcut(name: "Delete task",            keys: "⌘+⌫",         description: "Deletes the selected task or project after confirmation."),
                Shortcut(name: "Move to project",        keys: "⌘+⇧+M",       description: "Opens a picker to move the selected task into a project."),
                Shortcut(name: "Schedule",               keys: "⌘+S",         description: "Opens a date picker to schedule the selected task for a specific day."),
                Shortcut(name: "Set deadline",           keys: "⌃+D",         description: "Opens a date picker to set a hard deadline on the selected task."),
                Shortcut(name: "Add tags",               keys: "⌘+T",         description: "Opens the tag picker to assign one or more tags to the selected task."),
                Shortcut(name: "Show in project",        keys: "⌘+⌥+R",       description: "Reveals the selected task within its parent project context."),
            ]),
            ShortcutCategory(name: "View", shortcuts: [
                Shortcut(name: "Toggle sidebar",         keys: "⌘+⌥+S",       description: "Shows or hides the left sidebar for navigating between lists and areas."),
                Shortcut(name: "Show/hide evening",      keys: "⌘+E",         description: "Toggles the Evening section in Today view for tasks you plan to do in the evening."),
            ]),
        ]
    )

    // MARK: - Superhuman

    static let superhuman = AppShortcuts(
        id: "Superhuman",
        appName: "Superhuman",
        icon: "bolt.envelope.fill",
        bundleIdentifiers: ["com.superhuman.Superhuman", "com.superhuman.electron"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Go to Inbox",            keys: "G→I",          description: "Two-key sequence: press G then I to jump to your Inbox."),
                Shortcut(name: "Go to Sent",             keys: "G→S",          description: "Two-key sequence: press G then S to jump to Sent mail."),
                Shortcut(name: "Go to Done",             keys: "G→D",          description: "Two-key sequence: press G then D to jump to Done (archived) mail."),
                Shortcut(name: "Go to Starred",          keys: "G→⇧+S",        description: "Two-key sequence: press G then Shift+S to jump to Starred messages."),
                Shortcut(name: "Next email",             keys: "J",            description: "Moves focus to the next (older) email in the list."),
                Shortcut(name: "Previous email",         keys: "K",            description: "Moves focus to the previous (newer) email in the list."),
                Shortcut(name: "Open email",             keys: "Return",       description: "Opens the focused email to read its full content."),
                Shortcut(name: "Back to list",           keys: "U",            description: "Returns from the open email back to the message list."),
            ]),
            ShortcutCategory(name: "Actions", shortcuts: [
                Shortcut(name: "Reply",                  keys: "R",            description: "Opens a reply to the sender of the focused email."),
                Shortcut(name: "Reply all",              keys: "A",            description: "Opens a reply addressed to all recipients of the focused email."),
                Shortcut(name: "Forward",                keys: "F",            description: "Forwards the focused email to a new recipient."),
                Shortcut(name: "Done / Archive",         keys: "E",            description: "Archives the email and moves it to Done, clearing it from your inbox."),
                Shortcut(name: "Delete",                 keys: "⌘+⌫",         description: "Deletes the focused email permanently."),
                Shortcut(name: "Star",                   keys: "S",            description: "Stars the focused email for quick retrieval later."),
                Shortcut(name: "Mark unread",            keys: "⇧+U",          description: "Marks the focused email as unread."),
                Shortcut(name: "Mute",                   keys: "M",            description: "Mutes the thread so future replies don't notify you."),
                Shortcut(name: "Remind me",              keys: "H",            description: "Snoozes the email to reappear in your inbox at a later time."),
            ]),
            ShortcutCategory(name: "Compose", shortcuts: [
                Shortcut(name: "New email",              keys: "C",            description: "Opens the compose window to write a new email."),
                Shortcut(name: "Send",                   keys: "⌘+Return",    description: "Sends the composed email."),
                Shortcut(name: "Send and archive",       keys: "⌘+⇧+Return",  description: "Sends the email and immediately archives the thread."),
                Shortcut(name: "Add CC",                 keys: "⌘+⇧+C",       description: "Adds the CC field to the compose window."),
                Shortcut(name: "Add BCC",                keys: "⌘+⇧+B",       description: "Adds the BCC field to the compose window."),
            ]),
            ShortcutCategory(name: "Search", shortcuts: [
                Shortcut(name: "Search",                 keys: "⌘+K",         description: "Opens the Superhuman command bar to search emails or run commands."),
            ]),
        ]
    )

    // MARK: - Linear

    static let linear = AppShortcuts(
        id: "Linear",
        appName: "Linear",
        icon: "square.3.layers.3d.top.filled",
        bundleIdentifiers: ["com.linear", "linear.app.Linear"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Command menu",           keys: "⌘+K",         description: "Opens the command menu to quickly navigate, create, or search for anything in Linear."),
                Shortcut(name: "My Issues",              keys: "G→M",          description: "Two-key sequence: press G then M to go to My Issues."),
                Shortcut(name: "All Issues",             keys: "G→A",          description: "Two-key sequence: press G then A to view all issues in the workspace."),
                Shortcut(name: "Projects",               keys: "G→P",          description: "Two-key sequence: press G then P to navigate to Projects."),
                Shortcut(name: "Cycles",                 keys: "G→C",          description: "Two-key sequence: press G then C to navigate to Cycles."),
                Shortcut(name: "Inbox",                  keys: "G→I",          description: "Two-key sequence: press G then I to navigate to your Inbox."),
                Shortcut(name: "Views",                  keys: "G→V",          description: "Two-key sequence: press G then V to navigate to saved Views."),
                Shortcut(name: "Settings",               keys: "⌘+,",          description: "Opens the workspace or user settings."),
            ]),
            ShortcutCategory(name: "Issues", shortcuts: [
                Shortcut(name: "Create issue",           keys: "C",            description: "Opens the create issue dialog to add a new issue to the current team."),
                Shortcut(name: "Set status",             keys: "S",            description: "Opens the status picker for the focused issue."),
                Shortcut(name: "Set assignee",           keys: "A",            description: "Opens the assignee picker for the focused issue."),
                Shortcut(name: "Set priority",           keys: "P",            description: "Opens the priority picker for the focused issue."),
                Shortcut(name: "Set label",              keys: "L",            description: "Opens the label picker to add or change labels on the focused issue."),
                Shortcut(name: "Set project",            keys: "⇧+P",          description: "Opens the project picker to assign the focused issue to a project."),
                Shortcut(name: "Subscribe",              keys: "⌥+S",          description: "Subscribes you to notifications for the focused issue."),
                Shortcut(name: "Copy issue URL",         keys: "⌘+⇧+.",        description: "Copies the URL of the focused issue to the clipboard."),
                Shortcut(name: "Archive issue",          keys: "⌘+⌫",          description: "Archives the focused issue, removing it from active views."),
            ]),
            ShortcutCategory(name: "Views", shortcuts: [
                Shortcut(name: "Filter",                 keys: "F",            description: "Opens the filter panel to narrow the issue list by status, assignee, label, and more."),
                Shortcut(name: "Display settings",       keys: "D",            description: "Opens display options for grouping, ordering, and showing fields in the current view."),
                Shortcut(name: "Open detail",            keys: "Return",       description: "Opens the detail panel for the focused issue."),
            ]),
        ]
    )

    // MARK: - Telegram

    static let telegram = AppShortcuts(
        id: "Telegram",
        appName: "Telegram",
        icon: "paperplane.fill",
        bundleIdentifiers: ["ru.keepcoder.Telegram", "org.telegram.desktop"],
        categories: [
            ShortcutCategory(name: "Navigation", shortcuts: [
                Shortcut(name: "Search",                 keys: "⌘+F",         description: "Opens the global search to find messages, contacts, or chats."),
                Shortcut(name: "Next chat",              keys: "⌘+↓",         description: "Moves focus to the next chat in the list."),
                Shortcut(name: "Previous chat",          keys: "⌘+↑",         description: "Moves focus to the previous chat in the list."),
                Shortcut(name: "Next chat (alt)",        keys: "⌃+Tab",       description: "Alternative shortcut to move to the next chat."),
                Shortcut(name: "Previous chat (alt)",    keys: "⌃+⇧+Tab",     description: "Alternative shortcut to move to the previous chat."),
                Shortcut(name: "Archive",                keys: "⌘+⌥+A",       description: "Archives the selected chat to declutter your chat list."),
                Shortcut(name: "New group",              keys: "⌘+N",         description: "Opens the dialog to create a new group chat."),
                Shortcut(name: "New channel",            keys: "⌘+⇧+N",       description: "Opens the dialog to create a new channel."),
            ]),
            ShortcutCategory(name: "Messages", shortcuts: [
                Shortcut(name: "Send message",           keys: "Return",       description: "Sends the message typed in the compose field."),
                Shortcut(name: "New line in message",    keys: "⌘+Return",    description: "Inserts a newline in the compose field without sending the message."),
                Shortcut(name: "Delete message",         keys: "⌘+⌫",         description: "Deletes the selected message (your own messages only)."),
                Shortcut(name: "Edit last message",      keys: "↑",            description: "Press the up arrow in an empty compose field to edit your most recently sent message."),
            ]),
            ShortcutCategory(name: "Calls", shortcuts: [
                Shortcut(name: "New voice call",         keys: "⌘+⌥+C",       description: "Initiates a voice call with the contact in the currently open chat."),
            ]),
            ShortcutCategory(name: "Appearance", shortcuts: [
                Shortcut(name: "Toggle dark mode",       keys: "⌘+⇧+D",       description: "Switches between light and dark themes."),
                Shortcut(name: "Zoom in",                keys: "⌘++",         description: "Increases the text and UI size."),
                Shortcut(name: "Zoom out",               keys: "⌘+-",         description: "Decreases the text and UI size."),
            ]),
        ]
    )

    // MARK: - Obsidian

    static let obsidian = AppShortcuts(
        id: "Obsidian",
        appName: "Obsidian",
        icon: "diamond.fill",
        bundleIdentifiers: ["md.obsidian"],
        categories: [
            ShortcutCategory(name: "File & Navigation", shortcuts: [
                Shortcut(name: "New note",               keys: "⌘+N",         description: "Creates a new note in the current vault."),
                Shortcut(name: "Open note",              keys: "⌘+O",         description: "Opens the Quick Switcher to search and jump to any note by name."),
                Shortcut(name: "Search all notes",       keys: "⌘+⇧+F",       description: "Opens the full-text search panel to find content across the entire vault."),
                Shortcut(name: "Navigate back",          keys: "⌘+⌥+←",       description: "Goes back to the previously viewed note."),
                Shortcut(name: "Navigate forward",       keys: "⌘+⌥+→",       description: "Goes forward after navigating back."),
                Shortcut(name: "Open graph view",        keys: "⌘+⇧+G",       description: "Opens the Graph View showing all notes and their connections as a visual network."),
                Shortcut(name: "Toggle left sidebar",    keys: "⌘+\\",        description: "Shows or hides the left sidebar (file explorer, search, etc.)."),
                Shortcut(name: "Toggle right sidebar",   keys: "⌘+⇧+\\",      description: "Shows or hides the right sidebar (backlinks, outline, tags, etc.)."),
            ]),
            ShortcutCategory(name: "Editing", shortcuts: [
                Shortcut(name: "Toggle edit / preview",  keys: "⌘+E",         description: "Switches between the editable source view and the rendered reading view."),
                Shortcut(name: "Bold",                   keys: "⌘+B",         description: "Wraps selected text in **double asterisks** for bold formatting."),
                Shortcut(name: "Italic",                 keys: "⌘+I",         description: "Wraps selected text in *single asterisks* for italic formatting."),
                Shortcut(name: "Insert link",            keys: "⌘+K",         description: "Inserts a Markdown link at the cursor, or wraps selected text in a link."),
                Shortcut(name: "Strikethrough",          keys: "⌘+⇧+X",       description: "Wraps selected text in ~~tildes~~ for strikethrough."),
                Shortcut(name: "Inline code",            keys: "⌘+⇧+C",       description: "Wraps selected text in backticks for inline code formatting."),
                Shortcut(name: "Indent",                 keys: "Tab",          description: "Indents the current list item one level deeper."),
                Shortcut(name: "Outdent",                keys: "⇧+Tab",        description: "Outdents the current list item one level."),
                Shortcut(name: "Find & replace",         keys: "⌘+H",         description: "Opens the find and replace dialog for the current note."),
            ]),
            ShortcutCategory(name: "View", shortcuts: [
                Shortcut(name: "Command palette",        keys: "⌘+P",         description: "Opens the Command Palette to run any Obsidian command by typing its name."),
                Shortcut(name: "Zoom in",                keys: "⌘++",         description: "Increases the editor font size."),
                Shortcut(name: "Zoom out",               keys: "⌘+-",         description: "Decreases the editor font size."),
                Shortcut(name: "Reset zoom",             keys: "⌘+0",         description: "Resets the editor zoom to the default size."),
                Shortcut(name: "Split right",            keys: "⌘+⇧+→",       description: "Opens a new pane to the right of the current one."),
                Shortcut(name: "Focus on editor",        keys: "⎋",           description: "Moves focus into the editor, dismissing any open panels or dialogs."),
            ]),
        ]
    )
}
