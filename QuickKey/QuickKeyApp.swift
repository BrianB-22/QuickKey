import SwiftUI

@main
struct QuickKeyApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        // Menu bar only — no dock icon (LSUIElement=YES in Info.plist)
        Settings {
            EmptyView()
        }
    }
}
