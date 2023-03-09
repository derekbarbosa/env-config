#!/bin/bash
##########################################################################################################################################
# WARNING/DISCLAIMERS:															 #
# 1. Understand that this will install and source conf files for TMUX (TPM), BASH (Oh-My-Bash), & VIM (VUNDLE w/ COC)			 #
# 2. Understand that this uses my configuration files and set up, which I like because I have good taste (kidding) 			 #
# Feel free to modify and hack all of the .conf's, .rc's and .config files all you like!						 #
# 3. Understand that by running this bash script, you will replace all of your exisiting configs! (some things may also break!).	 #
# 4. This script only supports auto-installation of vim/tmux on debian, alpine, centos and fedora! 					 #
##########################################################################################################################################

### Author: Derek Barbosa (dbarbosa@bu.edu)

echo "Welcome! Preparing to install packages required for setup!"

## Attempt to install packages
REQUIRED_PKGS=(curl wget vim vim-X11 git openssl dwarves bc clang lld)

if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache -y "${REQUIRED_PKGS[@]}"
elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install -y "${REQUIRED_PKGS[@]}"
elif [ -x "$(command -v dnf)" ];     then sudo dnf install -y "${REQUIRED_PKGS[@]}"
elif [ -x "$(command -v zypper)" ];  then sudo zypper install -y "${REQUIRED_PKGS[@]}"
elif [ -x "$(command -v pacman)" ];   then sudo pacman -S -y "${REQUIRED_PKGS[@]}"
else echo "FAILED TO INSTALL PACKAGES: Package manager not found. You must manually install: ${REQUIRED_PKGS}">&1; fi

## Move .conf and .rc files to home
echo "Moving config files to home directory, some items may be overwritten :)"
cp -f .tmux.conf ~
cp -f .vimrc ~
cp -f .ctags ~
cp -f .bashrc ~/.bashrc-new

## cd to home (ensures repos are on proper path)
echo "Going to User's home directory"
cd ~
echo "Preparing to clone git repos"

## Clone Vundle Repo into .vim folder in user's home directory
git clone https://github.com/derekbarbosa/Vundle.vimi ~/.vim/bundle/Vundle.vim

## Clone Derek Barbosa's .vimrc and .tmux.conf and source .vimrc
vim +PluginInstall +qall

## Clone TPM (Tmux Plugin Manager) Repo into .tmux folder in user's home directory
git clone https://github.com/derekbarbosa/tpm ~/.tmux/plugins/tpm

## Source Derek's .tmux.conf and install the associated plugins!
tmux source ~/.tmux.conf

## Clone oh-my-bash! into user's home directory
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
reset

echo "All Done! Please be sure to check if your Vim and TMUX '.rc' files are sourced"
echo "Be sure to 'mv .bashrc-new .bashrc'"
