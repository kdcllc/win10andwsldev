# Move wsl vm image to a different machine

## Steps to export wsl:

```bash
    # 1. shutdown
    wsl --shutdown

    # 2. display all of the images
    wsl --list -v

    # 3. export
    wsl --export Ubuntu C:\Linux\Ubuntu.tar
```

## Steps to import wsl:

1. Enable the Windows Subsystem for Linux

```bash
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

2. Enable Virtual Machine feature

```bash
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

3. Download and Install [Linux kernel update package](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)


4. Set WSL 2 as your default version

```bash
    wsl --set-default-version 2
```

5. Import your image

```bash
    wsl --import Ubuntu C:\Linux\  C:\Linux\Ubuntu.tar
```

## Steps to fix the default user

Microsoft recommendation [Advanced settings configuration in WSL](https://learn.microsoft.com/en-us/windows/wsl/wsl-config) but they didn't work.

1. Login to imported distro 

```bash
    wsl -d Ubuntu -u usrname
```

2. Get user name id

```bash
    username@host:~$ id
```

3. Set registry to the distro name

```powershell
    Get-ItemProperty Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\*\ DistributionName | Where-Object -Property DistributionName -eq ubuntu  | Set-ItemProperty -Name DefaultUid -Value 1000
```

## Reference

- [Manual installation steps for older versions of WSL](https://learn.microsoft.com/en-us/windows/wsl/install-manual)
- [How to set default user for manually installed WSL distro?](https://superuser.com/questions/1566022/how-to-set-default-user-for-manually-installed-wsl-distro)
