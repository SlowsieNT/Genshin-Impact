
; ahk sucks, now we patch

SplitStr(aString, aDelimiter) {
	vR := [], vBuf := "", vL := StrLen(aString), vDL := StrLen(aDelimiter)
	loop, %vL% {
		vStr := SubStr(aString, A_Index, vDL)
		if (vStr != aDelimiter)
			vBuf .= vStr
		else {
			vR.Push(vBuf)
			vBuf := ""
		}
	}
	if (StrLen(vBuf))
		vR.push(vBuf)
	return vR
}

; save me from ahk, is nightmare
PosStr(aString, aNeedle, aIndex=1) {
	vL := StrLen(aString), vDL := StrLen(aNeedle)
	; handle negative aIndex
	if (aIndex < 1)
		aIndex := vL + aIndex + 1 ; basic rule, remove +1 if escalates kekw
	if (aIndex < 1)
		aIndex := 1 ; nullify remaining negativity
	; apply aIndex, reduce length
	if (aIndex > 1)
		vL := vL - aIndex
	loop, %vL% {
		vI := A_Index + (aIndex - 1)
		vStr := SubStr(aString, vI, vDL)
		vFlag := vStr == aNeedle
		if (vFlag) {
			return vI
		}
	}
	return -1
}

JoinStr(aArray, aDelimiter) {
	vR := "", vMI := aArray.MaxIndex()
	for vK, vV In aArray {
		vR .= vV
		if (A_Index != vMI)
			vR .= aDelimiter
	}
	return vR
}
