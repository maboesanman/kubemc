#!/bin/sh

# seed configs and mods
kubectl apply -f k8s-seed.yml
kubectl apply -f k8s-storage.yml
kubectl wait --for=condition=ready pod seeder
find seed \( ! -path '*/.*' \) -type f -exec kubectl cp ./{} seeder:/{} \;
kubectl delete pod seeder --wait

# spin up services
kubectl apply -f k8s-velocity.yml
kubectl apply -f k8s-survival.yml
kubectl apply -f k8s-creative.yml
