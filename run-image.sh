#!/bin/bash
#
# test run image
#
docker pull kjwikigdocker:latest
${WINPTY_CMD} docker run --rm \
    -e http_proxy=${http_proxy} -e https_proxy=${https_proxy} -e no_proxy="${no_proxy}" \
    -p 8080:8080 \
    kjwikigdocker:latest
