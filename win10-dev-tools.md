# Windows 10 Developers' tools installations

This is not all of the tools but most of them that can be installed for Web Application development.

## Install Visual Studio Code Insider edition with Git Win edition

1. [Download and Install Visual Studio Code Insider](https://code.visualstudio.com/docs/?dv=win&build=insiders)

2. [Install Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
 - there was an issue with setting up this extension I had to manually enable prompt for GISTID.

3. [Install Git for Windows](https://git-scm.com/download/win). Accept all of the defaults.

4. [Install Latest .NET SDK](https://dotnet.microsoft.com/download)
 - Need this for the extensions I have

## Install NVM and Node.js
Open-source tooling is changing constantly and some of the legacy application are using older version of the `Node.js` to solve this issue I installed `nvm` for windows and also for WSL.

1. [Install NVM for Windows 10](https://github.com/coreybutler/nvm-windows/releases)

`nvm` commands reference:
``` cmd
    nvm list
    nvm use
    nvm install
```

2. Install `Node.Js` with `nvm`

- Once `nvm` is installed now I can have as many versions of `Node.js` installed side-by-side as I need.

```cmd
    nvm install 10.13,0

    nvm use 10.13.0
```

3. [Install Azure CLI on Windows](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest)

- Windows MSI installation package is to be used for this operation.

4. [Chocolatey](https://chocolatey.org/install)

- This utility is like `brew` or `apt` to install other dependencies.
  Run `powershell` as Administrator

```ps
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

6. [Install Visual Studio Community](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=15) or paid

- Sign-In and configure Visual Studio.NET Identities.

- [Install Extension Manager](https://marketplace.visualstudio.com/items?itemName=MadsKristensen.ExtensionManager) this extension allows import/export functionality.

- Download and install extensions with this file [extensions.vsext](https://gist.githubusercontent.com/kdcllc/23670c0a73de3ae880bbb2dc969e2356/raw/d614cdfec60cdb0f41893e1daace7122f327116f/extensions.vsext)

- [Add and Configure Azure Nuget Custom Feed](./azure-nuget-feed.md)

7. [Install POSTMAN](https://www.getpostman.com/download?platform=win64)

- One of the best testing tools for RESTFul Apis.
- Visual Studio Code Extension is another good alternative [REST Client](https://github.com/Huachao/vscode-restclient)