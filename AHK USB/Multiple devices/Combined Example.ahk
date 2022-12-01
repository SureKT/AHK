;2nd Keyboard Detector
#SingleInstance force
#Persistent
#include Lib\AutoHotInterception.ahk

global AHI := new AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x1C4F, 0x0002)

AHI.SubscribeKey(keyboardId, GetKeySC("2"), true, Func("KeyEvent"))

cm1 := AHI.CreateContextManager(keyboardId)
return

KeyEvent(state) {
	static ctrlCode := GetKeySC("Ctrl")
	global keyboardId
	~ AHI.SendKeyEvent(keyboardId, ctrlCode, state)
	ToolTip%"State: " state
}

#if cm1.IsActive

Alt:: run%comspec% / k, C: \
	Users\
Sure
º
M::
Send, {
	Volume_Mute}
Sleep, 25000
Send, {
	Volume_Mute}
return

S:: run, D: \
	Python\
dbf.bat

#If

NumpadEnter:: Reload
NumpadSub:: ExitApp
F12:: run, explorer.exe