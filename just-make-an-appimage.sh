#! /bin/bash

set -e
set -x

image_name="just-make-an-appimage"

docker build -t "$image_name" .

docker run -e CHOWN_UID="$(id -u)" --rm -v "$(readlink -f .)":/ws -v -it "$image_name"
