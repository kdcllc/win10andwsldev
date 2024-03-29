# Windows 11 Developers' tools installations

**Windows 11 22H2 22621.674**

This is not a comprehensive list of all of the tools but a rough idea of the Web Development minimum required tools.

Windows 11 comes with preinstalled with:

- [App Installer](https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1?ocid=9nblggh4nns1_ORSEARCH_Bing&rtc=2&activetab=pivot:overviewtab)

- [Windows Terminal](https://github.com/microsoft/terminal/releases)

- [`winget`](https://docs.microsoft.com/en-us/windows/package-manager/winget/)

## Setting up development environment

1. Install `vscode-insiders` : `winget install code-insiders`

In one of my installs the options for menu on File Explore wasn't enabled, so I ran [OpenWithVScodeFix.reg](./scripts/OpenWithVScodeFix.reg).

2. Install `git for windows` : `winget install Git.Git`

Global `git` user setting:

```bash
    git config --global user.email "@kingdavidconsulting.com"
    git config --global user.name "kdcllc"
```

Project based `git` settings:

```bash
    git config user.email "@kingdavidconsulting.com"
    git config user.name "kdcllc"
```

3. Install `Docker Desktop` 
 - `winget install Docker.DockerDesktop`
 - [Kubernetes Lens](https://k8slens.dev/)


4. [Install Visual Studio Community](https://visualstudio.microsoft.com/free-developer-offers/) or paid

## Other

[Terminal customization](./windows-terminal.md)


## Install Azure CLI

[Install Azure CLI on Windows](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest)

- Windows MSI installation package is to be used for this operation.
- WSL2 installation `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`
- [Add and Configure Azure Nuget Custom Feed](./azure-nuget-feed.md)

## Install RESTful Tools

[Install POSTMAN](https://www.getpostman.com/download?platform=win64)

- One of the best testing tools for RESTFul Apis.
- Visual Studio Code Extension is another good alternative [REST Client](https://github.com/Huachao/vscode-restclient)

## Others

- [7-zip.org](https://www.7-zip.org/download.html)
- [Unblock downloaded PowerShell scripts](https://social.technet.microsoft.com/wiki/contents/articles/38496.unblock-downloaded-powershell-scripts.aspx?Redirected=true)
- [Ditto Clipboard Manager](https://ditto-cp.sourceforge.io/)
- [Keypirinha Program Launcher](http://keypirinha.com/)
- [Rufus Create bootable USB drives the easy way](https://github.com/pbatard/rufus)
- [Azure Storage Explorer](https://azure.microsoft.com/en-us/features/storage-explorer/)
- [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download?view=sql-server-ver15) can be a replacement for Microsoft SQL Management Studio.

```cmd
    choco install keypirinha
```

- [Powershell Script To Remove .NET Core Sdks](./scripts/RemoveCoreSDKs.ps1)


### Visual Studio.Net Incognito setup

```text
Chrome
Program: "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
Arguments: --incognito
Friendly Name: Chrome - Incognito


Firefox
Program: "C:\Program Files\Mozilla Firefox\firefox.exe"
Arguments: -private
Friendly Name: Firefox - Incognito

Edge Dev on Chromium
Program: "C:\Program Files (x86)\Microsoft\Edge Dev\Application\msedge.exe"
Arguments: -inprivate
Friendly Name: Edge Dev - Incognito

``````