#!/bin/bash

function car() {
    echo $1
}

function cdr() {
    shift
    echo "$@"
}

TAG_LIST=$(awk '/^ENV KJWIKIGDOCKER_VERSION/ {print $3;}' Dockerfile)
TAG_CAR=$(car $TAG_LIST)
TAG_CDR=$(cdr $TAG_LIST)
echo $TAG_CDR
IMAGE_NAME=$(awk '/^ENV KJWIKIGDOCKER_IMAGE/ {print $3;}' Dockerfile)

echo docker build -t ${IMAGE_NAME}:${TAG_CAR} .
$SUDO_DOCKER docker build -t ${IMAGE_NAME}:${TAG_CAR} .

for i in $TAG_CDR
do
    echo docker tag ${IMAGE_NAME}:$TAG_CAR ${IMAGE_NAME}:$i
    $SUDO_DOCKER docker tag ${IMAGE_NAME}:$TAG_CAR ${IMAGE_NAME}:$i
done
