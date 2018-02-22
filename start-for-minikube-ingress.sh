#!/bin/bash
#
# start kjwikigdocker for minikube
# 
# you must enable ingress addon.
#   minikube addons enable ingress
#
set -xe
kubectl apply -f kjwikigdocker-pvc-standard.yaml
kubectl apply -f kjwikigdocker-service-clusterip.yaml
kubectl apply -f kjwikigdocker-ingress.yaml
kubectl apply -f kjwikigdocker-deployment.yaml
set +xe
