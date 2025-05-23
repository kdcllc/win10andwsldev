# Android 

[Lenovo Tab K11 LTE](https://www.lenovo.com/us/en/p/tablets/android-tablets/lenovo-tab-series/zzitztccm41/zzitztccm41) came with `com.zui.notes` preinstalled `notepad` app. If accidentally uninstall this can be helpful to reinstall it.

- [`adb.exe` SDK Platform Tools](https://developer.android.com/tools/releases/platform-tools)

- [ZuiNotes](./ZuiNotes.zip)

```bash

# list all of the packages

adb shell pm list packages -f | findstr notes

# save to a file with paths
adb shell pm list packages -f > packages.txt

# specific path but still needs to be modified
package:/system/preinstall/ZuiNotes/ZuiNotes.apk=com.zui.notes

# path that can be pulled
/system/app/ZuiNotes/ZuiNotes.apk=com.zui.notes

# get the apk file
adb pull /system/preinstall/ZuiNotes/ZuiNotes.apk

# can be installed on a new one
adb install ZuiNotes.apk

```

