// ==UserScript==
// @name         Auto Redeem01
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       SlowsieNT
// @match        *://*/*
// @grant GM_getValue
// @grant GM_setValue
// @grant unsafeWindow
// ==/UserScript==

(function () {
	'use strict';
	var vScrPrefix = "dasadsnuf_2021_date", vInterval = 3 * 3600e3;
	var vLastDate = GM_getValue(vScrPrefix);
	var vDiff = Date.now() - vLastDate;
	var vACT_ID = "e202102251931481";
	// try fix if failure occurs
	if (!vDiff && 0 == vLastDate >> 0)
		GM_setValue(vScrPrefix, Date.now()), send_signin();
	// if diff is greater than 8h, then try signin
	if (vDiff > vInterval)
		GM_setValue(vScrPrefix, Date.now()), send_signin()
	function send_signin() {
		// THIS PART of the code claims daily reward for GAME
		fetch("https://hk4e-api-os.mihoyo.com/event/sol/sign?lang=en-us", {
			"headers": {
				"accept": "application/json, text/plain, */*",
				"accept-language": "en-US,en;q=0.9",
				"content-type": "application/json;charset=UTF-8",
				"sec-fetch-dest": "empty",
				"sec-fetch-mode": "cors",
				"sec-fetch-site": "same-site"
			},
			"referrer": "https://webstatic-sea.mihoyo.com/ys/event/signin-sea/index.html?act_id="+vACT_ID+"&lang=en-us",
			"referrerPolicy": "no-referrer-when-downgrade",
			"body": "{\"act_id\":\""+vACT_ID+"\"}",
			"method": "POST",
			"mode": "cors",
			"credentials": "include"
		});
		// THIS PART of the code claims another check-in
		fetch("https://api-os-takumi.mihoyo.com/community/apihub/api/signIn", {
			"headers": {
				"accept": "application/json, text/plain, */*",
				"accept-language": "en-US,en;q=0.9",
				"content-type": "application/json;charset=UTF-8",
				"sec-fetch-dest": "empty",
				"sec-fetch-mode": "cors",
				"sec-fetch-site": "cross-site",
				"x-rpc-language": "en-us"
			},
			"referrer": "https://www.hoyolab.com/",
			"referrerPolicy": "strict-origin-when-cross-origin",
			"body": "{\"gids\":\"2\"}",
			"method": "POST",
			"mode": "cors",
			"credentials": "include"
		});
	}
})();
