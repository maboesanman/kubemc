#!/bin/sh

# seed configs and mods
kubectl apply -f k8s-seed.yml
kubectl wait --for=condition=ready pod seeder
find . -iname '*.doc' -exec echo "File is {}" \;
find seed \( ! -path '*/.*' \) -type f -exec kubectl cp ./{} seeder:/{} \;
kubectl delete pod seeder --wait

# spin up services
kubectl apply -f k8s-velocity.yml
kubectl apply -f k8s-survival.yml
kubectl apply -f k8s-creative.yml
