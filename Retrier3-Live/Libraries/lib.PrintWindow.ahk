; PixelColor used only for debug
PixelColor(byref aX, byref aY, aAtMouseCoords=0){
	if aAtMouseCoords
		MouseGetPos, aX, aY
	PixelGetColor, vColor, %aX%, %aY%
	return vColor
}
class PrintWindow {
	__New(aWndId) {
		;PixelGetColor, OutputVar, OutputVarX, OutputVarY, RGB
		this.WndID := aWndID
		WinGetPos, , , vW, vH, ahk_id %aWndID%
		vDC := DllCall("GetDC", "UInt", pc_wID)
		vCDC := DllCall("CreateCompatibleDC", "UInt", vDC)
		vBitmap := DllCall("CreateCompatibleBitmap", "UInt", vDC, "Int", vW, "Int", vH)
		vSO := DllCall("SelectObject", "UInt", vCDC, "UInt", vBitmap)
		DllCall("SetWindowLong", "UInt", aWndID, "UInt", -20, "UInt", 0x80000)
		DllCall("PrintWindow", "UInt", aWndID, "UInt", vCDC, "UInt", 0)
		this.HandleDC := vDC
		this.CompatibleDC := vCDC
		this.CBitmap := vBitmap
	}
	BitBlt(aHDC, aX, aY, aCX, aCY, aHdcSrc, x1, y1, rop = 0xCC0020) {
		DllCall("gdi32.dll\BitBlt", "UInt", aHDC, "int", aX, "int", aY, "int", aCX, "int", aCY, "UInt", aHdcSrc, "int", x1, "int", x1, "UInt", rop) 
	}
	CreateDrawHandles(aHwnd, aScreenWidth, aScreenHeight, frame_cc, frame_cw) {
		; Get device context (DC)
		this.DCtx := DllCall("GetDC", "UInt", aHwnd)
		; create buffer to store old color data to remove drawn rectangles
		this.CompatibleDC := DllCall("gdi32.dll\CreateCompatibleDC", "UInt", this.DCtx)
		; Create Bitmap buffer to remove drawn rectangles
		this.CBitmap := DllCall("gdi32.dll\CreateCompatibleBitmap", "UInt", this.DCtx, "int", aScreenWidth, "int", aScreenHeight)
		; Select Bitmap buffer in buffer to remove drawn rectangles
		DllCall("gdi32.dll\SelectObject", "UInt", this.CompatibleDC, "UInt", this.CBitmap)
		; Create empty rectangular region
		this.RectRgn := DllCall("gdi32.dll\CreateRectRgn", "int", 0, "int", 0, "int", 0, "int", 0)
		; Specify the color of the control frame.
		this.SBrushC := DllCall("gdi32.dll\CreateSolidBrush", "UInt", frame_cc)
		; Specify the color of the window frame.
		this.SBrushW := DllCall("gdi32.dll\CreateSolidBrush", "UInt", frame_cw)
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
