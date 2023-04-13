; Functions Listed here are predefined
; FocusWindow(aID)
; SetCursorPos(aID, aX, aY, aWX, aWY)
; RClick(aID, aTimes=1)
; LClick(aID, aTimes=1)
; LClick2(aID, aX, aY)
; ELClick2(aID, aX, aY, aWX, aWY, aDelay=24, aUseMove=1)
; ELClick(aID, aX, aY, aWX, aWY, aUseMove=1)
; SpamDialogueLMB(aID, aTimes=8, aDelay=50)
; SpamEscape(aTimes=7, aDelay=100)
; SpamLMBEmit(aID, aX, aY, aWX, aWY, aTimes=5, aDelay=220)
; WinActiveGets(byref aCWndID=0, byref aWX=0, byref aWY=0, byref aW=0, byref aH=0)
; MouseMoveGame(aX, aY)
; SendKey(aID, aKey)
; SendVK_W(aDelay=1)
; SendVK_Shift(aDelay=1)
; ClickEnterText(aText, aWinID, aX, aY, aWinX, aWinY, aMouseMove=1, aDelay=4, aDelay2=0)
; ClickEnterText2(aText, aWinID, aX, aY, aWinX, aWinY, aDelay=4, aDelay2=24)
; PixelColor(byref aX, byref aY, aAtMouseCoords=0)
; -------------------------------------------------------------------
AnalyzeScreen:
Sysget, vScreenWidth, 78
Sysget, vScreenHeight, 79

if (2 == vRID && 901 > vScreenHeight && 1441 > vScreenWidth) {
	MsgBox Windowed 1440x900 is not supported on %vScreenWidth%x%vScreenHeight%
	ExitApp
}
vPixelette.Capture(vResolutionPostfix)
/*  globals:
	vWinID, vWinX, vWinY, vWinW, vWinH
	vIni, vPixelette, vRID,
	vNickname, vPassword
	vCurrentEmail
	vLogMailAfterFendOffTeleport
	vLogMailAfterFOTeleport_FileName
	dbgSentClicks := 0, dbgSentKeystrokes := 0
*/
; -------------------------------------------------------------------
; REGISTER
; Paste verify code
DbgColorRange(aPixellete, aX, aY, aRangeY=16, aRangeX=16){
	loop, %aRangeX% {
		vX := aX + A_Index
		loop, %aRangeY% {
			vY := aY + A_Index
			vQ := aPixellete.Scr.ColorAt(vX, vY)
			if ("FFFFFF" != vQ) {
				Clipboard = %vX%, %vY%, %vQ%
				msgbox x=%vX%, y=%vY%, %vQ%
			}
		}
	}
}
if (0 && vPixelette.Scr) {
	if vPixelette["UILExists"]
		msgbox vPixelette["UILExists"]
	else {
		DbgColorRange(vPixelette, 812, 210, 32, 10)
	}
	;594, 200, FFFFFF|596, 211, FFFFFF|609, 200, FFFFFF
	reload
	return
}
; vRID is resolution id
if (vPixelette["UIREmptyVerify"] && !vLazyQMGLinkOpened) {
	vLazyQMGLinkOpened := 1
	clipboard = %vUsr%@%vDmn%
	Run, %vCmd%
}
if (vPixelette["UIREmptyVerify"] && 6==StrLen(clipboard) && !InStr(clipboard, "@")) {
	dbgSentClicks+=1+1+4
	dbgSentKeystrokes+=StrLen(clipboard)
	if (1 == vRID) {
		FocusWindow(vWinID)
		sleep 335
		ClickEnterText2(clipboard, vWinID, 869, 376, vWinX, vWinY, 4, Delay:=333)
		ELClick2(vWinID, 852, 620, vWinX, vWinY, Delay:=200)
	}
	if (2 == vRID) {
		ClickEnterText2(clipboard, vWinID, 514, 399, vWinX, vWinY, 4, Delay:=333)
		ELClick2(vWinID, 574, 640, vWinX, vWinY, Delay:=200)
	}
}
; Email filling
if (vPixelette["UIREmptyMail"] && 6 != StrLen(clipboard) && InStr(clipboard, "@")) {
	dbgSentClicks+=4
	dbgSentKeystrokes+=StrLen(clipboard)
	FocusWindow(vWinID)
	; vars: vLazyQMGAllow, vLazyQMGType, vLazyQMGBrowser, vLazyQMGDelay
	if vLazyQMGAllow
		sleep %vLazyQMGDelay%
	FocusWindow(vWinID)
	sleep 50
	vCurrentEmail := clipboard
	; 550, 299, FFFFFF
	if (1 == vRID)
		ClickEnterText2(clipboard, vWinID, 925, 303, vWinX, vWinY, 4, Delay:=111)
	if (2 == vRID)
		ClickEnterText2(clipboard, vWinID, 565, 338, vWinX, vWinY, 4, Delay:=111)
}
; Password filling
if (vPixelette["UIREmptyPass"]) {
	dbgSentClicks+=2
	dbgSentKeystrokes+=StrLen(vPassword)
	if (1 == vRID)
		ClickEnterText2(vPassword, vWinID, 980, 447, vWinX, vWinY, 4, Delay:=111)
	if (2 == vRID)
		ClickEnterText2(vPassword, vWinID, 538, 463, vWinX, vWinY, 4, Delay:=111)
}
if (vPixelette["UIREmptyCPass"]) {
	dbgSentClicks+=2
	dbgSentKeystrokes+=StrLen(vPassword)
	if (1 == vRID)
		ClickEnterText2(vPassword, vWinID, 950, 516, vWinX, vWinY, 4, Delay:=111)
	if (2 == vRID)
		ClickEnterText2(vPassword, vWinID, 629, 532, vWinX, vWinY, 4, Delay:=111)
}
; Check agree checkbox
if (vPixelette["UIREmptyAgree"]) {
	dbgSentClicks+=2
	if (1 == vRID)
		ELClick2(vWinID, 728, 552, vWinX, vWinY, Delay:=244)
	if (2 == vRID)
		ELClick2(vWinID, 490, 579, vWinX, vWinY, Delay:=244)
}
; Send code
if (vCurrentEmail && vPixelette["UIREmptySendVerify"] && !vCaptchaRegisterShown) {
	dbgSentClicks+=2
	if (1 == vRID) {
		ELClick2(vWinID, 1148, 374, vWinX, vWinY, Delay:=335)
		ELClick2(vWinID, 1148, 374, vWinX, vWinY, Delay:=1000)
	}
	if (2 == vRID) {
		ELClick2(vWinID, 910, 401, vWinX, vWinY, Delay:=335)
		ELClick2(vWinID, 910, 401, vWinX, vWinY, Delay:=1000)
	}
}
if (vPixelette["UIRExistsCaptcha"])
	vCaptchaRegisterShown := 1
