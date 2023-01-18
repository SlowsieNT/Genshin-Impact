RChoice(aArray) {
	Random, vIndex, 1, aArray.MaxIndex()
	return aArray[vIndex]
}
QMG_FakeMailGenerator() {
	vArr := ["armyspy.com","cuvox.de","dayrep.com","einrot.com","fleckens.hu","gustr.com","jourrapide.com","rhyta.com","superrito.com","teleworm.us"]
	return RChoice(vArr)
}
QMG_GeneratorEmail() {
	vArr := ["gmailvn.net","enhanceronly.com","alvinneo.com","colevillecapital.com","plexvenet.com","pickuplanet.com","ebarg.net","btcmod.com","pianoxltd.com","filevino.com","posthectomie.info","24hinbox.com","bizimalem-support.de","asifboot.com","ma2limited.com","shurkou.com","bizisstance.com","boranora.com","email-temp.com","packiu.com","hotmail.red","nudinar.net","googl.win","crossfitcoastal.com","greendike.com","tubidu.com","emvil.com","pow-pows.com","onlyu.link","dmxs8.com","chantellegribbon.com","stinkypoopoo.com","rackabzar.com","guitarsxltd.com","netveplay.com","nx1.us","onlinecmail.com","saxophonexltd.com","goliszek.net","arss.me","yt-google.com","degar.xyz","816qs.com","cggup.com","speeddataanalytics.com","skillion.org","falixiao.com","getcashstash.com"]
	return RChoice(vArr)
}
QMG_EmailFake() {
	vArr := ["chantellegribbon.com","24hinbox.com","alvinneo.com","freeallapp.com","packiu.com","emvil.com","goldinbox.net","colevillecapital.com","kenvanharen.com","luddo.me","bizisstance.com","boranora.com","hotmail.red","rackabzar.com","dmxs8.com","pickuplanet.com","24mail.top","nudinar.net","filevino.com","greendike.com","getcashstash.com","gmailvn.net","asifboot.com","tubidu.com","plexvenet.com","stinkypoopoo.com","googl.win","happiseektest.com","enhanceronly.com","skillion.org","asistx.net","posthectomie.info","pianoxltd.com","guitarsxltd.com","ebarg.net","email-temp.com","onlinecmail.com","btcmod.com","falixiao.com","yt-google.com","fuadd.me","muvilo.net","saxlift.us","cggup.com","crossfitcoastal.com","livegolftv.com","cashbackr.com","stamberg.nl","coffeepancakewafflebacon.com"]
	return RChoice(vArr)
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
