#!/usr/bin/env bash

# Kill any existing instances of nwg-dock-hyprland
killall nwg-dock-hyprland

# Mac style dock configuration
# -d: detach (run in background)
# -p bottom: position at the bottom
# -a center: alignment center
# -i 48: icon size 48
# -x: auto-hide 
# -mb 10: margin bottom 10px (floating effect)
# -ml 10 -mr 10: margin left and right (prevent full width)
# -f: full width (omit to make it shrink to fit icons)

nwg-dock-hyprland -p bottom -a center -i 48 -x -mb 10 -hd 0
