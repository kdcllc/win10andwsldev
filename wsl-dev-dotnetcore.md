# Installing .NET Core SDK

1. [Install latest .NET Core SDK](https://www.microsoft.com/net/learn/dotnet/hello-world-tutorial#linuxubuntu)

- Register Microsoft key and feed

```bash
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
```

- Install latest stable SDK

```bash
sudo add-apt-repository universe
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.1
```

## [Remove .NET Core Runtime and SDK](https://docs.microsoft.com/en-us/dotnet/core/versions/remove-runtime-sdk-versions?tabs=Linux)

```bash
    sudo apt-get remove dotnet-host

    export DOTNET_VERSION=2.1.500
    sudo rm -rf /usr/share/dotnet/sdk/$DOTNET_VERSION
    sudo rm -rf /usr/share/dotnet/shared/Microsoft.NETCore.App/DOTNET_VERSION
    sudo rm -rf /usr/share/dotnet/shared/Microsoft.AspNetCore.App/DOTNET_VERSION
    sudo rm -rf /usr/share/dotnet/host/fxr/DOTNET_VERSION

```