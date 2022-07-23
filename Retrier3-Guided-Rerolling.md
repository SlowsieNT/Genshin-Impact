
## Welcome!
![Visitor count](https://shields-io-visitor-counter.herokuapp.com/badge?page=slowsient.genshin.guide)

## IMPORTANT
Reason for leaving: "they just couldn't care less"<br>
*"Nothing lasts forever."*<br>
*(nothing on **physical** plane lasts forever; but on ethereal plane; one who seeks wisdom will know the meaning of this)*

## Notes
- Script must be run as Administrator
   - Otherwise it cannot hook the window
- (Fend off dragon quest is handled by the script)
## Setting things up for the First time
(Needs re-setup if new feature is released for `.inf`)
1. Modify `Retrier3.ahk.inf` file
   - Choose to play as Aether by changing section `Player` by field `Female` to `0`
   - Choose different name by changing section `Player` by field `Name` to any name you want
   - Choose screen resolution by changing section `Screen` by field `Resolution`
      - Value `WM1440` for Windowed Mode (NOT 1440x900 full screen)
      - Value `FS1920` for 1920x1080 fullscreen mode
   - (OBSOLETE) Make sure `SAVASW64` is correct path to be able to skip opening cutscene.
     - Due celestia being partially done, cutscene is no longer a video file
   - There are two types of mail logging
      - After naming
      - After *reaching* ar5 
      - Can be disabled by changing section `LoggingMail` by field `Allow` to `0`
   - Setting LazyQMG up:
      - Can be disabled by changing section `LazyQMG` by field `Allow` to `0`
      - To use this feature press F2 at registration form
         - It is recommended to install `quickfmg.js` to avoid alt-tab
      - Make sure that section `LazyQMG` by field `Delay` is correct for you
      - Make sure that section `LazyQMG` by field `BrowserPath` is correct for you
      - Make sure that section `LazyQMG` by field `MailType` is set at your favorite mail generator service
2. Make sure that Game Graphics is set to `Medium` or above.
    - Required to complete "Fend off" faster!
3. Again, it is recommended that you use tampermonkey and install `quickfmg.js` script!
## Guided rerolling
Please read all!
1. Open the Game, then click Register (ingame)
2. Press `F2` at the registration form
    - This guide applies for enabled `LazyQMG`
    - `quickfmg.js` will aid with copying the email verify code
    - `Retrier3.ahk` will try to refocus window once copied the verify code
       - If fails more than once: make sure that section `LazyQMG` by field `Delay` is correct for you
          - Play with it until you get it right
3. Solve CAPTCHA
4. Let the script do Login, and you solve CAPTCHA, again
5. Let the script enter Game, do not interact
    - Script will enter the name
    - You may click during "click to begin" after login, yes! Not required.
6. Play the game after cutscenes are over (beach)
7. Waypoint tutorial popup is handled by the script, need not interact
    - Keep holding W like always
8. Dialogues are handled by the script (AR5 works flawlessly)
    - Script can be run at ANY QUEST, but may not work flawlessly
       - May get stuck, but for AR5 reroll needn't worry!
9. Amber splash screen is handled by the script
    - Script will auto press 2 then R
10. Journal opening is handled by the script
    - It will auto start holding W once all is done!
11. Gliding tutorial is handled by the script
    - It will auto press W, Space, followed by plunge!
12. Manually open settings
    - It should automatically go to Account tab and click redeem
    - Then will auto enter code `genshingift` and confirm, and double escape!
13. Optionally: Open the map, and teleport to the waypoint near the fountain
    - Script will auto confirm teleport
       - Script will automatically RESET ("standing by" mode)
14. Optionally: Claim adventure rank rewards (50 currency, and 1 wish)

If step 13 is skipped, manual reset (pressing the `Home` key) is required.<br>
The end.
