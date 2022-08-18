RChoice(aArray) {
	Random, vIndex, 1, aArray.MaxIndex()
	return aArray[vIndex]
}
QMG_FakeMailGenerator() {
	vArr := ["armyspy.com","cuvox.de","dayrep.com","einrot.com","fleckens.hu","gustr.com","jourrapide.com","rhyta.com","superrito.com","teleworm.us"]
	return RChoice(vArr)
}
QMG_GeneratorEmail() {
	vArr := ["cuedigy.com","colevillecapital.com","alvinneo.com","greendike.com","chantellegribbon.com","sharyndoll.com","lompaochi.com","capitalistdilemma.com","gmailvn.net","googl.win","thecirchotelhollywood.com","bedul.net","stinkypoopoo.com","bizisstance.com","hallo.singles","mailpluss.com","rackabzar.com","pickuplanet.com","omtecha.com","dinarsanjaya.com","cuendita.com","kongshuon.com","guitarsxltd.com","netveplay.com","nx1.us","email-temp.com","hotmail.red","ffo.kr","cuenmex.com","nproxi.com","onlinecmail.com","filevino.com","dmxs8.com","saxophonexltd.com","goliszek.net","boranora.com","noisemails.com","arss.me","yt-google.com","wpdork.com","degar.xyz","emkunchi.com","usbvap.com","btcmod.com","vireonidae.com","24hinbox.com","khoantuta.com","emvil.com","asifboot.com","816qs.com","mymailcr.com","playfunplus.com","hoangticusa.com","cggup.com","pianoxltd.com","ebarg.net","umtutuka.com","tubidu.com","transmute.us","plexvenet.com","manghinsu.com","pradabakery.com","omdiaco.com","soccerfit.com","kimachina.com","speeddataanalytics.com","hacktoy.com","packiu.com","indozoom.net","lompikachi.com","mitakian.com","skillion.org","falixiao.com","getcashstash.com"]
	return RChoice(vArr)
}
QMG_EmailFake() {
	vArr := ["bibliotekadomov.com","pianoxltd.com","colevillecapital.com","packiu.com","guitarsxltd.com","tubidu.com","filevino.com","techholic.in","alvinneo.com","ebarg.net","bedul.net","localtank.com","soccerfit.com","email-temp.com","mailpluss.com","cuedigy.com","buntatukapro.com","usbvap.com","onlinecmail.com","omdiaco.com","btcmod.com","emvil.com","kimachina.com","hotmail.red","goldinbox.net","partnerct.com","gmailvn.net","wonderfish-recipe2.com","mexcool.com","nproxi.com","mymailcr.com","falixiao.com","plexvenet.com","emkunchi.com","yt-google.com","shanghongs.com","transmute.us","greendike.com","pickuplanet.com","fuadd.me","cuendita.com","muvilo.net","dinarsanjaya.com","getcashstash.com","boranora.com","24hinbox.com","sharyndoll.com","manghinsu.com","skillion.org","saxlift.us","cggup.com","cuenmex.com","crossfitcoastal.com","pharmafactsforum.com","asifboot.com","capitalistdilemma.com","dmxs8.com","yuinhami.com","indozoom.net","mamasuna.com","hacktoy.com","livegolftv.com","bomukic.com","vietkevin.com","playfunplus.com","freeallapp.com","chantellegribbon.com","wpdork.com","bizisstance.com","omtecha.com","luddo.me","kongshuon.com","cashbackr.com","stamberg.nl","happiseektest.com","2wslhost.com","orangdalem.org","playfuny.com","typery.com","coffeepancakewafflebacon.com","rackabzar.com","mphaotu.com","skipadoo.org","noisemails.com","longaitylo.com","kenvanharen.com","khoantuta.com","ffo.kr"]
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
