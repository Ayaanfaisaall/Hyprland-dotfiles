#!/bin/bash

# Define the Rofi command
rofi_cmd="rofi -dmenu -i -p"

# Check if Wi-Fi is currently disabled
status=$(nmcli -t -f WIFI g)

if [ "$status" = "disabled" ]; then
    chosen=$(echo -e "Enable Wi-Fi" | $rofi_cmd "Wi-Fi")
    if [ "$chosen" == "Enable Wi-Fi" ]; then
        nmcli radio wifi on
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i network-wireless "Wi-Fi Enabled"
    fi
    exit 0
fi

# If on, grab a clean list of available SSIDs
ssids=$(nmcli -t -f SSID dev wifi | grep -v "^$" | sort | uniq)

# Show Rofi menu with Disable option at the top
chosen=$(echo -e "Disable Wi-Fi\n$ssids" | $rofi_cmd "Wi-Fi")

if [ "$chosen" == "Disable Wi-Fi" ]; then
    nmcli radio wifi off
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i network-wireless "Wi-Fi Disabled"
elif [ -n "$chosen" ]; then
    # Check if the network is already saved
    saved=$(nmcli -t -f NAME connection show | grep -w "$chosen")
    
    if [ -n "$saved" ]; then
        # Connect to known network
        nmcli connection up id "$chosen"
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i network-wireless "Connected to $chosen"
    else
        # Prompt for password for new network using Rofi's hidden input
        password=$(echo "" | rofi -dmenu -password -p "Password: ")
        if [ -n "$password" ]; then
            nmcli device wifi connect "$chosen" password "$password"
            notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i network-wireless "Connected to $chosen"
        fi
    fi
fi
