# Windows 11 Linux Subsystem Development Setup

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://raw.githubusercontent.com/kdcllc/win10andwsldev/master/LICENSE)

I personally &#x1F9E1; Windows for my FullStack development, thus this repo was born to keep track of the installation scripts and setup instructions pertaining to Windows 11 Linux Subsystem (WSL2).

1. The Installation steps for WSL, Visual Studio.NET, VS Code, DotNet Framework.
2. The scripts to install or configure Web Development environment.

Microsoft also released a repo with for setting up [Windows Dev Box Setup Scripts](https://github.com/Microsoft/windows-dev-box-setup-scripts).
This option is useful if one desired to completely automate the process. It includes powershell script to automate WSL installation,
[WSL Setup from powershell](https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/scripts/WSL.ps1).

## Window 11 Professional Configuration steps

1. [Install fresh version of Windows 11](https://www.microsoft.com/en-us/software-download/windows11).

3. Windows 10/11 [Enable Developer mode](https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development).

Or Run this powershell script

```ps1
    # enable developer mode on the system ---
    # source https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/scripts/SystemConfiguration.ps1
    Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1
```

4. [Install wsl on Windows 11 Pro](https://docs.microsoft.com/en-us/windows/wsl/install).

5. [Install Windows 11 FullStack Development tools](./win11-dev/fullstack-dev-tools.md).

6. [Install WSL Web Development Tools](./wsl-dev-tools.md)


7. [Install and Configure Docker with Kubernetes](./win10-docker-kube.md).


## Issues resolution

- [VS.NET and Docker SSl not finding Certificate Fix](./vsnet-docker-ssl-issue.md)