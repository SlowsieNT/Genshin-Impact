class IniStruct {
	__New() {
		this.Sections := [""], this.Values := []
	}
	__Delete() {
		this.Sections := [], this.Values := []
	}
	SectionIndex(aName) {
		vSections := this.Sections
		for vK, vV In vSections
			if (vV == aName)
				return A_Index
		return -1
	}
	SectionKeys(aSection) {
		vSI := this.SectionIndex(aSection), vR := []
		for vK, vV In this.Values {
			vSectionIndex := vV[1], vName := vV[2]
			if (vSI == vSectionIndex)
				vR.push(vName)
		}
		return vR
	}
	AddSection(aName) {
		vSI := this.SectionIndex(aName)
		if (-1 == this.SectionIndex(aName)) {
			this.Sections.Push(aName)
			return this.Sections.MaxIndex()
		}
		return vSI
	}
	FindKeyIndex(aName, aSection="") {
		vSI := this.SectionIndex(aSection)
		for vK, vV In this.Values {
			vSectionIndex := vV[1], vName := vV[2], vValue := vV[3]
			if (vSI == vSectionIndex && vName == aName)
				return A_Index
		}
		return -1
	}
	Get(aMagick, aDefault="") {
		vParts := SplitStr(aMagick, ";")
		vValue := this.GetValue(vParts[2], vParts[1])
		if (StrLen(Trim(vValue)))
			return vValue
		if (aDefault)
			return aDefault
		return vParts[3]
	}
	GetValue(aName, aSection="") {
		vKI := this.FindKeyIndex(aName, aSection)
		if (vKI > -1) {
			vValue := this.Values[vKI][3]
			return vValue
		}
	}
	AddValue(aName, aValue, aSection="") {
		vSI := this.AddSection(aSection)
		vKI := this.FindKeyIndex(aName, aSection)
		if (-1 == vKI)
			this.Values.Push([vSI, aName, aValue])
	}
}
INIParseFile(aFilename) {
	FileRead, vBuffer, %aFilename%
	vLineF = `n
	vCurrentSection := "", vLines := SplitStr(vBuffer, vLineF), vIniStruct := new IniStruct()
	; we don't do regex, it is evil
	; walkthrough the array, mastery has no destination
	for vK, vV In vLines {
		vLine := Trim(vV)
		vLineLen := strlen(vLine)
		; find both brackets
		vBracketLPos := PosStr(vLine, "[")
		vBracketRPos := PosStr(vLine, "]")
		vCommentStartPos := PosStr(vLine, ";")
		; handle ini current section name
		if (1 == vBracketLPos) {
			vCurrentSection := SubStr(SubStr(vLine, vBracketLPos + 1), 1, vBracketRPos - 2)
			vIniStruct.AddSection(vCurrentSection)
		} else {
			if ("" == Trim(vLine) || 1 == vCommentStartPos)
				continue
			; if not found, set: len + 2, for science xd
			vUncommentedLine := vLine
			; we parse line without shittalk
			if (vCommentStartPos > 0) 	{
				;msgbox has comments=%vLine%
				vUncommentedLine := SubStr(vLine, 1, vCommentStartPos - 2)
				vUncommentedLine := Trim(vUncommentedLine)
			}
			; get position of "=" in the line
			vAssignPos := PosStr(vUncommentedLine, "=")
			; go next iteration if no name=value
			if (-1 == vAssignPos)
				continue
			; get left side of =
			vLeft := trim(SubStr(vUncommentedLine, 1, vAssignPos - 1), "`r")
			; get right side of =
			vRight := trim(SubStr(vUncommentedLine, vAssignPos + 1), "`r")
			; msgbox Left: "%vLeft%"`nRight: "%vRight%"
			vIniStruct.AddValue(vLeft, vRight, vCurrentSection)
		}
	}
	return vIniStruct
}
