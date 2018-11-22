# Windows 10 Developers' tools installations

1. [Installation NVM for Windows 10](https://github.com/coreybutler/nvm-windows/releases)

``` bash
    nvm list
    nvm use
    nvm install
```

2. Install NodeJs

```cmd
    nvm install 10.13,0

    nvm use 10.13.0
```

3. [Install Azure CLI on Windows](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest)
Windows MSI installation package is to be used for this operation.

4. [Chocolatey](https://chocolatey.org/install)
Run As Administrator
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

5. Install Helm
```cmd
    choco install kubernetes-helm
```