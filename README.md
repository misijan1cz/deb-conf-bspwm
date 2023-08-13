# debian-bspwm

Minimal Debian BSPWM desktop configuration, fork of Debian-titus bspwm branch.   
Tested on **Debian 12 (bookworm)**.

## Usage

- Create (almost) minimal installation of Debian stable.
  - run Debian NetInstall image
  - when selecting packages, uncheck "Desktop enviroment" and "GNOME" (leave only "Essential packages" checked)
  - finish installation
- Install git: `sudo apt install git`
- Clone branch: `git clone https://github.com/misijan1cz/debian-bspwm-config`
- Go to the cloned directory: `cd debian-bspwm-config`
- Run install script as root: `sudo su` and `./install.sh`

## Reminder

This repository is for my personal use but feel free to clone it.   
Keyboard layout is cz (qwerty) by default. You can change it in `.config/bspwm/bspwmrc` file.

This repository only contains *dotfiles* and other files for quick post-install configuration of **Debian**.   
This repository is **not a distribution**.

## Screenshots

![alt text](https://github.com/misijan1cz/debian-bspwm-config/blob/main/screenshot-bspwm.png?raw=true)

![alt text](https://github.com/misijan1cz/debian-bspwm-config/blob/main/screenshot-lightdm.png?raw=true)

![alt text](https://github.com/misijan1cz/debian-bspwm-config/blob/main/screenshot-neofetch.png?raw=true)

![alt text](https://github.com/misijan1cz/debian-bspwm-config/blob/main/screenshot-bootloader.png?raw=true)

## Sources

ChrisTitusTech: <https://github.com/ChrisTitusTech/Debian-titus/tree/bspwm>

