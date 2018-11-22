# Installing .NET Core SDK

1. [Install latest .NET Core SDK](https://www.microsoft.com/net/learn/dotnet/hello-world-tutorial#linuxubuntu)

- Register Microsoft key and feed

```bash
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
```

- Install latest SDK

```bash
sudo add-apt-repository universe
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.1
```