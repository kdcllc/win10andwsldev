# Windows Subsystem Linux Developers' tools installations

1. [Install and Configure Git](./wsl-dev-git.md)

2. [Install .NET Core SDK](./wsl-dev-dotnetcore.md)

3. Install WSL build essential

```bash
    sudo apt-get install -y build-essential
```

4. Install [nvm](https://github.com/creationix/nvm)

```bash
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
```


## Clean up WSL

```bash
    #This terminal command deletes all .deb files from /var/cache/apt/archives. It basically cleans up the apt-get cache.
    sudo apt-get autoclean
    
    #This terminal command is used to free up the disk space by cleaning up downloaded .deb files from the local repository.
    sudo apt-get clean

    #This terminal command used to remove packages that were automatically installed to satisfy dependencies for some package and no longer needed by those packages.
    sudo apt-get autoremove
```