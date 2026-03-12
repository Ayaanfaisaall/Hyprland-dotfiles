#!/bin/bash

# Active window ka exact address nikalna
address=$(hyprctl activewindow -j | jq -r '.address')

# Error handling: Agar koi window focus mein na ho
if [ -z "$address" ] || [ "$address" == "null" ]; then
    exit 0
fi

# Ek temporary state file jo check karegi ke window is waqt solid hai ya nahi
state_file="/tmp/opaque_$address"

if [ -f "$state_file" ]; then
    # Agar pehle se solid hai, toh file delete karein aur wapas transparent/blur kar dein
    rm "$state_file"
    hyprctl setprop active opaque 0
else
    # Agar transparent hai, toh state file create karein aur 100% solid kar dein
    touch "$state_file"
    hyprctl setprop active opaque 1
fi
