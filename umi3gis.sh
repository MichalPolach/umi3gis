#!/bin/bash

# Ubuntu Minimal i3-gaps Installation Script!

echo "========== CHECKING UPDATES =========="
sudo apt update

echo
echo "========== INSTALLING DEPENDENCIES & SOFTWARE =========="
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
  sudo apt install -y lxappearance keepass2 xdotool fonts-inconsolata fonts-font-awesome fonts-noto terminator \
  imagemagick scrot acpi firefox feh dunst network-manager-gnome arandr software-properties-common \
  i3lock libnotify-bin arc-theme udiskie
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
  git clone https://github.com/MichalPolach/dotfiles_ubuntu
  sudo mv dotfiles_ubuntu/.config/i3blocksBAR /usr/local/libexec/i3blocks
  mv dotfiles_ubuntu/.[!.]* ./

# there is a memory leak problem when viewing images in ranger in current version provided in Ubuntu repos. So it needs to be compiled from source.
  git clone https://github.com/ranger/ranger.git
  sudo apt install -y python-chardet highlight atool bsdtar unrar poppler-utils \
  mediainfo odt2txt caca-utils
  cd ranger
  sudo make install
  cd
  
  wget https://dl.opendesktop.org/api/files/download/id/1527389798/s/8f6e430c27957f023a17356babfc00d9/t/1537981448/u//Hackneyed-24x24-0.6-right-handed.tar.bz2
  tar -xvf Hackneyed-24x24-0.6-right-handed.tar.bz2
  mv Hackneyed-24x24 .icons/
  
  sudo rm -rf ranger dotfiles_ubuntu i3blocks umi3gis.sh i3-gaps Hackneyed-24x24 Hackneyed-24x24-0.6-right-handed.tar.bz2
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
