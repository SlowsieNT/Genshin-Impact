// ==UserScript==
// @name         Auto Redeem01
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       SlowsieNT
// @match        *://*/*
// @connect hk4e-api-os.mihoyo.com
// @connect api-os-takumi.mihoyo.com
// @grant GM_xmlhttpRequest
// @grant GM_getValue
// @grant GM_setValue
// @grant unsafeWindow
// ==/UserScript==

(function () {
	'use strict';
	var vScrPrefix = "scr_J202205_date", vInterval = 3 * 3600e3;
	var vLastDate = GM_getValue(vScrPrefix);
	var vDiff = Date.now() - vLastDate;
	var vACT_ID = "e202102251931481";
	// try fix if failure occurs
	if (!vDiff && 0 == vLastDate >> 0)
		GM_setValue(vScrPrefix, Date.now()), Checkin();
	// if diff is greater than (x)h, then try signin
	if (vDiff > vInterval)
		GM_setValue(vScrPrefix, Date.now()), Checkin();
	function Checkin() {
		// THIS PART of the code claims daily reward for GAME
		GM_xmlhttpRequest({
			method: "POST", url: "https://hk4e-api-os.mihoyo.com/event/sol/sign?lang=en-us",
			data: "{\"act_id\":\""+vACT_ID+"\"}",
			headers: {
				"accept": "application/json, text/plain, */*",
				"accept-language": "en-US,en;q=0.9",
				"content-type": "application/json;charset=UTF-8",
				"referrer": "https://webstatic-sea.mihoyo.com/ys/event/signin-sea/index.html?act_id="+vACT_ID+"&lang=en-us",
				"referrerPolicy": "no-referrer-when-downgrade",
			}
		});
		// Community xp check-in
		GM_xmlhttpRequest({
			method: "POST", url: "https://api-os-takumi.mihoyo.com/community/apihub/api/signIn",
			data: "{\"gids\":\"2\"}",
			headers: {
				"accept": "application/json, text/plain, */*",
				"accept-language": "en-US,en;q=0.9",
				"content-type": "application/json;charset=UTF-8",	
				"x-rpc-language": "en-us"
			}
		});
	}
})();
