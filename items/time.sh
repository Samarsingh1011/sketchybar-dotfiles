#!/bin/bash

sketchybar --add item starCycle right \
           --set starCycle icon=􀒎 \
                          script="$PLUGIN_DIR/updateTime.sh" \
                          label.font.size=11 \
                          padding_right = 0 \
                          update_freq=1 

