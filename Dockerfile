FROM ubuntu:bionic

# install dependencies for craft, as listed in their docs
RUN sed -i 's|# deb-src|deb-src|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y qt5-default python3-pip python-all git wget libxcb-xinerama0-dev && \
    apt-get build-dep -y qt5-default

# install craft
# unfortunately, it's interactive, but we can "fix" that problem using good ol' yes
RUN yes 0 | python3 -c "$(wget https://raw.githubusercontent.com/KDE/craft/master/setup/CraftBootstrap.py -O -)" --prefix ~/CraftRoot

# install linuxdeploy into the craft environment
RUN wget https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-x86_64.AppImage && \
    wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage && \
    chmod +x linuxdeploy*.AppImage && \
    mv linuxdeploy*.AppImage ~/CraftRoot/bin
