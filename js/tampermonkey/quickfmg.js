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
				return (x=[
					"cudimex.com", "lohpcn.com", "mymailcr.com", "zipst.site",
					"tirtalayana.com", "amazon-aws-us.com", "crtapev.com",
					"bookf.site", "zetgets.com", "cuenmex.com",
					"epubp.site", "notvn.com", "ermtia.com",
					"domy.me", "supg.site", "login-to.online",
					"manq.site", "dikitin.com", "partnerct.com",
					"oanghika.com", "gmailya.com", "cggup.com",
					"enhanceronly.com", "btcmod.com", "azwej.site",
					"taluabushop.com", "boranora.com", "tikabravani.art",
					"urbanlegendsvideo.com", "makentehosting.com", "helperv.com",
					"epubly.site", "silnmy.com", "songtaith.com",
					"hdtniudn.com", "ucyeh.com", "neaeo.com",
					"getmail.lt", "ieolsdu.com", "mobilp.site",
					"getmail.fun", "be-mail.xyz", "cuendita.com"
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
		_.GenerateMail2 = function () {
			function GenerateMD(x) {
				return (x=['gmx.fit', 'community-college.university', 'omtecha.com', 'notcuttsgifts.com', 'duniakeliling.com', 'visieonl.com', 'tivilebonza.com', 'gotcertify.com', 'bogsmail.me', 'agung001.com', 'packiu.com', 'riniiya.com', 'notvn.com', 'crossfitcoastal.com', 'techholic.in', 'lompikachi.com', '24hinbox.com', 'tunrahn.com', 'codu.site', 'eluvit.com', 'badutstore.com', 'eelrcbl.com', 'tagt.us', 'taikz.com', 'hasevo.com', 'typery.com', 'virginiaintel.com', 'uioct.com', 'ndxmails.com', 'perirh.com', 'vshgl.com', 'nicecook.top', 'gmailwe.com', 'outlook.sbs', 'jobstoknow.com', 'nongvannguyen.com', 'emlppt.com', 'gmailco.ml', 'oreple.com', 'nkgursr.com', 'eeetivsc.com', 'gmailpro.ml', 'pyhaihyrt.com', 'yt-google.com', 'devou.site', 'kecapasin.buzz', 'filevino.com', 'hieu.in'])[x.length*Math.random()>>0];
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