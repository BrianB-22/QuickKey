import Foundation
import Combine

final class FavoritesStore: ObservableObject {
    private static let udKey = "com.quickkey.favorites.v1"

    @Published private(set) var ids: Set<String> = []

    init() {
        if let saved = UserDefaults.standard.array(forKey: Self.udKey) as? [String] {
            ids = Set(saved)
        }
    }

    func isFavorite(_ shortcut: Shortcut, appName: String) -> Bool {
        ids.contains(stableKey(shortcut, appName))
    }

    func add(_ shortcut: Shortcut, appName: String) {
        ids.insert(stableKey(shortcut, appName))
        persist()
    }

    func remove(_ shortcut: Shortcut, appName: String) {
        ids.remove(stableKey(shortcut, appName))
        persist()
    }

    // stable across launches because the shortcut data is static
    func stableKey(_ shortcut: Shortcut, _ appName: String) -> String {
        "\(appName)|\(shortcut.name)|\(shortcut.keys)"
    }

    private func persist() {
        UserDefaults.standard.set(Array(ids), forKey: Self.udKey)
    }
}
