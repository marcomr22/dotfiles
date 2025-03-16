#!/bin/sh

source "$CONFIG_DIR/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

DRAWING=on
COLOR=$SECD
case "${PERCENTAGE}" in
  9[0-9]|100) ICON=""
  ;;
  [6-8][0-9]) ICON=""
  ;;
  [3-5][0-9]) ICON=""
  ;;
  [1-2][0-9]) ICON=""; COLOR="$PEACH"
  ;;
  *) ICON=""; COLOR="$RED"
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=""
  if [[ "${PERCENTAGE}" == 100 ]]; then
    COLOR="$GREEN"
  fi
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" icon.color=$COLOR label="${PERCENTAGE}%" label.color=$COLOR
