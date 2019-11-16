#!/bin/bash
#
#
#
while [ $# -gt 0 ]
do
    if [ x"$1"x = x"--help"x ]; then
        echo "release-preview  [options]"
        echo "  options:"
        echo "    --help      print this."
        echo "    --no-edit   skip edit Dockerfile, etc."
        exit 0
    fi
    if [ x"$1"x = x"--no-edit"x ]; then
        NO_EDIT=true
        shift
        continue
    fi
done


EDITOR=${EDITOR:-vi}
echo EDITOR is $EDITOR

set -eux
echo "check docker / kubectl / helm"
docker version
kubectl version
helm version
set +eux

if [ x"$NO_EDIT"x = x"true"x ] ; then
    echo "skip edit Dockerfile README.md helm-chart/kjwikigdocker/Chart.yaml"
else
    # edit version number
    $EDITOR Dockerfile README.md helm-chart/kjwikigdocker/Chart.yaml
fi

export IMAGE_BUILD_TAG=$( cat Dockerfile | grep ENV | grep  KJWIKIGDOCKER_VERSION | egrep -e  'build[0-9]+' | awk '{print $3}' )
export IMAGE_PREFIX=
# use docker hub site
# export IMAGE_PREFIX=georgesan/
# export IMAGE_BUILD_TAG=latest
# export no_cache=
# export no_cache=true

# build image
bash build-image.sh

# build helm-chart package
bash package-helm-chart.sh

# test run via helm
pushd helm-chart
    # check if kjwikigdocker is present.
    if helm list | grep kjwikigdocker ; then
        # use local image name
        helm upgrade kjwikigdocker kjwikigdocker --set image.repository=${IMAGE_PREFIX}kjwikigdocker --set image.tag=$IMAGE_BUILD_TAG --set image.pullPolicy=IfNotPresent
    else
        # use local image name
        helm install kjwikigdocker kjwikigdocker --set image.repository=${IMAGE_PREFIX}kjwikigdocker --set image.tag=$IMAGE_BUILD_TAG --set image.pullPolicy=IfNotPresent
    fi
    # wait for deploy
    kubectl rollout status deploy/kjwikigdocker
popd

echo ""
echo "Note"
echo ""
echo "1. add '127.0.0.1  kjwikigdocker.minikube.local' to /etc/hosts (when docker-for-windows 18.03)"
echo "2. add 'kjwikigdocker.minikube.local' to browser proxy exclude"
echo "3. access http://kjwikigdocker.minikube.local/kjwikigdocker/"
echo ""
