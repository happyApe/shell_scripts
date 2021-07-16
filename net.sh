#!/bin/bash

# A network connectivity checker

while :; do
    wget -q --tries=10 --timeout=20 --spider http://google.com
    if [[ $? -eq 0 ]]; then
            echo "Status : Online"
            break
    else
            notify-send -i error "Not Connected to Wi-Fi Network"
            echo "Status : Offline"
            sleep 10
    fi
done

