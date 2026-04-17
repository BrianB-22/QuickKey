import Foundation
import SwiftUI
import ServiceManagement

enum AppFontSize: String, CaseIterable {
    case small  = "Small"
    case medium = "Medium"
    case large  = "Large"

    /// Primary row text (shortcut name, key badge)
    var body: CGFloat {
        switch self {
        case .small:  return 12
        case .medium: return 14
        case .large:  return 17
        }
    }

    /// Secondary text (description subtitle)
    var caption: CGFloat {
        switch self {
        case .small:  return 10
        case .medium: return 12
        case .large:  return 14
        }
    }

    /// Section header text
    var subheadline: CGFloat {
        switch self {
        case .small:  return 11
        case .medium: return 13
        case .large:  return 15
        }
    }

    /// Tab strip label
    var tabLabel: CGFloat {
        switch self {
        case .small:  return 10
        case .medium: return 12
        case .large:  return 14
        }
    }
}

final class SettingsStore: ObservableObject {
    private static let fontSizeKey = "com.quickkey.fontSize"

    @Published var launchAtLogin: Bool = false {
        didSet { applyLaunchAtLogin() }
    }

    @Published var fontSize: AppFontSize = .medium {
        didSet { UserDefaults.standard.set(fontSize.rawValue, forKey: Self.fontSizeKey) }
    }

    @Published var allowKeyComboTrigger: Bool = false {
        didSet { UserDefaults.standard.set(allowKeyComboTrigger, forKey: "com.quickkey.allowTrigger") }
    }

    @Published var showInstalledAppsOnly: Bool = true {
        didSet { UserDefaults.standard.set(showInstalledAppsOnly, forKey: "com.quickkey.installedAppsOnly") }
    }

    @Published var globalHotkeyEnabled: Bool = true {
        didSet { UserDefaults.standard.set(globalHotkeyEnabled, forKey: "com.quickkey.globalHotkey") }
    }

    @Published var favoritesHotkeyEnabled: Bool = true {
        didSet { UserDefaults.standard.set(favoritesHotkeyEnabled, forKey: "com.quickkey.favoritesHotkey") }
    }

    @Published var showKeyNames: Bool = false {
        didSet { UserDefaults.standard.set(showKeyNames, forKey: "com.quickkey.showKeyNames") }
    }

    init() {
        launchAtLogin = SMAppService.mainApp.status == .enabled

        if let raw = UserDefaults.standard.string(forKey: Self.fontSizeKey),
           let saved = AppFontSize(rawValue: raw) {
            fontSize = saved
        }

        // Explicitly stored false is fine; missing key also defaults to false
        allowKeyComboTrigger = UserDefaults.standard.bool(forKey: "com.quickkey.allowTrigger")

        // Default true: only false if the user has explicitly stored false
        if UserDefaults.standard.object(forKey: "com.quickkey.installedAppsOnly") != nil {
            showInstalledAppsOnly = UserDefaults.standard.bool(forKey: "com.quickkey.installedAppsOnly")
        }

        if UserDefaults.standard.object(forKey: "com.quickkey.globalHotkey") != nil {
            globalHotkeyEnabled = UserDefaults.standard.bool(forKey: "com.quickkey.globalHotkey")
        }

        if UserDefaults.standard.object(forKey: "com.quickkey.favoritesHotkey") != nil {
            favoritesHotkeyEnabled = UserDefaults.standard.bool(forKey: "com.quickkey.favoritesHotkey")
        }

        // Default false — only override if user has explicitly set it
        if UserDefaults.standard.object(forKey: "com.quickkey.showKeyNames") != nil {
            showKeyNames = UserDefaults.standard.bool(forKey: "com.quickkey.showKeyNames")
        }
    }

    private func applyLaunchAtLogin() {
        do {
            if launchAtLogin {
                try SMAppService.mainApp.register()
            } else {
                try SMAppService.mainApp.unregister()
            }
        } catch {
            print("Launch at login error: \(error.localizedDescription)")
        }
    }
}
