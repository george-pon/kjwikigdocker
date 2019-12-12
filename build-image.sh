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
    echo IMAGE_PREFIX is $IMAGE_PREFIX
    echo TAG_CDR is $TAG_CDR
    IMAGE_NAME=${IMAGE_PREFIX}$(awk '/^ENV KJWIKIGDOCKER_IMAGE/ {print $3;}' Dockerfile)

    if [ ! -z "$HTTP_PROXY" ]; then
        BUILD_OPT="$BUILD_OPT  --build-arg HTTP_PROXY=$HTTP_PROXY"
    fi
    if [ ! -z "$HTTPS_PROXY" ]; then
        BUILD_OPT="$BUILD_OPT  --build-arg HTTPS_PROXY=$HTTPS_PROXY"
    fi
    if [ ! -z "$http_proxy" ]; then
        BUILD_OPT="$BUILD_OPT  --build-arg http_proxy=$http_proxy"
    fi
    if [ ! -z "$https_proxy" ]; then
        BUILD_OPT="$BUILD_OPT  --build-arg https_proxy=$https_proxy"
    fi
    if [ ! -z "$NO_PROXY" ]; then
        BUILD_OPT="$BUILD_OPT  --build-arg NO_PROXY=$NO_PROXY"
    fi
    if [ ! -z "$no_proxy" ]; then
        BUILD_OPT="$BUILD_OPT  --build-arg no_proxy=$no_proxy"
    fi

    if [ ! -z "$no_cache" ]; then
        BUILD_OPT="$BUILD_OPT --no-cache"
    fi

    if docker buildx ls 1>/dev/null 2>/dev/null ; then
	# docker buildx is available
        PLATOPT=
        MACHINE=$( uname -m )
        case $MACHINE in
	 x86_64) PLATOPT='--platform=linux/amd64' ;;
	 armv7l) PLATOPT='--platform=linux/arm/v7' ;;
        esac
        export DOCKER_BUILDKIT=1
        echo $SUDO_DOCKER docker buildx build $BUILD_OPT -t ${IMAGE_NAME}:${TAG_CAR} $PLATOPT  .
        $SUDO_DOCKER docker buildx build $BUILD_OPT -t ${IMAGE_NAME}:${TAG_CAR} $PLATOPT  .
        RC=$?
    else
        echo $SUDO_DOCKER docker build $BUILD_OPT -t ${IMAGE_NAME}:${TAG_CAR} .
        $SUDO_DOCKER docker build $BUILD_OPT -t ${IMAGE_NAME}:${TAG_CAR} .
        RC=$?
    fi
    
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
