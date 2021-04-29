#!/bin/sh

kind create cluster --config kind-config.yml

kind load docker-image --name kubemc mc-limbo

kubectl apply -f k8s-limbo-deployment.yml
kubectl apply -f k8s-limbo-service.yml
kubectl apply -f k8s-ingress.yml
