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
; GenshinOpeningBypass(aStandaloneWindows64Path)
; GenshinOpeningBypassRevoke(aStandaloneWindows64Path)
; -------------------------------------------------------------------
AnalyzeScreen:
vPixelette.Capture(vResolutionPostfix)
/*  globals:
	vWinID, vWinX, vWinY, vWinW, vWinH
	vIni, vPixelette, vRID,
	vNickname, vPassword 
*/
; -------------------------------------------------------------------
; REGISTER
; Paste verify code
if (0) {
	if vPixelette["UIIGWideHPBar"]
		msgbox vPixelette["UIIGWideHPBar"]
	else {
		vA := vPixelette.Scr.ColorAt(vAX:=587, vAY:=94)
		vB := vPixelette.Scr.ColorAt(vBX:=575, vBY:=91)
		vC := vPixelette.Scr.ColorAt(vCX:=539, vCY:=89)
		Clipboard = %vAX%, %vAY%, %vA%|%vBX%, %vBY%, %vB%|%vCX%, %vCY%, %vC%
		msgbox %vAX%, %vAY%, %vA%|%vBX%, %vBY%, %vB%|%vCX%, %vCY%, %vC%
	}
	reload
	return
}
; vRID is resolution id
if (vPixelette["UIREmptyVerify"] && 6==StrLen(clipboard) && !InStr(clipboard, "@")) {
	if (1 == vRID) {
		FocusWindow(vWinID)
		sleep 335
		ClickEnterText2(clipboard, vWinID, 747, 390, vWinX, vWinY, 4, Delay:=333)
		ELClick2(vWinID, 1006, 673, vWinX, vWinY, Delay:=200)
	}
	if (2 == vRID) {
		ClickEnterText2(clipboard, vWinID, 547, 363, vWinX, vWinY, 4, Delay:=333)
		ELClick2(vWinID, 622, 586, vWinX, vWinY, Delay:=200)
	}
	
}
; Email filling
if (vPixelette["UIREmptyMail"] && InStr(clipboard, "@")) {
	; 550, 299, FFFFFF
	if (1 == vRID)
		ClickEnterText2(clipboard, vWinID, 777, 313, vWinX, vWinY, 4, Delay:=111)
	if (2 == vRID)
		ClickEnterText2(clipboard, vWinID, 550, 299, vWinX, vWinY, 4, Delay:=111)
}
; Password filling
if (vPixelette["UIREmptyPass"]) {
	if (1 == vRID)
		ClickEnterText2(vPassword, vWinID, 750, 482, vWinX, vWinY, 4, Delay:=111)
	if (2 == vRID)
		ClickEnterText2(vPassword, vWinID, 541, 429, vWinX, vWinY, 4, Delay:=111)
}
if (vPixelette["UIREmptyCPass"]) {
	if (1 == vRID)
		ClickEnterText2(vPassword, vWinID, 748, 557, vWinX, vWinY, 4, Delay:=111)
	if (2 == vRID)
		ClickEnterText2(vPassword, vWinID, 548, 490, vWinX, vWinY, 4, Delay:=111)
}
; Check agree checkbox
if (vPixelette["UIREmptyAgree"]) {
	if (1 == vRID)
		ELClick2(vWinID, 727, 594, vWinX, vWinY, Delay:=244)
	if (2 == vRID)
		ELClick2(vWinID, 530, 522, vWinX, vWinY, Delay:=244)
}
; Send code
if (vPixelette["UIREmptySendVerify"] && !vCaptchaRegisterShown) {
	if (1 == vRID) {
		ELClick2(vWinID, 1112, 389, vWinX, vWinY, Delay:=335)
		ELClick2(vWinID, 1112, 389, vWinX, vWinY, Delay:=1000)
	}
	if (2 == vRID) {
		ELClick2(vWinID, 847, 353, vWinX, vWinY, Delay:=335)
		ELClick2(vWinID, 847, 353, vWinX, vWinY, Delay:=1000)
	}
}
if (vPixelette["UIRExistsCaptcha"])
	vCaptchaRegisterShown := 1

; -------------------------------------------------------------------
; LOGIN REQUESTED
vIsEmptyPw := vPixelette["UILEmptyPass"]
if (vIsEmptyPw) {
	if (1 == vRID)
		ClickEnterText2(vPassword, vWinID, 709, 502, vWinX, vWinY, 4, Delay:=111)
	if (2 == vRID)
		ClickEnterText2(vPassword, vWinID, 542, 465, vWinX, vWinY, 4, Delay:=111)
}
if (!vIsEmptyPw && !vCaptchaLoginShown && vPixelette["UILBtnStartGame"]) {
	if (1 == vRID)
		ELClick2(vWinID, 829, 681, vWinX, vWinY, Delay:=1000)
	if (2 == vRID)
		ELClick2(vWinID, 589, 590, vWinX, vWinY, Delay:=1000)
}
if (vPixelette["UILExistsCaptcha"])
	vCaptchaLoginShown := 1
