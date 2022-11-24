#!/bin/bash

echo "Building images..."

docker build -t bzrr0/projeto-backend:1.1 backend/.
docker build -t bzrr0/projeto-database:1.1 database/.

echo "Pushing images to HUB..."

docker push bzrr0/projeto-backend:1.1
docker push bzrr0/projeto-database:1.1

echo "Creating services on cluster..."

kubectl apply -f ./services.yml

echo "Creating deployments..."

kubectl apply -f ./deployment.yml
