FocusWindow(aID) {
	WinActivate, ahk_id %aID% ; This will focus window by its id
}
SetCursorPos(aID, aX, aY, aWX, aWY) {
	DllCall("SetCursorPos", "int", aWX + aX, "int", aWY + aY)
}
RClick(aID, aTimes=1) {
	ControlClick, , ahk_id %aID%, , right, aTimes
}
LClick(aID, aTimes=1) {
	ControlClick, , ahk_id %aID%, , left, aTimes
}
LClick2(aID, aX, aY){
	ControlClick, x%aX% y%aY%, ahk_id %aID%, , left, 1 ; coordinated click
}
; simulate and set cursor position
ELClick(aID, aX, aY, aWX, aWY, aUseMove=1) {
	if aUseMove
		SetCursorPos(aID, aX, aY, aWX, aWY)
	LClick2(aID, aX, aY)
}
ELClick2(aID, aX, aY, aWX, aWY, aDelay=24, aUseMove=1) {
	ELClick(aID, aX, aY, aWX, aWY, aUseMove)
	Sleep %aDelay%
}
SpamDialogueLMB(aID, aTimes=8, aDelay=50) {
	Loop, %aTimes% {
		LClick(aID, 3)
		Sleep aDelay
	}
}
SpamEscape(aTimes=7, aDelay=100) {
	Loop, %aTimes% {
		Send {Escape}
		Sleep aDelay
	}
}
SpamLMBEmit(aID, aX, aY, aWX, aWY, aTimes=5, aDelay=220) {
	Loop, %aTimes% {
		ELClick(aID, aX, aY, aWX, aWY, 0)
		Sleep aDelay
	}
}
WinActiveGets(byref aCWndID=0, byref aWX=0, byref aWY=0, byref aW=0, byref aH=0, byref aProcessName="", byref aProcessPath="", byref aProcessId=0, byref aCount=0) {
	WinGet, aCount, Count, A ; A - active window
	WinGet, aProcessPath, ProcessPath, A ; A - active window
	WinGet, aProcessName, ProcessName, A ; A - active window
	WinGet, aProcessId, PID, A ; A - active window
	WinGet, aCWndID, ID, A ; A - active window
	WinGetPos, aWX, aWY, aW, aH, A
}
MouseMoveGame(aX, aY) {
	; Moving cursor ingame (camera view?)
	DllCall("mouse_event", uint, 1, int, aX, int, aY)
}
SendKey(aID, aKey) {
	ControlSend, , %aKey%, ahk_id %aID% ; Send keystroke to window by its id
}
SendVK_W(aDelay=1) {
	Send, {w down}
	Sleep %aDelay%
	Send, {w up}
}
SendVK_Shift(aDelay=1) {
	Send, {Shift down}
	Sleep %aDelay%
	Send, {Shift up}
}
ClickEnterText(aText, aWinID, aX, aY, aWinX, aWinY, aMouseMove=1, aDelay=4, aDelay2=0){
	ELClick(aWinID, aX, aY, aWinX, aWinY, aMouseMove)
	Sleep aDelay
	SendInput %aText%
	if aDelay2
		Sleep aDelay2
}
ClickEnterText2(aText, aWinID, aX, aY, aWinX, aWinY, aDelay=4, aDelay2=24){
	ClickEnterText(aText, aWinID, aX, aY, aWinX, aWinY, 1, aDelay, aDelay2)
}
