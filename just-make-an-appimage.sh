#! /bin/bash

set -euxo pipefail

image="owncloudci/appimage-build:centos7-amd64"
docker pull "$image"
docker run -e CHOWN_UID="$(id -u)" --rm -v "$(readlink -f .)":/ws -v -it "$image" /ws/scripts/craft-appimage.sh
