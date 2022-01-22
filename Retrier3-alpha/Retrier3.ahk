#Include, Libraries/lib.PrintWindow.ahk
#Include, Libraries/lib.pixelette.ahk
#Include, Libraries/lib.string.ahk
#Include, Libraries/lib.ini.ahk
#include, Libraries/lib.time.ahk
#include, Libraries/lib.macros.ahk
#include, Libraries/mod.cutscene.ahk
#Include, Retrier3.Logic.ahk
#MaxHotkeysPerInterval, 999999
#MenuMaskKey, vk07
#SingleInstance, force
#UseHook, on
DetectHiddenWindows, On
Menu, Tray, Icon, Shell32.dll, 172
;----------------------------------------------------------------------------
~$*Insert::Pause ; Pause.
~$*Home::Reload ; Re-read the script.
~$*End::ExitApp ; Close the script.
;----------------------------------------------------------------------------
EmptyWorkingSet() {
	return, DllCall("psapi.dll\EmptyWorkingSet", "UInt", -1)
}
GetScriptIniFN() {
	vX = %A_ScriptFullPath%.ini
	return vX
}
;----------------------------------------------------------------------------
F2::
; add globals here:
vPlayerFemale := 1
vNickname := "Lumine"
vPassword := "$Pw!61-6754001^"
vStandalone64Path := "D:\Program Files\Genshin Impact\Genshin Impact game\GenshinImpact_Data\StreamingAssets\VideoAssets\StandaloneWindows64"
; do not edit:
vCaptchaRegisterShown := 0, vCaptchaLoginShown := 0
vAttackedWideHPBar := 0
; allocate variables
WinActiveGets(vWinID, vWinX, vWinY, vWinW, vWinH)
; load ini with colors
vIni := INIParseFile(GetScriptIniFN())
; create Pixelette instance
vPixelette := new Pixelette(vWinID)
; import from ini
vPixelette.ParseIniStruct(vIni)
; MAIN LOOP xd
Loop {
	; free RAM
	EmptyWorkingSet()
	; burn RAM, CPU
	if vScriptFinished
		break
	SetTimer, AnalyzeScreen, 1
}
Return
;----------------------------------------------------------------------------
F1::
	WinGet, vCWndID, ID, A ; A - active window
	vScr := new PrintWindow(vCWndID)
	MouseGetPos, OutputVarX, OutputVarY ; Get the coordinates of the mouse, assign the X coordinate of the mouse to the variable OutputVarX, and the same OutputVarY
	vColor := vScr.ColorAt(OutputVarX, OutputVarY)
	Clipboard = %OutputVarX%, %OutputVarY%, %vColor%
	ToolTip, Coordinates: %OutputVarX%、%OutputVarY% `nHexColor: #%vColor% ; Tooltip OutputVarX OutputVarY OutputVar
	SetTimer, RemoveToolTip, -5000 ; Let the tooltip disappear after a while
Return
;----------------------------------------------------------------------------
RemoveToolTip:
	ToolTip
Return