; -------------------------------------------------------------------
; LOGIN REQUESTED
vIsEmptyPw := vPixelette["UILEmptyPass"]
if (vIsEmptyPw) {
	dbgSentClicks+=3
	dbgSentKeystrokes+=StrLen(vPassword)
	if (1 == vRID)
		ClickEnterText2(vPassword, vWinID, 709, 502, vWinX, vWinY, 4, Delay:=111)
	if (2 == vRID)
		ClickEnterText2(vPassword, vWinID, 542, 465, vWinX, vWinY, 4, Delay:=111)
}
if (vPixelette["UILExistsCaptcha"])
	vCaptchaLoginShown := 1
if (!vIsEmptyPw && !vCaptchaLoginShown && vPixelette["UILBtnStartGame"]) {
	dbgSentClicks+=3
	if (1 == vRID)
		ELClick2(vWinID, 851, 693, vWinX, vWinY, Delay:=111)
	if (2 == vRID)
		ELClick2(vWinID, 589, 590, vWinX, vWinY, Delay:=111)
}
; -------------------------------------------------------------------
; AUTHORIZED
if (vPixelette["UIAGameStart"]) {
	dbgSentClicks+=3
	;msgbox UIAGameStart
	if (1 == vRID)
		LClick2(vWinID, 222, 222)
	if (2 == vRID)
		LClick2(vWinID, 222, 222)
	Sleep 200
}
if (vPixelette["UIACTB"]) {
	dbgSentClicks+=3
	LClick2(vWinID, 222, 222)
}
; Checkbox agree all
if (vPixelette["UIAAgreement"]) {
	dbgSentClicks+=2
	if (1 == vRID)
		ELClick2(vWinID, 581, 490, vWinX, vWinY, Delay:=333)
	if (2 == vRID)
		ELClick2(vWinID, 403, 434, vWinX, vWinY, Delay:=333)
}
; Button accept
if (vPixelette["UIAABtnAgree"]) {
	dbgSentClicks+=2
	if (1 == vRID)
		ELClick2(vWinID, 1078, 783, vWinX, vWinY, Delay:=111)
	if (2 == vRID)
		ELClick2(vWinID, 788, 679, vWinX, vWinY, Delay:=111)
}
; -------------------------------------------------------------------
; INGAME
if (vPixelette["UIIGTwinSelect"]) {
	dbgSentClicks+=1
	if (1 == vRID) {
		if (vPlayerFemale)
			ELClick2(vWinID, 419, 613, vWinX, vWinY, Delay:=111)
		else ELClick2(vWinID, 1507, 315, vWinX, vWinY, Delay:=111)
	}
	if (2 == vRID) {
		if (vPlayerFemale)
			ELClick2(vWinID, 334, 477, vWinX, vWinY, Delay:=111)
		else ELClick2(vWinID, 1112, 320, vWinX, vWinY, Delay:=111)
	}
}
if (vPixelette["UIIGTwinEmptyName"]) {
	dbgSentClicks+=2
	dbgSentKeystrokes+=StrLen(vNickname)
	if (1 == vRID)
		ClickEnterText2(vNickname, vWinID, 832, 987, vWinX, vWinY, 4, Delay:=111)
	if (2 == vRID)
		ClickEnterText2(vNickname, vWinID, 620, 848, vWinX, vWinY, 4, Delay:=111)
}
if (vPixelette["UIIGBtnConfirm"]) {
	dbgSentClicks+=1
	if (1 == vRID)
		ELClick2(vWinID, 1632, 980, vWinX, vWinY, Delay:=111)
	if (2 == vRID)
		ELClick2(vWinID, 1215, 853, vWinX, vWinY, Delay:=111)
	; LOG MAIL IF ALLOWED
	if (vLogMailAllow && InStr(vCurrentEmail, "@")) {
		FileRead, vBuffer, %vLogMailFileName%
		if (!InStr(vBuffer, vCurrentEmail) && StrLen(vCurrentEmail) < 96)
			FileAppend, %vCurrentEmail%`r`n, %vLogMailFileName%
	}
}
; vBeepOpening, vBeepAttackedWHP, AttackedWHPEpoch
; vSoundsCutscene, vSoundsCutsceneDelay
; vSoundsFendoff, vSoundsFendoffDelay
if (vPixelette["UIIGBlackscreen"]) {
	if (!vBeepOpening) {
		vBeepOpening := 1
		PlaySound(vSoundsCutscene, vSoundsCutsceneDelay)
	}
}
if (vPixelette["UIIGTutorialWaypoint"]) {
	dbgSentClicks+=1
	if (1 == vRID)
		ELClick2(vWinID, 900, 600, vWinX, vWinY, Delay:=111)
	if (2 == vRID)
		ELClick2(vWinID, 379, 457, vWinX, vWinY, Delay:=111)
}
if (vPixelette["UIIGAutoplay"]) {
	if (vAttackedWideHPBar && !vBeepAttackedWHP) {
		if (!AttackedWHPEpoch)
			AttackedWHPEpoch := utcnow()
		if (utcnow() - AttackedWHPEpoch > vSoundsFendoffDelay) {
			PlaySound(vSoundsFendoff)
			vBeepAttackedWHP := 1
		}
	}
	dbgSentKeystrokes+=2
	SendKey(vWinID, "f")
	sleep 111
	SendKey(vWinID, "f")
}
if (vPixelette["UIIGUndiscoveredWaypoint"]) {
	dbgSentKeystrokes+=4
	SpamEscape()
}
if (vPixelette["UIIGConversationMulti2"])
	MsgBox, found
