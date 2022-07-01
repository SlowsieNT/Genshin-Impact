RChoice(aArray) {
	Random, vIndex, 1, aArray.MaxIndex()
	return vIndex
}
QMG_FakeMailGenerator() {
	vArr := ["armyspy.com","cuvox.de","dayrep.com","einrot.com","fleckens.hu","gustr.com","jourrapide.com","rhyta.com","superrito.com","teleworm.us"]
	return vArr[RChoice(vArr)]
}
QMG_GeneratorEmail() {
	vArr := ["sunshine94.in", "cuedigy.com", "colevillecapital.com", "alvinneo.com", "bukanimers.com", "greendike.com", "securebitcoin.agency", "chantellegribbon.com", "sharyndoll.com", "picsviral.net", "lompaochi.com", "gotcertify.com", "capitalistdilemma.com", "gmailvn.net", "uhpanel.com", "googl.win", "thecirchotelhollywood.com", "bedul.net", "crpotu.com", "stinkypoopoo.com", "bizisstance.com", "hallo.singles", "mailpluss.com", "rackabzar.com", "pickuplanet.com", "fnaul.com", "omtecha.com", "dinarsanjaya.com", "cuendita.com", "kongshuon.com", "guitarsxltd.com", "netveplay.com", "nx1.us", "email-temp.com", "hotmail.red", "ffo.kr", "cuenmex.com", "nproxi.com", "onlinecmail.com", "filevino.com", "dmxs8.com", "saxophonexltd.com", "goliszek.net", "ndxmails.com", "boranora.com", "noisemails.com", "arss.me", "yt-google.com", "wpdork.com", "degar.xyz", "emkunchi.com", "usbvap.com", "btcmod.com", "vireonidae.com", "tempgmail.ga", "24hinbox.com", "khoantuta.com", "emvil.com", "asifboot.com", "816qs.com", "mymailcr.com", "playfunplus.com", "hoangticusa.com", "cggup.com", "outlook.sbs", "pianoxltd.com", "ebarg.net", "aletar.ga", "umtutuka.com", "tubidu.com", "transmute.us", "plexvenet.com", "manghinsu.com", "pradabakery.com", "omdiaco.com", "soccerfit.com", "x4u.me", "kimachina.com", "gkqil.com", "speeddataanalytics.com", "yandex.cfd", "hacktoy.com", "packiu.com", "newsote.com", "indozoom.net", "emailaing.com", "lompikachi.com", "debb.me", "mitakian.com", "fernet89.com", "skillion.org", "falixiao.com"]
	return vArr[RChoice(vArr)]
}
QMG_EmailFake() {
	vArr := ["bibliotekadomov.com","pianoxltd.com","colevillecapital.com","packiu.com","guitarsxltd.com","tubidu.com","filevino.com","techholic.in","alvinneo.com","ebarg.net","bedul.net","localtank.com","soccerfit.com","email-temp.com","mailpluss.com","cuedigy.com","buntatukapro.com","uhpanel.com","usbvap.com","onlinecmail.com","omdiaco.com","btcmod.com","emvil.com","kimachina.com","hotmail.red","goldinbox.net","newsote.com","partnerct.com","mochaphotograph.com","gmailvn.net","wonderfish-recipe2.com","mexcool.com","emailaing.com","nproxi.com","mymailcr.com","falixiao.com","plexvenet.com","emkunchi.com","yt-google.com","esbuah.nl","shanghongs.com","transmute.us","greendike.com","pickuplanet.com","fuadd.me","ndxmails.com","netvemovie.com","abreutravel.com","cuendita.com","muvilo.net","dinarsanjaya.com","getcashstash.com","aletar.ga","boranora.com","outlook.sbs","24hinbox.com","gkqil.com","axie.ml","sharyndoll.com","fnaul.com","manghinsu.com","skillion.org","saxlift.us","gotcertify.com","cggup.com","cuenmex.com","crossfitcoastal.com","pharmafactsforum.com","yandex.cfd","asifboot.com","capitalistdilemma.com","dmxs8.com","fernet89.com","yuinhami.com","indozoom.net","ectong.xyz","mamasuna.com","hacktoy.com","livegolftv.com","bomukic.com","vietkevin.com","picsviral.net","playfunplus.com","freeallapp.com","chantellegribbon.com","wpdork.com","bizisstance.com","nomnomca.com","omtecha.com","luddo.me","kongshuon.com","cashbackr.com","stamberg.nl","happiseektest.com","tempgmail.ga","2wslhost.com","orangdalem.org","playfuny.com","typery.com","coffeepancakewafflebacon.com","rackabzar.com","mphaotu.com","snehadas.tech","skipadoo.org","noisemails.com","longaitylo.com","kenvanharen.com","renliner.cf","khoantuta.com","imnarbi.gq","carras.ga","ffo.kr"]
	return vArr[RChoice(vArr)]	
}
QMG_Username() {
	Random, vChr, 103, 122
	Random, vChr2, 103, 122
	Random, vNum, 1111, 99999
	vStr := utcnow(), vChr := Chr(vChr), vChr2 := Chr(vChr2)
	vStr2 = %vChr%%vStr%%vChr2%%vNum%
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
