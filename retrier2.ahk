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

SendLMB(aID, aTimes=1) {
	ControlClick, , ahk_id %aID%, , left, aTimes
}
SendLMB2(aID, aX, aY){
	ControlClick, x%aX% y%aY%, ahk_id %aID%, , left, 1
}
SendRMB(aID) {
	ControlClick, , ahk_id %aID%, , right, 1
}
SendKey(aID, aKey) {
	ControlSend, , %aKey%, ahk_id %aID%
}
MouseMoveEx(aX, aY) {
	MouseMove, 0, 0, 80, R
}
EmitMouseLMB(aID, aX, aY, aWX, aWY, aUseMove=1) {
	if aUseMove
		DllCall("SetCursorPos", "int", aWX + aX, "int", aWY + aY)
	if aUseMove
		MouseMoveEx(0, 0)
	SendLMB2(aID, aX, aY)
}
SpamEscape() {
	Send {Escape}
		Sleep 100
		Send {Escape}
		Sleep 100
		Send {Escape}
		Sleep 100
		Send {Escape}
		Sleep 100
		Send {Escape}
		Sleep 100
		Send {Escape}
		Sleep 100
		Send {Escape}
}
Check2(arr, x, y) {
	return arr[x][0] && arr[y][0]
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
;---
LogStart(){
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", "http://localhost:81/logdate.php", true)
	whr.Send(Data)
	whr.WaitForResponse()
}
;-----------------------------------------------------------------------------
;MouseMoveGame(54, 0) ; 25
return
F2::
cwnd_id := 0, OffsetTop := 26
WX := 0, WY := 0, pixels := []
if (cwnd_id < 1) {
	WinGet, cwnd_id, ID, A ; A - active window
	WinGetPos, WX, WY, , , A
	matcher.gWID := cwnd_id
}

if (0) {
	c1 := PixelColor(543, 91, cwnd_id)
	c2 := PixelColor(543, 92, cwnd_id)
	Clipboard = [543, 91, "%c1%"], [543, 92, "%c2%"]
	return
}


; SendLMB2(cwnd_id, 1346, 414)
; PixelColor(1185, 530, cwnd_id)
; MatchPixelColors(bar4, cwnd_id)

MouseMoveGame(aX, aY) {
	DllCall("mouse_event", uint, 1, int, aX, int, aY)
}
SendClick(x, y) {
	EmitMouseLMB(cwnd_id, x, y, WX, WY)
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

; currently testing old script

; YOU MAY NEED to change "D:\" to which partition your game is installed
; required for skip cutscene
vStandaloneWindows64Path := "D:\Program Files\Genshin Impact\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets\StandaloneWindows64\"

; do not edit this (one) line below
matcher := new PixelMatcher(cwnd_id)
matcher.AddColors("startgame", [ [593, 451, "0xFFFFFF"], [62, 850, "0xC5C5C5"] ])
matcher.AddColors("clicktobegin", [ [648, 877, "0xFFFFFF"], [66, 845, "0x222222"] ])
matcher.AddColors("selecttwin", [ [661, 880, "0xECE5D8"], [734, 881, "0xECE5D8"], [789, 881, "0xECE5D8"] ])
matcher.AddColors("undiscoveredkeywaypoint", [ [612, 681, "0x555656"], [615, 683, "0xB1B1B2"] ])
matcher.AddColors("dialogueoptions", [ [977, 674, "0xF6F6F6"], [967, 661, "0xFFFFFF"] ])
matcher.AddColors("dialogueoption", [ [976, 728, "0xFFFFFF"], [982, 731, "0xF1F1F1"] ])
matcher.AddColors("journalrequest", [ [578, 216, "0x3D3D3D"], [578, 215, "0x3E3E3E"] ])
matcher.AddColors("journalopened", [ [310, 192, "0x151920"], [331, 248, "0x76726D"] ])
matcher.AddColors("passwordreg", [ [570, 420, "0xC2C2C2"], [657, 417, "0xEDEDED"] ])
matcher.AddColors("nameinput", [ [648, 854, "0xCACACC"], [642, 852, "0xD0D0D1"] ])
matcher.AddColors("confirmname", [ [1206, 847, "0x313131"], [854, 852, "0xF5F2EE"] ])
matcher.AddColors("dvalinhp", [ [543, 91, "0xFF5A5A"], [543, 92, "0xFF5A5A"] ])

matcher.AddColors("verifycode", [      [549, 352, "0xCFCFCF"],[579, 354, "0xE6E6E6"],[599, 352, "0xFFFFFF"]      ])


; also added feature to auto paste email
matcher.AddColors("emailtextbox", [   [549, 284, "0xFDFDFD"], [594, 280, "0xFFFFFF"]   ])
; old stuff below again
matcher.AddColors("eulachecked", [ [523, 542, "0xF1F8FC"], [509, 464, "0xFFFFFF"] ])
matcher.AddColors("hasauto", [ [82, 74, "0xECE5D8"], [77, 61, "0x3B4353"] ])
matcher.AddColors("paimnonshittalker", [ [ 896, 440, "0xFFFFFF" ], [896, 446, "0xE2E4E5"], [ 896, 440+56, "0xFFFFFF" ] ])
matcher.AddColors("teleportreq0", [ [978, 672, "0xFFFFFF"], [979, 664, "0x299BDB"] ])
matcher.AddColors("teleportreq1", [ [1215, 866, "0x4A5366"],[1228, 867, "0x6D727E"] ])
matcher.AddColors("teleportreq2", [ [1214, 873, "0x4A5366"], [1171, 860, "0x4A5366"] ])
matcher.AddColors("tos1", [ [440, 245, "0x323232"], [730, 257, "0x323232"], [641, 204, "0xFFFFFF"] ])
matcher.AddColors("tos2", [ [1300, 143, "0xECE5D8"], [1228, 146, "0x454D5C"] ])
matcher.AddColors("amberacquired", [ [444, 498, "0x5A2E27"],[760, 345, "0xC44016"] ])
matcher.AddColors("waypointtutorial", [ [551, 479, "0xFFFFFF"], [523, 359, "0xB2A470"] ])
; testing
matcher.AddColors("registertextdetect", [   [633, 207, "0x4EA4DC"], [593, 244, "0xFFFFFF"], [662, 214, "0xCEE6F5"]    ])
; this line (one) below is just template
matcher.AddColors("startgame", [  ])
sawDvalin := 0
canClickRegister := 0

; set char name and password here
charName := "A"
textPassword := "A1400xSceret32114"

/*
for people who want to skip those things:
get colours for these coordinations
how to: capture pixels when those tutorials appear on screen

example: PixelColor(698, 339, cwnd_id)

[shop]
698, 339
697, 475
741, 487
[wish]
700, 349
718, 374
696, 480
[dress]
685, 341
720, 320
617, 478
806, 473
*/

Loop {
	
	
	EmptyMem()
	y1 := 190 + offsettop
	y2 := 189 + offsettop
	;c1 := PixelColor(896, 446, cwnd_id)
	;c2 := PixelColor(578, y2, cwnd_id)
	;clipboard = [578, %y1%, %c1%], [578, %y2%, %c2%]
	;msgbox %c1%

	
	matcher.match()

	HasStartGame := matcher.GetIsAllPositive("startgame")
	CanBegin := matcher.GetIsAllPositive("clicktobegin")
	CanChooseTwin := matcher.GetIsAllPositive("selecttwin")
	CanCloseMap := matcher.GetIsAllPositive("undiscoveredkeywaypoint")
	HasDialogueOption := matcher.GetIsAllPositive("dialogueoption")
	HasDialogueOptions := matcher.GetIsAllPositive("dialogueoptions")
	CanClickAcquired01 := matcher.GetIsAllPositive("amberacquired")
	CanOpenJournal := matcher.GetIsAllPositive("journalrequest")
	CanCloseJournal := matcher.GetIsAllPositive("journalopened") ; passwordreg
	CanEnterPassword := matcher.GetIsAllPositive("passwordreg")
	CanConfirmName := matcher.GetIsAllPositive("confirmname")
	CanPasteEmail := matcher.GetIsAllPositive("emailtextbox")
	HasNameInput := matcher.GetIsAllPositive("nameinput")
	HasDvalin := matcher.GetIsAllPositive("dvalinhp")
	HasVerifyBox := matcher.GetIsAllPositive("verifycode")
	HasEulaChecked := matcher.GetIsAllPositive("eulachecked")
	HasConvAuto := matcher.GetIsAllPositive("hasauto")
	HasTeleport1 := matcher.GetIsAllPositive("teleportreq0")
	HasTeleport2 := matcher.GetIsAllPositive("teleportreq1")
	HasTeleport3 := matcher.GetIsAllPositive("teleportreq2")
	HasTermsoShit := matcher.GetIsAllPositive("tos1")
	HasTermsoShit2 := matcher.GetIsAllPositive("tos2")
	HasShitOnscreen := matcher.GetIsAllPositive("paimnonshittalker")
	HasWaypointTutorial := matcher.GetIsAllPositive("waypointtutorial")

	; [debug below]
	;result := matcher.GetResult("dialogueoption")
	;a := result[2][1]
	;msgbox %a%
	;MouseMoveGame(26, -50)
	;return
	; 978, 672, [1215, 866
	; [end of debug]

	if CanPasteEmail {
		vHaystack := clipboard
		vFoundPos := InStr(vHaystack, "@")
		if (vFoundPos > 1) {
			EmitMouseLMB(cwnd_id, 668, 276, WX, WY)
			sleep 35
			sendinput %vHaystack%
			sleep 150
		}
	}

	if HasVerifyBox {
		clipboardsize := strlen(Clipboard)
		if (6 == clipboardsize) {
			WinActivate, ahk_id %cwnd_id% ; focus game window
			if (0 == HasEulaChecked) ; 
				EmitMouseLMB(cwnd_id, 531, 542, WX, WY) ; checkbox position
			sleep 5
			EmitMouseLMB(cwnd_id, 633, 351, WX, WY) ; textbox of code position
			sendinput %Clipboard%
			sleep 25
		}
	}
	if (HasEulaChecked && 0 == HasVerifyBox) {
		EmitMouseLMB(cwnd_id, 581, 587, WX, WY)
		Sleep 250
	}

	if HasTeleport1 {
		if sawDvalin {
			break
		}
		msgbox sawDvalin=%sawDvalin%
		EmitMouseLMB(cwnd_id, 978, 672, WX, WY)
	}
	if (HasTeleport2 || HasTeleport3)
		EmitMouseLMB(cwnd_id, 1215, 866, WX, WY)
	if HasTermsoShit {
		EmitMouseLMB(cwnd_id, 402, 432, WX, WY)
		sleep 50
		EmitMouseLMB(cwnd_id, 803, 678, WX, WY)
		sleep 300
	}
		
	if CanEnterPassword {
		EmitMouseLMB(cwnd_id, 599, 425, WX, WY)
		sleep 5
		sendinput %textPassword%
		Sleep 180
		EmitMouseLMB(cwnd_id, 654, 487, WX, WY)
		sleep 5
		sendinput %textPassword%
		Sleep 180
		; [530, 540, "0xFFFFFF"]
		EmitMouseLMB(cwnd_id, 530, 540, WX, WY)
		sleep 35
	}
	
	if HasTermsoShit2 {
		EmitMouseLMB(cwnd_id, 1317, 144, WX, WY)
		sleep 700
	}
	if (HasShitOnscreen || HasWaypointTutorial) {
		SendLMB(cwnd_id, 1)
		Sleep 100
		Send f
	}
	if HasDvalin {
		sawDvalin:=1
		vTimeToKill := 8+18
		vDragoningEpoch := utcnow()
		while (utcnow()-vDragoningEpoch < vTimeToKill) {
			SendLMB(cwnd_id, 4)
		}
	}

	if CanConfirmName ; just in case, happens
		EmitMouseLMB(cwnd_id, 1223, 844, WX, WY)

	if CanCloseJournal {
		Send {Escape}
		Sleep 750
		Send v
		Sleep 500
		Send v
	}

	if CanOpenJournal {
		Send J
		Sleep 50
	}

	if HasNameInput {
		EmitMouseLMB(cwnd_id, 613, 850, WX, WY)
		Sleep 50
		SendInput %charName%
		Sleep 200
		EmitMouseLMB(cwnd_id, 1234, 854, WX, WY)
		sleep 150
		EmitMouseLMB(cwnd_id, 1234, 854, WX, WY)
		Sleep 7000
		GenshinOpeningBypassRevoke(vStandaloneWindows64Path)
	}
	
	if HasDialogueOptions
		EmitMouseLMB(cwnd_id, 1024, 650, WX, WY)
	else {
		if HasDialogueOption {
			EmitMouseLMB(cwnd_id, 1024, 725, WX, WY)
			Sleep 4
			EmitMouseLMB(cwnd_id, 1024, 725-64, WX, WY)
		}
	}
	
	if CanCloseMap
		SpamEscape()
	if CanClickAcquired01 {
		EmitMouseLMB(cwnd_id, 292, 495, WX, WY)
		Sleep 500
		EmitMouseLMB(cwnd_id, 292, 495, WX, WY)
		Sleep 1000
		Send 2
		Sleep 320
		Send r
	}
	if (HasConvAuto) {
		SendLMB(cwnd_id, 3)
		Sleep 15
		SendLMB(cwnd_id, 3)
		Sleep 10
		SendLMB(cwnd_id, 3)
		Sleep 8
		SendLMB(cwnd_id, 4)
		Sleep 5
		SendLMB(cwnd_id, 4)
	}
	if (CanChooseTwin) {
		EmitMouseLMB(cwnd_id, 292, 495, WX, WY)
	}
	if HasStartGame {
		GenshinOpeningBypass(vStandaloneWindows64Path)
		EmitMouseLMB(cwnd_id, 292, 347, WX, WY)
	}
	if CanBegin
		EmitMouseLMB(cwnd_id, 292, 347, WX, WY)
	if HasDvalin {
		Sleep 10
	} else {
		Sleep 50
	}
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

utcnow() {
	return gettime(0 + A_YYYY, 0 + A_MM, 0 + A_DD, 0 + A_Hour, 0 + A_Min, 0 + A_Sec, 0 + A_MSec)
}
Join(strArray) {
	s := ""
	for i, v in strArray
		s .= ", " . v
	return substr(s, 3)
}
Return
;----------------------------------------------------------------------------
F1::
	MouseGetPos, OutputVarX, OutputVarY ; Get the coordinates of the mouse, assign the X coordinate of the mouse to the variable OutputVarX, and the same OutputVarY
	PixelGetColor, OutputVar, %OutputVarX%, %OutputVarY%, RGB ; Call the PixelGetColor function to get the RGB value of the coordinates of the mouse and assign it to OutputVar
	StringRight, OutputVar, OutputVar, 8 ; Intercepts the 8 characters to the right of OutputVar (the second OutputVar) because the value obtained is this: 0x000000. Assign the intercepted value to OutputVar (the first OutputVar).
	Clipboard = [%OutputVarX%, %OutputVarY%, "%OutputVar%"]
	; Send the value of OutputVarX OutputVarY OutputVar to the clipboard
	ToolTip, Coordinates: %OutputVarX%、%OutputVarY% `nHexColor: %OutputVar% ; Tooltip OutputVarX OutputVarY OutputVar
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
		if 0 == hWND
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
				c := a == b
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

PixelColor(pc_x, pc_y, pc_wID) {
	If pc_wID
	{
		pc_hDC := DllCall("GetDC", "UInt", pc_wID)
		WinGetPos, , , pc_w, pc_h, ahk_id %pc_wID%
		pc_hCDC := DllCall("CreateCompatibleDC", "UInt", pc_hDC)
		pc_hBmp := DllCall("CreateCompatibleBitmap", "UInt", pc_hDC, "Int", pc_w, "Int", pc_h)
		pc_hObj := DllCall("SelectObject", "UInt", pc_hCDC, "UInt", pc_hBmp)
		DllCall("PrintWindow", "UInt", pc_wID, "UInt", pc_hCDC, "UInt", 0)
		pc_fmtI := A_FormatInteger
		SetFormat, IntegerFast, Hex
		pc_c := DllCall("GetPixel", "UInt", pc_hCDC, "Int", pc_x, "Int", pc_y, "UInt")
		pc_c := pc_c >> 16 & 0xff | pc_c & 0xff00 | (pc_c & 0xff) << 16
		pc_c .= ""
		SetFormat, IntegerFast, %pc_fmtI%
		DllCall("DeleteObject", "UInt", pc_hBmp)
		DllCall("DeleteDC", "UInt", pc_hCDC)
		DllCall("ReleaseDC", "UInt", pc_wID, "UInt", pc_hDC)
		;msgbox %pc_c%, %pc_x%x
		Return pc_c
	}
}
;----------------------------------------------------------------------------
EmptyMem() {
	Return, DllCall("psapi.dll\EmptyWorkingSet", "UInt", -1)
}
Return
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
