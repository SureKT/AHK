#InstallKeybdHook
#InstallMouseHook
#MaxHotkeysPerInterval, 500

^Numpad0::
MouseClick, L, 0, 0, ,0

Sleep, 50
Send, {PrintScreen}

Sleep, 50
MouseClickDrag, L, 2250, 600, 2750, 950, 3,

Sleep, 50
MouseClick, L, 2800, 10, ,0

Sleep, 50
Send, ^c

Sleep, 50
Send, ^v

Sleep, 50
Send, {Enter}

Sleep, 50
Return

^NumpadSub::ExitApp
^NumpadEnter::Reload