# Installation of Docker and Kubernetes On the Desktop

1. [Install Docker Daemon and Docker Compose](./wsl_docker_setup.sh)

```bash
    curl -o- https://raw.githubusercontent.com/kdcllc/wind10wsldev/master/wsl_docker_setup.sh | sudo bash
```

 - Or follow the steps in this article [Setting Up Docker for Windows and WSL to Work Flawlessly](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly)

2. Kubernetes

- Install `Kubectl` in WSL
```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
&& chmod +x ./kubectl \
&& sudo mv ./kubectl /usr/local/bin/kubectl
```

- Copying Kubernetes Config from Windows

```bash 
mkdir ~/.kube \
&& cp /mnt/d/Users/Root/.kube/config ~/.kube
```

3. Install Helm

```bash
    export HELM_VERSION=2.8.0
    wget https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
    tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
    sudo mv linux-amd64/helm /usr/local/bin && \
    helm init
```

4. Install Draft

```bash
    export DRAFT_VERSION=0.16.0 && \
    curl -LO https://azuredraft.blob.core.windows.net/draft/draft-v${DRAFT_VERSION}-linux-amd64.tar.gz && \
    tar -xvzf draft-v${DRAFT_VERSION}-linux-amd64.tar.gz && \
    sudo mv linux-amd64/draft /usr/local/bin && \
    draft init
```

### Useful commands

Stopping all running containers and removing all of the images, volumes, networks

```bash
    docker container stop $(docker container ls -a -q) && docker system prune -a -f --volumes
```