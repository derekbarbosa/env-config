#!/bin/bash

## Script To Setup Fedora Remotes for devel

REQUIRED_PKG=(curl wget vim git openssl rpmdevtools ncurses-devel pesign grubby kernel-devel kernel-headers dwarves bc clang lld ipmitool)

sudo dnf install -y "${REQUIRED_PKG[@]}" && echo "Success..."

sudo dnf group install -y --with-optional "C Development Tools and Libraries"

sysctl -w kernel.panic_on_io_nmi=1 >> /etc/sysctl.conf
sysctl -w kernel.panic_on_unrecovered_nmi=1 >> /etc/sysctl.conf
sysctl -w kernel.unknown_nmi_panic=1 >> /etc/sysctl.conf
sysctl -w kernel.panic=1 >> /etc/sysctl.conf

sysctl -p

git clone https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git 

git clone git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git
