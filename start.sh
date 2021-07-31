#!/bin/sh

# create cluster
kind create cluster --config kind-config.yml

docker build -t mc-limbo mc-limbo
docker build -t mc-velocity mc-velocity

# load docker images into container
kind load docker-image --name kubemc mc-limbo
# kind load docker-image --name kubemc mc-velocity

# apply configs
kubectl apply -f k8s-limbo-deployment.yml
kubectl apply -f k8s-limbo-service.yml
# kubectl apply -f k8s-velocity-deployment.yml
# kubectl apply -f k8s-velocity-service.yml

# port forward
# kubectl wait --for=condition=ready service/velocity-service
# kubectl port-forward service/velocity-service --address 0.0.0.0 25565:25565
