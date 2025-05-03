#!/bin/bash     
source $CONFIG_DIR/colors.sh 
INTERFACE="en4" #Modify this 

STATUS=$(ifconfig "$INTERFACE" 2>/dev/null | awk '/status: /{print $2}')

IP=$(ipconfig getifaddr "$INTERFACE" 2>/dev/null)

SPEED=$(networksetup -getMedia "$INTERFACE" 2>/dev/null | sed -n 's/.*:\s*//p')

if [[ "$STATUS" == "active" ]]; then
  LABEL="$SPEED"
  [[ -n "$IP" ]] && LABEL+=" · $IP"
  sketchybar --set eth drawing=on icon=􁅏 label="Connected" icon.color=$Yellow
else
  sketchybar --set eth drawing=on icon=􁣡 label="Disconnected" icon.color=$RED
fi
