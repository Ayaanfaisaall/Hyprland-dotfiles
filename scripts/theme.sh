#!/bin/bash

if [ -z "$1" ]; then
        echo "Parameter not entered!"
        echo "Use like: ./theme.sh <parameter>"
        exit 1
fi

no=$1

hyprppr="$HOME/.config/hypr/hyprpaper.conf"
hyprlck="$HOME/.config/hypr/hyprlock.conf"
wybr="$HOME/.config/waybar/config.jsonc"
sddm="/usr/share/sddm/themes/silent/configs/default.conf"

sed -i "s/[0-9]\+\.jpg/$no.jpg/g" "$hyprppr"
sed -i "s/[0-9]\+\.jpg/$no.jpg/g" "$hyprlck"
sudo sed -i "s/[0-9]\+\.jpg/$no.jpg/g" "$sddm"

if [ $no -eq 14 ]; then
        sed -i "s/zaailW.svg/zaail.svg/g" "$wybr"
        pkill waybar; waybar &> /dev/null &
else
        sed -i "s/zaail.svg/zaailW.svg/g" "$wybr" &> /dev/null
        pkill waybar; waybar &> /dev/null &
fi

pkill hyprpaper; hyprpaper &> /dev/null &
