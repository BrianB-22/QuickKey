import Foundation

struct Shortcut: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let keys: String         // e.g. "⌘+C" or "⌘+⇧+Z" — split on "+" to render badges
    let description: String  // shown as hover tooltip

    init(name: String, keys: String, description: String = "") {
        self.name = name
        self.keys = keys
        self.description = description
    }
}

struct ShortcutCategory: Identifiable {
    let id = UUID()
    let name: String
    let shortcuts: [Shortcut]
}

struct AppShortcuts: Identifiable {
    let id: String          // stable key = appName
    let appName: String
    let icon: String        // SF Symbol name
    let bundleIdentifiers: [String]
    let hostBundleIdentifiers: [String]  // parent apps this tool runs inside (e.g. Terminal for Vim)
    let categories: [ShortcutCategory]

    init(id: String, appName: String, icon: String, bundleIdentifiers: [String], hostBundleIdentifiers: [String] = [], categories: [ShortcutCategory]) {
        self.id = id
        self.appName = appName
        self.icon = icon
        self.bundleIdentifiers = bundleIdentifiers
        self.hostBundleIdentifiers = hostBundleIdentifiers
        self.categories = categories
    }
}
