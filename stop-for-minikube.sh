#!/bin/bash
#
# start kjwikigdocker for minikube
#
set -x
kubectl delete svc/kjwikigdocker
kubectl delete deploy/kjwikigdocker
kubectl delete ingress/kjwikigdocker
# kubectl delete pvc/claim-kjwikigdocker
set +x
