#!/bin/bash

## Script To Setup Fedora Remotes for devel

sudo dnf install wget vim git fedpkg fedora-packager rpmdevtools ncurses-devel pesign grubby kernel-devel kernel-headers dwarves bc clang lld 

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source "$HOME/.cargo/env"

rustup component add rust-src

cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen


mkdir ~/workspace

git clone https://www.github.com/torvalds/linux ~/workspace/
