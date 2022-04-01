# Initial Windows 10 Setup with User Profile on D: drive

1. Update location of User Profiles.

- Run `Regedit` in command prompt as administrator `[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList]`

- Update entries for `ProfilesDirectory` and `Public` profile per this image.
 ![regedit](./img/wind10-user-profile-update.jpg)

2. Add a new `Local User` named `Root` do not provide a password.

3. Don't log off the `Admin` user but log in as newly created user `Root`, if registry modification was correct then newly created user profile should be created under `D:\Users`