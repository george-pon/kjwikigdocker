#!/bin/bash

set -xe
docker run -p 8080 -e KJWikiG_defaultWord=StartPage kjwikigdocker:latest
set +xe
