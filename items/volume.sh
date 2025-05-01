#!/bin/bash 

sketchybar --add iterm volume right \
           --set volume script="$PLUGIN_DIR/volume.sh"  \
           --subscribe volume volume_change \
           