; -------------------------------------------------------------------
; AUTHORIZED
if (vPixelette["UIAGameStart"]) {
	if (1 == vRID)
		LClick2(vWinID, 222, 222)
	if (2 == vRID)
		LClick2(vWinID, 222, 222)
	Sleep 200
}
if (vPixelette["UIACTB"]) {
	GenshinOpeningBypass(vStandalone64Path)
	LClick2(vWinID, 222, 222)
}
; Checkbox agree all
if (vPixelette["UIAAgreement"]) {
	if (1 == vRID)
		ELClick2(vWinID, 581, 490, vWinX, vWinY, Delay:=333)
	if (2 == vRID)
		ELClick2(vWinID, 412, 444, vWinX, vWinY, Delay:=333)
}
; Button accept
if (vPixelette["UIAABtnAgree"]) {
	if (1 == vRID)
		ELClick2(vWinID, 1078, 783, vWinX, vWinY, Delay:=111)
	if (2 == vRID)
		ELClick2(vWinID, 808, 685, vWinX, vWinY, Delay:=111)
}
; -------------------------------------------------------------------
; INGAME
if (vPixelette["UIIGTwinSelect"]) {
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
	if (1 == vRID)
		ClickEnterText2(vNickname, vWinID, 832, 987, vWinX, vWinY, 4, Delay:=111)
	if (2 == vRID)
		ClickEnterText2(vNickname, vWinID, 620, 848, vWinX, vWinY, 4, Delay:=111)
}
if (vPixelette["UIIGBtnConfirm"]) {
	if (1 == vRID)
		ELClick2(vWinID, 1632, 980, vWinX, vWinY, Delay:=111)
	if (2 == vRID)
		ELClick2(vWinID, 1215, 853, vWinX, vWinY, Delay:=111)
}
if (vPixelette["UIIGBlackscreen"])
	GenshinOpeningBypassRevoke(vStandalone64Path)
if (vPixelette["UIIGTutorialWaypoint"]) {
	if (1 == vRID)
		ELClick2(vWinID, 900, 600, vWinX, vWinY, Delay:=111)
	if (2 == vRID)
		ELClick2(vWinID, 379, 457, vWinX, vWinY, Delay:=111)
}
if (vPixelette["UIIGAutoplay"]) {
	SendKey(vWinID, "f")
	SendKey(vWinID, "f")
}
if (vPixelette["UIIGUndiscoveredWaypoint"])
	SpamEscape()
if (vPixelette["UIIGConversationMulti2"])
	MsgBox, found
; Now allow only one option to be clicked
if (vPixelette["UIIGConversationMulti"] || vPixelette["UIIGConversationMulti2"]) {
	if (1 == vRID) {
		SetCursorPos(vWinID, 1295, 721-2, vWinX, vWinY)
		ELClick2(vWinID, 1295, 721, vWinX, vWinY)
	}
	if (2 == vRID) {
		SetCursorPos(vWinID, 981, 671-2, vWinX, vWinY)
		ELClick2(vWinID, 981, 671, vWinX, vWinY)
	}
} else if (vPixelette["UIIGConversationSingle"]) {
	if (1 == vRID)
		ELClick2(vWinID, 1286, 794, vWinX, vWinY)
	if (2 == vRID)
		ELClick2(vWinID, 971, 715, vWinX, vWinY)
}
; End of dialogue option clickment
if (vPixelette["UIIGRedBowGirlAcquired"]) {
	if (1 == vRID)
		ELClick2(vWinID, 1286, 794, vWinX, vWinY)
	if (2 == vRID)
		ELClick2(vWinID, 463, 524, vWinX, vWinY)
}
if (vPixelette["UIIGOpenJournal"])
	SendKey(vWinID, "J")
if (vPixelette["UIIGOpenedJournal"]) {
	SendKey(vWinID, "{Escape}")
	sleep 777
	SendKey(vWinID, "v")
}
if (vPixelette["UIIGWideHPBar"]) {
	vAttackedWideHPBar := 1
	vTimeToKill := 8+18
	vAttackingEpoch := utcnow()
	while (utcnow()-vAttackingEpoch < vTimeToKill)
		Loop, 8 {
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 0)
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 1)
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 0)
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 1)
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 0)
		}
}
if (vPixelette["UIIGPaimonGatekeeper"]) {
	if (1 == vRID)
		ELClick2(vWinID, 1295, 721, vWinX, vWinY, 32)
	if (2 == vRID)
		ELClick2(vWinID, 1295, 721, vWinX, vWinY, 32)
	SendKey(vWinID, "f")
}
if (vPixelette["UIIGTeleportBtn"]) {
	if (1 == vRID)
		ELClick2(vWinID, 1539, 1003, vWinX, vWinY, 32)
	if (2 == vRID)
		ELClick2(vWinID, 1187, 873, vWinX, vWinY, 32)
	; Assuming reroll is complete
	if (vAttackedWideHPBar) {
		Reload
		sleep 777
	}
}
if (vAttackedWideHPBar && vPixelette["UIIGRedeemExists"] && vPixelette["UIIGRedeemExists"]) {
	if (1 == vRID) {
		ClickEnterText2("genshingift", vWinID, 941, 519, vWinX, vWinY, 4, Delay:=111)
		ELClick2(vWinID, 1063, 733, vWinX, vWinY, 32)
	}
	if (2 == vRID) {
		ClickEnterText2("genshingift", vWinID, 672, 451, vWinX, vWinY, 4, Delay:=111)
		ELClick2(vWinID, 824, 613, vWinX, vWinY, 32)
	}
	sleep 250
	SendKey(vWinID, "{escape}")
	sleep 250
	SendKey(vWinID, "{escape}")
}
; -------------------------------------------------------------------
; FRAME DELAY (less than 30fps recommended)
sleep 1000/24
Return
