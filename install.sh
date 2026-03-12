#!/bin/bash

# Install Dependencies (for Fedora)
echo "Installing Dependencies..."
sudo dnf install -y hyprland waybar rofi-wayland dunst nwg-dock-hyprland eww pamixer brightnessctl network-manager-applet bluez-tools stow cliphist wl-clipboard libnotify grim slurp alacritty

# Backup already existing configurations
echo "Backing up existing configurations (if any)" 
mkdir -p ~/.config/configbak
mv ~/.config/hypr ~/.config/waybar ~/.config/rofi ~/.config/eww ~/.config/nwg-dock-hyprland ~/.config/dunst ~/.config/configbak/ 2>/dev/null

# Deploy Configurations:
echo "Deploying the configurations"
cd .config
stow -t ~/.config .

# Make Scripts Executable:
echo "Making scripts executable"
chmod +x ~/.config/hypr/scripts/*.sh
chmod +x ~/.config/eww/scripts/*.sh

# Reload Hyprland (if already loaded) or login into Hyprland
echo "Installation Successfull! Reload Hyprland (if already loaded) or login into Hyprland"
