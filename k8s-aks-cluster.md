# Azure AKS Cluster Notes

[Enable the dashboard to work with authentication](https://github.com/Azure/AKS/issues/1573#issuecomment-706444871)
```bash
    kubectl delete clusterrolebinding kubernetes-dashboard
    kubectl create clusterrolebinding kubernetes-dashboard-cluster-user --clusterrole=cluster-admin --user=clusterUser
```

Then `kubectl proxy` [Local Dashboard](http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default)


