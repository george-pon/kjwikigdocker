#!/bin/bash

function car() {
    echo $1
}

function cdr() {
    shift
    echo "$@"
}

function f_docker_build() {
    TAG_LIST=$(awk '/^ENV KJWIKIGDOCKER_VERSION/ {print $3;}' Dockerfile)
    TAG_CAR=$(car $TAG_LIST)
    TAG_CDR=$(cdr $TAG_LIST)
    echo $TAG_CDR
    IMAGE_NAME=$(awk '/^ENV KJWIKIGDOCKER_IMAGE/ {print $3;}' Dockerfile)

    echo docker build -t ${IMAGE_NAME}:${TAG_CAR} .
    $SUDO_DOCKER docker build -t ${IMAGE_NAME}:${TAG_CAR} .
    RC=$?
    if [ $RC -ne 0 ]; then
        echo "ERROR: docker build failed."
        return 1
    fi

    for i in $TAG_CDR
    do
        echo docker tag ${IMAGE_NAME}:$TAG_CAR ${IMAGE_NAME}:$i
        $SUDO_DOCKER docker tag ${IMAGE_NAME}:$TAG_CAR ${IMAGE_NAME}:$i
    done

    return 0
}

f_docker_build
