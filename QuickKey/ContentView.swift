import SwiftUI
import AppKit

struct ContentView: View {
    @EnvironmentObject var vm: ShortcutsViewModel
    @EnvironmentObject var settings: SettingsStore
    @FocusState private var searchFocused: Bool
    @State private var scrollToTabId: String = ""
    @State private var showSettings = false
    @State private var keyMonitor: Any? = nil

    private var allTabIds: [String] {
        ["Favorites"] + vm.allApps.map { $0.id }
    }

    var body: some View {
        VStack(spacing: 0) {
            headerBar
            Divider()
            searchBar
            appTabStrip
            Divider()
            shortcutList
            Divider()
            footerBar
        }
        .frame(width: 560, height: 660)
        .background(Color(NSColor.windowBackgroundColor))
        .onAppear {
            searchFocused = true
            keyMonitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
                // Let text fields handle their own key events
                if NSApp.keyWindow?.firstResponder is NSTextView { return event }
                let ids = allTabIds
                let current = ids.firstIndex(of: vm.selectedAppId) ?? 0
                switch event.keyCode {
                case 123: // left arrow
                    let newId = ids[max(0, current - 1)]
                    vm.selectedAppId = newId
                    scrollToTabId = newId
                    return nil
                case 124: // right arrow
                    let newId = ids[min(ids.count - 1, current + 1)]
                    vm.selectedAppId = newId
                    scrollToTabId = newId
                    return nil
                default:
                    return event
                }
            }
        }
        .onDisappear {
            if let monitor = keyMonitor { NSEvent.removeMonitor(monitor) }
            keyMonitor = nil
        }
        .sheet(isPresented: $showSettings) {
            SettingsView().environmentObject(settings)
        }
    }

    // MARK: Header

    private var headerBar: some View {
        HStack(spacing: 8) {
            Image(systemName: "keyboard.fill")
                .foregroundColor(.accentColor)
                .font(.title3)
            Text("QuickKey")
                .font(.headline)
            Spacer()
            if let name = vm.activeAppName {
                HStack(spacing: 4) {
                    Circle()
                        .fill(vm.activeAppHasData ? Color.green : Color.red)
                        .frame(width: 6, height: 6)
                    Text(name)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            Button { showSettings = true } label: {
                Image(systemName: "gear")
                    .foregroundStyle(.secondary)
                    .font(.body)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
    }


    // MARK: Search

    private var searchBar: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            TextField("Search shortcuts…", text: $vm.searchText)
                .textFieldStyle(.plain)
                .focused($searchFocused)
            if !vm.searchText.isEmpty {
                Button { vm.searchText = "" } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(9)
        .background(Color(NSColor.controlBackgroundColor).opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
    }

    // MARK: App Tabs

    private var appTabStrip: some View {
        HStack(spacing: 0) {
            // Left arrow
            Button {
                let ids = allTabIds
                let idx = ids.firstIndex(of: scrollToTabId.isEmpty ? vm.selectedAppId : scrollToTabId) ?? 0
                scrollToTabId = ids[max(0, idx - 1)]
            } label: {
                Image(systemName: "chevron.left")
                    .font(.caption.weight(.semibold))
                    .frame(width: 22, height: 32)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .foregroundStyle(.secondary)

            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {
                        AppTabButton(icon: "star.fill", name: "Favorites",
                                     isSelected: vm.selectedAppId == "Favorites") {
                            vm.selectedAppId = "Favorites"
                            vm.searchText = ""
                            scrollToTabId = "Favorites"
                        }
                        .id("Favorites")

                        Divider().frame(height: 18).padding(.horizontal, 2)

                        ForEach(vm.allApps) { app in
                            AppTabButton(icon: app.icon, name: app.appName,
                                         isSelected: vm.selectedAppId == app.id,
                                         isHosted: vm.isHostedApp(app)) {
                                vm.selectedAppId = app.id
                                vm.searchText = ""
                                scrollToTabId = app.id
                            }
                            .id(app.id)
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 7)
                }
                .onChange(of: scrollToTabId) { id in
                    guard !id.isEmpty else { return }
                    withAnimation(.easeInOut(duration: 0.2)) {
                        proxy.scrollTo(id, anchor: .center)
                    }
                }
                .onChange(of: vm.selectedAppId) { id in
                    scrollToTabId = id
                }
            }

            // Right arrow
            Button {
                let ids = allTabIds
                let idx = ids.firstIndex(of: scrollToTabId.isEmpty ? vm.selectedAppId : scrollToTabId) ?? 0
                scrollToTabId = ids[min(ids.count - 1, idx + 1)]
            } label: {
                Image(systemName: "chevron.right")
                    .font(.caption.weight(.semibold))
                    .frame(width: 22, height: 32)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .foregroundStyle(.secondary)
        }
    }

    // MARK: Shortcuts list

    @ViewBuilder
    private var shortcutList: some View {
        let inFavorites = vm.selectedAppId == "Favorites"

        if vm.filteredCategories.isEmpty {
            if inFavorites && vm.searchText.isEmpty {
                favoritesEmptyState
            } else {
                emptySearchState
            }
        } else {
            List {
                ForEach(vm.filteredCategories) { category in
                    Section {
                        ForEach(category.shortcuts) { shortcut in
                            // In favorites tab the category.name IS the source app name
                            let appName = inFavorites ? category.name : vm.selectedAppId
                            ShortcutRow(shortcut: shortcut, appName: appName, query: vm.searchText)
                        }
                    } header: {
                        HStack(spacing: 8) {
                            Rectangle()
                                .fill(Color.accentColor)
                                .frame(width: 3, height: 14)
                                .cornerRadius(1.5)
                            Text(category.name)
                                .font(.system(size: settings.fontSize.subheadline, weight: .bold))
                                .foregroundStyle(.primary)
                                .textCase(nil)
                        }
                        .padding(.vertical, 2)
                    }
                }
            }
            .listStyle(.inset)
            .scrollContentBackground(.hidden)
        }
    }

    private var favoritesEmptyState: some View {
        VStack(spacing: 12) {
            Spacer()
            Image(systemName: "star")
                .font(.largeTitle)
                .foregroundStyle(.tertiary)
            Text("No favorites yet")
                .font(.headline)
                .foregroundStyle(.secondary)
            Text("Right-click any shortcut to add it here.")
                .font(.subheadline)
                .foregroundStyle(.tertiary)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    private var emptySearchState: some View {
        VStack(spacing: 10) {
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.largeTitle)
                .foregroundStyle(.tertiary)
            Text("No shortcuts found for \"\(vm.searchText)\"")
                .foregroundStyle(.secondary)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: Footer

    private var footerBar: some View {
        HStack {
            Text("\(totalCount) shortcuts")
                .font(.caption)
                .foregroundStyle(.tertiary)
            Spacer()
            Button("Quit QuickKey") {
                NSApplication.shared.terminate(nil)
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
    }

    private var totalCount: Int {
        vm.filteredCategories.reduce(0) { $0 + $1.shortcuts.count }
    }
}

// MARK: - App Tab Button

struct AppTabButton: View {
    let icon: String
    let name: String
    let isSelected: Bool
    var isHosted: Bool = false
    let action: () -> Void

    @EnvironmentObject var settings: SettingsStore

    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.system(size: settings.fontSize.tabLabel - 2))
                Text(name)
                    .font(.system(size: settings.fontSize.tabLabel,
                                  weight: isSelected ? .semibold : .regular))
                if isHosted && !isSelected {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 5, height: 5)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(isSelected ? Color.accentColor : Color(NSColor.controlBackgroundColor))
            .foregroundStyle(isSelected ? Color.white : Color.primary)
            .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Shortcut Row

struct ShortcutRow: View {
    let shortcut: Shortcut
    let appName: String
    let query: String

    @EnvironmentObject var vm: ShortcutsViewModel
    @EnvironmentObject var settings: SettingsStore

    private var isFav: Bool {
        vm.favoritesStore.isFavorite(shortcut, appName: appName)
    }

    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 5) {
                    Text(highlightedName)
                        .font(.system(size: settings.fontSize.body))
                    if isFav && vm.selectedAppId != "Favorites" {
                        Image(systemName: "star.fill")
                            .font(.caption2)
                            .foregroundStyle(.yellow)
                    }
                }
                if !shortcut.description.isEmpty {
                    Text(shortcut.description)
                        .font(.system(size: settings.fontSize.caption))
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            KeyComboView(
                keys: shortcut.keys,
                onTrigger: settings.allowKeyComboTrigger ? { vm.triggerShortcut?(shortcut.keys) } : nil
            )
        }
        .padding(.vertical, 3)
        .contentShape(Rectangle())
        .contextMenu {
            Button {
                vm.triggerShortcut?(shortcut.keys)
            } label: {
                Label("Trigger in Active App", systemImage: "bolt.fill")
            }

            Button {
                NSPasteboard.general.clearContents()
                NSPasteboard.general.setString(shortcut.keys.replacingOccurrences(of: "+", with: ""), forType: .string)
            } label: {
                Label("Copy \(shortcut.keys.replacingOccurrences(of: "+", with: ""))", systemImage: "doc.on.doc")
            }

            Button {
                let text = "\(shortcut.name) — \(shortcut.keys.replacingOccurrences(of: "+", with: ""))"
                NSPasteboard.general.clearContents()
                NSPasteboard.general.setString(text, forType: .string)
            } label: {
                Label("Copy as Text", systemImage: "text.alignleft")
            }

            Divider()

            if isFav {
                Button {
                    vm.favoritesStore.remove(shortcut, appName: appName)
                } label: {
                    Label("Remove from Favorites", systemImage: "star.slash")
                }
            } else {
                Button {
                    vm.favoritesStore.add(shortcut, appName: appName)
                } label: {
                    Label("Add to Favorites", systemImage: "star")
                }
            }
        }
    }

    private var highlightedName: AttributedString {
        var str = AttributedString(shortcut.name)
        guard !query.isEmpty,
              let range = str.range(of: query, options: .caseInsensitive)
        else { return str }
        str[range].backgroundColor = .init(.systemYellow.withAlphaComponent(0.35))
        return str
    }
}

// MARK: - Key Combo

struct KeyComboView: View {
    let keys: String
    var onTrigger: (() -> Void)? = nil

    @State private var isHovered = false
    @State private var isPressed = false

    private var tokens: [String] {
        keys.components(separatedBy: "+").filter { !$0.isEmpty }
    }

    var body: some View {
        HStack(spacing: isHovered ? 5 : 3) {
            ForEach(tokens, id: \.self) { token in
                KeyBadge(label: token, isHighlighted: isHovered)
            }
        }
        .scaleEffect(
            isPressed ? 0.88 : (isHovered ? 1.65 : 1.0),
            anchor: .trailing
        )
        .zIndex(isHovered ? 100 : 0)
        .onHover { hovering in
            if onTrigger != nil {
                if hovering { NSCursor.pointingHand.push() } else { NSCursor.pop() }
            }
            withAnimation(.spring(response: 0.22, dampingFraction: 0.58)) {
                isHovered = hovering
            }
        }
        .onTapGesture {
            // Brief press-down, then fire
            withAnimation(.easeIn(duration: 0.07)) { isPressed = true }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
                withAnimation(.spring(response: 0.2, dampingFraction: 0.5)) { isPressed = false }
                onTrigger?()
            }
        }
    }
}

struct KeyBadge: View {
    let label: String
    var isHighlighted: Bool = false

    @EnvironmentObject var settings: SettingsStore

    private static let symbolToName: [String: String] = [
        "⌥": "Option", "⌃": "Ctrl", "⇧": "Shift",
        "⌫": "Delete", "⎋": "Esc", "↑": "Up", "↓": "Down",
        "←": "Left", "→": "Right", "↩": "Return"
    ]

    private var displayLabel: String {
        guard settings.showKeyNames else { return label }
        return Self.symbolToName[label] ?? label
    }

    var body: some View {
        Text(displayLabel)
            .font(.system(size: settings.fontSize.body, design: .monospaced).weight(.semibold))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                isHighlighted
                    ? Color.accentColor.opacity(0.13)
                    : Color(NSColor.controlBackgroundColor)
            )
            .clipShape(RoundedRectangle(cornerRadius: 7))
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(
                        isHighlighted ? Color.accentColor : Color(NSColor.separatorColor),
                        lineWidth: isHighlighted ? 1.5 : 1
                    )
            )
            .shadow(
                color: isHighlighted ? Color.accentColor.opacity(0.35) : .black.opacity(0.15),
                radius: isHighlighted ? 10 : 0,
                x: 0,
                y: isHighlighted ? 4 : 2
            )
    }
}

