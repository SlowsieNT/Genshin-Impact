## Repository
- Renamed from `genshin` to `Genshin-Impact`

## retrier2.ahk
NOTE: retrier2.ahk is based on Legacy code, never intended to ever be polished but adjusted to work properly.<br>
NOTE: **retrier2.ahk is approaching phase EOL (End of Life), support by author will cease in due time *(in 2022?)***<br>
#### [Game: **v2.2**]
- [**09-Sep-2021**]
  - Added hooks for
    - Detect login after register, and autologin
    - `loginpassworddetect`, `loginpassworddetect`
  - Detect login success "start game", then auto click to start
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
