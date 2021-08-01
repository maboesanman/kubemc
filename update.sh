#!/bin/sh

# build images
docker build -t mc-limbo mc-limbo
docker build -t mc-velocity mc-velocity

# load docker images into container
kind load docker-image --name kubemc mc-limbo
kind load docker-image --name kubemc mc-velocity

# apply configs
kubectl apply -f k8s-limbo.yml
kubectl apply -f k8s-velocity.yml
kubectl apply -f k8s-database.yml