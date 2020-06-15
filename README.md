# Windows 10 Linux Subsystem development setup

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://raw.githubusercontent.com/kdcllc/win10andwsldev/master/LICENSE)

I personally &#x1F9E1; Windows for my FullStack development, thus this repo was born to keep track of installation scripts and setup instructions with Windows 10 Linux Subsystem (WSL2) to enabled FullStack development.

1. The Installation steps for WSL, Visual Studio.NET, VS Code, DotNet Framework.
2. The scripts to install or configure Web Development environment.

Microsoft also released a repo with for setting up [Windows Dev Box Setup Scripts](https://github.com/Microsoft/windows-dev-box-setup-scripts).
This option is useful if one desired to completely automate the process. It includes powershell script to automate WSL installation,
[WSL Setup from powershell](https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/scripts/WSL.ps1).

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