#/bin/bash
##########################################################################################################################################
# WARNING/DISCLAIMERS:															 #
# 1. Ensure you have git installed and ready-to-go!											 #
# 2. Understand that this will install and source conf files for TMUX (TPM), BASH (Oh-My-Bash), & VIM (VUNDLE w/ COC)			 #
# 3. Understand that this uses my configuration files and set up, which I like because I have good taste (kidding) 			 #
# Feel free to modify and hack all of the .conf's, .rc's and .config files all you like!						 #
# 4. Understand that by running this bash script, you will replace all of your exisiting configs! (some things may also break!).	 #
# 5. This script only supports auto-installation of vim/tmux on debian, apline, centos and fedora! 					 #
##########################################################################################################################################

###Author: Derek Barbosa (dbarbosa@bu.edu)

#Check OS Vendor + PKG manager 
declare -A osInfo;
osInfo[/etc/debian_version]="apt-get install -y"
osInfo[/etc/alpine-release]="apk --update add"
osInfo[/etc/centos-release]="yum install -y"
osInfo[/etc/fedora-release]="dnf install -y"

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        package_manager=${osInfo[$f]}
    fi
done

##install vim and tmux
${package_manager} vim
${package_manager} tmux

##cd to home (ensures repos are on proper path)
cd ~

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
