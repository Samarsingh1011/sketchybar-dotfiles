#!/bin/bash

if [ "$SENDER" = "space_windows_change" ]; then
  space="$(echo "$INFO" | jq -r '.space')"
  apps="$(echo "$INFO" | jq -r '.apps | keys[]')"

  icon_strip=" "
  count=0

  if [ -n "$apps" ]; then
    while read -r app; do
      icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
      icon_strip+=" $icon"
      ((count++))
      if [ "$count" -ge 3 ]; then
        break
      fi
    done <<< "$apps"
  else
    icon_strip=" —"
  fi

  sketchybar --set space.$space label="$icon_strip"
fi

