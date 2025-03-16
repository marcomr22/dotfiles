#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting
source "$CONFIG_DIR/colors.sh"

sketchybar --set "$NAME" icon.color="$SECD" label="$(date '+%d/%m %H:%M')" label.color="$SECD"
