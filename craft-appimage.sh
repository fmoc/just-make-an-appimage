#! /bin/bash

set -e
set -x

# enable craft environment
source ~/CraftRoot/craft/craftenv.sh

# set up and build ownCloud client
craft --add-blueprint-repository https://github.com/owncloud/craft-blueprints-owncloud.git
craft owncloud-client
craft --package owncloud-client

# move artifact(s) into caller's working directory
cd ~/CraftRoot/tmp/

# the AppImage will be built by the root user
# therefore, as a convenience feature, we change the owner to the caller's uid
chown "$CHOWN_UID" *.AppImage*

mv *.AppImage* /ws
