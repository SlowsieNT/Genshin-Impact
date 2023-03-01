RChoice(aArray) {
	Random, vIndex, 1, aArray.MaxIndex()
	return aArray[vIndex]
}
QMG_Username() {
	; could be better but couldn't care less
	Random, vChr, 103, 122
	Random, vChr2, 103, 122
	Random, vChr3, 103, 122
	Random, vNum, 11111, 999999
	vStr := utcnow(), vChr := Chr(vChr), vChr2 := Chr(vChr2)
	vStr2 = %vChr%%vStr%%vChr2%%vNum%%vChr3%
	return vStr2
}
QMG_FMGLink(aUsr, aDmn) {
	vStr = http://www.fakemailgenerator.com/inbox/%aDmn%/%aUsr%/
	return vStr
}
QMG_GELink(aUsr, aDmn) {
	vStr = https://generator.email/%aUsr%@%aDmn%
	return vStr
}
QMG_EFLink(aUsr, aDmn) {
	vStr = https://emailfake.com/%aDmn%/%aUsr%/
	return vStr
}
