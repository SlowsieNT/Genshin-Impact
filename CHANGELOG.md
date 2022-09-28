## Repository
- Renamed from `genshin` to `Genshin-Impact`
- Still accessible at `SlowsieNT/Genshin`
## [js] checkin-redeem (Latest: 03-jun-2022)
#### (03-jun-2022)
- Add `@connect` to avoid "allow" popup.
#### (16-may-2022)
- No more irrelevant errors in dev console, yay!
## [js] quickfmg (Latest: 05-sep-2022)
Supported domains:
- [highly recommended] http://emailfake.com/
- [recommended] http://generator.email
- [not recommended] http://fakemailgenerator.com/
#### (05-sep-2022)
- Remove expired mails (remaining uptime less than 420days)
- Add new mails
#### (19-aug, 17-aug-2022)
- (19-aug) Forgor to remove irrelevant code and do polish
- Add verify code copy for Tower of Fantasy!
- Remove expired mails (remaining uptime less than 366days)
#### (03-jun-2022)
- Update check #1, title of fake mail website will show "UPDATE" if script is updated (on github)
  - Message lasts for 5 seconds, title will reset.
- Update check #2, it may auto update script too, not tested
#### (01-jun-2022)
- Update invert filter of `html` (from 90% to 91%)
- Remove outdated mails (uptime less than ~200d)
- Add mails (uptime more than ~200d)
#### (16-may, 31-mar-2022)
- (16-may) Add invert filter to `html` (~90% invert)
- Add a lot of mails
- Add "load mail" feature
## Retrier3 (Latest: 05-sep-2022)
#### [Game: **v3.1**] (sep-2022)
- "They still don't care." (anniversary)
#### [Game: **v3.0**] (sep-2022)
- End of active support.
#### [Game: **v3.0**] (05-sep-2022)
- Yeet `mod.cutscene.ahk` as it is useless!
- Readjusted pixel hooks
- Added feature `Sounds` for `.inf`!
- Added `icecubes.mp3` for `Sounds` feature for people that reroll in pitch black room, so they can close eyes and wait for sound notification.
  - Finally we can reroll during nighttime with less eyedamage!
- Remove expired mails from `LazyQMG` (remaining uptime less than 420days)
- Add new mails to `LazyQMG`
#### [Game: **v3.0**] (24-aug-2022)
- Readjusted pixel hook(s)
  - `UIIGOpenedJournal`
#### [Game: **v2.8**] (17-aug-2022)
- Remove expired mails (remaining uptime less than 366days)
#### [Game: **v2.8**] (13-jul-2022)
- Readjusted pixel hook(s)
  - Too many nerfs to write
#### [Game: **v2.7**] (01-jul-2022)
- Edit github repo logo
- Remove expired mails from `LazyQMG`
  - Mails with less than ~221 days are removed
- Fix: Script preferred default value over ini defined value
  - The `if (Trim(str))` if string were `0` ahk would assume as false value, thus caused the issue
    - Added the right logic
#### [Game: **v2.7**] (08-jun-2022)
- Reduce clicks necessary to redeem code `genshingift`
#### [Game: **v2.7**] (06-jun-2022)
- Add feature to generate mail upon pressing F2 at registration form
  - Can be disabled in `.inf` by setting section `LazyQMG` field `Allow` to `0`
- When prompted with "Press Space" it will now always plunge
  - Can be disabled in `.inf` by setting section `HiddenSettings` field `PressSpaceOnce` to `1`
#### [Game: **v2.7**] (01-jun-2022)
- Add feature to auto "Press 2" when prompted (long lost Retrier3 code; back in the days of Retrier2)
- Add feature to auto "Press W"
- Add feature to instantly plunge on "Press Space"
- Add feature after arriving to *castle* to hold W
- Add feature after auto pressing W, continues to hold W
#### [Game: **v2.7**] (01-Jun, 31-may-2022)
- Readjusted pixel hook(s)
  - Hook(s): `UIIGAutoplay`, `UIIGUndiscoveredWaypoint`, `UIIGOpenedJournal`
  - Hook(s): `UIIGUndiscoveredWaypoint` (01-Jun)
