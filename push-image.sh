#!/bin/bash

TAG_LIST=$(awk '/^ENV KJWIKIGDOCKER_VERSION/ {print $3;}' Dockerfile)
IMAGE_NAME=$(awk '/^ENV KJWIKIGDOCKER_IMAGE/ {print $3;}' Dockerfile)

for i in $TAG_LIST
do
    echo $SUDO_DOCKER docker tag ${IMAGE_NAME}:$i ${REPO_SERV}${IMAGE_NAME}:$i
    $SUDO_DOCKER docker tag ${IMAGE_NAME}:$i ${REPO_SERV}${IMAGE_NAME}:$i
    echo $SUDO_DOCKER docker push ${REPO_SERV}${IMAGE_NAME}:$i
    $SUDO_DOCKER docker push ${REPO_SERV}${IMAGE_NAME}:$i
done
