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
