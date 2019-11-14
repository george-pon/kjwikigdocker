#!/bin/bash

echo "access with browser http://localhost:8080/kjwikigdocker/"
set -xe
docker run -p 8080:8080 --rm --name kjwikigdocker -e KJWikiG_defaultWord=StartPage kjwikigdocker:latest
docker rm -f  kjwikigdocker
set +xe
