#Include, Libraries/lib.PrintWindow.ahk
#Include, Libraries/lib.pixelette.ahk
#Include, Libraries/lib.string.ahk
#Include, Libraries/lib.ini.ahk
#include, Libraries/lib.time.ahk
#include, Libraries/lib.macros.ahk
#include, Libraries/mod.qmg.ahk
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
PlaySound(aFilename, aDelay=0, aDelay2=0) {
	sleep %aDelay%
	SoundPlay, %aFilename%
	sleep %aDelay2%
}
GetScrPath(aAdd) {
	s = %A_ScriptDir%/%aAdd%
	return s
}
GetScriptIniFN(aExt=".ini") {
	vX = %A_ScriptFullPath%%aExt%
	return vX
}
GetRequest(aURL){
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", aURL, true)
	;whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	whr.Send()
	whr.WaitForResponse()
	return whr.ResponseText
}

;----------------------------------------------------------------------------
F2::
dbgSentClicks := 0, dbgSentKeystrokes := 0
infOnline := GetRequest("https://raw.githubusercontent.com/SlowsieNT/Genshin-Impact/main/Retrier3-Live/Etc.Updates.ini")
infOnline := INIParseFile(infOnline, 1)
infOld := INIParseFile(GetScrPath("Etc.Updates.ini"))
dateOld := infOld.Get("Retrier3;date;0")
dateNew := infOnline.Get("Retrier3;date;0")
if (dateNew > dateOld)
	MsgBox Updates available:`r`nhttps://github.com/SlowsieNT/Genshin-Impact
; inf
vInf := INIParseFile(GetScriptIniFN(".inf"))
; load ini with colors
vIni := INIParseFile(GetScriptIniFN())
; retrieve values from inf, no edits required here
; do not edit unless dev
vCurrentEmail := ""
vPlayerFemale := "1" == vInf.Get("Player;Female;1")
vNickname := vInf.Get("Player;Name;Lumine")
vPassword := vInf.Get("Account;Password", "$P+w!614$28754!14001^")
vPressSpaceOnce := "1" == vInf.Get("HiddenSettings;PressSpaceOnce;0")
; Sounds
vSoundsCutscene := vInf.Get("Sounds;AfterCutscene;icecubes.mp3")
vSoundsCutsceneDelay := vInf.Get("Sounds;AfterCutsceneDelay;1000")
vSoundsFendoff := vInf.Get("Sounds;AfterFendoff;icecubes.mp3")
vSoundsFendoffDelay := vInf.Get("Sounds;AfterFendoffDelay;1000")
; LazyQMG
vLazyQMGAllow := "1" == vInf.Get("LazyQMG;Allow;1")
vLazyQMGType := vInf.Get("LazyQMG;MailType;2")
vLazyQMGDelay := vInf.Get("LazyQMG;Delay;1500")
vLazyQMGBrowser := vInf.Get("LazyQMG;BrowserPath;2")
; etc
vResolutionPostfix := vInf.Get("Screen;Resolution;FS1920")
vStandalone64Path := vInf.Get("Game;SAVASW64", "D:\Program Files\Genshin Impact\Genshin Impact game\GenshinImpact_Data\StreamingAssets\VideoAssets\StandaloneWindows64")
; LogMail
vLogMailAllow := "1" == vInf.Get("LoggingMail;Allow;1")
vLogMailAfterFendOffTeleport := "1" == vInf.Get("LoggingMail;AfterFOTeleport;0")
vLogMailAfterFOTeleport_FileName := vInf.Get("LoggingMail;AfterFOTeleport_FileName", "ar5mails.log")
vLogMailFileName := vInf.Get("LoggingMail;FileName", "mails.log")
; Now allocate array of chosen mail type
QMGMagick = ModsQMG;MailType%vLazyQMGType%
QMGStr := vIni.Get(QMGMagick)
QMGArray := SplitStr(QMGStr, ",")
; edit only if you know how to maintain script:
vResIdx := {"FS1920":1, "WM1440":2}
; do not edit anything below unless you are dev:
vRID := vResIdx[vResolutionPostfix]
vCaptchaRegisterShown := 0, vCaptchaLoginShown := 0
vAttackedWideHPBar := 0, vSpaced := 0, vLazyQMGLinkOpened := 0, vCodeRedeemed := 0
vBeepOpening := 0, vBeepAttackedWHP := 0, AttackedWHPEpoch := 0
; allocate variables
WinActiveGets(vWinID, vWinX, vWinY, vWinW, vWinH)
; create Pixelette instance
vPixelette := new Pixelette(vWinID)
; import from ini
vPixelette.ParseIniStruct(vIni)
;---------------------------------------------------------------------------
; MAIN LOOP xd
if (vLazyQMGAllow) {
	; vars: vLazyQMGAllow, vLazyQMGType, vLazyQMGBrowser, vLazyQMGDelay
	vUsr := QMG_Username(), vDmn := "", vCmd := ""
	if (0 == vLazyQMGType) {
		vLink := QMG_FMGLink(vUsr, vDmn := RChoice(QMGArray))
		vCmd = %vLazyQMGBrowser% %vLink%
	}
	if (1 == vLazyQMGType) {
		vLink := QMG_GELink(vUsr, vDmn := RChoice(QMGArray))
		vCmd = %vLazyQMGBrowser% %vLink%
	}
	if (2 == vLazyQMGType) {
		vLink := QMG_EFLink(vUsr, vDmn := RChoice(QMGArray))
		vCmd = %vLazyQMGBrowser% %vLink%
	}
}
Loop {
	; free RAM
	EmptyWorkingSet()
	; burn RAM, CPU
	SetTimer, AnalyzeScreen, 1
}
Return
;----------------------------------------------------------------------------
F4::
	WinGet, vCWndID, ID, A ; A - active window
	vScr := new PrintWindow(vCWndID)
	MouseGetPos, OutputVarX, OutputVarY ; Get the coordinates of the mouse, assign the X coordinate of the mouse to the variable OutputVarX, and the same OutputVarY
	vColor := vScr.ColorAt(OutputVarX, OutputVarY)
	Clipboard = %OutputVarX%, %OutputVarY%, %vColor%
	ToolTip, Coordinates: %OutputVarX% %OutputVarY% `nHexColor: #%vColor% ; Tooltip OutputVarX OutputVarY OutputVar
	SetTimer, RemoveToolTip, -5000 ; Let the tooltip disappear after a while
Return
;----------------------------------------------------------------------------
RemoveToolTip:
	ToolTip
Return
