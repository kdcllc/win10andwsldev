# Windows Subsystem Linux Developers' tools installations

1. [Install and Configure Git](./wsl-dev-git.md)

2. [Install .NET Core SDK](./wsl-dev-dotnetcore.md)

3. Install WSL build essential

```bash
    sudo apt-get install -y build-essential
```

4. Install [nvm](https://github.com/creationix/nvm)

```bash
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | sudo bash
```

5. Install Node.js

```bash
    export NODE_VERSION=10.13.0 && \
    nvm install ${NODE_VERSION} && \
    nvm use ${NODE_VERSION}
```

6. [Install Docker Daemon and Docker Compose](./wsl_docker_setup.sh)

```bash
    curl -o- https://raw.githubusercontent.com/kdcllc/wind10wsldev/master/wsl_docker_setup.sh | bash 
```

 - Or follow the steps in this article [Setting Up Docker for Windows and WSL to Work Flawlessly](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly)

7. Kubernetes


## Clean up WSL

```bash
    #This terminal command deletes all .deb files from /var/cache/apt/archives. It basically cleans up the apt-get cache.
    sudo apt-get autoclean
    
    #This terminal command is used to free up the disk space by cleaning up downloaded .deb files from the local repository.
    sudo apt-get clean

    #This terminal command used to remove packages that were automatically installed to satisfy dependencies for some package and no longer needed by those packages.
    sudo apt-get autoremove
```