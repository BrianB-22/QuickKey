import Carbon

final class HotkeyManager {
    var onActivate: (() -> Void)?

    private var hotKeyRef: EventHotKeyRef?
    private var eventHandlerRef: EventHandlerRef?
    private var registeredID: UInt32 = 0

    /// keyCode: Carbon virtual key code (kVK_*)
    /// modifiers: Carbon modifier flags (optionKey, cmdKey, etc.)
    /// id: unique integer — must differ between concurrent HotkeyManager instances
    func register(keyCode: UInt32, modifiers: UInt32, id: UInt32) {
        unregister()
        registeredID = id

        var hotKeyID = EventHotKeyID()
        hotKeyID.signature = 0x514B5F31  // 'QK_1'
        hotKeyID.id = id

        var eventType = EventTypeSpec(
            eventClass: OSType(kEventClassKeyboard),
            eventKind: OSType(kEventHotKeyPressed)
        )

        InstallEventHandler(
            GetApplicationEventTarget(),
            { _, event, userData -> OSStatus in
                guard let ptr = userData, let event = event else {
                    return OSStatus(eventNotHandledErr)
                }
                let mgr = Unmanaged<HotkeyManager>.fromOpaque(ptr).takeUnretainedValue()

                // Only act on the hotkey ID this instance registered
                var pressedID = EventHotKeyID()
                GetEventParameter(
                    event,
                    EventParamName(kEventParamDirectObject),
                    EventParamType(typeEventHotKeyID),
                    nil,
                    MemoryLayout<EventHotKeyID>.size,
                    nil,
                    &pressedID
                )
                guard pressedID.id == mgr.registeredID else { return OSStatus(eventNotHandledErr) }

                DispatchQueue.main.async { mgr.onActivate?() }
                return noErr
            },
            1,
            &eventType,
            Unmanaged.passUnretained(self).toOpaque(),
            &eventHandlerRef
        )

        RegisterEventHotKey(keyCode, modifiers, hotKeyID, GetApplicationEventTarget(), 0, &hotKeyRef)
    }

    func unregister() {
        if let ref = hotKeyRef { UnregisterEventHotKey(ref); hotKeyRef = nil }
        if let ref = eventHandlerRef { RemoveEventHandler(ref); eventHandlerRef = nil }
    }
}
