#!/bin/bash
#
# リリース前確認用シェル
#
while [ $# -gt 0 ]
do
    if [ x"$1"x = x"--help"x ]; then
        echo "release-preview  [options]"
        echo "  options:"
        echo "    --help      print this."
        echo "    --no-edit   skip edit Dockerfile, etc."
        echo "    --no-chart  skip generate helm chart"
        exit 0
    fi
    if [ x"$1"x = x"--no-edit"x ]; then
        NO_EDIT=true
        shift
        continue
    fi
    if [ x"$1"x = x"--no-chart"x ]; then
        NO_CHART=true
        shift
        continue
    fi
done


EDITOR=${EDITOR:-vi}
if type $EDITOR ; then
    echo EDITOR is $EDITOR
elif type vim ; then
    EDITOR=vim
    echo EDITOR is $EDITOR
fi

set -eux
echo "check ... docker / kubectl / helm"
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
export IMAGE_NAME=${IMAGE_PREFIX}$(awk '/^ENV KJWIKIGDOCKER_IMAGE/ {print $3;}' Dockerfile)
# use docker hub site
# export IMAGE_PREFIX=georgesan/
# export IMAGE_BUILD_TAG=latest
# export no_cache=
# export no_cache=true

# build image
export USE_BUILDX=no
bash build-image.sh

if [ x"$NO_CHART"x = x"true"x ]; then
    echo "skip helm-chart package"
else
    # build helm-chart package
    bash package-helm-chart.sh
fi

# test run via helm
pushd helm-chart
    # check if kjwikigdocker is present.
    if helm list | grep kjwikigdocker ; then
        # use local image name
        helm upgrade kjwikigdocker kjwikigdocker \
            --set image.repository=$IMAGE_NAME \
            --set image.tag=$IMAGE_BUILD_TAG \
            --set image.pullPolicy=IfNotPresent \
            --set ingress.hosts="{host.docker.internal}" \
            --set replicaCount=1
    else
        # use local image name
        helm install kjwikigdocker kjwikigdocker \
            --set image.repository=$IMAGE_NAME \
            --set image.tag=$IMAGE_BUILD_TAG \
            --set image.pullPolicy=IfNotPresent  \
            --set ingress.hosts="{host.docker.internal}" \
            --set replicaCount=1
    fi
    # wait for deploy
    kubectl rollout status deploy/kjwikigdocker
popd

echo ""
echo "Note"
echo ""
echo "1. add 'xxx.xxx.xxx.xxx  host.docker.internal' to /etc/hosts (when docker desktop for windows)"
echo "2. add 'host.docker.internal' to browser proxy exclude"
echo "3. access https://host.docker.internal/kjwikigdocker/"
echo ""
