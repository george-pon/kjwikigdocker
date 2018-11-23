#!/bin/bash

EDITOR=${EDITOR:-vi}
echo EDITOR is $EDITOR

# edit version number
$EDITOR Dockerfile README.md helm-chart/kjwikigdocker/Chart.yaml

# build image
export IMAGE_PREFIX=georgesan/
bash build-image.sh

# build helm-chart package
bash package-helm-chart.sh

# test run via helm
pushd helm-chart
    # check if kjwikigdocker is present.
    PRESENT=$( helm list kjwikigdocker )
    if [ -z "$PRESENT" ] ; then
        # use local image name
        helm install kjwikigdocker --name kjwikigdocker --set image.repository=georgesan/kjwikigdocker --set image.tag=stable --set image.pullPolicy=IfNotPresent
    else
        # use local image name
        helm upgrade kjwikigdocker kjwikigdocker --set image.repository=georgesan/kjwikigdocker --set image.tag=stable --set image.pullPolicy=IfNotPresent
    fi
    # wait for deploy
    kubectl rollout status deploy/kjwikigdocker
popd

echo ""
echo "Note"
echo ""
echo "1. add '127.0.0.1  kjwikigdocker.minikube.local' to /etc/hosts (when docker-for-windows 18.03)"
echo "2. add 'kjwikigdocker.minikube.local' to browser proxy exclude"
echo "3. access http://kjwikigdocker.minikube.local/kjwikigdocker"
echo ""
