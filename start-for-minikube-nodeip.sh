#!/bin/bash
#
# start kjwikigdocker for minikube
#
set -xe
kubectl apply -f kjwikigdocker-pvc-standard.yaml
kubectl apply -f kjwikigdocker-service-nodeip.yaml
kubectl apply -f kjwikigdocker-deployment.yaml
set +xe
