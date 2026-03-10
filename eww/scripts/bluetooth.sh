#!/bin/bash

rofi_cmd="rofi -dmenu -i -p"

# Check if Bluetooth is powered on
power_status=$(bluetoothctl show | grep "Powered: yes")

if [ -z "$power_status" ]; then
    chosen=$(echo -e "Power On" | $rofi_cmd "Bluetooth")
    if [ "$chosen" == "Power On" ]; then
        bluetoothctl power on
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i bluetooth "Bluetooth Powered On"
    fi
    exit 0
fi

# If powered on, get list of known/available devices
devices=$(bluetoothctl devices | grep Device | cut -d ' ' -f 3-)

# Add Power Off option at the top
chosen=$(echo -e "Power Off\n$devices" | $rofi_cmd "Bluetooth")

if [ "$chosen" == "Power Off" ]; then
    bluetoothctl power off
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i bluetooth "Bluetooth Powered Off"
elif [ -n "$chosen" ]; then
    # Get MAC address of the chosen device
    mac=$(bluetoothctl devices | grep "$chosen" | awk '{print $2}')
    
    # Check connection status to toggle it
    info=$(bluetoothctl info "$mac")
    if echo "$info" | grep -q "Connected: yes"; then
        bluetoothctl disconnect "$mac"
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i bluetooth "Disconnected: $chosen"
    else
        bluetoothctl connect "$mac"
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i bluetooth "Connected: $chosen"
    fi
fi
