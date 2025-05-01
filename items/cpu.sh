#!/bin/bash 

sketchybar --add item cpu right \
           --set cpu  \
           update_freq=1\
           icon=􀫦 \
           background.color=0xcc0f0f14 \
           script="$PLUGIN_DIR/cpuUsageAnimation.sh" \
