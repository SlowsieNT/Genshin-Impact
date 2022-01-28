class Pixelette {
	__New(aWndId) {
		this.WndID := aWndID
		this.Palette := []
		this.Found := []
		this.NFound := []
		this.Postfix := ""
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
	FindColors(aName, aColors) {
		for vK, vV in aColors {
			vColor := vV[3], vX := vV[1], vY := vV[2]
			vFoundColor := this.Scr.ColorAt(vX, vY)				
			vFlag := vColor == vFoundColor
			if (!vFlag) {
				vStr = %vX%, %vY%, %vFoundColor%
				this.NFound.Push(vStr)
			}
			vCount += vFlag
		}
		vFlag := vCount == aColors.MaxIndex()
		if (vFlag)
			this.Found.Push(aName)
	}
	Capture(aPostfix) {
		this.Postfix := aPostfix := Trim(aPostfix)
		this.NFound := []
		this.Found := []
		this.Scr := new PrintWindow(this.WndID)
		vLen := this.Palette.MaxIndex()
		for vK, vV in this.Palette {
			vCount := 0
			vColors := vV.Colors, vName := vV.Name
			vPFP := PosStr(vName, aPostfix)
			vPFLP := strlen(aPostfix) - (strlen(vName) - vPFP)
			if (-1 != vPFP && 1 == vPFLP)
				this.FindColors(vName, vColors)
			else if (!aPostfix)
				this.FindColors(vName, vColors)
		}
	}
	__Get(aName) {
		vX := this.Postfix
		vName = %aName%_%vX%
		for vK, vV in this.Found
			if (vName == vV)
				return 1
	}
}
