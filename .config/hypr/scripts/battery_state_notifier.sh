#!/bin/bash

last_state=""

upower --monitor-detail |
while read -r line; do
    if echo "$line" | grep -q "state:"; then
        state=$(echo "$line" | awk '{print $2}')

        if [ "$state" != "$last_state" ]; then
            last_state="$state"

            case "$state" in
                charging)
                    notify-send "Power Connected" \
                    "The system is now connected to external power and charging."
                    ;;
                discharging)
                    notify-send "Power Disconnected" \
                    "The system is now operating on battery power."
                    ;;
                fully-charged)
                    notify-send "Battery Fully Charged" \
                    "Charging has completed. You may disconnect the power adapter."
                    ;;
            esac
        fi
    fi
done
