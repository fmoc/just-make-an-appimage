#! /bin/bash

set -e
set -x

yes 0 | python3 -c "$(curl -q https://raw.githubusercontent.com/KDE/craft/master/setup/CraftBootstrap.py)" --prefix ~/CraftRoot

# enable craft environment
source ~/CraftRoot/craft/craftenv.sh

# prepare craft environment
craft --add-blueprint-repository https://github.com/owncloud/craft-blueprints-owncloud.git

# in case a specific branch was requested, we want to build that branch
if [[ "$BRANCH" != "" ]]; then
    craft --set branch="$BRANCH" owncloud-client
fi

# install dependencies
craft linuxdeploy

# set up and build ownCloud client
craft --set enableAppImageUpdater=true owncloud-client
craft --set enableAutoUpdater=true owncloud-client
craft owncloud-client
craft --package owncloud-client

# move artifact(s) into caller's working directory
cd ~/CraftRoot/tmp/

# the AppImage will be built by the root user
# therefore, as a convenience feature, we change the owner to the caller's uid
chown "$CHOWN_UID" *.AppImage*

mv *.AppImage* /ws
