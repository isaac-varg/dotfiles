#!/bin/bash

# set screenlock wallpapers
# TODO have this set somewhere else globally?
SCREELOCK_WALLPAPER_DIR="$HOME/.local/share/isaac-varg/lockscreen"

# get a random image for the folder
IMAGE=$(find "$SCREELOCK_WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)

# TODO maybe have a fallback to solid color
# in case something cose wrong

# run swaylock with the image
swaylock --image "$IMAGE"
