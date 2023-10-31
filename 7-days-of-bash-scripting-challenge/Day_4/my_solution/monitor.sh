#!/bin/bash

if [ $# -eq 1 ]; then
    process_name=$1
else
    read -p "Enter process name to monitor: " process_name
fi

if ps | grep $process_name; then
    echo "$process_name is running."
else
    echo "$process_name is not running."
    for attempt in {1..3};
    do
        echo "Attempting to start process, "$process_name". Attempt #$attempt"
        systemctl start "$process_name"

        for countdown in {1..5};
        do
            echo -ne "\r$countdown"
            sleep 1
        done

        if ps | grep "$process_name"; then
            echo "$process_name is running."
            break
        fi
    done

    echo "Unable to start $process_name"
fi