; Now allow only one option to be clicked
if (vPixelette["UIIGConversationMulti"] || vPixelette["UIIGConversationMulti2"]) {
	dbgSentClicks+=1
	if (1 == vRID) {
		SetCursorPos(vWinID, 1295, 721-2, vWinX, vWinY)
		ELClick2(vWinID, 1295, 721, vWinX, vWinY)
	}
	if (2 == vRID) {
		SetCursorPos(vWinID, 993, 664-2, vWinX, vWinY)
		ELClick2(vWinID, 993, 664, vWinX, vWinY)
	}
} else if (vPixelette["UIIGConversationSingle"]) {
	dbgSentClicks+=1
	if (1 == vRID)
		ELClick2(vWinID, 1286, 794, vWinX, vWinY)
	if (2 == vRID)
		ELClick2(vWinID, 971, 715, vWinX, vWinY)
}
; End of dialogue option clickment
if (vPixelette["UIIGRedBowGirlAcquired"]) {
	dbgSentClicks+=.1
	if (1 == vRID)
		ELClick2(vWinID, 1286, 794, vWinX, vWinY)
	if (2 == vRID)
		ELClick2(vWinID, 463, 524, vWinX, vWinY)
}
if (vPixelette["UIIGPress2"]) {
	dbgSentKeystrokes+=2
	SendKey(vWinID, "2")
	sleep 500
	SendKey(vWinID, "r")
}
if (vPixelette["UIIGOpenJournal"]) {
	dbgSentKeystrokes+=2
	SendKey(vWinID, "{w down}")
	SendKey(vWinID, "J")
}
if (vPixelette["UIIGOpenedJournal"]) {
	dbgSentKeystrokes+=2
	SendKey(vWinID, "{Escape}")
	sleep 777
	SendKey(vWinID, "v")
}

