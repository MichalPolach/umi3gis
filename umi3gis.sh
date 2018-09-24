#!/bin/bash

# Ubuntu Minimal i3-gaps Installation Script!

echo "========== CHECKING UPDATES =========="
sudo apt update

echo "========== INSTALLING DEPENDENCYS & SOFTWARE =========="
sudo apt install -y vim libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev \
libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
autoconf xutils-dev dh-autoreconf ubuntu-drivers-common mesa-utils mesa-utils-extra compton \
xorg xserver-xorg xserver-xorg-input-all libxcb-xrm-dev network-manager dmenu pulseaudio \
terminator firefox feh dunst network-manager-gnome arandr software-properties-common i3lock \
imagemagick scrot libnotify-bin acpi

echo "========== INSTALLING I3Blocks =========="
git clone https://github.com/Airblader/i3blocks-gaps i3blocks
cd i3blocks
make clean debug
sudo make install

cd

echo "========== INSTALLING I3-GAPS =========="
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -Rf build/
mkdir build
cd build/
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install

cd
echo "exec i3" > .xinitrc

echo "========== INSTALLATION COMPLETE! =========="
