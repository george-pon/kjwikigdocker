#/bin/bash

set -xe

# helm install for kjwikigdocker
cd helm-chart
helm install kjwikigdocker --name kjwikigdocker --set ingress.hosts="{kjwikigdocker.default.svc.k8s.local}"

# wait until deploy complete
kubectl rollout status deploy/kjwikigdocker

set +xe
