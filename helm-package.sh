#!/bin/bash
#
# build helm chart package
#

set -ex

mkdir -p ./helm-chart/charts
pushd ./helm-chart/charts
helm package ../kjwikigdocker
helm repo index  .
popd

set +ex
