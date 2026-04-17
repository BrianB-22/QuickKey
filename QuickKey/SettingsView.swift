import SwiftUI
import AppKit

struct SettingsView: View {
    @EnvironmentObject var settings: SettingsStore
    @Environment(\.dismiss) var dismiss
    @State private var accessibilityGranted = KeyEventSender.isAccessibilityEnabled()

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
                                Text("Click a key badge or highlight a shortcut and press Return to fire it. Requires Accessibility permission — see below.")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }

                Section("Permissions") {
                    HStack(spacing: 10) {
                        Image(systemName: "hand.raised.fill")
                            .foregroundColor(accessibilityGranted ? .green : .orange)
                            .frame(width: 20)
                        VStack(alignment: .leading, spacing: 1) {
                            Text("Accessibility Permission")
                            Text(accessibilityGranted
                                 ? "Granted — shortcut triggering is active."
                                 : "Not granted — shortcut triggering won't work.")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        if accessibilityGranted {
                            Circle().fill(Color.green).frame(width: 8, height: 8)
                        } else {
                            Button("Open Settings") {
                                NSWorkspace.shared.open(
                                    URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility")!
                                )
                            }
                            .buttonStyle(.borderedProminent)
                            .controlSize(.small)
                        }
                    }
                    .padding(.vertical, 2)
                }

                Section("Keys") {
                    Toggle(isOn: $settings.showKeyNames) {
                        HStack(spacing: 10) {
                            Image(systemName: "character.cursor.ibeam")
                                .foregroundColor(.accentColor)
                                .frame(width: 20)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Show Key Names Instead")
                                Text("Displays Command, Option, Ctrl, Shift instead of ⌘ ⌥ ⌃ ⇧.")
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

            Divider()

            VStack(spacing: 4) {
                Link("github.com/BrianB-22/QuickKey", destination: URL(string: "https://github.com/BrianB-22/QuickKey")!)
                    .font(.caption)
                Text("Version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0")")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("Vibed by Brian Bernacki")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }
            .padding(.vertical, 12)
        }
        .frame(width: 380, height: 700)
        .onAppear { accessibilityGranted = KeyEventSender.isAccessibilityEnabled() }
    }
}
