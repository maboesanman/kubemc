#!/bin/sh

# create secret
kubectl create secret generic player-forwarding-secret --from-literal=secret=$(openssl rand -hex 16)

# spin up services
kubectl apply -f k8s-velocity.yml
kubectl apply -f k8s-server-survival.yml
kubectl apply -f k8s-server-survival-laurel.yml
kubectl apply -f k8s-server-creative.yml
