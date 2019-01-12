## Install and Configure Kubernates and Docker

1. Control Panel --> Turn Windows Feature on or off --> Windows Hypervisor Platform or [powershell script](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)

>  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

2. Disable legacy features of Windows with [Vulnerability SMB 1.0/CIFS File Sharing Support](https://www.zdnet.com/article/windows-10-tip-stop-using-the-horribly-insecure-smbv1-protocol/)

> Enable-WindowsOptionalFeature -Online -FeatureName smb1protocol

![vulnerability](./img/win10-remove-cifs-vunerubility.JPG)

3. [Downlaod and Install Docker Edge](https://docs.docker.com/docker-for-windows/edge-release-notes/)

4. Install Kubernetes Dashboard into cluster

[Instruction for the Dashboard install](https://github.com/kubernetes/dashboard/wiki/Installation?WT.mc_id=-blog-scottha#recommended-setup)

> kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/alternative/kubernetes-dashboard.yaml

Heapster depreciated - Monitoring system for Kubernetes
> kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/rbac/heapster-rbac.yaml
> kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/standalone/heapster-controller.yaml

I had to update `heapster` deployment with the following for the `command`:
```json
"command": [
              "/heapster",
              "--source=kubernetes:https://kubernetes.default?useServiceAccount=true&kubeletHttps=true&kubeletPort=10250&insecure=true"
            ],
```

> kubectl create -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/influxdb.yaml
> kubectl create -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/grafana.yaml

5. Install Helm

> choco install kubernetes-helm

> helm init --upgrade


6. Install Draft

[Azure Draft](https://github.com/Azure/draft)

>  choco install draft
