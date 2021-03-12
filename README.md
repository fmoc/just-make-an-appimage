# Just make an AppImage

Just call `just-make-an-appimage.sh` to:

1. build a Docker image containing [craft](https://github.com/KDE/craft) and some dependencies of the [ownCloud client](https://github.com/owncloud/client)
2. run `craft-appimage.sh` in a container to build the client using the image we just built

Once it's finished, you should see a nice up-to-date AppImage in your current working directory.


## Stuff that works

- AppImage passes quality checks like [appimagelint](https://github.com/TheAssassin/appimagelint)
- AppImage runs on major distros, including xubuntu 18.04, Debian 10.8 with LXQt, Linux Mint 20.1 with MATE, Fedora Workstation Live 33, openSUSE Tumbleweed KDE Live Snapshot 2021-03-07


## Stuff that doesn't work yet

- AppImages lack version numbers
- AppImageUpdate
