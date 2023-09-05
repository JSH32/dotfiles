#!/bin/bash

if [ ! -f "/etc/arch-release" ]; then
  echo "This script only works on Arch derivatives"
  exit 1
fi

# Installing yay for downloading other packages
if ! command -v yay &> /dev/null
then
    echo "Installing yay"
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
fi

# Install required dependencies
yay -S --needed bspwm picom rofi sxhkd dunst zsh xfce4-screensaver xfce4-notifyd xfce4-power-manager unzip \
                network-manager-applet flameshot ttf-jetbrains-mono ttf-jetbrains-mono-nerd pavucontrol \
                brightnessctl blueman bluez-utils bluez polybar dotbot alacritty slick-greeter lightdm exa bat

echo "Enabling services"
sudo systemctl enable --now bluetooth
sudo systemctl enable lightdm -f

echo "Cloning submodules"
git submodule update --init --recursive

echo "Making zsh the default shell"
chsh -s $(which zsh)

if ! command -v oh-my-posh &> /dev/null
then
  echo "Installing Oh-My-Posh"
  curl -s https://ohmyposh.dev/install.sh | sudo bash -s
fi

dotbot -c ./install.conf.yaml