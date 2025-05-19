#!/bin/bash

# nvidia drivers
sudo pacman -S --noconfirm --needed nvidia nvidia-utils nvidia-settings egl-wayland

sudo echo "options nvidia_drm modeset=1" > /etc/modprobe.d/nvidia.conf

sudo pacman -S --noconfirm --needed zsh
chsh -s $(which zsh)

sudo pacman -S --noconfirm --needed wezterm

sudo pacman -S --noconfirm --needed neovim lua luarocks
sudo luarocks install luacheck

sudo pacman -S --noconfirm --needed tldr

sudo pacman -S --noconfirm --needed go

sudo pacman -S --noconfirm --needed docker
sudo pacman -S --noconfirm --needed fzf

