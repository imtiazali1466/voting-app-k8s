#!/bin/bash

# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# For ARM64 
[$(uname -m) = aarch64 ] && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"]

# add execute permission and mv to /usr/local/bin
chmod +x ./kubectl
sudo mv ./kubectl /user/local/bin/kubectl

# install kubectl and check version
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

