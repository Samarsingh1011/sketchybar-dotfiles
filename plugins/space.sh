#!/bin/sh
source "$CONFIG_DIR/colors.sh" 

if [ $SELECTED = true ]; then
  sketchybar --set $NAME background.drawing=on \
                         background.color=$ITEM_BG_COLOR \
                         label.color=$ACCENT_COLOR_WHITE \
                         icon.color=$ACCENT_COLOR_WHITE
else
  sketchybar --set $NAME background.drawing=off \
                         label.color=$ACCENT_COLOR \
                         icon.color=$ACCENT_COLOR
fi