if (vPixelette["UIIGPressW"] || vPixelette["UIIGPressWASD"])
	SendKey(vWinID, "{w down}")
if ((!vSpaced || !vPressSpaceOnce) && vPixelette["UIIGPressSpace"]) {
	dbgSentClicks+=1
	dbgSentKeystrokes+=2
	vSpaced := 1
	SendKey(vWinID, "{Space}")
	sleep 50
	ELClick2(vWinID, 720, 480, vWinX, vWinY, 0)
}
if (vPixelette["UIIGWideHPBar"]) {
	dbgSentClicks += 55
	vAttackedWideHPBar := 1
	vTimeToKill := 8+20
	vAttackingEpoch := utcnow()/1000
	while (utcnow()/1000-vAttackingEpoch < vTimeToKill)
		Loop, 8 {
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 0)
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 1)
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 1)
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 1)
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 0)
		}
	; Log mail if allowed #2
	if (vLogMailAfterFendOffTeleport && InStr(vCurrentEmail, "@")) {
		FileRead, vBuffer, %vLogMailAfterFOTeleport_FileName%
		if (!InStr(vBuffer, vCurrentEmail) && StrLen(vCurrentEmail) < 96)
			FileAppend, %vCurrentEmail%`r`n, %vLogMailAfterFOTeleport_FileName%
	}
}
if (vPixelette["UIIGPaimonGatekeeper"]) {
	dbgSentClicks+=1
	dbgSentKeystrokes+=2
	if (1 == vRID)
		ELClick2(vWinID, 1295, 721, vWinX, vWinY, 32)
	if (2 == vRID)
		ELClick2(vWinID, 1295, 721, vWinX, vWinY, 32)
	SendKey(vWinID, "f")
}
if (vPixelette["UIIGTeleportBtn"]) {
	dbgSentClicks+=1
	if (1 == vRID)
		ELClick2(vWinID, 1539, 1003, vWinX, vWinY, 32)
	if (2 == vRID)
		ELClick2(vWinID, 1187, 873, vWinX, vWinY, 32)
	; Assuming reroll is complete
	if (vAttackedWideHPBar) {
		FileAppend, clicks:%dbgSentClicks%`r`nkeystrokes:%dbgSentKeystrokes%`r`n, "clicks.log"
		Reload
		sleep 777
	}
}
if (vAttackedWideHPBar && !vCodeRedeemed && vPixelette["UIIGSettingsControls"]) {
	dbgSentClicks+=1
	if (1 == vRID)
		ELClick2(vWinID, 181, 574, vWinX, vWinY, 32)
	if (2 == vRID)
		ELClick2(vWinID, 133, 456, vWinX, vWinY, 32)
}
if (vAttackedWideHPBar && !vCodeRedeemed && vPixelette["UIIGSettingsAccount"]) {
	dbgSentClicks+=1
	if (1 == vRID)
		ELClick2(vWinID, 1571, 277, vWinX, vWinY, 32)
	if (2 == vRID)
		ELClick2(vWinID, 1181, 232, vWinX, vWinY, 32)
}
if (vAttackedWideHPBar && vPixelette["UIIGRedeemExists"] && vPixelette["UIIGRedeemExists"]) {
	dbgSentClicks+=2
	dbgSentKeystrokes+=StrLen("genshingift")+2+1
	vCodeRedeemed := 1
	if (1 == vRID) {
		ClickEnterText2("genshingift", vWinID, 941, 519, vWinX, vWinY, 4, Delay:=111)
		ELClick2(vWinID, 1063, 733, vWinX, vWinY, 32)
	}
	if (2 == vRID) {
		ClickEnterText2("genshingift", vWinID, 672, 451, vWinX, vWinY, 4, Delay:=111)
		ELClick2(vWinID, 824, 613, vWinX, vWinY, 32)
	}
	sleep 300
	SendKey(vWinID, "{escape}")
	sleep 300
	SendKey(vWinID, "{escape}")
}
; -------------------------------------------------------------------
; FRAME DELAY (less than 30fps recommended)
sleep 1000/24
Return
