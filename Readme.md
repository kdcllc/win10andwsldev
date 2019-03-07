# Windows 10 Linux Subsystem development setup

This repo designed to provide a Guidance for Windows 10 Linux Subsystem (WSL) development. There are many ways to configure and create Web Development Environments this Guide attempts to address some of the common issues with configuration and installation.

It includes:

1. The Installation steps for WSL, Visual Studio.NET, VS Code, DotNet Framework.
2. The scripts to install or configure Web Development environment.

Microsoft also released a repo with for setting up [Windows Dev Box Setup Scripts](https://github.com/Microsoft/windows-dev-box-setup-scripts).
This option is useful if one desired to completely automate the process. It includes powershell script to automate WSL installation,
[WSL Setup from powershell](https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/scripts/WSL.ps1).

## Development hardware

[MSI PL60 Gamer Notebook (Intel i7-7500U, 32GB, 250GB SSD + 1TB HDD, NVIDIA GTX 1050 2GB, Killer AC Wifi, 15.6" Full HD IPS, Windows 10) ](https://www.amazon.com/gp/product/B073R3N5RC/ref=oh_aui_search_detailpage?ie=UTF8&psc=1). 
This machine came with upgraded Solid State drive, but it is not large enough to use it for all of the installation, so location for the `User Profiles` is moved from `C:` drive to `D:` drive.

## Window 10 Professional Configuration steps

1. [Install clean version of Windows 10](https://www.microsoft.com/en-us/software-download/windows10). During installation process create a user named `Admin` then upon login into Windows run `Windows Update` to bring this system up-to-speed.

2. [Update location of `User Profiles`](./win10-move-userprofile.md).

3. Windows 10 [Enable Developer mode](https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development).

- Or Run this powershell script

```ps
    #--- Enable developer mode on the system ---
    #--- source https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/scripts/SystemConfiguration.ps1 ---
    Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1
```

4. [Install Windows Subsystem Linux (WSL) on Windows 10 Professional](./wsl-install.md).

- Unfortunately WSL doesn't recognize installed apps, so we have to have copies of the software to be installed on both.
For example, I installed `Git` but I also now need to install `Git` on WSL as well.

5. [Install WSL Web Development Tools](./wsl-dev-tools.md)

6. [Install Windows 10 Web Development tools](./win10-dev-tools.md).

6. [Install and Configure Docker with Kubernetes](./win10-docker-kube.md).


## Issues resolution

- [VS.NET and Docker SSl not finding Certificate Fix](./vsnet-docker-ssl-issue.md)