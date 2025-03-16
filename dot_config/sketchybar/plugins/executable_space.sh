#!/bin/sh
source "$CONFIG_DIR/colors.sh"

SPACE_ICONS=("" "" "" "" "" "" "" "" "" "")

SPACE=(
  icon.padding_left=6
  icon.padding_right=6
  label.padding_right=6
  icon.color=$SECD
  icon.highlight_color=$SECD
  icon.background.draw=on
  background.height=25
  background.padding_left=0
  background.padding_right=0
  background.color=$BG_SEC_COLR
  background.corner_radius=8
  background.drawing=on
  label.drawing=off
)

sketchybar --add event aerospace_workspace_change

for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add item space.$sid left \
             --subscribe space.$sid aerospace_workspace_change \
             --set space.$sid "${SPACE[@]}" \
             click_script="aerospace workspace $sid" \
             script="$CONFIG_DIR/plugins/aerospace.sh $sid" \
           --set space.$sid icon=${SPACE_ICONS[i]}
done
