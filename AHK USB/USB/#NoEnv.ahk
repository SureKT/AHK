#NoEnv
#SingleInstance, Force
#KeyHistory, 0
#MaxThreadsPerHotkey, 1
#Persistent
ListLines, Off
SendMode, Input
SetBatchLines, -1
SetWinDelay, -1
SetMouseDelay, -1
SetKeyDelay, -1, -1
SetTitleMatchMode, 2
DetectHiddenWindows, On
SetWorkingDir, % A_ScriptDir

Wallpapers := [] ; Forces the list to be an array.

WallpaperLoc := A_Desktop "C:\GERARD\Wallpaper" ; The location of the wallpapers

Loop, % WallpaperLoc . "*.jpg" ; wherever you store your wallpapers
{
	Wallpapers[A_Index] := A_LoopFileName
}

Menu, Tray, NoStandard ; Forces the Tray menu to be blank before adding anything.
Menu, Tray, Add, Refresh Wallpapers, RefreshWallpapers ; Manual refresh for wallpapers
Menu, Tray, Add
Menu, Tray, Add, Exit Script, Exit ; Allow exiting the script with a simple command.
Return ; Ends the auto-execute section

RefreshWallpapers: ; does the same job as the auto-execute
	Wallpapers := []

	Loop, % WallpaperLoc . "*.jpg" ; wherever you store your wallpapers
	{
		Wallpapers[A_Index] := A_LoopFileName
	}
	TrayTip, Wallpaper, Wallpaper list refreshed!,,1
	Return

Exit:
	ExitApp, 0 ; Exit the script with a code of 0

;!7:: ; Sets the wallpaper to a random image in the 'Pictures' folder.
;	TrayTip, Wallpaper, % Format("Setting ""{1}"" as your wallpaper", File := Wallpapers[Random(1, Wallpapers.MaxIndex())]),, 1
;	FileCopy, % % WallpaperLoc . File, % A_MyDocuments . "\currentwallpaper.jpg", 1
;	SetWallpaper(A_MyDocuments . "\currentwallpaper.jpg")
;	Return

^!Numpad7:: ; Sets the wallpaper to 'WM1.jpg'
	SetWallpaper(WallpaperLoc . "WOK.jpg")
	Return

; Sets the wallpaper to a selected file of your choosing.
;SetWallpaper(WallpaperFile) {
;	DllCall("SystemParametersInfo", "Uint", 20, "Uint", 0, "Str", WallpaperFile, "Uint", 2)
;}

; Just a minor function to help with minimizing code. Nothing to worry about for your sake.
Random(Min, Max) {
	Random, Out, % Min, % Max
	Return, Out
}

NumpadEnter::Reload
NumpadSub::ExitApp