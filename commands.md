# Terminal commands for k8s-votting app

## 1. Creating and managing k8s cluster with kind

- clear terminal
```bash
clear
```

- check kind version
```bash
kind version
```

- create kind cluster
```bash
kind create cluster --config=config.yml
```

- check cluster info
```bash
kind cluster-info --contect kind-kind
kubectl get nodes
kubectl get clusters
```

## 2. Installing kubectl 

- Download and installing kubectl
```bash
bash install_kubectl.sh
kubectl version --client
```

- Installing and managing Docker 
```bash
bash install_docker.sh 
sudo docker ps
```

- Cloning app
```bash
git clone https://github.com/imtiazali1466/voting-app-k8s.git
cd voting-app-k8s
git pull
```

- Managing cluster
```bash
kubectl apply -f k8s_manifests/
kubectl get all
kubectl get pods
kubectl get pods -n nginx
kubectl get ns
```

