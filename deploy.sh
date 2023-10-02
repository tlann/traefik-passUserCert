#!/bin/bash

kubectl create ns who
kubectl create secret tls who-secret -n who  --key="genCerts/localhost.key" --cert="genCerts/localhost.crt"
kubectl apply -f whoami-deploy.yaml
kubectl apply -f whoami-ingress.yaml
kubectl apply -f whoami-service.yaml
