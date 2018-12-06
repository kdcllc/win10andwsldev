## Install and Configure Kubernates and Docker

1. Control Panel --> Turn Windows Feature on or off --> Windows Hypervisor Platform or [powershell script](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)

```ps
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

2. Disable legacy features of Windows with [Vulnerability SMB 1.0/CIFS File Sharing Support](https://www.zdnet.com/article/windows-10-tip-stop-using-the-horribly-insecure-smbv1-protocol/)

```ps
    Enable-WindowsOptionalFeature -Online -FeatureName smb1protocol
```

![vulnerability](./img/win10-remove-cifs-vunerubility.JPG)

3. [Downlaod and Install Docker Edge](https://docs.docker.com/docker-for-windows/edge-release-notes/)

4. Install Helm

```cmd
    choco install kubernetes-helm
```

5. Install Draft

[Azure Draft](https://github.com/Azure/draft)

```cmd
    choco install draft
```