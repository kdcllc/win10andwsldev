# Install Windows Subsystem Linux (WSL) on Windows 10 Professional

There are two ways this can be accomplished, manually or automated thru use of powershell script.

## Manual Steps

1. Open Powershell `Run as Administrator` and run this script to enable WSL as mentioned [here](https://aka.ms/wslinstall):

```ps
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

2. Launch Windows Store and choose flavor of Linux to use: `Ubuntu`

3. Launch Ubuntu.exe from the Start Menu. Enter a username:`root` and password: `secret` (for sudo command).

4. Update/Upgrade the WSL System to the latest

`-y` flag supply `YES` answer to the upgrade.

```bash
    sudo apt-get update
    sudo apt-get -y upgrade

    #correct the problem if occurred
    sudo dpkg --configure -a
    sudo apt autoremove
```

## Using Powershell Script to Install WSL

[Microsoft Powershell Script WSL.ps1](https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/scripts/WSL.ps1).
