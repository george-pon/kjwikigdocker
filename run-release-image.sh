#!/bin/bash
#
# test run image
#

function env_search() {
    if [ $# -eq 0 ]; then
        echo "NOT_FOUND"
    fi
    arg_name=$1
    cat Dockerfile | sed -e 's%ENV '"$arg_name"'=%ENV '"$arg_name"' %g' | awk '/^ENV '"$arg_name"'[ ]/ {print $3;}'
}

TAG_LIST=$( env_search KJWIKIGDOCKER_VERSION )
IMAGE_NAME=${IMAGE_PREFIX}$( env_search KJWIKIGDOCKER_IMAGE )

REPO_SERV=docker.io/george-san/

for i in $TAG_LIST
do
    docker pull ${REPO_SERV}${IMAGE_NAME}:${i}
    ${WINPTY_CMD} docker run -i -t --rm \
        -e http_proxy=${http_proxy} -e https_proxy=${https_proxy} -e no_proxy="${no_proxy}" \
        -p 8080:8080 \
        ${REPO_SERV}${IMAGE_NAME}:${i}
    break
done

#
# end of file
#
