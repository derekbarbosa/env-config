#!/bin/bash

## Script To Setup Fedora Remotes for devel

REQUIRED_PKG=(curl wget vim git openssl fedpkg centpkg fedora-packager rpmdevtools ncurses-devel pesign grubby kernel-devel kernel-headers dwarves bc clang lld)

sudo dnf install -y "${REQUIRED_PKG[@]}" && echo "Success..."

sudo dnf group install -y --with-optional "C Development Tools and Libraries"

## Set up Virtualization Stuff

sudo dnf group install -y --with-optional virtualization
sudo dnf group install -y --with-optional "Headless Management"

sudo systemctl enable libvirtd
sudo systemctl start libvirtd

sudo systemctl enable cockpit
sudo systemctl start cockpit

systemctl enable serial-getty@ttyS0.service
systemctl start serial-getty@ttyS0.service

## Set up Rust Devel
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
curl https://sh.rustup.rs -sSf | sh -s -- -y
rustup default 1.62.0 # kernel supports 1.62.0 
echo "dont forget to: source "$HOME/.cargo/env""

echo "once you've done that, rustup component add rust-src"
echo "then cargo install --locked --version '$(scripts/min-tool-version.sh bindgen)' bindgen"


## Finally, clone the Upstream Kernel
mkdir -p ~/workspace/linux

git clone https://www.github.com/torvalds/linux ~/workspace/linux
