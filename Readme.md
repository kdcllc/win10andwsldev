# Windows 10 Linux Subsystem development setup

The purpose of this repo is to include all of the needed tools, scripts and steps for standing up a development environment on Windows 10 with Linux Subsystem (WSL) for web and mobile development.

I also came a cross this Microsoft repo [Windows Dev Box Setup Scripts](https://github.com/Microsoft/windows-dev-box-setup-scripts). It contains a treasure trove of automated scripts including [WSL Setup from powershell](https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/scripts/WSL.ps1).

For my development needs I am using [MSI PL60 Gamer Notebook (Intel i7-7500U, 32GB, 250GB SSD + 1TB HDD, NVIDIA GTX 1050 2GB, Killer AC Wifi, 15.6" Full HD IPS, Windows 10) ](https://www.amazon.com/gp/product/B073R3N5RC/ref=oh_aui_search_detailpage?ie=UTF8&psc=1). Since this machine has small size of the solid state drive. Let's reconfigure where the location of the `User Profiles` is from `C:` drive to `D:` drive.

## Configuration steps

1. [Install clean version of Windows 10](https://www.microsoft.com/en-us/software-download/windows10)
 -Create User `Admin` then upon login into Windows run `Windows Update` to bring this system up-to-speed.

2. [Update location of User Profiles](./win10-move-userprofile.md)

5. [Enable Developer mode](https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development)

```ps
    #--- Enable developer mode on the system ---
    #--- source https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/scripts/SystemConfiguration.ps1 ---
    Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1
```

6. [Install Windows 10 Development tools](./win10-dev-tools.md)

7. [Install and Configure Kubernetes and Docker](./win10-docker-kube.md)


## Installing Developers' tools

Now we are ready to install developers' tools on both system. Unfortunately WSL doesn't recognize installed apps, so we have to have copies of the software to be installed on both.
For example, I installed `Git` but I also now need to install `Git` on WSL as well.

- [Setup Windows 10](./win10-dev-tools.md)
- [Setup WSL](./wsl-dev-tools.md)