#!/bin/bash

function env_search() {
    if [ $# -eq 0 ]; then
        echo "NOT_FOUND"
    fi
    arg_name=$1
    cat Dockerfile | sed -e 's%ENV '"$arg_name"'=%ENV '"$arg_name"' %g' | awk '/^ENV '"$arg_name"'[ ]/ {print $3;}'
}

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

TAG_LIST=$( env_search KJWIKIGDOCKER_VERSION )
TAG_LIST=$( add-machine-suffix $TAG_LIST )
IMAGE_NAME=${IMAGE_PREFIX}$( env_search KJWIKIGDOCKER_IMAGE )

REPO_SERV=georgesan/

for i in $TAG_LIST
do
    echo $SUDO_DOCKER docker tag ${IMAGE_NAME}:$i ${REPO_SERV}${IMAGE_NAME}:$i
    $SUDO_DOCKER docker tag ${IMAGE_NAME}:$i ${REPO_SERV}${IMAGE_NAME}:$i
    echo $SUDO_DOCKER docker push ${REPO_SERV}${IMAGE_NAME}:$i
    $SUDO_DOCKER docker push ${REPO_SERV}${IMAGE_NAME}:$i
done
