#!/bin/bash

## Script To Setup Fedora Remotes for devel

REQUIRED_PKG=(curl wget vim git openssl rpmdevtools ncurses-devel pesign grubby kernel-devel kernel-headers dwarves bc clang lld ipmitool)

sudo dnf install -y "${REQUIRED_PKG[@]}" && echo "Success..."

sudo dnf group install -y --with-optional "C Development Tools and Libraries"

git clone https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git 

git clone git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git
