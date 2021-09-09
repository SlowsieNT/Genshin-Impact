// ==UserScript==
// @name         Quick FakeMailGen
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        *://www.fakemailgenerator.com/*
// @icon         https://www.google.com/s2/favicons?domain=fakemailgenerator.com
// @grant        unsafeWindow
// @grant        GM_setClipboard
// @require      https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js
// ==/UserScript==

(function() {
    'use strict';
	function GenerateString(aLength) {
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
	function GenerateMD(x) {
		return (x=["@armyspy.com", "@cuvox.de",
		"@dayrep.com", "@einrot.com", "@fleckens.hu",
		"@gustr.com", "@jourrapide.com", "@rhyta.com",
		"@superrito.com", "@teleworm.us"])[x.length*Math.random()>>0];
	}
	// GM_setClipboard
	// once user click on logo, it will redirect to random email link
	$(".navbar-brand").click(function () {
		// generate random things
		// we try to randomize all we can randomize
		var vDomain = GenerateMD(),
			vLengthRng = 15+Math.random()*16>>0,
			vFancyLetter = String.fromCharCode(97+6+Math.random()*16>>0),
			vUsername = GenerateString(vLengthRng)+vFancyLetter+Date.now();
		// copy generated mail to clipboard
		// it could be done other way, couldn't be bothered again (#3)
		GM_setClipboard(vUsername+vDomain);
		// navigate to new mail
		location.href = 'http://www.fakemailgenerator.com/inbox/' +
		vDomain.slice(1) + '/' + vUsername + '/';
	}).css("background-color", "green").attr("href", "#");
	// check if mail received every 255ms
	// and then after copying stop the script
	var vTmrChk1 = setInterval(function () {
		var vParagraph = $(".left-align p:contains(ifica)");
		if (vParagraph.length)
			GM_setClipboard(vParagraph.text().split(" ")[0]), clearInterval(vTmrChk1);
	}, 255);
    // Your code here...
})();