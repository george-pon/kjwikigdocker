#!/bin/bash
#
# start kjwikigdocker for minikube
#
set -xe
kubectl delete svc/kjwikigdocker
kubectl delete deploy/kjwikigdocker-deployment
# kubectl delete pvc/claim-kjwikigdocker
set +xe
