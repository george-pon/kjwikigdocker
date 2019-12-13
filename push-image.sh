#!/bin/bash


function add-machine-suffix() {
    local i=
    local MACHINE=$( uname -m )
    for i in "$@"
    do
	if [ x"$MACHINE"x = x"x86_64"x ]; then
	    echo $i
	else
	    echo $i-$MACHINE
	fi
    done
}



TAG_LIST=$(awk '/^ENV KJWIKIGDOCKER_VERSION/ {print $3;}' Dockerfile)
TAG_LIST=$( add-machine-suffix $TAG_LIST )
IMAGE_NAME=$(awk '/^ENV KJWIKIGDOCKER_IMAGE/ {print $3;}' Dockerfile)

REPO_SERV=georgesan/

for i in $TAG_LIST
do
    echo $SUDO_DOCKER docker tag ${IMAGE_NAME}:$i ${REPO_SERV}${IMAGE_NAME}:$i
    $SUDO_DOCKER docker tag ${IMAGE_NAME}:$i ${REPO_SERV}${IMAGE_NAME}:$i
    echo $SUDO_DOCKER docker push ${REPO_SERV}${IMAGE_NAME}:$i
    $SUDO_DOCKER docker push ${REPO_SERV}${IMAGE_NAME}:$i
done
