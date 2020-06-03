#!/bin/bash

# Receives your Windows username as only parameter.
# ./kubectl_ubuntu_wsl.sh Root

# curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.3/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

windowsUser=$1

mkdir -p ~/.kube
ln -sf "/mnt/c/users/$windowsUser/.kube/config" ~/.kube/config

kubectl version
