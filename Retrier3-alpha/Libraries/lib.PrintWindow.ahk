; PixelColor used only for debug
PixelColor(byref aX, byref aY, aAtMouseCoords=0){
	if aAtMouseCoords
		MouseGetPos, aX, aY
	PixelGetColor, vColor, %aX%, %aY%
	return vColor
}
class PrintWindow {
	__New(aWndId) {
		this.WndID := aWndID
		WinGetPos, , , vW, vH, ahk_id %aWndID%
		vDC := DllCall("GetDC", "UInt", pc_wID)
		vCDC := DllCall("CreateCompatibleDC", "UInt", vDC)
		vBitmap := DllCall("CreateCompatibleBitmap", "UInt", vDC, "Int", vW, "Int", vH)
		vSO := DllCall("SelectObject", "UInt", vCDC, "UInt", vBitmap)
		DllCall("PrintWindow", "UInt", aWndID, "UInt", vCDC, "UInt", 0)
		this.HandleDC := vDC
		this.CompatibleDC := vCDC
		this.CBitmap := vBitmap
	}
	ColorAR(aX, aY, byref aRef) {
		return this.ColorAtRef(aX, aY, aRef)
	}
	ColorAtRef(aX, aY, byref aRef) {
		return aRef := this.ColorAt(aX, aY)
	}
	ColorAt(aX, aY) {
		vOldFormat := A_FormatInteger
		SetFormat, IntegerFast, Hex
		vN := DllCall("GetPixel", "UInt", this.CompatibleDC, "Int", aX, "Int", aY, "UInt")
		vN := vN >> 16 & 0xff | vN & 0xff00 | (vN & 0xff) << 16
		vN .= ""
		vN := StrReplace(vN, "0x", "")
		SetFormat, IntegerFast, %vOldFormat%
		return vN
	}
	__Delete() {
		vWID := this.WndID
		vDC := this.HandleDC
		vCDC := this.CompatibleDC
		vBitmap := this.CBitmap 
		DllCall("DeleteObject", "UInt", vBitmap)
		DllCall("DeleteDC", "UInt", vCDC)
		DllCall("ReleaseDC", "UInt", vWID, "UInt", vDC)
	}
}
