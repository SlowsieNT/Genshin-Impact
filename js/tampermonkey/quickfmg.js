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
	var LAST_UPDATE = 1662404282673, LiveLU, CanCheck = 0, EPType = -1,
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
	$(function(){
		if (0 === EPType) FakeMailGeneratorCom();
		else if (1 === EPType) GeneratorEmail();
		else if (2 === EPType) EmailFake();
		GM_setClipboard(($("#email_ch_text").text()||$("#cxtEmail").text()||"").trim());
		RunVCHandlers();
	});
	function RunVCHandlers() {
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
					"khoantuta.com","pradabakery.com","gmailvn.net","cudimex.com","enhanceronly.com","wpdork.com","alvinneo.com","colevillecapital.com","transmute.us","plexvenet.com","manghinsu.com","pickuplanet.com","orangdalem.org","kongshuon.com","o0i.es","ebarg.net","btcmod.com","umtutuka.com","nproxi.com","mexcool.com","pianoxltd.com","filevino.com","skipadoo.org","kimachina.com","cupremplus.com","thekangsua.com","typery.com","bedul.net","vietkevin.com","bibliotekadomov.com","posthectomie.info","24hinbox.com","playfuny.com","bizimalem-support.de","asifboot.com","ma2limited.com","mitakian.com","lompikachi.com","shurkou.com","bizisstance.com","boranora.com","maoaokachima.com","email-temp.com","cuenmex.com","packiu.com","mamasuna.com","hotmail.red","cuendita.com","nudinar.net","googl.win","crossfitcoastal.com","greendike.com","mymailcr.com","tubidu.com","emvil.com","hacktoy.com","pow-pows.com","cuedigy.com","onlyu.link","digimexplus.com","mphaotu.com","lompaochi.com","mailpluss.com","aenikaufa.com","dmxs8.com","chantellegribbon.com","capitalistdilemma.com","thecirchotelhollywood.com","stinkypoopoo.com","hallo.singles","rackabzar.com","omtecha.com","guitarsxltd.com","netveplay.com","nx1.us","ffo.kr","onlinecmail.com","saxophonexltd.com","goliszek.net","noisemails.com","arss.me","yt-google.com","degar.xyz","emkunchi.com","usbvap.com","vireonidae.com","816qs.com","playfunplus.com","hoangticusa.com","cggup.com","soccerfit.com","omdiaco.com","speeddataanalytics.com","indozoom.net","skillion.org","falixiao.com","getcashstash.com"
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
					"24hinbox.com","chantellegribbon.com","wpdork.com","alvinneo.com","freeallapp.com","masjoco.com","packiu.com","emvil.com","bomukic.com","goldinbox.net","colevillecapital.com","kenvanharen.com","luddo.me","manghinsu.com","bizisstance.com","thekangsua.com","boranora.com","nproxi.com","hotmail.red","omdiaco.com","rackabzar.com","dmxs8.com","24mail.top","cudimex.com","bibliotekadomov.com","pickuplanet.com","oanghika.com","nudinar.net","soccerfit.com","transmute.us","filevino.com","playfunplus.com","mexcool.com","partnerct.com","greendike.com","cuendita.com","bedul.net","getcashstash.com","gmailvn.net","asifboot.com","tubidu.com","lompikachi.com","plexvenet.com","usbvap.com","stinkypoopoo.com","devfiltr.com","mailpluss.com","googl.win","happiseektest.com","mamasuna.com","enhanceronly.com","cupremplus.com","omtecha.com","hacktoy.com","skillion.org","asistx.net","mphaotu.com","posthectomie.info","noisemails.com","umtutuka.com","papakiung.com","typery.com","kimsangung.com","pianoxltd.com","guitarsxltd.com","ebarg.net","localtank.com","email-temp.com","cuedigy.com","onlinecmail.com","btcmod.com","kimachina.com","wonderfish-recipe2.com","mymailcr.com","falixiao.com","emkunchi.com","yt-google.com","shanghongs.com","fuadd.me","muvilo.net","saxlift.us","cggup.com","cuenmex.com","crossfitcoastal.com","pharmafactsforum.com","capitalistdilemma.com","yuinhami.com","indozoom.net","livegolftv.com","vietkevin.com","kongshuon.com","cashbackr.com","stamberg.nl","2wslhost.com","orangdalem.org","playfuny.com","coffeepancakewafflebacon.com","skipadoo.org","longaitylo.com","khoantuta.com","ffo.kr"
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
	}
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
			aFunc(jo.uptime > 420, jo);
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
    //unsafeWindow.DbgFetchMails=DbgFetchMails;
    //unsafeWindow.DbgBulkValidate=DbgBulkValidate;
})();
