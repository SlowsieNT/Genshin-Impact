// ==UserScript==
// @name         Quick FakeMailGen
// @namespace    http://tampermonkey.net/
// @version      0.1.3
// @description  try to take over the world!
// @author       You
// @match        *://*.fakemailgenerator.com/*
// @match        *://*.generator.email/*
// @match        *://*.emailfake.com/*
// @icon         https://www.google.com/s2/favicons?domain=fakemailgenerator.com
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
	// remove the flashbang:
	GM_addStyle('html{filter:invert(.91);}img,.navbar-brand,.nav-link{filter:invert(.91);}');
	var LAST_UPDATE = 1660775374971, LiveLU, CanCheck = 0, EPType = -1,
		ScriptName = GM_info.script.name, LHost = location.hostname;
	function UpdateAvailable() {
		return (0||LiveLU) > LAST_UPDATE;
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
	if (-1 < LHost.indexOf("fakemailgenerator.com")) CanCheck=1,EPType=0;
	if (-1 < LHost.indexOf("generator.email")) CanCheck=1,EPType=1;
	if (-1 < LHost.indexOf("emailfake.com")) CanCheck=1,EPType=2;
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
				return (x=[
					"cuedigy.com","colevillecapital.com","alvinneo.com","greendike.com","chantellegribbon.com","sharyndoll.com","lompaochi.com","capitalistdilemma.com","gmailvn.net","googl.win","thecirchotelhollywood.com","bedul.net","stinkypoopoo.com","bizisstance.com","hallo.singles","mailpluss.com","rackabzar.com","pickuplanet.com","omtecha.com","dinarsanjaya.com","cuendita.com","kongshuon.com","guitarsxltd.com","netveplay.com","nx1.us","email-temp.com","hotmail.red","ffo.kr","cuenmex.com","nproxi.com","onlinecmail.com","filevino.com","dmxs8.com","saxophonexltd.com","goliszek.net","boranora.com","noisemails.com","arss.me","yt-google.com","wpdork.com","degar.xyz","emkunchi.com","usbvap.com","btcmod.com","vireonidae.com","24hinbox.com","khoantuta.com","emvil.com","asifboot.com","816qs.com","mymailcr.com","playfunplus.com","hoangticusa.com","cggup.com","pianoxltd.com","ebarg.net","umtutuka.com","tubidu.com","transmute.us","plexvenet.com","manghinsu.com","pradabakery.com","omdiaco.com","soccerfit.com","kimachina.com","speeddataanalytics.com","hacktoy.com","packiu.com","indozoom.net","lompikachi.com","mitakian.com","skillion.org","falixiao.com","getcashstash.com"
				])[x.length*Math.random()>>0];
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
				// removed expired mails
				return (x=[
					"bibliotekadomov.com","pianoxltd.com","colevillecapital.com","packiu.com","guitarsxltd.com","tubidu.com","filevino.com","techholic.in","alvinneo.com","ebarg.net","bedul.net","localtank.com","soccerfit.com","email-temp.com","mailpluss.com","cuedigy.com","buntatukapro.com","usbvap.com","onlinecmail.com","omdiaco.com","btcmod.com","emvil.com","kimachina.com","hotmail.red","goldinbox.net","partnerct.com","gmailvn.net","wonderfish-recipe2.com","mexcool.com","nproxi.com","mymailcr.com","falixiao.com","plexvenet.com","emkunchi.com","yt-google.com","shanghongs.com","transmute.us","greendike.com","pickuplanet.com","fuadd.me","cuendita.com","muvilo.net","dinarsanjaya.com","getcashstash.com","boranora.com","24hinbox.com","sharyndoll.com","manghinsu.com","skillion.org","saxlift.us","cggup.com","cuenmex.com","crossfitcoastal.com","pharmafactsforum.com","asifboot.com","capitalistdilemma.com","dmxs8.com","yuinhami.com","indozoom.net","mamasuna.com","hacktoy.com","livegolftv.com","bomukic.com","vietkevin.com","playfunplus.com","freeallapp.com","chantellegribbon.com","wpdork.com","bizisstance.com","omtecha.com","luddo.me","kongshuon.com","cashbackr.com","stamberg.nl","happiseektest.com","2wslhost.com","orangdalem.org","playfuny.com","typery.com","coffeepancakewafflebacon.com","rackabzar.com","mphaotu.com","skipadoo.org","noisemails.com","longaitylo.com","kenvanharen.com","khoantuta.com","ffo.kr"
				])[x.length*Math.random()>>0];
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
		var vTmrChk2 = setInterval(function () {
			if (-1 === document.title.toLowerCase().indexOf("tower of fantasy"))
				return;
			// brute force the code location
			var codes = Array.apply(0, $("#email-table *")).map(function(y, x){
				// assume x positive, and length less than 7
				if (+x && 7 > (x = y.innerText.trim()).length)
					return +x;
			}).filter(function(x){return x;});
			if (0 in codes)
				GM_setClipboard(codes[0]), clearInterval(vTmrChk2);
		}, 2e2);
		// copy mail handler:
		var vTmrChk1 = setInterval(function () {
			var vParagraph = $("[class*=subj_div]:contains(ifica)");
			if (vParagraph.length)
				GM_setClipboard(vParagraph.text().split(" ")[0]), clearInterval(vTmrChk1);
		}, 2e2);
	}
	$(function(){
		if (0 === EPType) FakeMailGeneratorCom();
		else if (1 === EPType) GeneratorEmail();
		else if (2 === EPType) EmailFake();
		GM_setClipboard(($("#email_ch_text").text()||$("#cxtEmail").text()||"").trim());
	});
	function DbgFetchMails(aFunc, aErrFunc) {
		$.get("/", function (aResp) {
			var d = new DOMParser().parseFromString(aResp, "text/html");
			var arr = Array.apply(0, $("[onclick*=change_dropdown_list]", d)).map(function (a) {
				return a.innerText.trim();
			});
			aFunc(arr);
		}).error(aErrFunc);
	}
	// imagine i added a function useful only to devs
	function DbgValidate(aFunc, aErrFunc, aUsr, aDmn) {
		$.post("/check_adres_validation3.php", "usr="+encodeURIComponent(aUsr)+"&dmn="+encodeURIComponent(aDmn)).done(function (aResp) {
			var jo = JSON.parse(aResp);
			aFunc(jo.uptime > 365, jo);
		}).error(function () {
			aErrFunc.apply(this, arguments);
		});
	}
	// IMAGINE... REAL SHET
	function DbgBulkValidate(aFunc, aItems) {
		var ret = [], cd = 0, elen = aItems.length;
		// 'elen, my beloved where r u?
		// elen's bitch, ahem, expected length
		(function Next(aIndex) {
			var item = aItems[aIndex];
			DbgValidate(function (isok) {
				if (isok)
					ret.push(item);
				if (++cd >= elen)
					aFunc(ret);
			}, function () {
				if (++cd >= elen)
					aFunc(ret);
			}, "a", item);
			// stack em async XHRs
			if (item)
				setTimeout(Next, 255, ++aIndex);
		})(0);
	}
})();
