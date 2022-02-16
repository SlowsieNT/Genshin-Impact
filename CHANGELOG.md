## Repository
- Renamed from `genshin` to `Genshin-Impact`

## Retrier3 (Latest: 28-jan-2022)
NOTE:
Retrier3 is based on **retrier2.ahk**, however its code structure changed.<br>
**Retrier2.ahk** (old) can finally rest in piece, or in peace, but not in peas.<br>
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
NOTE: **retrier2.ahk is slowly approaching phase EOL (End of Life), support by author will cease in due time *(Summer 2022?)***<br>
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
