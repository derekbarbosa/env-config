#!/bin/bash
##########################################################################################################################################
# WARNING/DISCLAIMERS:															 #
# 1. Ensure you have git, vim, tmux, npm, nodejs, and curl  installed and ready-to-go!							 #
# 2. Understand that this will install and source conf files for TMUX (TPM), BASH (Oh-My-Bash), & VIM (VUNDLE w/ COC)			 #
# 3. Understand that this uses my configuration files and set up, which I like because I have good taste (kidding) 			 #
# Feel free to modify and hack all of the .conf's, .rc's and .config files all you like!						 #
# 4. Understand that by running this bash script, you will replace all of your exisiting configs! (some things may also break!).	 #
# 5. This script only supports auto-installation of vim/tmux on debian, apline, centos and fedora! 					 #
##########################################################################################################################################

###Author: Derek Barbosa (dbarbosa@bu.edu)

echo "Welcome! Preparing to install packages required for setup!"

##attempt to install packages
packagesNeeded='curl git vim tmux'
if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache $packagesNeeded
elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install $packagesNeeded
elif [ -x "$(command -v dnf)" ];     then sudo dnf install $packagesNeeded
elif [ -x "$(command -v zypper)" ];  then sudo zypper install $packagesNeeded
elif [ -x "$(command -v pacman)"];   then sudo pacman -S $packagesNeeded
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $packagesNeeded">&2; fi

##attempt to install NodeJS and NPM
packagesNeeded='nodejs node npm'
if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache $packagesNeeded
elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install $packagesNeeded
elif [ -x "$(command -v dnf)" ];     then sudo dnf install $packagesNeeded
elif [ -x "$(command -v zypper)" ];  then sudo zypper install $packagesNeeded
elif [ -x "$(command -v pacman)"];   then sudo pacman -S $packagesNeeded
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $packagesNeeded">&2; fi

##move .conf and .rc files to home
echo "Moving config files to home directory, some items may be overwritten :)"
mv -f .tmux.conf ~
mv -f .vimrc ~
mv -f .bashrc ~
##cd to home (ensures repos are on proper path)
echo "Going to User's home directory"
cd ~
echo "Preparing to clone git repos"

##Clone Vundle Repo into .vim folder in user's home directory
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

##Clone Derek Barbosa's .vimrc and .tmux.conf and source .vimrc
git clone https://github.com/derekbarbosa/env-config.git ~/
vim +PluginInstall +qall

##Clone TPM (Tmux Plugin Manager) Repo into .tmux folder in user's home directory
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

##Source Derek's .tmux.conf and install the associated plugins!
tmux source ~/.tmux.conf

##Clone oh-my-bash! into user's home directory
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
source .bashrc.omb-backup*
rm .bashrc
mv .bashrc.omb-backup* .bashrc

echo "all done! please be sure to test VIM, TMUX, your new bash shell accordingly! \n if changes haven't taken place, please source the config files once again!"
