# debian-bspwm

Debian BSPWM + lightdm desktop configuration, fork of Debian-titus bspwm branch.
Tested for **Debian 12 (bookworm)**

## Usage

- Create (almost) minimal installation of Debian stable.
  - run Debian NetInstall image
  - (optional) disable root user by leaving root password empty (creating root user is generally discouraged for security reasons)
  - when selecting packages, uncheck "Desktop enviroment" and "GNOME" (leave only "Essential packages" checked)
  - finish installation
- Install git: `sudo apt install git`
- Clone branch: `git clone https://github.com/misijan1cz/deb-conf --branch bspwm-desktop`
- Go to the cloned directory: `cd bspwm-desktop`
- Run install script as root: `sudo su` and `./install.sh`

## Reminder

This repository is for my personal use but feel free to clone it.

This repository only contains *dotfiles* and other files for configuration of a minimal install of **Debian** with only *"Essential packages"* installed.   
This repository is **not a distribution**.

## Sources

ChrisTitusTech: <https://github.com/ChrisTitusTech/Debian-titus/tree/bspwm>

