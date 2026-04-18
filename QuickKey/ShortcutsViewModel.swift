import AppKit
import Combine

final class ShortcutsViewModel: ObservableObject {
    @Published var selectedAppId: String = "System"
    @Published var searchText: String = ""

    let database = ShortcutsDatabase.shared
    let favoritesStore = FavoritesStore()
    let settings: SettingsStore

    private var cancellables = Set<AnyCancellable>()

    init(settings: SettingsStore) {
        self.settings = settings
        // Forward favorites changes so the view re-renders
        favoritesStore.objectWillChange.sink { [weak self] in
            self?.objectWillChange.send()
        }.store(in: &cancellables)
        // Re-render when the installed-apps filter toggle changes
        settings.$showInstalledAppsOnly.sink { [weak self] _ in
            self?.objectWillChange.send()
        }.store(in: &cancellables)
    }

    var allApps: [AppShortcuts] {
        guard settings.showInstalledAppsOnly else { return database.allApps }
        return database.allApps.filter { app in
            if app.bundleIdentifiers.isEmpty && app.hostBundleIdentifiers.isEmpty { return true }
            let directMatch = app.bundleIdentifiers.contains {
                NSWorkspace.shared.urlForApplication(withBundleIdentifier: $0) != nil
            }
            let hostMatch = app.hostBundleIdentifiers.contains {
                NSWorkspace.shared.urlForApplication(withBundleIdentifier: $0) != nil
            }
            return directMatch || hostMatch
        }
    }

    var filteredCategories: [ShortcutCategory] {
        selectedAppId == "Favorites"
            ? filteredFavoritesCategories
            : filteredAppCategories
    }

    // MARK: - Private

    private var filteredAppCategories: [ShortcutCategory] {
        guard let app = database.shortcuts(for: selectedAppId) else { return [] }
        let query = searchText.trimmingCharacters(in: .whitespaces).lowercased()
        guard !query.isEmpty else { return app.categories }

        return app.categories.compactMap { category in
            let hits = category.shortcuts.filter { matches($0, query: query) }
            return hits.isEmpty ? nil : ShortcutCategory(name: category.name, shortcuts: hits)
        }
    }

    private var filteredFavoritesCategories: [ShortcutCategory] {
        let query = searchText.trimmingCharacters(in: .whitespaces).lowercased()

        // Collect favorites grouped by source app, preserving app order
        return database.allApps.compactMap { app in
            let favs = app.categories
                .flatMap { $0.shortcuts }
                .filter { favoritesStore.isFavorite($0, appName: app.appName) }
                .filter { query.isEmpty || matches($0, query: query) }

            return favs.isEmpty ? nil : ShortcutCategory(name: app.appName, shortcuts: favs)
        }
    }

    private func matches(_ shortcut: Shortcut, query: String) -> Bool {
        shortcut.name.lowercased().contains(query)
            || shortcut.keys.lowercased().contains(query)
            || shortcut.description.lowercased().contains(query)
    }

    var allAppsSearchResults: [ShortcutCategory] {
        let query = searchText.trimmingCharacters(in: .whitespaces).lowercased()
        guard !query.isEmpty else { return [] }
        return database.allApps.compactMap { app in
            let hits = app.categories.flatMap { $0.shortcuts }.filter { matches($0, query: query) }
            return hits.isEmpty ? nil : ShortcutCategory(name: app.appName, shortcuts: hits)
        }
    }

    /// Set by AppDelegate — closes the popover and fires the key event in the last active app.
    var triggerShortcut: ((String) -> Void)?

    /// Set by AppDelegate — closes the popover.
    var closePopover: (() -> Void)?

    // Tracked active app — updated by notification, never stale
    @Published var activeAppName: String? = nil
    @Published var activeAppHasData: Bool = false
    @Published var activeBundleId: String? = nil

    // Called by AppDelegate whenever the frontmost (non-QuickKey) app changes
    func updateActiveApp(_ app: NSRunningApplication) {
        activeAppName = app.localizedName
        let bundleId = app.bundleIdentifier
        activeBundleId = bundleId
        let knownName = bundleId.flatMap { database.appName(forBundleId: $0) }
        activeAppHasData = knownName != nil
        if let name = knownName {
            selectedAppId = name
        } else {
            selectedAppId = "Favorites"
        }
    }

    func isHostedApp(_ app: AppShortcuts) -> Bool {
        guard let bundleId = activeBundleId else { return false }
        return app.hostBundleIdentifiers.contains(bundleId)
    }
}
