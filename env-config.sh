#!/bin/bash
##########################################################################################################################################
# WARNING/DISCLAIMERS:															 #
# 1. Ensure you have git, vim, tmux, npm, nodejs, and curl  installed and ready-to-go!							 #
# 2. Understand that this will install and source conf files for TMUX (TPM), BASH (Oh-My-Bash), & VIM (VUNDLE w/ COC)			 #
# 3. Understand that this uses my configuration files and set up, which I like because I have good taste (kidding) 			 #
#  - Feel free to modify and hack all of the .conf's, .rc's and .config files all you like!						 #
# 4. Understand that by running this bash script, you will replace all of your exisiting configs! (some things may also break!).	 #
# 5. This script only supports auto-installation of vim/tmux on debian, apline, centos and fedora! 					 #
##########################################################################################################################################

###Author: Derek Barbosa (dbarbosa@bu.edu)

echo "Welcome! Preparing to install packages required for setup!"

## Attempt to install packages
packagesNeeded='curl git vim'
if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache $packagesNeeded
elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install $packagesNeeded
elif [ -x "$(command -v dnf)" ];     then sudo dnf install $packagesNeeded
elif [ -x "$(command -v zypper)" ];  then sudo zypper install $packagesNeeded
elif [ -x "$(command -v pacman)"];   then sudo pacman -S $packagesNeeded
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $packagesNeeded">&2; fi

## move .conf and .rc files to home
echo "Moving config files to home directory, some items may be overwritten :)"
mv -f .vimrc ~
mv -f .bashrc ~/.bashrc-new

## Setup VIM Packages
mkdir -pv ~/.vim/pack
PACKPATH=$HOME/.vim/pack
cd $PACKPATH
mkdir -pv syntastic/start cpp-highlight/start tree/start airline/start

## Clone Vim Plugins into respective directories
git clone https://github.com/vim-airline/vim-airline $PACKPATH/airline/start/
git clone https://github.com/octol/vim-cpp-enhanced-highlight $PACKPATH/cpp-highlight/start
git clone https://github.com/preservim/nerdtree $PACKPATH/tree/start
git clone https://github.com/vim-syntastic/syntastic $PACKPATH/syntastic/start

## cd to home (ensures repos are on proper path)
echo "Going to User's home directory"
cd ~
echo "Preparing to clone git repos"

## Clone oh-my-bash! into user's home directory
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
rm -f .bashrc
mv -f .bashrc-new .bashrc
source .bashrc

echo "all done! please be sure to test VIM, TMUX, your new bash shell accordingly! \n if changes haven't taken place, please source the config files once again!"
