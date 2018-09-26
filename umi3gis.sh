#!/bin/bash

# Ubuntu Minimal i3-gaps Installation Script!

echo "========== CHECKING UPDATES =========="
sudo apt update

echo
echo "========== INSTALLING DEPENDENCYS & SOFTWARE =========="
sudo apt install -y vim libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev \
libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
autoconf xutils-dev dh-autoreconf ubuntu-drivers-common mesa-utils mesa-utils-extra compton \
xorg xserver-xorg xserver-xorg-input-all libxcb-xrm-dev network-manager dmenu pulseaudio \

echo
echo "+++++++++ Optional Programs +++++++++"
echo -n "Install optional software? (y/n): "
read answer

if [ $answer = 'y' ]; then
  echo
  echo "========== INSTALLING OPTIONAL SOFTWARE =========="
  sudo apt install -y lxappearance ranger keepass2 xdotool fonts-font-awesome fonts-noto terminator \
  imagemagick scrot acpi firefox feh dunst network-manager-gnome arandr software-properties-common \
  i3lock libnotify-bin arc-theme
else
  echo "CONTINUING..."
  echo
fi

echo
echo "========== INSTALLING I3Blocks =========="
git clone https://github.com/Airblader/i3blocks-gaps i3blocks
cd i3blocks
make clean debug
sudo make install

cd

echo
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

echo
echo ++++++++++ UARS ++++++++++
echo "Do you want to setup an awesome i3-gaps setup?!"
echo  -n "(y/n): "
read answer

if [ $answer = 'y' ]; then
  git clone https://github.com/MichalPolach/dotfiles
  sudo mv dotfiles/.config/i3blocksBAR /usr/local/libexec/i3blocks
  mv dotfiles/.[!.]* ./
  
  wget https://dl.opendesktop.org/api/files/download/id/1527389798/s/de29c1fc444efa4d27bc5084eea40022/t/1537974305/u/Hackneyed-24x24-0.6-right-handed.tar.bz2
  tar -xvf Hackneyed-24x24-0.6-right-handed.tar.bz2
  mv Hackneyed-24x24 .icons/
  
  rm -rf dotfiles i3blocks umi3gis.sh i3-gaps Hackneyed-24x24 Hackneyed-24x24-0.6-right-handed.tar.bz2
else
  echo "Unacceptable!"
fi

echo
echo "+++++ Enabling NetworkManager +++++"
sudo systemctl enable NetworkManager
echo

echo "========== INSTALLATION COMPLETE! =========="
echo
echo "You should now reboot or logout in order to use your newly configured system."
echo -n "Reboot(r) or Logout(l)?: "
read answer

if [ $answer = 'r' ]; then
  sudo shutdown -r now
elif [ $answer = 'l' ]; then
  exit
else
  echo "no action selected, you can continue to make further changes... or whatever."
fi
