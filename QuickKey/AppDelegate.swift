import AppKit
import SwiftUI
import Combine
import Carbon

final class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusItem: NSStatusItem!
    private var popover: NSPopover!
    let settings = SettingsStore()
    lazy var vm = ShortcutsViewModel(settings: settings)

    private var lastActiveApp: NSRunningApplication?
    private let hotkeyManager = HotkeyManager()
    private let favHotkeyManager = HotkeyManager()
    private var cancellables = Set<AnyCancellable>()

    func applicationDidFinishLaunching(_ notification: Notification) {
        setupMenuBarItem()
        setupPopover()
        observeFrontmostApp()

        // Wire up the trigger action so ContentView can call back into AppDelegate
        vm.triggerShortcut = { [weak self] keys in
            self?.performTrigger(keys: keys)
        }

        // ⌥Space — open/close popover
        hotkeyManager.onActivate = { [weak self] in self?.togglePopoverFromHotkey() }
        applyGlobalHotkey(settings.globalHotkeyEnabled)
        settings.$globalHotkeyEnabled.sink { [weak self] in self?.applyGlobalHotkey($0) }
            .store(in: &cancellables)

        // ⌥⌘Space — open popover directly on Favorites
        favHotkeyManager.onActivate = { [weak self] in self?.openFavoritesFromHotkey() }
        applyFavoritesHotkey(settings.favoritesHotkeyEnabled)
        settings.$favoritesHotkeyEnabled.sink { [weak self] in self?.applyFavoritesHotkey($0) }
            .store(in: &cancellables)
    }

    // MARK: - Setup

    private func setupMenuBarItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        guard let button = statusItem.button else { return }
        button.image = NSImage(systemSymbolName: "keyboard", accessibilityDescription: "QuickKey")
        button.action = #selector(togglePopover(_:))
        button.target = self
        button.sendAction(on: [.leftMouseUp, .rightMouseUp])
    }

    private func setupPopover() {
        popover = NSPopover()
        popover.contentSize = NSSize(width: 560, height: 660)
        popover.behavior = .transient
        popover.animates = true
        popover.contentViewController = NSHostingController(
            rootView: ContentView()
                .environmentObject(vm)
                .environmentObject(settings)
        )
    }

    private func observeFrontmostApp() {
        NSWorkspace.shared.notificationCenter.addObserver(
            self,
            selector: #selector(frontmostAppChanged(_:)),
            name: NSWorkspace.didActivateApplicationNotification,
            object: nil
        )
    }

    // MARK: - Trigger

    private func performTrigger(keys: String) {
        guard KeyEventSender.isAccessibilityEnabled() else {
            KeyEventSender.requestAccessibilityPermission()
            showAccessibilityAlert()
            return
        }

        let target = lastActiveApp
        popover.performClose(nil)

        // Give the popover time to close and the previous app to regain focus
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            target?.activate(options: .activateIgnoringOtherApps)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                KeyEventSender.send(keys: keys)
            }
        }
    }

    private func showAccessibilityAlert() {
        let alert = NSAlert()
        alert.messageText = "Accessibility Permission Required"
        alert.informativeText = """
            QuickKey needs Accessibility access to trigger shortcuts in other apps.

            Open System Settings → Privacy & Security → Accessibility, then enable QuickKey.
            """
        alert.addButton(withTitle: "Open System Settings")
        alert.addButton(withTitle: "Later")
        if alert.runModal() == .alertFirstButtonReturn {
            NSWorkspace.shared.open(
                URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility")!
            )
        }
    }

    // MARK: - Actions

    private func applyGlobalHotkey(_ enabled: Bool) {
        if enabled {
            hotkeyManager.register(keyCode: UInt32(kVK_Space), modifiers: UInt32(optionKey), id: 1)
        } else {
            hotkeyManager.unregister()
        }
    }

    private func applyFavoritesHotkey(_ enabled: Bool) {
        if enabled {
            favHotkeyManager.register(keyCode: UInt32(kVK_ANSI_F),
                                      modifiers: UInt32(optionKey | cmdKey), id: 2)
        } else {
            favHotkeyManager.unregister()
        }
    }

    private func openFavoritesFromHotkey() {
        vm.selectedAppId = "Favorites"
        if popover.isShown { return }
        if let button = statusItem.button { showPopover(from: button) }
    }

    private func togglePopoverFromHotkey() {
        if popover.isShown {
            popover.performClose(nil)
        } else {
            if let active = NSWorkspace.shared.frontmostApplication,
               active.bundleIdentifier != Bundle.main.bundleIdentifier {
                vm.updateActiveApp(active)
            }
            if let button = statusItem.button { showPopover(from: button) }
        }
    }

    @objc private func togglePopover(_ sender: NSStatusBarButton) {
        guard let event = NSApp.currentEvent else { return }

        if event.type == .rightMouseUp {
            showContextMenu()
            return
        }

        if popover.isShown {
            popover.performClose(sender)
        } else {
            if let active = NSWorkspace.shared.frontmostApplication,
               active.bundleIdentifier != Bundle.main.bundleIdentifier {
                vm.updateActiveApp(active)
            }
            showPopover(from: sender)
        }
    }

    private func showPopover(from button: NSStatusBarButton) {
        // If the popover is already on a different screen than the button, close it first
        // so it reopens anchored to the correct display.
        if let popoverScreen = popover.contentViewController?.view.window?.screen,
           let buttonScreen = button.window?.screen,
           popoverScreen != buttonScreen {
            popover.performClose(nil)
        }
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        popover.contentViewController?.view.window?.makeKey()
        // Prevent search bar from stealing focus on open
        DispatchQueue.main.async { [weak self] in
            self?.popover.contentViewController?.view.window?.makeFirstResponder(nil)
        }
    }

    private func showContextMenu() {
        let menu = NSMenu()
        menu.addItem(withTitle: "About QuickKey", action: #selector(showAbout), keyEquivalent: "")
        menu.addItem(.separator())
        menu.addItem(withTitle: "Quit QuickKey", action: #selector(quitApp), keyEquivalent: "q")
        menu.items.forEach { $0.target = self }
        statusItem.menu = menu
        statusItem.button?.performClick(nil)
        statusItem.menu = nil
    }

    @objc private func frontmostAppChanged(_ notification: Notification) {
        guard let app = notification.userInfo?[NSWorkspace.applicationUserInfoKey] as? NSRunningApplication,
              app.bundleIdentifier != Bundle.main.bundleIdentifier
        else { return }
        lastActiveApp = app
        vm.updateActiveApp(app)
    }

    @objc private func showAbout() {
        NSApp.orderFrontStandardAboutPanel(nil)
    }

    @objc private func quitApp() {
        NSApp.terminate(nil)
    }
}
