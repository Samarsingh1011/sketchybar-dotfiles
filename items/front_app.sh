#!/bin/bash

sketchybar --add item front_app left \
           --set front_app       background.color=$ITEM_BG_COLOR \
                                 icon.color=$ACCENT_COLOR_WHITE \
                                 label.font.size=15 \
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 label.color=$ACCENT_COLOR_WHITE \
                                 script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched
