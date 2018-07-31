#!/bin/bash
#
# start kjwikigdocker for docker-for-windows
#
set -xe
kubectl apply -f kjwikigdocker-pvc-standard.yaml
kubectl apply -f kjwikigdocker-service-clusterip.yaml
kubectl apply -f kjwikigdocker-deployment.yaml
set +xe
