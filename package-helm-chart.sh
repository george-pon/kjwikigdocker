#!/bin/bash
#
# build helm chart package
#

set -ex

mkdir -p ./helm-chart/charts
pushd ./helm-chart/charts
helm package ../kjwikigdocker
helm repo index  --url=https://raw.githubusercontent.com/george-pon/kjwikigdocker/master/helm-chart/charts/  .
popd

set +ex

echo "package-helm-chart.sh done"
