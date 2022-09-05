RChoice(aArray) {
	Random, vIndex, 1, aArray.MaxIndex()
	return aArray[vIndex]
}
QMG_FakeMailGenerator() {
	vArr := ["armyspy.com","cuvox.de","dayrep.com","einrot.com","fleckens.hu","gustr.com","jourrapide.com","rhyta.com","superrito.com","teleworm.us"]
	return RChoice(vArr)
}
QMG_GeneratorEmail() {
	vArr := ["khoantuta.com","pradabakery.com","gmailvn.net","cudimex.com","enhanceronly.com","wpdork.com","alvinneo.com","colevillecapital.com","transmute.us","plexvenet.com","manghinsu.com","pickuplanet.com","orangdalem.org","kongshuon.com","o0i.es","ebarg.net","btcmod.com","umtutuka.com","nproxi.com","mexcool.com","pianoxltd.com","filevino.com","skipadoo.org","kimachina.com","cupremplus.com","thekangsua.com","typery.com","bedul.net","vietkevin.com","bibliotekadomov.com","posthectomie.info","24hinbox.com","playfuny.com","bizimalem-support.de","asifboot.com","ma2limited.com","mitakian.com","lompikachi.com","shurkou.com","bizisstance.com","boranora.com","maoaokachima.com","email-temp.com","cuenmex.com","packiu.com","mamasuna.com","hotmail.red","cuendita.com","nudinar.net","googl.win","crossfitcoastal.com","greendike.com","mymailcr.com","tubidu.com","emvil.com","hacktoy.com","pow-pows.com","cuedigy.com","onlyu.link","digimexplus.com","mphaotu.com","lompaochi.com","mailpluss.com","aenikaufa.com","dmxs8.com","chantellegribbon.com","capitalistdilemma.com","thecirchotelhollywood.com","stinkypoopoo.com","hallo.singles","rackabzar.com","omtecha.com","guitarsxltd.com","netveplay.com","nx1.us","ffo.kr","onlinecmail.com","saxophonexltd.com","goliszek.net","noisemails.com","arss.me","yt-google.com","degar.xyz","emkunchi.com","usbvap.com","vireonidae.com","816qs.com","playfunplus.com","hoangticusa.com","cggup.com","soccerfit.com","omdiaco.com","speeddataanalytics.com","indozoom.net","skillion.org","falixiao.com","getcashstash.com"]
	return RChoice(vArr)
}
QMG_EmailFake() {
	vArr := ["24hinbox.com","chantellegribbon.com","wpdork.com","alvinneo.com","freeallapp.com","masjoco.com","packiu.com","emvil.com","bomukic.com","goldinbox.net","colevillecapital.com","kenvanharen.com","luddo.me","manghinsu.com","bizisstance.com","thekangsua.com","boranora.com","nproxi.com","hotmail.red","omdiaco.com","rackabzar.com","dmxs8.com","24mail.top","cudimex.com","bibliotekadomov.com","pickuplanet.com","oanghika.com","nudinar.net","soccerfit.com","transmute.us","filevino.com","playfunplus.com","mexcool.com","partnerct.com","greendike.com","cuendita.com","bedul.net","getcashstash.com","gmailvn.net","asifboot.com","tubidu.com","lompikachi.com","plexvenet.com","usbvap.com","stinkypoopoo.com","devfiltr.com","mailpluss.com","googl.win","happiseektest.com","mamasuna.com","enhanceronly.com","cupremplus.com","omtecha.com","hacktoy.com","skillion.org","asistx.net","mphaotu.com","posthectomie.info","noisemails.com","umtutuka.com","papakiung.com","typery.com","kimsangung.com","pianoxltd.com","guitarsxltd.com","ebarg.net","localtank.com","email-temp.com","cuedigy.com","onlinecmail.com","btcmod.com","kimachina.com","wonderfish-recipe2.com","mymailcr.com","falixiao.com","emkunchi.com","yt-google.com","shanghongs.com","fuadd.me","muvilo.net","saxlift.us","cggup.com","cuenmex.com","crossfitcoastal.com","pharmafactsforum.com","capitalistdilemma.com","yuinhami.com","indozoom.net","livegolftv.com","vietkevin.com","kongshuon.com","cashbackr.com","stamberg.nl","2wslhost.com","orangdalem.org","playfuny.com","coffeepancakewafflebacon.com","skipadoo.org","longaitylo.com","khoantuta.com","ffo.kr"]
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
