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
Debug() {
	;1189, 497, FFFFFF|1196, 586, F1F1F1|1191, 580, FFFFFF
	SetTimer, AnalyzeScreen, Off
	vColor1 := PixelColor(1189, 497)
	vColor2 := PixelColor(1196, 586)
	vColor3 := PixelColor(1191, 580)
	msgbox %vColor1%,%vColor2%,%vColor3%
}
AnalyzeScreen:
vPixelette.Capture()
/*  globals:
	vWinID, vWinX, vWinY, vWinW, vWinH
	vIni, vPixelette
	vNickname, vPassword 
*/
;Debug()
;return

; -------------------------------------------------------------------
; REGISTER
; Paste verify code
if (vPixelette["UIREmptyVerify_FS1920"] && 6==StrLen(clipboard) && !InStr(clipboard, "@")) {
	ClickEnterText2(clipboard, vWinID, 747, 390, vWinX, vWinY, 4, Delay:=333)
	ELClick2(vWinID, 1006, 673, vWinX, vWinY, Delay:=200)
}
; Email filling
if (vPixelette["UIREmptyMail_FS1920"] && InStr(clipboard, "@"))
	ClickEnterText2(clipboard, vWinID, 777, 313, vWinX, vWinY, 4, Delay:=111)
; Password filling
if (vPixelette["UIREmptyPass_FS1920"])
	ClickEnterText2(vPassword, vWinID, 750, 482, vWinX, vWinY, 4, Delay:=111)
if (vPixelette["UIREmptyCPass_FS1920"])
	ClickEnterText2(vPassword, vWinID, 748, 557, vWinX, vWinY, 4, Delay:=111)
; Check agree checkbox
if (vPixelette["UIREmptyAgree_FS1920"])
	ELClick2(vWinID, 727, 594, vWinX, vWinY, Delay:=244)
; Send code
if (vPixelette["UIREmptySendVerify_FS1920"] && !vCaptchaRegisterShown) {
	ELClick2(vWinID, 1112, 389, vWinX, vWinY, Delay:=335)
	ELClick2(vWinID, 1112, 389, vWinX, vWinY, Delay:=1000)
}
if (vPixelette["UIRExistsCaptcha_FS1920"])
	vCaptchaRegisterShown := 1

; -------------------------------------------------------------------
; LOGIN REQUESTED
vIsEmptyPw := vPixelette["UILEmptyPass_FS1920"]
if (vIsEmptyPw)
	ClickEnterText2(vPassword, vWinID, 709, 502, vWinX, vWinY, 4, Delay:=111)
if (!vIsEmptyPw && !vCaptchaLoginShown && vPixelette["UILBtnStartGame_FS1920"])
	ELClick2(vWinID, 829, 681, vWinX, vWinY, Delay:=1000)
if (vPixelette["UILExistsCaptcha_FS1920"])
	vCaptchaLoginShown := 1
; -------------------------------------------------------------------
; AUTHORIZED
if (vPixelette["UIAGameStart_FS1920"]) {
	LClick2(vWinID, 222, 222)
	Sleep 200
}
if (vPixelette["UIACTB_FS1920"]) {
	GenshinOpeningBypass(vStandalone64Path)
	LClick2(vWinID, 222, 222)
}
; Checkbox agree all
if (vPixelette["UIAAgreement_FS1920"])
	ELClick2(vWinID, 581, 490, vWinX, vWinY, Delay:=333)
; Button accept
if (vPixelette["UIAABtnAgree_FS1920"])
	ELClick2(vWinID, 1078, 783, vWinX, vWinY, Delay:=111)
; -------------------------------------------------------------------
; INGAME
if (vPixelette["UIIGTwinSelect_FS1920"])
	if (vPlayerFemale)
		ELClick2(vWinID, 419, 613, vWinX, vWinY, Delay:=111)
	else ELClick2(vWinID, 1507, 315, vWinX, vWinY, Delay:=111)
if (vPixelette["UIIGTwinEmptyName_FS1920"])
	ClickEnterText2(vNickname, vWinID, 832, 987, vWinX, vWinY, 4, Delay:=111)
if (vPixelette["UIIGBtnConfirm_FS1920"])
	ELClick2(vWinID, 1632, 980, vWinX, vWinY, Delay:=111)
if (vPixelette["UIIGBlackscreen_FS1920"])
	GenshinOpeningBypassRevoke(vStandalone64Path)
if (vPixelette["UIIGTutorialWaypoint_FS1920"])
	ELClick2(vWinID, 900, 600, vWinX, vWinY, Delay:=111)
if (vPixelette["UIIGAutoplay_FS1920"])
	ELClick2(vWinID, 900, 600, vWinX, vWinY, Delay:=1)
if (vPixelette["UIIGUndiscoveredWaypoint_FS1920"])
	SpamEscape()
if (vPixelette["UIIGConversationMulti2_FS1920"])
	MsgBox, found
if (vPixelette["UIIGConversationMulti_FS1920"] || vPixelette["UIIGConversationMulti2_FS1920"]) {
	SetCursorPos(vWinID, 1295, 721-2, vWinX, vWinY)
	ELClick2(vWinID, 1295, 721, vWinX, vWinY)
}
if (vPixelette["UIIGConversationSingle_FS1920"]) {
	ELClick2(vWinID, 1286, 794, vWinX, vWinY)
}
if (vPixelette["UIIGRedBowGirlAcquired_FS1920"])
	ELClick2(vWinID, 1286, 794, vWinX, vWinY)
if (vPixelette["UIIGOpenJournal"])
	SendKey(vWinID, "J")
if (vPixelette["UIIGOpenedJournal"])
	SendKey(vWinID, "{Escape}")
if (vPixelette["UIIGWideHPBar"]) {
	vAttackedWideHPBar := 1
	vTimeToKill := 8+18
	vAttackingEpoch := utcnow()
	while (utcnow()-vAttackingEpoch < vTimeToKill)
		Loop, 8 {
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 1)
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 0)
			ELClick2(vWinID, 1295, 721, vWinX, vWinY, 2)
		}
}
if (vPixelette["UIIGPaimonGatekeeper"]) {
	ELClick2(vWinID, 1295, 721, vWinX, vWinY, 32)
	SendKey(vWinID, "f")
}
if (vPixelette["UIIGTeleportBtn"])
	ELClick2(vWinID, 1539, 1003, vWinX, vWinY, 32)

; debug
if (0) {
vXd := vPixelette.NFound
if (vXd.MaxIndex() > 0) {
	vLine = `n
	vStr := JoinStr(vXd, "|")
	clipboard = %vStr%
	msgbox %vStr%
}
}

; -------------------------------------------------------------------
; FRAME DELAY (less than 30fps recommended)
sleep 1000/24
