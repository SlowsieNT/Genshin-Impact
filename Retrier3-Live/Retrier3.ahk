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
GetScriptIniFN(aExt=".ini") {
	vX = %A_ScriptFullPath%%aExt%
	return vX
}
;----------------------------------------------------------------------------
F2::
; inf
vInf := INIParseFile(GetScriptIniFN(".inf"))
; retrieve values from inf, no edits required here
vPlayerFemale := "1" == vInf.Get("Player;Female;1")
vNickname := vInf.Get("Player;Name;Lumine")
vPassword := vInf.Get("Account;Password", "$P+w!614$28754!14001^")
vResolutionPostfix := vInf.Get("Screen;Resolution;FS1920")
vStandalone64Path := vInf.Get("Game;SAVASW64", "D:\Program Files\Genshin Impact\Genshin Impact game\GenshinImpact_Data\StreamingAssets\VideoAssets\StandaloneWindows64")
vLogMailAllow := "1" == vInf.Get("LoggingMail;Allow;1")
vLogMailFileName := vInf.Get("LoggingMail;FileName", "mails.log")
; edit only if you know how to maintain script:
vResIdx := {"FS1920":1, "WM1440":2}
; do not edit anything below unless you are dev:
vRID := vResIdx[vResolutionPostfix]
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
;---------------------------------------------------------------------------
; LOG MAIL IF ALLOWED
if (vLogMailAllow && InStr(clipboard, "@")) {
	FileRead, vBuffer, %vLogMailFileName%
	if (!InStr(vBuffer, clipboard) && StrLen(clipboard) < 96)
		FileAppend, %clipboard%`r`n, %vLogMailFileName%
}
;---------------------------------------------------------------------------
; MAIN LOOP xd
Loop {
	; free RAM
	EmptyWorkingSet()
	; burn RAM, CPU
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