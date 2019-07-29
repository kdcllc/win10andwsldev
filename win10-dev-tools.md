# Windows 10 Developers' tools installations

This is not a comprehensive list of all of the tools but a rough idea of the Web Development minimum required tools.

## Install Visual Studio Code Insider edition with Git Windows edition

1. [Install Latest .NET SDK](https://dotnet.microsoft.com/download)

- WSL `curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -DryRun --version 2.2.300` and `curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 3.0.100-preview6-012264`

```bash

    $ which dotnet /usr/bin/dotnet
    $ export PATH=/home/msi/.dotnet:$PATH
    $ which dotnet /home/msi/.dotnet/dotnet
    
    $ dotnet --list-sdks
```

2. [Download and Install Visual Studio Code Insider](https://code.visualstudio.com/docs/?dv=win&build=insiders)

3. [Install Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)

- Github Token Id
- Github Gist Id

4. [Install Git for Windows](https://git-scm.com/download/win). Accept all of the defaults. (WSL2 now doesn't require installation of `git`)

- Global `git` user setting:

```bash
    git config --global user.email "info@kingdavidconsulting.com"
    git config --global user.name "kdcllc"

    # The core.autocrlf=input setting is pretty crucial. It can break things you install over git (like rbenv).
    git config --global core.autocrlf input
```

- Project based `git` settings:

```bash
    git config user.email "info@kingdavidconsulting.com"
    git config user.name "kdcllc"
```

## Install NVM and Node.js

Instead of directly installing `Node.js` use [`Windows 10 NVM tooling`](https://github.com/coreybutler/nvm-windows/releases) to install multiple versions of `Node.js`.

Installation on WSL 1 or 2 `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash1`.

- `nvm` commands reference:

``` cmd
    nvm list
    nvm use
    nvm install
```

- Install `Node.Js` with `nvm`

- Once `nvm` is installed it is possible to have as many versions of `Node.js` installed side-by-side as needed.

```cmd
    nvm install 10.13,0

    nvm use 10.13.0
```

## Install Azure CLI

[Install Azure CLI on Windows](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest)

- Windows MSI installation package is to be used for this operation.
- WSL2 installation `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`

## Install Chocolatey manager

[Chocolatey](https://chocolatey.org/install)

- This utility is like `brew` or `apt` to install other dependencies.
  Run `powershell` as Administrator

```ps
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Install Visual Studio.NET 2017

[Install Visual Studio Community](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=15) or paid

- Sign-In and configure Visual Studio.NET Identities.

### Visual Studio.NET 2017

- [Install Extension Manager 2017](https://marketplace.visualstudio.com/items?itemName=MadsKristensen.ExtensionManager) this extension allows import/export functionality.

- [Download Visual Studio 2017 extensions2017.vsext](https://raw.githubusercontent.com/kdcllc/win10andwsldev/master/vsconfiguration/extensions2017.vsext)

### Visual Studio.NET 2019

- [Install Extension Manager 2019](https://marketplace.visualstudio.com/items?itemName=MadsKristensen.ExtensionManager2019)
- [Download Visual Studio 2019 extensions2019.vsext](https://raw.githubusercontent.com/kdcllc/win10andwsldev/master/vsconfiguration/extensions2019.vsext)

- [Add and Configure Azure Nuget Custom Feed](./azure-nuget-feed.md)

### Maunally install Visual Studio.NET Extensions

- [Mapping Generator](https://marketplace.visualstudio.com/items?itemName=54748ff9-45fc-43c2-8ec5-cf7912bc3b84.mappinggenerator)
- [Clean Bin and Obj](https://marketplace.visualstudio.com/items?itemName=dobrynin.cleanbinandobj)

### Clean Uninstall Visual Studio.NET 2017

In case when Uninstall fails on the UI compoenet of the VS Installer then this untility can be used:

```cmd
     %ProgramFiles(x86)%\Microsoft Visual Studio\Installer\resources\app\layout\installcleanup.exe
```
Or use manual delete of the following:

```txt
    
    %ProgramData%\Microsoft\VisualStudio\15.0

    %ProgramData%\Microsoft\VisualStudio\Packages

    %AppData%\Microsoft\VisualStudio\15.0*

    %AppData%\Microsoft\VisualStudio\Packages

    %ProgramFiles(x86)%\Microsoft Visual Studio\2017

    HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\15.0*

    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\15.0*
```

## Install RESTful Tools

[Install POSTMAN](https://www.getpostman.com/download?platform=win64)

- One of the best testing tools for RESTFul Apis.
- Visual Studio Code Extension is another good alternative [REST Client](https://github.com/Huachao/vscode-restclient)

## Others

- `Nuget.exe`

  ```cmd
    choco install nuget.commandline
  ```

- [7-zip.org](https://www.7-zip.org/download.html)
- [Unblock downloaded PowerShell scripts](https://social.technet.microsoft.com/wiki/contents/articles/38496.unblock-downloaded-powershell-scripts.aspx?Redirected=true)
- [Ditto Clipboard Manager](https://ditto-cp.sourceforge.io/)
- [Keypirinha Program Launcher](http://keypirinha.com/)
- [f.lux](https://justgetflux.com/news/pages/v4/welcome/#download)
- [Rufus Create bootable USB drives the easy way](https://github.com/pbatard/rufus)
- [Azure Storage Explorer](https://azure.microsoft.com/en-us/features/storage-explorer/)
- [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download?view=sql-server-ver15) can be a replacement for Microsoft SQL Management Studio.

```cmd
    choco install keypirinha
```
- [Powershell Script To Remove .NET Core Sdks](./RemoveCoreSDKs.ps1)