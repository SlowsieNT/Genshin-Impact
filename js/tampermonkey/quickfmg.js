// ==UserScript==
// @name         Quick FakeMailGen
// @namespace    http://tampermonkey.net/
// @version      0.1.1
// @description  try to take over the world!
// @author       You
// @match        *://*.fakemailgenerator.com/*
// @match        *://*.generator.email/*
// @match        *://*.emailfake.com/*
// @icon         https://www.google.com/s2/favicons?domain=fakemailgenerator.com
// @updateURL    https://github.com/SlowsieNT/Genshin-Impact/blob/main/js/tampermonkey/quickfmg.js
// @downloadURL  https://github.com/SlowsieNT/Genshin-Impact/blob/main/js/tampermonkey/quickfmg.js
// @grant        unsafeWindow
// @grant        GM_setClipboard
// @grant        GM_addStyle
// @grant        GM_info
// @grant        GM_xmlhttpRequest
// @run-at       document-start
// @connect      github.com
// @connect      raw.githubusercontent.com
// @require      https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js
// ==/UserScript==

(function() {
	'use strict';
	GM_addStyle('html{filter:invert(.91);}img,.navbar-brand,.nav-link{filter:invert(.91);}');
	var LAST_UPDATE = 1654245277864, LiveLU, CanCheck = 0, EPType = -1,
		ScriptName = GM_info.script.name;
	function UpdateAvailable() {
		return (LiveLU||0) > LAST_UPDATE;
	}
	function UpdateCheck(aFunc) {
		var vURL = "https://github.com/SlowsieNT/Genshin-Impact/raw/main/js/tampermonkey/quickfmg.js";
		GM_xmlhttpRequest({
			url: vURL,
			onload: function (aX) {
				if (200 == aX.status) {
					var vVer = aX.response.split("var LAST_UPDATE =");
					if (1 in vVer)
						vVer = +vVer[1].trim().split(",")[0];
					else vVer = 0;
					LiveLU = vVer;
					aFunc();
				}
			}
		});
	}
	if (-1 < location.hostname.indexOf("fakemailgenerator.com")) CanCheck=1,EPType=0;
	if (-1 < location.hostname.indexOf("generator.email")) CanCheck=1,EPType=1;
	if (-1 < location.hostname.indexOf("emailfake.com")) CanCheck=1,EPType=2;
	CanCheck && UpdateCheck(function () {
		$(function() {
			var vOT = document.title;
			if (UpdateAvailable()) {
				document.title = "UPDATE UserScript: " + ScriptName;
				setTimeout(function () { document.title = "UPDATE: " + ScriptName; }, 1500);
				setTimeout(function () {
					document.title = vOT;
				}, 5e3);
			}
		});
	});
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
				// 143 to 128 (removed mails with <200d uptime)
				return (x=["sunshine94.in","cuedigy.com","roidirt.com","colevillecapital.com","alvinneo.com","bukanimers.com","greendike.com","securebitcoin.agency","chantellegribbon.com","sharyndoll.com","picsviral.net","lompaochi.com","gotcertify.com","capitalistdilemma.com","gmailvn.net","uhpanel.com","googl.win","thecirchotelhollywood.com","bedul.net","crpotu.com","silnmy.com","stinkypoopoo.com","hallo.singles","bizisstance.com","mailpluss.com","rackabzar.com","pickuplanet.com","fnaul.com","omtecha.com","assrec.com","dinarsanjaya.com","cuendita.com","mumbama.com","tcoaee.com","kongshuon.com","guitarsxltd.com","netveplay.com","nx1.us","email-temp.com","hotmail.red","antawii.com","hmpoeao.com","ffo.kr","cuenmex.com","nproxi.com","onlinecmail.com","filevino.com","dmxs8.com","saxophonexltd.com","goliszek.net","ndxmails.com","boranora.com","noisemails.com","arss.me","yt-google.com","wpdork.com","degar.xyz","bringnode.xyz","emkunchi.com","usbvap.com","btcmod.com","vireonidae.com","perirh.com","tempgmail.ga","otlaecc.com","24hinbox.com","villastream.xyz","khoantuta.com","oreple.com","emvil.com","asifboot.com","ssrrbta.com","816qs.com","gltrrf.com","mymailcr.com","ndenwse.com","otezuot.com","ermtia.com","omdlism.com","playfunplus.com","hoangticusa.com","cggup.com","outlook.sbs","osmye.com","pianoxltd.com","rmune.com","ebarg.net","aletar.ga","umtutuka.com","tubidu.com","transmute.us","plexvenet.com","manghinsu.com","pradabakery.com","omdiaco.com","x4u.me","soccerfit.com","kimachina.com","eeetivsc.com","nwhsii.com","tkmushe.com","lhtstci.com","lersptear.com","oaouemo.com","gkqil.com","speeddataanalytics.com","isluntvia.com","eelraodo.com","riniiya.com","yandex.cfd","eloltsf.com","hacktoy.com","nieise.com","packiu.com","eoooodid.com","newsote.com","emlppt.com","eatneha.com","indozoom.net","emailaing.com","lompikachi.com","debb.me","mitakian.com","hedvdeh.com","inadtia.com","fernet89.com","skillion.org","falixiao.com","getcashstash.com"])[x.length*Math.random()>>0];
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
		_.NavigateMail1 = function (aEmail) {
			if ("string" === typeof aEmail && aEmail.trim())
				location.href = 'https://generator.email/' + aEmail;
		};
		_.GenerateMail2 = function () {
			function GenerateMD(x) {
				// removed expired mails(225 to 164; had less than 200d uptime)
				return (x=["bibliotekadomov.com","oreple.com","isluntvia.com","pianoxltd.com","colevillecapital.com","packiu.com","guitarsxltd.com","tubidu.com","filevino.com","emlppt.com","techholic.in","alvinneo.com","ebarg.net","bedul.net","localtank.com","soccerfit.com","email-temp.com","mailpluss.com","eatneha.com","cuedigy.com","buntatukapro.com","eelraodo.com","mefvopic.com","uhpanel.com","usbvap.com","onlinecmail.com","omdiaco.com","btcmod.com","emvil.com","roidirt.com","kimachina.com","hedvdeh.com","rmune.com","niatlsu.com","hotmail.red","goldinbox.net","newsote.com","partnerct.com","nieise.com","mochaphotograph.com","gmailvn.net","inadtia.com","wonderfish-recipe2.com","mexcool.com","emailaing.com","nproxi.com","oydtab.com","mymailcr.com","falixiao.com","plexvenet.com","emkunchi.com","hiowaht.com","yt-google.com","eeetivsc.com","otlaecc.com","esbuah.nl","shanghongs.com","riniiya.com","transmute.us","eoooodid.com","greendike.com","osmye.com","pickuplanet.com","fuadd.me","ndxmails.com","netvemovie.com","abreutravel.com","cuendita.com","muvilo.net","dinarsanjaya.com","getcashstash.com","aletar.ga","oaouemo.com","boranora.com","outlook.sbs","24hinbox.com","gkqil.com","axie.ml","lhtstci.com","sharyndoll.com","fnaul.com","manghinsu.com","skillion.org","vshgl.com","saxlift.us","lersptear.com","pyhaihyrt.com","gotcertify.com","cggup.com","cuenmex.com","crossfitcoastal.com","silnmy.com","pharmafactsforum.com","yandex.cfd","nwhsii.com","asifboot.com","capitalistdilemma.com","icnwte.com","ibnlolpla.com","dmxs8.com","esoetge.com","mumbama.com","fernet89.com","yuinhami.com","indozoom.net","ectong.xyz","anuefa.com","mamasuna.com","hacktoy.com","livegolftv.com","bomukic.com","vietkevin.com","omdlism.com","assrec.com","golviagens.com","yt2.club","picsviral.net","playfunplus.com","freeallapp.com","chantellegribbon.com","zeemails.in","neeahoniy.com","wpdork.com","bizisstance.com","nomnomca.com","omtecha.com","gltrrf.com","luddo.me","kongshuon.com","cashbackr.com","stamberg.nl","happiseektest.com","2wslhost.com","tempgmail.ga","orangdalem.org","ssrrbta.com","tcoaee.com","puanghli.com","nalsci.com","distraplo.com","playfuny.com","typery.com","perirh.com","coffeepancakewafflebacon.com","ermtia.com","rackabzar.com","antawii.com","uewodia.com","mphaotu.com","restromail.com","villastream.xyz","snehadas.tech","skipadoo.org","bringnode.xyz","noisemails.com","longaitylo.com","kenvanharen.com","renliner.cf","khoantuta.com","imnarbi.gq","hmpoeao.com","carras.ga","ffo.kr","eeuasi.com"])[x.length*Math.random()>>0];
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
		_.NavigateMail2 = function (aEmail) {
			if ("string" === typeof aEmail && aEmail.trim()) {
				var vParts = aEmail.split("@");
				location.href = "https://emailfake.com/" + vParts[1] + "/" + vParts[0];
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
		var vNL = $(".nav-link:nth(0)");
		$("span:last", vNL).text("Load mail...");
		vNL.click(function () {
			Generator.NavigateMail1(prompt("Enter mail to load:"));
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
		// prompt to load mail by raw email
		var vNL = $(".nav-link:nth(0)");
		$("span:last", vNL).text("Load mail...");
		vNL.click(function () {
			Generator.NavigateMail2(prompt("Enter mail to load:"));
		}).css("background-color", "green").attr("href", "#");
		// copy mail handler:
		var vTmrChk1 = setInterval(function () {
			var vParagraph = $("[class*=subj_div]:contains(ifica)");
			if (vParagraph.length)
				GM_setClipboard(vParagraph.text().split(" ")[0]), clearInterval(vTmrChk1);
		}, 255);
	}
	$(function(){
		if (0 === EPType) FakeMailGeneratorCom();
		else if (1 === EPType) GeneratorEmail();
		else if (2 === EPType) EmailFake();
	});
})();