- Readjusted: Pos hook diag opt
#### [Game: **v2.6**] (16-may-2022)
- Readjusted pixel hook(s)
  - Hook `UIIGUndiscoveredWaypoint`
#### [Game: **v2.6**] (30-mar-2022)
- Readjusted pixel hook(s)
  - Register, InGame UI
- Removed ONLY FEW mail domains that fail on emailfake
#### [Game: **v2.5**] (16-feb-2022)
- Readjusted pixel hook(s) for `WM1440`
- Readjusted pixel hook(s) for `FS1920`
- Readjusted when mail is logged.
- Readjusted when "Lv5" mail is logged.
- Added message if "Windowed 1440x900" is NOT supported.
#### [Game: **v2.4**] (12-feb-2022)
- Features to `Retrier.ahk.inf`
  - Readjusted logic for `LoggingMail`
    - Mails will be logged to file after blackscreen if `Allow` is set to `1`
  - Added `LoggingMail` section, by field `AfterFOTeleport` to allow logging
    - Triggers if script was running during "fend off"
  - Added `LoggingMail` section, by field `AfterFOTeleport_FileName` to write to user-defined file
    - Triggers if script was running during "fend off"
#### [Game: **v2.4**] (28-jan-2022)
- Retrier3 enters beta phase, is stable enough.
- Added `Retrier.ahk.inf` for easier setup!'
  - Check it out!
  - Added `LoggingMail` section, by field `Allow` to allow logging
  - Added `LoggingMail` section, by field `FileName` to write to user-defined file
- Last Farewell to retrier2! R.I.P
#### [Game: **v2.4**] (26-jan-2022)
- After first teleport (after fend off dragon)
  - Upon teleport confirmation, it will reload (stop) script (feature from retrier2)
  - (it will NOT RELOAD if script wasn't running entire reroll)
- When at redeem code popup (after fend off dragon)
  - Enters code `genshingift` and clicks then it does double Escape
  - (it will NOT enter code if script wasn't running entire reroll)
#### [Game: **v2.4**] (24-jan-2022)
- Support Boy selection, Girl is by default
  - Required to change `vPlayerFemale` to `0` if Boy needed!
- Changed `vPassword`, old is provided next to it
- Support Windowed Mode 1440x900
  - Required to change `vResolutionPostfix` to `"WM1440"` !!!
- Support Fullscreen Mode 1920x1080
  - Required to change `vResolutionPostfix` to `"FS1920"` !!!
#### [Game: **v2.4**] (23-jan-2022)
- Initial **Retrier3** release



## retrier2.ahk
NOTE: retrier2.ahk is based on Legacy code, never intended to ever be polished but adjusted to work properly.<br>
NOTE: **retrier2.ahk is on phase EOL (End of Life), support by author ceased<br>
#### [Game: **v2.3**]
- [**27-Nov-2021**]
  - Minor changes
  - Polishing
    - Removed 49+ lines of useless code
      - Added some comments as well
- [**24-Nov-2021**]
  - Polished most of codebase, even though promised not to
  - Made easier for editing the Script!
  - No features added
  - Removed `IsSimilarColor`, added few functions from v3.1 code
#### [Game: **v2.2**]
- [**13-Oct-2021**]
  - Added hooks for
    - Detect login after register, and autologin
    - `loginpassworddetect`, `loginbuttondetect`
  - Detect login success "start game," then auto click to start
    - Hook: `startgamedetect2`
#### [Game: **v2.1**]
- [**09-Sep-2021**]
  - Revoked usage of `IsSimilarColor` *(left to remain in codebase?)*
  - Reapplied **exact** pixel hooks for:
    - dialogueoption, dialogueoptions
- [**03-Sep-2021**]
  - Added `IsSimilarColor`
  - Reapplied pixel hooks for:
    - dialogueoption, dialogueoptions *(detects clickable dialogue options)*
    - autoconv *(detects if player is in dialogue)*
    - confirmname *(button to confirm custom name for Lumine/Aether)*
