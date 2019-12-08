#!/bin/bash
#
# test run image
#
function docker-run-kjwikigdocker() {
    docker pull georgesan/kjwikigdocker:latest
    ${WINPTY_CMD} docker run --rm \
        -e http_proxy=${http_proxy} -e https_proxy=${https_proxy} -e no_proxy="${no_proxy}" \
        georgesan/kjwikigdocker:latest
}
docker-run-kjwikigdocker
