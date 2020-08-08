#!/bin/bash

sudo apt -y install git libx11-dev meson pkg-config python3-setuptools python3-mako zlib1g-dev libexpat1-dev libdrm-dev bison flex libwayland-dev wayland-protocols libwayland-egl-backend-dev libxext-dev libxdamage-dev libx11-xcb-dev libxcb-glx0-dev libxcb-dri2-0-dev libxcb-dri3-dev libxcb-present-dev libxshmfence-dev libxxf86vm-dev libxrandr-dev gettext
sudo apt -y install mesa-utils

cd /tmp || exit 1
git clone https://gitlab.freedesktop.org/mesa/mesa -b master
mkdir -p mesa/build
cd mesa/build || exit 1
meson .. . -Dprefix=/usr -Ddri-drivers= -Dvulkan-drivers= -Dgallium-drivers=panfrost,kmsro,swrast -Dlibunwind=false
sudo ninja install

echo "You may now reboot"
