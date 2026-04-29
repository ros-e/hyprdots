#!/bin/bash

WALL_DIR="$HOME/backgrounds"

SELECTED=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) \
    | wofi --dmenu --allow-images
)

[ -z "$SELECTED" ] && exit 0

if ! pgrep -x "awww" > /dev/null; then
    awww &
    sleep 0.2
fi

awww img "$SELECTED" --transition-type=random

