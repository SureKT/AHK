#InstallKeybdHook
#InstallMouseHook

^!NumpadEnter::Reload
#IfWinActive Stardew Valley

+z::
While GetKeyState("z", "P")
{
    MouseClick, L
}
sleep 30
return

^Numpad1::
Loop {
    MouseClick , L
    Sleep 25
    if GetKeyState("Numpad2", "P")
        break
}
return