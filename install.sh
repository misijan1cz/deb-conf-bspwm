#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

### Change Debian to SID Branch
##cp /etc/apt/sources.list /etc/apt/sources.list.bak
##cp sources.list /etc/apt/sources.list

username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
apt update
apt upgrade -y

# Install nala
apt install nala -y

# Making .config and Moving config files and background to Pictures
cd $builddir
mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/Pictures
cp .Xresources /home/$username
cp .Xnord /home/$username
cp -R dotconfig/* /home/$username/.config/
cp background.jpg /home/$username/Pictures/
mv user-dirs.dirs /home/$username/.config
chown -R $username:$username /home/$username

##############################
### CONFIGURE INSTALLATION ###
##############################

# Essential Packages 
nala install feh bspwm sxhkd kitty rofi polybar picom thunar nitrogen lxpolkit x11-xserver-utils unzip yad wget curl -y
# Basic Packages
nala install neofetch flameshot psmisc vim lxappearance papirus-icon-theme lxappearance fonts-noto-color-emoji firefox-esr -y
# Other Packages
#nala install virt-manager gnome-disks gedit onlyoffice-desktopeditors -y                             # ... workstation
#nala install iio-sensor-proxy -y                                                                     # ... tablet
#nala install vlc lmms -y                                                                             # ... media

# Sound system: pulse OR pipewire
nala install pulseaudio pavucontrol -y
#nala install pipewire{,-{audio,pulse,alsa}} libspa-0.2-bluetooth wireplumber pavucontrol -y

# Display manager: LightDM OR XDM
nala install lightdm -y && systemctl enable lightdm
#nala install xdm xorg -y && systemctl enable xdm.service

############################
### END OF CONFIGURATION ###
############################

# Theming display managers
mkdir -p /etc/X11/xdm
mkdir -p /etc/lightdm
mkdir -p /usr/share/backgrounds
cp config-xdm/.xsession /home/$username
cp config-xdm/Xresources config-xdm/Xsetup /etc/X11/xdm/
cp config-lightdm/lightdm-gtk-greeter.conf /etc/lightdm/
cp background.jpg /usr/share/backgrounds/

# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Installing fonts
cd $builddir 
nala install fonts-font-awesome -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
mv dotfonts/fontawesome/otfs/*.otf /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*

# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

# Install Nordzy cursor
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd $builddir
rm -rf Nordzy-cursors

# Change target from CLI to GUI
systemctl set-default graphical.target

# Beautiful bash
git clone https://github.com/ChrisTitusTech/mybash
cd mybash
bash setup.sh
cd $builddir

# Update GRUB background
echo "GRUB_BACKGROUND=/home/mj/Pictures/background.jpg" >> /etc/default/grub
update-grub

# Polybar configuration
bash scripts/changeinterface

# Use nala
bash scripts/usenala
