## Install Windows Subsystem Linux (WSL) on Windows
The following manually steps can accomplish what this script will do [WSL.ps1](https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/scripts/WSL.ps1).

1. Open Powershell `Run as Administrator` and run this script to enable WSL [Install the Windows Subsystem for Linux](https://aka.ms/wslinstall):

```ps
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

2. Windows Store and choose flavor of Linux: `Ubuntu`

3. Launch Ubuntu.exe from the Start Menu. Enter a username:`root` and password: `secret` (for sudo command)

4. Update the System

`-y` flag supply `YES` answer to the upgrade.

```bash
    sudo apt-get update 
    sudo apt-get -y upgrade

    #correct the problem if occurred
    sudo dpkg --configure -a
    sudo apt autoremove
```