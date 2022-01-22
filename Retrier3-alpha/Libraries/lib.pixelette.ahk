class Pixelette {
	__New(aWndId) {
		this.WndID := aWndID
		this.Palette := []
		this.Found := []
		this.NFound := []
	}
	ParseIniStruct(aIniStruct) {
		if (!this.Palette)
			this.Palette := []
		for vK, vV in aIniStruct.Values {
			vName := vV[2], vValue := vV[3], vColorsArr := []
			; handle by separator |
			for vK, vV in SplitStr(vValue, "|") {
				vArr := []
				; loop thru eg: x, y, hexcolor
				for vK, vV in SplitStr(vV, ",")
					vArr.Push(Trim(vV, "`n`r`t "))
				vColorsArr.Push(vArr)
			}
			this.Palette.push({Name: vName, Colors: vColorsArr, State: 0})
		}
	}
	Capture() {
		this.NFound := []
		this.Found := []
		this.Scr := new PrintWindow(this.WndID)
		vLen := this.Palette.MaxIndex()
		for vK, vV in this.Palette {
			vCount := 0
			vColors := vV.Colors, vName := vV.Name
			vItem := vV
			for vK, vV in vColors {
				vColor := vV[3], vX := vV[1], vY := vV[2]
				vFoundColor := this.Scr.ColorAt(vX, vY)				
				vFlag := vColor == vFoundColor
				if (!vFlag && vName == "UIIGWideHPBar") {
					vStr = %vX%, %vY%, %vFoundColor%
					this.NFound.Push(vStr)
				}
				vCount += vFlag
			}
			vFlag := vCount == vColors.MaxIndex()
			if (vFlag)
				this.Found.Push(vName)
		}
	}
	__Get(aName) {
		for vK, vV in this.Found
			if (aName == vV)
				return 1
	}
	__Delete() {
		
	}
}
