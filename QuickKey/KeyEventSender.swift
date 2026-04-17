import CoreGraphics
import AppKit
import ApplicationServices

enum KeyEventSender {

    // MARK: - Public

    static func isAccessibilityEnabled() -> Bool {
        AXIsProcessTrusted()
    }

    static func requestAccessibilityPermission() {
        let key = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String
        AXIsProcessTrustedWithOptions([key: true] as CFDictionary)
    }

    /// Parse a stored key string like "⌘+⇧+Z" and post the corresponding CGEvents.
    static func send(keys: String) {
        let tokens = keys.components(separatedBy: "+").filter { !$0.isEmpty }

        var flags: CGEventFlags = []
        var keyCode: CGKeyCode? = nil

        for token in tokens {
            switch token {
            case "⌘": flags.insert(.maskCommand)
            case "⇧": flags.insert(.maskShift)
            case "⌥": flags.insert(.maskAlternate)
            case "⌃": flags.insert(.maskControl)
            default:   keyCode = virtualKey(for: token)
            }
        }

        guard let kc = keyCode else { return }
        let src = CGEventSource(stateID: .hidSystemState)

        let down = CGEvent(keyboardEventSource: src, virtualKey: kc, keyDown: true)
        down?.flags = flags
        down?.post(tap: .cghidEventTap)

        let up = CGEvent(keyboardEventSource: src, virtualKey: kc, keyDown: false)
        up?.flags = flags
        up?.post(tap: .cghidEventTap)
    }

    // MARK: - Key code table

    // Virtual key codes from <HIToolbox/Events.h>
    private static func virtualKey(for token: String) -> CGKeyCode? {
        let map: [String: CGKeyCode] = [
            // Letters
            "A": 0,  "S": 1,  "D": 2,  "F": 3,  "H": 4,  "G": 5,
            "Z": 6,  "X": 7,  "C": 8,  "V": 9,  "B": 11, "Q": 12,
            "W": 13, "E": 14, "R": 15, "Y": 16, "T": 17, "O": 31,
            "U": 32, "I": 34, "P": 35, "L": 37, "J": 38, "K": 40,
            "N": 45, "M": 46,
            // Numbers
            "1": 18, "2": 19, "3": 20, "4": 21, "5": 23,
            "6": 22, "7": 26, "8": 28, "9": 25, "0": 29,
            // Symbols
            "-": 27, "=": 24, "+": 24, "[": 33, "]": 30,
            "\\": 42, ";": 41, "'": 39, ",": 43, ".": 47,
            "/": 44, "`": 50,
            // Special
            "Space": 49, "Return": 36, "↩": 36,
            "Tab": 48,   "⇥": 48,
            "⌫": 51,     "Delete": 51,
            "⎋": 53,     "Escape": 53,
            // Arrows
            "←": 123, "→": 124, "↑": 126, "↓": 125,
            // Function keys
            "F1": 122, "F2": 120, "F3": 99,  "F4": 118,
            "F5": 96,  "F6": 97,  "F7": 98,  "F8": 100,
            "F9": 101, "F10": 109,"F11": 103, "F12": 111,
        ]
        return map[token.uppercased()] ?? map[token]
    }
}
