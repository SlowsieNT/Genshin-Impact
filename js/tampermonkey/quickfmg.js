// ==UserScript==
// @name         Quick FakeMailGen
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        *://*.fakemailgenerator.com/*
// @match        *://*.generator.email/*
// @match        *://*.emailfake.com/*
// @icon         https://www.google.com/s2/favicons?domain=fakemailgenerator.com
// @grant        unsafeWindow
// @grant        GM_setClipboard
// @require      https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js
// ==/UserScript==

(function() {
    'use strict';
	var Generator = new function () {
		var _ = this;
		function RandomStr(aLength) {
			// couldn't be bothered to use one Random() call, yes
			for (var i = 0, r = ""; i < aLength; i++) {
				// we use bitwise flex for flooring number in range: 2147483647, -2147483648
				var t = [48,97][Math.random()*2>>0];
				// legend says ternary operator is slower than "if", couldn't be bothered again
				r += t>48?String.fromCharCode(t+Math.random()*6>>0):Math.random()*10>>0;
			}
			// people define variables outside "for", oh no
			return r;
		}
		_.GenerateMail0 = function () {
			function GenerateMD(x) {
				return (x=["armyspy.com", "cuvox.de",
				"dayrep.com", "einrot.com", "fleckens.hu",
				"gustr.com", "jourrapide.com", "rhyta.com",
				"superrito.com", "teleworm.us"])[x.length*Math.random()>>0];
			}
			var vDomain = GenerateMD(),
					vLengthRng = 8+Math.random()*16>>0,
					vFancyLetter = String.fromCharCode(97+6+Math.random()*16>>0),
					vUsername = RandomStr(vLengthRng)+vFancyLetter+Date.now();
			return {
				Name: vUsername, Host: vDomain,
				URL: 'http://www.fakemailgenerator.com/inbox/' + vDomain.slice(1) + '/' + vUsername + '/',
				toString: function () {
					return vUsername+"@"+vDomain;
				}
			}
		};
		_.GenerateMail1 = function () {
			function GenerateMD(x) {
				// 42 mails to 143
				return (x=["rmune.com","nonise.com","silnmy.com","manghinsu.com","suprd.site","umaasa.com","pradabakery.com","eetieg.com","tvonline.ml","alvinneo.com","go0glelemail.com","omdiaco.com","breaksmedia.com","scdhn.com","zetgets.com","neaeo.com","colevillecapital.com","tmtdoeh.com","hcfmgsrp.com","revofgod.cf","isueir.com","nkgursr.com","x4u.me","outlook.sbs","ndenwse.com","gotcertify.com","pfmretire.com","oreple.com","hdtniudn.com","usbvap.com","soccerfit.com","ilrlb.com","nbobd.com","kimachina.com","eeetivsc.com","uhpanel.com","nwhsii.com","fnaul.com","untract.com","gasss.net","tkmushe.com","dyoeii.com","lhtstci.com","lersptear.com","bbtspage.com","pickuplanet.com","tubidu.com","webmhouse.com","oaouemo.com","gkqil.com","speeddataanalytics.com","soundsel.com","24hinbox.com","prcee.site","eluvit.com","isluntvia.com","eelraodo.com","greendike.com","riniiya.com","otpku.com","gofsrhr.com","uioct.com","ecallen.com","btcmod.com","screalian.site","yandex.cfd","ezybarber.com","email-temp.com","visieonl.com","capitalistdilemma.com","eloltsf.com","yaachea.com","bedul.net","hacktoy.com","hotmail.red","nieise.com","docxz.site","packiu.com","eoooodid.com","zouber.site","rehtdita.com","teeoli.com","hasevo.com","khoantuta.com","newsote.com","emlppt.com","eatneha.com","gmailvn.net","rheiop.com","indozoom.net","mobisg.site","turtlebutfast.com","debbykristy.art","frepsalan.website","roidirt.com","filerj.site","crpotu.com","fheiesit.com","tariqa-burhaniya.com","chowet.site","emailaing.com","pianoxltd.com","docxx.site","ebarg.net","gmailwe.com","tchoeo.com","aletar.ga","email-brasil.com","sitished.site","devou.site","bookez.site","urbansvg.com","devib.site","ady12.design","gmailpro.cf","victorysvg.com","alb-gaming.com","plexvenet.com","cuendita.com","lompikachi.com","mobisi.site","bai47.com","pubiv.site","debb.me","mitakian.com","hedvdeh.com","ulummky.com","mtcxmail.com","emvil.com","inadtia.com","fernet89.com","howte.site","mailcuk.com","picsviral.net","epicwave.desi","adaov.com","onlinecmail.com","skillion.org","falixiao.com","ichstet.com","getcashstash.com","asifboot.com","mymailcr.com"])[x.length*Math.random()>>0];
			}
			var vDomain = GenerateMD(),
					vLengthRng = 4+Math.random()*4>>0,
					vFancyLetter = String.fromCharCode(97+6+Math.random()*16>>0),
					vUsername = RandomStr(vLengthRng)+vFancyLetter+Date.now();
			return {
				Name: vUsername, Host: vDomain,
				toString: function () {
					return vUsername+"@"+vDomain;
				}
			}
		};
		_.GenerateMail2 = function () {
			function GenerateMD(x) {
				// 40 mails to 225
				return (x=["nkgursr.com","formedisciet.site","bibliotekadomov.com","oduyzrp.com","oreple.com","nonise.com","isluntvia.com","zetgets.com","enhytut.com","pianoxltd.com","pfmretire.com","colevillecapital.com","hcfmgsrp.com","chowet.site","packiu.com","esacrl.com","guitarsxltd.com","isueir.com","tubidu.com","filevino.com","sgisfg.com","tchoeo.com","prcee.site","txtiv.site","filerj.site","emlppt.com","techholic.in","ecallen.com","alvinneo.com","ebarg.net","hasevo.com","sfdi.site","screalian.site","bedul.net","jagomail.com","bookez.site","tariqa-burhaniya.com","codue.site","localtank.com","soccerfit.com","email-temp.com","mailpluss.com","iymktphn.com","singmails.com","bookex.site","eatneha.com","docxz.site","xducation.us","cuedigy.com","dwraygc.com","buntatukapro.com","eelraodo.com","mefvopic.com","uhpanel.com","usbvap.com","victorysvg.com","onlinecmail.com","rapa.ga","istudey.com","omdiaco.com","eetieg.com","rheiop.com","btcmod.com","emvil.com","roidirt.com","email-brasil.com","kimachina.com","hedvdeh.com","rmune.com","niatlsu.com","hotmail.red","oygkt.com","uioct.com","ririsbeautystore.com","scdhn.com","ezybarber.com","goldinbox.net","devou.site","devib.site","nbobd.com","newsote.com","partnerct.com","eluvit.com","nieise.com","bbtspage.com","mochaphotograph.com","mobisi.site","gmailvn.net","inadtia.com","pdfro.site","marketyou.fun","wonderfish-recipe2.com","eiibps.com","mexcool.com","emailaing.com","webmhouse.com","nproxi.com","oydtab.com","mymailcr.com","aihtnb.com","falixiao.com","plexvenet.com","hs-gilching.de","emkunchi.com","ilrlb.com","hiowaht.com","yt-google.com","xlsmail.com","niceteeshop.com","pubix.site","eeetivsc.com","icenhl.com","sewce.com","hdtniudn.com","umaasa.com","otlaecc.com","esbuah.nl","neaeo.com","kwontol.com","shanghongs.com","riniiya.com","transmute.us","eoooodid.com","greendike.com","osmye.com","gmailwe.com","pickuplanet.com","fuadd.me","ndxmails.com","smulevip.com","go0glelemail.com","netvemovie.com","abreutravel.com","forumbens.online","anatolygroup.com","rehtdita.com","lsadinl.com","cuendita.com","muvilo.net","breaksmedia.com","dinarsanjaya.com","occumulately.site","holaunce.site","getcashstash.com","dyoeii.com","jaringan.design","how1w.site","pontualcontabilidade.org","teeoli.com","authorizes.me","pergi.id","aletar.ga","oaouemo.com","boranora.com","outlook.sbs","24hinbox.com","gkqil.com","fardainc.net","zaya.ga","debbykristy.art","naverapp.com","storebas.website","websmail.us","visieonl.com","gasss.net","axie.ml","soundsel.com","lhtstci.com","yaachea.com","sharyndoll.com","tigo.tk","fnaul.com","manghinsu.com","skillion.org","seventol.online","vshgl.com","saxlift.us","txtee.site","relay-bossku3.com","lersptear.com","pyhaihyrt.com","otpku.com","bitzonasy.info","tmtdoeh.com","gotcertify.com","cggup.com","icao6.us","stablic.site","cuenmex.com","crossfitcoastal.com","untract.com","silnmy.com","pharmafactsforum.com","yandex.cfd","nwhsii.com","asifboot.com","capitalistdilemma.com","icnwte.com","ibnlolpla.com","dmxs8.com","suprd.site","esoetge.com","mumbama.com","tellsow.live","fheiesit.com","bai47.com","fernet89.com","yuinhami.com","sitished.site","janurganteng.com","lulukbuah.host","indozoom.net","manaq.site","ectong.xyz","drstshop.com","pegoku.com","anuefa.com","fortressfinancial.xyz","mamasuna.com","hacktoy.com","livegolftv.com","turtlebutfast.com","ieolsdu.com","howti.site","bomukic.com"])[x.length*Math.random()>>0];
			}
			var vDomain = GenerateMD(),
					vLengthRng = 4+Math.random()*4>>0,
					vFancyLetter = String.fromCharCode(97+6+Math.random()*16>>0),
					vUsername = RandomStr(vLengthRng)+vFancyLetter+Date.now();
			return {
				Name: vUsername, Host: vDomain,
				URL: "https://emailfake.com/"+vDomain+"/"+vUsername,
				toString: function () {
					return vUsername+"@"+vDomain;
				}
			}
		};
	};
	// for: generator.email
	function GeneratorEmail() {
		// once user click on logo, it will redirect to random email link
		$(".navbar-brand").click(function () {
			var vMail = Generator.GenerateMail1();
			GM_setClipboard("" + vMail);
			// navigate to new mail
			location.href = 'https://generator.email/' + vMail;
		}).css("background-color", "green").attr("href", "#");
		// copy mail handler:
		var vTmrChk1 = setInterval(function () {
			var vParagraph = $("h1:contains(ifica)");
			if (vParagraph.length)
				GM_setClipboard(vParagraph.text().split(" ")[0]), clearInterval(vTmrChk1);
		}, 255);
	}
	// for: fakemailgenerator.com
	function FakeMailGeneratorCom() {
		// once user click on logo, it will redirect to random email link
		$(".navbar-brand").click(function () {
			var vMail = Generator.GenerateMail0();
			GM_setClipboard("" + vMail);
			// navigate to new mail
			location.href = vMail.URL;
		}).css("background-color", "green").attr("href", "#");
		// copy mail handler:
		var vTmrChk1 = setInterval(function () {
			var vParagraph = $(".left-align p:contains(ifica)");
			if (vParagraph.length)
				GM_setClipboard(vParagraph.text().split(" ")[0]), clearInterval(vTmrChk1);
		}, 255);
	}
	function EmailFake(){
		// once user click on logo, it will redirect to random email link
		$(".navbar-brand").click(function () {
			var vMail = Generator.GenerateMail2();
			GM_setClipboard("" + vMail);
			location.href = vMail.URL;
		}).css("background-color", "green").attr("href", "#");
		// copy mail handler:
		var vTmrChk1 = setInterval(function () {
			var vParagraph = $("[class*=subj_div]:contains(ifica)");
			if (vParagraph.length)
				GM_setClipboard(vParagraph.text().split(" ")[0]), clearInterval(vTmrChk1);
		}, 255);
	}
	if (-1 < location.host.indexOf("fakemailgenerator.com")) FakeMailGeneratorCom();
	if (-1 < location.host.indexOf("generator.email")) GeneratorEmail();
	if (-1 < location.host.indexOf("emailfake.com")) EmailFake();
})();