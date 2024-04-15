#!/bin/bash

# update status every 5 seconds
while true; do
    #pomo status > /home/kishan/.pomo/i3status
    status=$(pomo status --json)

    state=$(jq -r '.state' <<< "$status")

    # if state is 0, then we are not in a pomodoro

    if [ "$state" -eq 0 ]; then
        echo "" > /home/kishan/.pomo/i3status
        sleep 1
        continue
    fi

    
    message=$(jq -r '.task_message' <<< "$status")
    count=$(jq -r '.count' <<< "$status")
    n_pomodoros=$(jq -r '.n_pomodoros' <<< "$status")
    remaining=$(jq -r '.remaining' <<< "$status")
    pause=$(jq -r '.pauseduration' <<< "$status")

    remaining=$((remaining/1000000000))
    pause=$((pause/1000000000))


    if [ "$state" -eq 1 ]; then
        timer=$(date -d @"$remaining" -u +%M)
        echo "$timer $message [$count/$n_pomodoros]" > /home/kishan/.pomo/i3status
    elif [ "$state" -eq 4 ]; then
        echo "Paused $timer $message [$count/$n_pomodoros]" > /home/kishan/.pomo/i3status
    else
        echo "Break Time $timer [$count/$n_pomodoros]" > /home/kishan/.pomo/i3status
        timer=$(date -d @"$pause" -u +%M:%S)
    fi


    sleep 1
done

