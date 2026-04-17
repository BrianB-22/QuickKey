import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: SettingsStore
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack(spacing: 8) {
                Image(systemName: "gear")
                    .foregroundColor(.accentColor)
                    .font(.title3)
                Text("Settings")
                    .font(.headline)
                Spacer()
                Button { dismiss() } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.tertiary)
                        .font(.title3)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)

            Divider()

            Form {
                Section("General") {
                    Toggle(isOn: $settings.launchAtLogin) {
                        HStack(spacing: 10) {
                            Image(systemName: "power")
                                .foregroundColor(.accentColor)
                                .frame(width: 20)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Launch at Login")
                                Text("Open QuickKey automatically when you log in.")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }

                    Toggle(isOn: $settings.showInstalledAppsOnly) {
                        HStack(spacing: 10) {
                            Image(systemName: "app.badge.checkmark")
                                .foregroundColor(.accentColor)
                                .frame(width: 20)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Show Help for Installed Apps Only")
                                Text("Hides apps from the tab strip that aren't installed on this Mac.")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }

                    Toggle(isOn: $settings.globalHotkeyEnabled) {
                        HStack(spacing: 10) {
                            Image(systemName: "keyboard.fill")
                                .foregroundColor(.accentColor)
                                .frame(width: 20)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Global Hotkey (⌥Space)")
                                Text("Open QuickKey from any app without clicking the menu bar.")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }

                    Toggle(isOn: $settings.favoritesHotkeyEnabled) {
                        HStack(spacing: 10) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.accentColor)
                                .frame(width: 20)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Favorites Hotkey (⌥⌘F)")
                                Text("Jump straight to your Favorites from any app.")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }

                Section("Shortcuts") {
                    Toggle(isOn: $settings.allowKeyComboTrigger) {
                        HStack(spacing: 10) {
                            Image(systemName: "bolt.fill")
                                .foregroundColor(.accentColor)
                                .frame(width: 20)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Allow Key Combo Clicks to Activate")
                                Text("Click a key badge to fire that shortcut in the active app.")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }

                Section("Appearance") {
                    HStack(spacing: 10) {
                        Image(systemName: "textformat.size")
                            .foregroundColor(.accentColor)
                            .frame(width: 20)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Font Size")
                            Picker("", selection: $settings.fontSize) {
                                ForEach(AppFontSize.allCases, id: \.self) { size in
                                    Text(size.rawValue).tag(size)
                                }
                            }
                            .pickerStyle(.segmented)
                            .labelsHidden()
                        }
                    }
                    .padding(.vertical, 2)
                }
            }
            .formStyle(.grouped)
        }
        .frame(width: 380, height: 540)
    }
}
