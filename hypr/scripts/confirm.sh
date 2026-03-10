#!/bin/bash

# User se action argument receive karna (exit ya poweroff)
action=$1

if [ "$action" == "exit" ]; then
    prompt="Logout of Hyprland?"
    command="hyprctl dispatch exit"
elif [ "$action" == "poweroff" ]; then
    prompt="Poweroff PC?"
    command="systemctl poweroff"
elif [ "$action" == "reboot" ]; then
    prompt="Restart PC?"
    command="reboot"
else
    echo "Invalid action"
    exit 1
fi

# Rofi dmenu ko as a confirmation dialog use karna
# Isme thori basic styling bhi add ki hai taake clean lagay
choice=$(echo -e "No\nYes" | rofi -dmenu -i -p "$prompt" \
    -theme-str 'window {width: 250px; border-radius: 15px;} listview {lines: 2;}')

# Agar user 'Yes' select kare, tabhi command execute ho
if [ "$choice" == "Yes" ]; then
    eval $command
fi
