#!/bin/bash

CPU_GREP=$(top -l 1 | grep "^CPU usage")

IDLE=$(echo "$CPU_GREP" | awk -F, '{print $3}' | awk '{print $1}' | tr -dc '0-9.')

if [[ -z "$IDLE" ]]; then
  echo "Invalid CPU data"
  exit 1
fi

ACTIVE=$(printf "%.0f" "$(echo "100 - $IDLE" | bc)")

NUM_BLOCKS=$((ACTIVE * 10 / 100))


BLOCKS=( ▏ ▎ ▍ ▌ ▋ ▊ ▉ █ )

BLOCKS_LAST_INDEX=$((${#BLOCKS[@]} - 1))

SPARK=""

for ((i = 1; i <= 10; i++)); do
    if ((i <= NUM_BLOCKS)); then
        SPARK+="${BLOCKS[$BLOCKS_LAST_INDEX]}"
    else
        SPARK+="${BLOCKS[0]}"
    fi
done

if ((ACTIVE<30)); then
    COLOR="0xff50fa7b"
elif ((ACTIVE<60)); then
    COLOR="0xffffc300"
else
    COLOR="0xffff5555"
fi

Label="${SPARK}${ACTIVE}%"

sketchybar --set "$NAME" label="$Label" label.color="$COLOR"
