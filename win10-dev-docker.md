# Installation and Configuration of Docker/Kubernetes on Windows 10

## Configure Docker Daemon

1. Enable tcp communication on `tcp` protocol for WSL communication:

Check `Expose daemon on tcp://localhost:2375 without TLS`

2. Enable Kubernetes

- Check Enable Kubernetes
- Deploy Docker Stack to Kubernetes by default
- Check Kubernetes install

```cmd
    kubectl cluster-info
```

3. Shared Drives

- Check all of the drives to be shared

## [Install and Configure Kubernetes Dashboard](https://github.com/kubernetes/dashboard)

- Install Dashboard

```cmd
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
```

- Alternative install

```cmd
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/alternative/kubernetes-dashboard.yaml
```

- Run and Access the Dashboard

```cmd
    kubectl proxy
```

[http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/overview?namespace=default](http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/overview?namespace=default)
