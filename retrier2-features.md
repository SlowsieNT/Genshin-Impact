## Features of Retrier2
NOTE: Speaking of numbers, I did do math, and it turns out **around 60% of interaction** during AR5 reroll **is reduced**.<br>
[#list-of-features](#list-of-features)

Retrier2 does not use `PixelGetColor`, which would screenshot everytime and surely cause high CPU usage
- Uses custom code which prints screen ONCE and searches through provided data (from `Retrier2_AllocateMatcherPData`)

### As of November 24th, 2021, changes were made:
- You may easily edit `Retrier2_GetSettings` (search within editor)
- **For developers**
  - You may easily edit `Retrier2_AllocateMatcherPData`
    - Added shorthand `aM.Set`, does the same as `aM.AddColors(aName, aColors[][])`
  - No longer needed to call `matcher.GetIsAllPositive(aName)`
    - Added shorthand `matcher[aName]`, yay!
- Code has been polished
- No new features are **ever** planned!
  - Unless it's for v3.1 which has stable code, it does the same as 2.x version.

### List of Features
- You are not supposed to open map during reroll
  - Unless you are rank 4, or above
    - You may break something otherwise
- Cutscene skip REQUIRES NO user interaction AFTER logging in
  - You can interact AFTER beach cutscene
- Registration & Login is **almost** automated; requires CAPTCHA
  - Since 2.2, seems to require re-entering password, feature has been implemented (the day finally came)
- Auto click anywhere on "START GAME" screen
- Opening cutscene skip (twins)
  - (Saves around 50 seconds)
- Female twin will be selected, named & lastly confirmed
- Skips through dialogue by LClick
- Mini Waypoint Tutorial is 'skipped' by LClick
- When at first statue of the Seven, spams Escape key to exit map
- After red bow girl splash screen, 'skip' by LClick then swap to red girl by pressing 2
  - May not work at times
- At Monstadt entrance, tutorial for navigation will be 'skipped' by macro
- Fend off Dragon DOES NOT NEED user interaction; for now
  - Requires: Medium graphics setting or above 
- Once Fend Dragon off is done, and talk is done, door blocked by Paimon is handled by the Script
  - You can now rest in **piece**
- Teleport confirmation is automated by default
  - **You ARE NOT SUPPOSED to open map UNLESS reroll is complete**
