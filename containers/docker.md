# Docker

## Commands

- Clean up

```bash
    # clean up system
    docker system prune -f
    docker container prune -f

    # list all images
    docker images -f dangling=true
    # clean up
    docker rmi -f $(docker images -f "dangling=true" -q)

```
-  Toggle Context
To toggle between context

```bash
    # list all docker contexts
    docker context ls
    
    # the VM based context that enables Kubernetes
    docker context use default

    # new WSL2 context
    docker context use wsl
```

## [Install and Configure Kubernetes Dashboard](https://github.com/kubernetes/dashboard)

Alternative tool for K8s cluster is <https://github.com/lensapp/lens>

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


## References

- [Use Docker to build, test and push your Artifacts](https://lostechies.com/gabrielschenker/2016/09/26/use-docker-to-build-test-and-push-your-artifacts/)

