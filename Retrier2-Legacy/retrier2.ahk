;----------------------------------------------------------------------------
#MaxHotkeysPerInterval, 999999 ;Specify the rate at which the hotkey is activated with #HotkeyInterval, above which a warning dialog will be displayed.
#MenuMaskKey, vk07 ;Change the button used to disguise (mask) the Win or Alt key release event.
#SingleInstance, force ;Decide if the script is allowed to run again when it is already running.
#UseHook, on ;Forces the use of hooks to implement all or part of the keyboard hotkeys.
DetectHiddenWindows, On ;Sets whether the script can "see" hidden windows.
;Process, Priority, , High ;Perform one of the following operations on the process: Check if the process exists; Change the priority of the process; Close the process; Wait for the process to close.
Menu, Tray, Icon, Shell32.dll, 172
;----------------------------------------------------------------------------
~$*Insert::Pause ; Pause.
~$*Home::Reload ; Re-read the script.
~$*End::ExitApp ; Close the script.
~$*!k::KeyHistory ; Displays script information and history of recent keystrokes and mouse clicks.
;----------------------------------------------------------------------------

; USER SETTINGS
Retrier2_GetSettings() {
	; OLD script pw was A1400xSceret32114
	; YOU MAY EDIT THESE 3 LINES(variables) BELOW
	vCustomName := "Lumine"
	vPassword := "A1400x!Sceret32114"
	; Usually partition letter may need change:
	vStandaloneWindows64Path := "D:\Program Files\Genshin Impact\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets\StandaloneWindows64\"
	; DO NOT EDIT BELOW, UNLESS YOU KNOW WHAT ARE YOU DOING
	return {"PlayerName":vCustomName, "Password": vPassword, "SW64P": vStandaloneWindows64Path}
}
; DEVELOPER SETTINGS
Retrier2_AllocateMatcherPData(aM) {
	; Caution: 3rd value (color) can be Integer, string not required!!!
	; aM.AddColors("Name", [ [1, 1, 0x0] ])
	;       aM.Set("Name", [ [1, 1, 0x0] ])
	; === REGISTRATION FORM ===
	; Pixel Detect TextBox(es)
	aM.Set("Register_Detect", [ [476, 203, "0x4EA4DC"], [662, 223, "0x4EA4DC"], [514, 235, "0xFFFFFF"] ])
	aM.Set("Register_TBoxEmail", [ [545, 286, "0xFAFAFA"], [555, 287, "0xEEEEEE"], [575, 287, "0xFFFFFF"] ])
	aM.Set("Register_TBoxVerify", [ [551, 350, "0xD3D3D3"], [567, 352, "0xEBEBEB"], [570, 352, "0xFFFFFF"] ])
	aM.Set("Register_TBoxPass", [ [544, 416, "0xF9F9F9"], [556, 416, "0xDDDDDD"], [593, 416, "0xFFFFFF"] ])
	; Pixel Detect CheckBox(es)
	aM.Set("Register_CBoxTOSPP", [ [526, 517, "0xD7D7D7"], [531, 527, "0xF4F4F4"], [528, 521, "0xFFFFFF"] ])
	; Pixel Detect LinkLabel(s)
	; Verify Send Code
	aM.Set("Register_LLnkCode", [ [835, 351, "0x8DC4E8"], [839, 352, "0xE7F3FA"], [836, 349, "0xFFFFFF"] ])
	aM.Set("Register_LLnkCodeBugged", [ [835, 375, "0x6EB5E2"], [845, 379, "0xAED6EF"], [836, 377, "0xFFFFFF"] ])
	; ===/ REGISTRATION FORM ===

	; === LOGIN FORM ===
	; Pixel Detect TextBox(es)
	aM.Set("Login_Detect", [ [653, 247, "0x666666"], [685, 236, "0x808080"], [72, 857, "0x7F7F7F"], [568, 246, "0xFFFFFF"] ])
	aM.Set("Login_TBoxEmail", [ [493, 350, "0xCCCCCC"], [532, 354, "0xCECECE"], [592, 357, "0xE4E4E4"], [552, 354, "0xFFFFFF"] ])
	aM.Set("Login_TBoxPass", [ [491, 438, "0xF9F9F9"], [522, 440, "0xE6E6E6"], [541, 447, "0xCCCCCC"], [519, 446, "0xFFFFFF"] ])
	; Pixel Detect Labels
	; Detect Terms of Service
	aM.Set("Login_TOSDetect", [ [459, 251, "0xEFEFEF"], [564, 244, "0x323232"], [435, 432, "0x383838"], [457, 487, "0x646464"], [442, 534, "0xCBCBCB"], [446, 251, "0xFFFFFF"] ])
	; Detect StartGames
	aM.Set("Login_StartGame2.1", [ [593, 451, "0xFFFFFF"], [62, 850, "0xC5C5C5"] ])
	aM.Set("Login_StartGameLogin", [ [584, 445, "0xFFFFFF"], [1368, 778, "0x222222"], [690, 466, "0xFFFFFF"], [79, 844, "0x909090"], [1378, 851, "0x3C3C3C"] ])
	; ===/ LOGIN FORM ===

	; === INGAME ===
	; Start of opening cutscene pixels
	aM.Set("Ingame_SelectTwin", [ [660, 880, "0xECE5D8"], [700, 881, "0xECE5D8"], [701, 885, "0xECE5D8"] ])
	aM.Set("Ingame_PlayerName", [ [648, 854, "0xCACACC"], [642, 852, "0xD0D0D1"] ])
	aM.Set("Ingame_ConfirmName", [ [1228, 853, "0xECE5D8"], [1233, 840, "0xECE5D8"], [1197, 853, "0x313131"] ])
	; End of opening cutscene pixels
	; Start of regular pixels
	aM.Set("Ingame_DialogueOptions", [ [977, 658, "0xFFFFFF"], [970, 670, "0xF2F2F2"], [970, 669, "0xFBFBFB"], [971, 726, "0xF2F2F2"] ])
	aM.Set("Ingame_DialogueOption", [ [966, 717, "0xFFFFFF"], [964, 718, "0xFCFCFC"], [968, 710, "0xFDFDFD"] ])
	aM.Set("Ingame_ReqOpenJournal", [ [578, 216, "0x3D3D3D"], [578, 215, "0x3E3E3E"] ])
	aM.Set("Ingame_JournalOpen", [ [382, 247, "0x76726D"], [339, 192, "0x151920"] ])
	aM.Set("Ingame_ConvDetect", [ [76, 63, "0x3B4354"], [84, 71, "0xECE5D8"] ])
	aM.Set("Ingame_PaimonGuardsDoor", [ [ 896, 440, "0xFFFFFF" ], [896, 446, "0xE2E4E5"], [ 896, 440+56, "0xFFFFFF" ] ])
	aM.Set("Ingame_RedGirl2BowAcquired", [ [444, 498, "0x5A2E27"],[760, 345, "0xC44016"] ])
	aM.Set("Ingame_WaypointTutorial", [ [551, 479, "0xFFFFFF"], [523, 359, "0xB2A470"] ])
	aM.Set("Ingame_BigHPBar", [ [543, 91, "0xFF5A5A"], [543, 92, "0xFF5A5A"] ])
	aM.Set("Ingame_UndiscoveredWaypoint", [ [609, 688, "0xB0B0B1"], [614, 681, "0x9F9FA0"] ])
	aM.Set("Ingame_ClickToBegin", [ [648, 877, "0xFFFFFF"], [66, 845, "0x222222"] ])
	; Teleport Detections (abbreviations: D=Detect, C=Component)
	aM.Set("Ingame_DTeleportC1", [ [1215, 866, "0x4A5366"], [1228, 867, "0x6D727E"] ])
	aM.Set("Ingame_DTeleportC2", [ [1214, 873, "0x4A5366"], [1171, 860, "0x4A5366"] ])
	; Else
	aM.Set("Ingame_BlackScreen", [ [714, 36, 0x0], [714, 35, 0x0], [712, 35, 0x0] ])
	aM.Set("Ingame_", [  ])
	; End of regular pixels
	; ===/ INGAME ===
}
;----------------------------------------------------------------------------
EmptyMem() {
	Return, DllCall("psapi.dll\EmptyWorkingSet", "UInt", -1)
}
FocusWindow(aID) {
	WinActivate, ahk_id %aID% ; This will focus window by its id
}
SendLMB(aID, aTimes=1) {
	ControlClick, , ahk_id %aID%, , left, aTimes ; Send click to window by its id
}
SendLMB2(aID, aX, aY){
	ControlClick, x%aX% y%aY%, ahk_id %aID%, , left, 1 ; Send click to window by its id
}
SendRMB(aID) {
	ControlClick, , ahk_id %aID%, , right, 1 ; Send click to window by its id
}
SendKey(aID, aKey) {
	ControlSend, , %aKey%, ahk_id %aID% ; Send keystroke to window by its id
}
SpamDialogueLMB(aID, aWX, aWY, aTimes=8, aDelay=25) {
	Loop, %aTimes% {
		SendLMB(aID, 3)
		Sleep aDelay
	}
}
SpamEscape(aTimes=7, aDelay=100) {
	Loop, %aTimes% {
		Send {Escape}
		Sleep aDelay
	}
}
EmitMouseLMB2(aID, aX, aY, aWX, aWY, aUseMove=1, aDelay=0) {
	EmitMouseLMB(aID, aX, aY, aWX, aWY, aUseMove)
	if aDelay
		Sleep aDelay
}
EmitMouseLMB(aID, aX, aY, aWX, aWY, aUseMove=1) {
	if aUseMove
		DllCall("SetCursorPos", "int", aWX + aX, "int", aWY + aY)
	SendLMB2(aID, aX, aY)
}
MouseMoveGame(aX, aY) {
	; Moving cursor ingame (camera view?)
	DllCall("mouse_event", uint, 1, int, aX, int, aY)
}
SendClick(aX, aY) {
	EmitMouseLMB(vCurrWndHnd, aX, aY, WX, WY)
}
MouseMoveEx(aX=0, aY=0, aSpeed=80) {
	MouseMove, aX, aY, aSpeed, R
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
LogStart(aData=""){ ; was used for measuring reroll time - all history
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", "http://localhost:81/logdate.php", true)
	whr.Send(aData)
	whr.WaitForResponse()
}
ClickEnterText(aText, aWinID, aX, aY, aWinX, aWinY, aMouseMove=1, aDelay=4, aDelay2=0){
	EmitMouseLMB(aWinID, aX, aY, aWinX, aWinY, aMouseMove)
	Sleep aDelay
	SendInput %aText%
	if aDelay2
		Sleep aDelay2
}
ClickEnterText2(aText, aWinID, aX, aY, aWinX, aWinY, aDelay=4, aDelay2=24){
	ClickEnterText(aText, aWinID, aX, aY, aWinX, aWinY, 1, aDelay, aDelay2)
}
PixelColor(byref aX, byref aY, aAtMouseCoords=0){
	if aAtMouseCoords
		MouseGetPos, aX, aY
	PixelGetColor, vColor, %aX%, %aY%
	return vColor
}
;-----------------------------------------------------------------------------
F2::
vCurrWndHnd := 0, OffsetTop := 26
WX := 0, WY := 0
if (vCurrWndHnd < 1) {
	WinGet, vCurrWndHnd, ID, A ; A - active window
	WinGetPos, WX, WY, , , A
}
; used for debugging
if (0) {
	c1 := PixelColor(x1:=626, y1:=848)
	c2 := PixelColor(x2:=625, y2:=847)
	Clipboard = [%x1%, %y1%, "%c1%"], [%x2%, %y2%, "%c2%"]
	return
}
GenshinOpeningAssets(aStandaloneWindows64Path, byref aFile1, byref aFile2, byref aFile3) {
	vFile1 = %aStandaloneWindows64Path%\MDAQ001_OPNew_Part1.usm
	vFile2 = %aStandaloneWindows64Path%\MDAQ001_OPNew_Part2_PlayerBoy.usm
	vFile3 = %aStandaloneWindows64Path%\MDAQ001_OPNew_Part2_PlayerGirl.usm
	aFile1 := vFile1, aFile2 := vFile2, aFile3 := vFile3
}
GenshinOpeningBypass(aStandaloneWindows64Path) {
	GenshinOpeningAssets(aStandaloneWindows64Path, vFile1, vFile2, vFile3)
	FileMove, %vFile1%, %vFile1%.bak
	FileMove, %vFile2%, %vFile2%.bak
	FileMove, %vFile3%, %vFile3%.bak
}
GenshinOpeningBypassRevoke(aStandaloneWindows64Path) {
	GenshinOpeningAssets(aStandaloneWindows64Path, vFile1, vFile2, vFile3)
	FileMove, %vFile1%.bak, %vFile1%
	FileMove, %vFile2%.bak, %vFile2%
	FileMove, %vFile3%.bak, %vFile3%
}

; NO TOUCHMENT!
vUserEmail := ""
vPMatch := new PixelMatcher(vCurrWndHnd)
Retrier2_AllocateMatcherPData(vPMatch)
vSettings := Retrier2_GetSettings()

; Start of Zero value variables
Ingame_SeenDragon := 0, Register_CanSubmit := 0, Login_SeenButton := 0, Register_MailEntered := 0, Register_UIGone := 0
vOpeningBypassRevoked := 0, Register_CodeSent := 0
; End of Zero value variables

; used for verifying email address (6 digit code, or similar)
RegisterApplyVerifyCode(aCurrWndHnd, aWX, aWY, byref aVar1, byref aVar2) {
	FocusWindow(aCurrWndHnd)
	Sleep 100 ; Delay needed for window to properly show
	ClickEnterText2(Clipboard, aCurrWndHnd, 552, 352, aWX, aWY, Delay:=2, Delay:=99)
	aVar1:=1, aVar2:=2
}
Loop {
	EmptyMem()
	vPMatch.match()
	; GenshinOpeningBypass(aStandaloneWindows64Path)
	; GenshinOpeningBypassRevoke(aStandaloneWindows64Path)
	; EmitMouseLMB(aCurrWndHnd, 668, 276, WX, WY)
	; EmitMouseLMB2(aCurrWndHnd, 668, 276, WX, WY, 1, aDelay=0)
	; ClickEnterText(aText, aWinID, aX, aY, aWinX, aWinY, aMouseMove=1, aDelay=4, aDelay2=0)
	; ClickEnterText2(aText, aWinID, aX, aY, aWinX, aWinY, aDelay=4, aDelay2=0)
	; vSettings[PlayerName, Password, SW64P]
	
	; Reminder: CODE ORDER MATTERS (unless you add more logic)

	; === LOGIN FORM ===
	vLoginDetect := vPMatch["Login_Detect"]
	vLoginTBoxPass := vPMatch["Login_TBoxPass"]
	vLoginTBoxEmail := vPMatch["Login_TBoxEmail"]
	; Reset Register_CanSubmit to 0 once register is done
	if vLoginDetect {
		; debugmsg
		Register_CanSubmit:=0
	}
	; Fill password textbox if empty
	if vLoginTBoxPass {
		; debugmsg
		ClickEnterText2(vSettings["Password"], vCurrWndHnd, 550, 427, WX, WY, Delay:=2, Delay:=99)
	}
	; Fill email textbox if empty
	if vLoginTBoxEmail
		if vUserEmail {
			; debugmsg
			ClickEnterText2(vUserEmail, vCurrWndHnd, 540, 333, WX, WY, Delay:=2, Delay:=99)
		}
	; Before Clicking Login button, perform checks
	if (!vLoginTBoxEmail && !vLoginTBoxPass && !Login_SeenButton && vLoginDetect) {
		; debugmsg
		Login_SeenButton := 2
		;msgbox %Login_SeenButton%
		EmitMouseLMB(vCurrWndHnd, 596, 610, WX, WY)
		Sleep 2000
	}
	; Handle Terms of Service Agreement
	if vPMatch["Login_TOSDetect"] {
		; debugmsg
		; Click "all" Checkbox
		EmitMouseLMB2(vCurrWndHnd, 404, 434, WX, WY, 1, Delay:=32+333)
		; Click Accept
		EmitMouseLMB2(vCurrWndHnd, 785, 686, WX, WY, 1, Delay:=250)
	}
	; ===/ LOGIN FORM ===

	; === REGISTRATION FORM ===
	if Register_CanSubmit { ; Happens when all register data is filled
		; debugmsg
		EmitMouseLMB2(vCurrWndHnd, 662, 597, WX, WY, 1, 480)
	}
	if vPMatch["Register_CBoxTOSPP"] { ; Check/click the unchecked checkbox
		; debugmsg
		EmitMouseLMB2(vCurrWndHnd, 526, 517, WX, WY, 1, 32)
	}
	if vPMatch["Register_TBoxPass"] { ; Fill both password fields
		FocusWindow(vCurrWndHnd)
		ClickEnterText2(vSettings["Password"], vCurrWndHnd, 572, 423, WX, WY, Delay:=4, Delay:=99)
		ClickEnterText2(vSettings["Password"], vCurrWndHnd, 549, 490, WX, WY, Delay:=4, Delay:=99)
	}
	if vPMatch["Register_TBoxEmail"] { ; Fill email field with copied mail
		vFoundPos := InStr(vHaystack := Clipboard, "@")
		if (vFoundPos > 1) {
			; debugmsg
			vUserEmail := Clipboard
			FocusWindow(vCurrWndHnd)
			ClickEnterText2(vHaystack, vCurrWndHnd, 574, 287, WX, WY, Delay:=4, Delay:=150)
		}
	} else Register_MailEntered := 1
	; Report register ui being missing
	if !vPMatch["Register_Detect"]
		Register_UIGone = 1
	vLLnkCodeUI := vPMatch["Register_LLnkCode"] || vPMatch["Register_LLnkCodeBugged"]
	; Checks before clicking send code
	if (Register_MailEntered && vLLnkCodeUI && !Register_CanSubmit) {
		; debugmsg
		if Register_UIGone
			return
		FocusWindow(vCurrWndHnd)
		Sleep 100
		EmitMouseLMB2(vCurrWndHnd, 841, 351, WX, WY, 1, 120)
		EmitMouseLMB2(vCurrWndHnd, 841, 351, WX, WY, 1, 120+2400)
		Register_CodeSent:=1
	}
	; Clipboard Checking for verify code fails at times
	; Someone else to fix this (doesn't happen in new script)
	vCBL := StrLen(Clipboard)
	if (6 == vCBL && !Register_UIGone && 2 != Register_CodeSent) {
		; it'll allocate 2 variables (last 2 func args)
		RegisterApplyVerifyCode(vCurrWndHnd, WX, WY, Register_CanSubmit, Register_CodeSent)
	}
	while (Register_CodeSent && 2 != Register_CodeSent) {
		vCBL := StrLen(Clipboard)
		if (!Register_CanSubmit && 6 == vCBL) {
			; it'll allocate 2 variables (last 2 func args)
			RegisterApplyVerifyCode(vCurrWndHnd, WX, WY, Register_CanSubmit, Register_CodeSent)
		}
		Sleep 100
	}
	; ===/ REGISTRATION FORM ===

	; === INGAME ===
	; Detect "Click To Begin"
	if vPMatch["Ingame_ClickToBegin"] {
		; debugmsg
		; Remove Cutscene files
		GenshinOpeningBypass(vSettings["SW64P"])
		; Then Click anywhere to load game
		EmitMouseLMB2(vCurrWndHnd, 456, 453, WX, WY, 1, Delay:=111)
	}
	; Detect any "Start Game"
	vCanStartGame := vPMatch["Login_StartGame2.1"] || vPMatch["Login_StartGameLogin"]
	; Checks, then click anywhere
	if vCanStartGame {
		; debugmsg
		EmitMouseLMB2(vCurrWndHnd, 456, 453, WX, WY, 1, Delay:=111)
	}
	; Detect Twin Selection
	if vPMatch["Ingame_SelectTwin"] {
		; debugmsg
		GenshinOpeningBypass(vSettings["SW64P"])
		EmitMouseLMB2(vCurrWndHnd, 309, 515, WX, WY, 1, Delay:=48)
	}
	; Detect Twin Name Input Box
	if vPMatch["Ingame_PlayerName"] {
		; debugmsg
		ClickEnterText2(vSettings["PlayerName"], vCurrWndHnd, 626, 853, WX, WY, Delay:=4, Delay:=32)
	}
	; Detect Twin Confirm Name Button
	if vPMatch["Ingame_ConfirmName"] {
		; debugmsg
		; Click Confirm Name
		EmitMouseLMB2(vCurrWndHnd, 1223, 846, WX, WY, 1, 50)
	}
	; Detect if black screen is shown (when cutscene files corrupt)
	if vPMatch["Ingame_BlackScreen"] {
		; Restore cutscene files
		GenshinOpeningBypassRevoke(vSettings["SW64P"])
	}
	; Handle one simple tutorial
	if vPMatch["Ingame_WaypointTutorial"] {
		; debugmsg
		SendLMB(vCurrWndHnd, 1)
	}
	; We need to slay paimon the door guardsman
	if vPMatch["Ingame_PaimonGuardsDoor"] {
		; debugmsg
		SendLMB(vCurrWndHnd, 1) ; First we kill him
		Sleep 9 ; We wait...
		Send F ; Then we press F to pay respects
	}
	; Detect Dialogue Option(s) and handle them
	if vPMatch["Ingame_DialogueOptions"] {
		; debugmsg
		EmitMouseLMB(vCurrWndHnd, 1024, 650, WX, WY)
	}
	else if vPMatch["Ingame_DialogueOption"] {
		; debugmsg
		EmitMouseLMB2(vCurrWndHnd, 1024, 650, WX, WY, 1, Delay:=4)
		EmitMouseLMB2(vCurrWndHnd, 1024, 725, WX, WY, 1, Delay:=4)
		EmitMouseLMB2(vCurrWndHnd, 1024, 725-64, WX, WY, 1, Delay:=0)
	}
	; Detect if cutscene on first statue of 7 was shown the map
	if vPMatch["Ingame_UndiscoveredWaypoint"] {
		; debugmsg
		SpamEscape() ; Spam out of map
	}
	; Detect if red bow girl is shown
	if vPMatch["Ingame_RedGirl2BowAcquired"] {
		; debugmsg
		; Then try to exit and select her and aim
		EmitMouseLMB2(vCurrWndHnd, 292, 495, WX, WY, 1, Delay:=1500)
		EmitMouseLMB2(vCurrWndHnd, 292, 495, WX, WY, 1, Delay:=320)
		EmitMouseLMB2(vCurrWndHnd, 292, 495, WX, WY, 1, Delay:=320)
		EmitMouseLMB2(vCurrWndHnd, 292, 495, WX, WY, 1, Delay:=320)
		Send 2
		Sleep 360
		Send r
	}
	; Detect conversation, spam during conversation
	if vPMatch["Ingame_ConvDetect"] {
		; debugmsg
		SpamDialogueLMB(vCurrWndHnd, WX, WY)
	}
	; Handle Journaling
	if vPMatch["Ingame_ReqOpenJournal"] {
		; debugmsg
		Send J
		Sleep 50
	}
	if vPMatch["Ingame_JournalOpen"] {
		; debugmsg
		Send {Escape}
		Sleep 800
		Send v
	}
	; Teleport on any teleport component detection
	if (vPMatch["Ingame_DTeleportC1"] || vPMatch["Ingame_DTeleportC2"]) {
		; debugmsg
		EmitMouseLMB(vCurrWndHnd, 1215, 866, WX, WY)
		if Ingame_SeenDragon
			break ; Break script if rerolling
	}
	; Detect Dragon dungeon, actually any big hp bar will trigger this
	vHasDragon := vPMatch["Ingame_BigHPBar"]
	if vHasDragon {
		; debugmsg
		Ingame_SeenDragon := 1
		vTimeToKill := 8+18
		vAttackingEpoch := utcnow()
		while (utcnow()-vAttackingEpoch < vTimeToKill) {
			SendLMB(vCurrWndHnd, 5)
			SendLMB(vCurrWndHnd, 3)
		}
	}
	; ===/ INGAME ===
	
	; Script delay should exist
	; DON'T set above 24FPS, may break script(default: 23)
	Sleep 1000/23
}
; ahk sucks, here's the polyfill for: get unix timestamp 
gettime(aYear=1970, aMonth=1, aDay=1, aHour=0, aMinute=0, aSeconds=0, aMilli=0) {
	; this is correct way to calculate timestamp, noobs
	vDaysToMonth := [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365]
	vYears := aYear - 1970
	; this is the way, noobs only divide by 4, not all x/4 are leap
	vLeaps := ceil(vYears/4 + vYears/400 - vYears/100)
	vYearsToTime := (vYears - vLeaps) * 31536000 + vLeaps * 31622400
	vMonthsToTime := vDaysToMonth[aMonth] * 86400
	vDaysToTime := aDay * 86400
	vHoursToTime := aHour * 3600
	vMinutesToTime := aMinute * 60
	; add all numbers together
	vTime := vYearsToTime+vMonthsToTime+vDaysToTime+vHoursToTime+vMinutesToTime+aSeconds+aMilli/1000
	; do -86400 for lulz' sake
	return round(vTime - 86400, 3)
}
; Once upon a time I wish I could one-line things in AHK
utcnow() {
	; When adding 0 matters, be like:
	return gettime(0 + A_YYYY, 0 + A_MM, 0 + A_DD, 0 + A_Hour, 0 + A_Min, 0 + A_Sec, 0 + A_MSec)
}
; Again, for lulz' sake kekw
IsSame(aColorA, aColorB) {
	return aColorA == aColorB ; kekw
}
Join(strArray) { ; This function has no literal purpose, debugging?
	s := ""
	for i, v in strArray
		s .= ", " . v
	return substr(s, 3)
}
;----------------------------------------------------------------------------
F1::
	vColorHex := PixelColor(vMouseX, vMouseY, 1)
	Clipboard = [%vMouseX%, %vMouseY%, %vColorHex%]
	; Send the value of OutputVarX vMouseY OutputVar to the clipboard
	ToolTip, Pixel info: %vMouseX%; %vMouseY%; %vColorHex%
	SetTimer, RemoveToolTip, -5000 ; Let the tooltip disappear after a while
Return
;----------------------------------------------------------------------------
RemoveToolTip:
	ToolTip
Return
;----------------------------------------------------------------------------
class PixelMatcher {
	__New(aWndId) {
		this.gWID := aWndId
		this.gArray := []
		this.gResult := []
	}
	__Get(aName) {
		return this.GetIsAllPositive(aName)
	}
	GetIsAllPositive(aName) {
		result := this.GetResult(aName), c := 0
		for i in result
			c += result[i][1]
		return c == result.MaxIndex()
	}
	; result[pixel index][1=get boolean, 2=get found color]
	GetResult(aName) {
		zArr := this.gResult
		for i in zArr {
			item := zArr[i]
			if (aName == item[1])
				return item[2]
		}
		return 0
	}
	Set(aName, aColors) {
		this.AddColors(aName, aColors)
	}
	AddColors(aName, aColors) {
		this.gArray.Push([aColors, aName])
	}
	GetPixel(aHCDC, aX, aY) {
		pc_c := DllCall("GetPixel", "UInt", aHCDC, "Int", aX, "Int", aY, "UInt")
		pc_c := pc_c >> 16 & 0xff | pc_c & 0xff00 | (pc_c & 0xff) << 16
		a := pc_c . ""
		return a
	}
	Match() {
		hWND := this.gWID
		if !hWND
			return 0
		pc_hDC := DllCall("GetDC", "UInt", hWND)
		WinGetPos, , , pc_w, pc_h, ahk_id %hWND%
		pc_hCDC := DllCall("CreateCompatibleDC", "UInt", pc_hDC)
		pc_hBmp := DllCall("CreateCompatibleBitmap", "UInt", pc_hDC, "Int", pc_w, "Int", pc_h)
		pc_hObj := DllCall("SelectObject", "UInt", pc_hCDC, "UInt", pc_hBmp)
		DllCall("PrintWindow", "UInt", hWND, "UInt", pc_hCDC, "UInt", 0)
		zArr := this.gArray, rArr := []
		for i in zArr {
			pixels := zArr[i][1], cret := [], pval := []
			cret.Push(zArr[i][2])
			for i in pixels {
				x := pixels[i][1], y := pixels[i][2]
				a := this.GetPixel(pc_hCDC, x, y)
				b := pixels[i][3]
				c := IsSame(a, b)
				pval.Push([c, a])
			}
			cret.Push(pval)
			rArr.Push(cret)
		}
		this.gResult := rArr
		DllCall("DeleteObject", "UInt", pc_hBmp)
		DllCall("DeleteDC", "UInt", pc_hCDC)
		DllCall("ReleaseDC", "UInt", hWND, "UInt", pc_hDC)
		return rArr
	}
}
;----------------------------------------------------------------------------
/*
	for starting beach dash simulation attempt, readmemory would be great with it and improvements added to it
	if (3 == animationType) {
		if (iterations > 3) {
			return
		}
	}
	if (2 == animationType) {
		if (iterations > 2) {
			animationType := 3, iterations := 0
			MouseMoveGame(-155, 25)
		}
	}
	if (1 == animationType) {
		if (iterations > 1) {
			animationType := 2, iterations := 0
			MouseMoveGame(240, 0)
		}
	}
*/
