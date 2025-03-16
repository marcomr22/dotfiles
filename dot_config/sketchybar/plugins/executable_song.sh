!#/bin/sh

source "$CONFIG_DIR/colors.sh"

TITLE="$(nowplaying-cli get title)"

if [ "$TITLE" = "null" ]; then
  exit 0
fi

if [ ${#TITLE} -gt 29 ]; then
  TITLE=${TITLE:0:30}
  TITLE+="..."
fi

sketchybar --set "$NAME" icon="" icon.color="$MAIN" label="${TITLE}" label.color="$MAIN"
