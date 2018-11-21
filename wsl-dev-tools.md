# Windows Subsystem Linux Developers' tools installations

1. [Install Git]()
- Generating new SSH Key for Github
```
    ssh-keygen -t rsa -b 4096 -C "info@kingdavidconsulting.com"
```
- Generating new SSH Key for Azure
```
    ssh-keygen -C "someemail@some.com"
```

Check if agent is running
```bash
    eval $(ssh-agent -s)
```
Add the certificate to the agent
```bash
     ssh-add ~/.ssh/id_rsa
```

Configuration
```bash
    git config --global user.email "info@kingdavidconsulting.com"
    git config --global user.name "kdcllc"
```

Copy SSH Key
```bash
    #windows
    clip < ~/.ssh/github_id_rsa
    #linux
    cat ~/.ssh/github_id_rsa
```
2. [Install latest .NET Core SDK](https://www.microsoft.com/net/learn/dotnet/hello-world-tutorial#linuxubuntu)

Register Microsoft key and feed
```
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
```

Install latest SDK
```
sudo add-apt-repository universe
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.1
```

or 
```
sudo apt-get install dotnet-sdk-2.1.4

```

```bash
    #This terminal command deletes all .deb files from /var/cache/apt/archives. It basically cleans up the apt-get cache.    
    sudo apt-get autoclean
    
    #This terminal command is used to free up the disk space by cleaning up downloaded .deb files from the local repository.    
    sudo apt-get clean

    #This terminal command used to remove packages that were automatically installed to satisfy dependencies for some package and no longer needed by those packages.
    sudo apt-get autoremove
```